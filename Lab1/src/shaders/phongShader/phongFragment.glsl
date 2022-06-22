#ifdef GL_ES
precision mediump float;
#endif

// Phong related variables
uniform sampler2D uSampler;
uniform vec3 uKd;
uniform vec3 uKs;
uniform vec3 uLightPos;
uniform vec3 uCameraPos;
uniform vec3 uLightIntensity;

varying highp vec2 vTextureCoord;
varying highp vec3 vFragPos;
varying highp vec3 vNormal;

// Shadow map related variables
#define NUM_SAMPLES 20
#define BLOCKER_SEARCH_NUM_SAMPLES NUM_SAMPLES
#define PCF_NUM_SAMPLES NUM_SAMPLES
#define NUM_RINGS 10

#define EPS 1e-3
#define PI 3.141592653589793
#define PI2 6.283185307179586

uniform sampler2D uShadowMap;

varying vec4 vPositionFromLight;

/* HardShadow Depth Bias Term */ 
#define BIAS_COEF 0.007
#define BIAS BIAS_COEF * max( 0.0 , 1.0 - dot(normalize(uLightPos), normalize(vNormal)) )


/* PCF/BlockerDepth constant */ 

// 使用方法：vec / TEXTURE_SIZE * STRIDE
// 同比缩小，意思为4000 x 4000 pixel的shadowMap上，取半径为 10 的Disk Convoluation
#define TEXTURE_SIZE 4000.0
#define PCF_STRIDE 10.0
// 根据令其老师的说法，这个需要使用ShadowMap与Light之间的距离来进行运算，但是这块确实不太明白，就随便设了
// “将shadowMap固定在一个位置，光在shadowMap上投影的大小就是Blocker Search Size”
#define BLOCKER_STRIDE 100.0

/* PCSS constant */ 
#define W_LIGHT 5.0

highp float rand_1to1(highp float x) { 
  // -1 -1
  return fract(sin(x) * 10000.0);
}

highp float rand_2to1(vec2 uv) { 
  // 0 - 1
  const highp float a = 12.9898, b = 78.233, c = 43758.5453;
  highp float dt = dot(uv.xy, vec2(a, b)), sn = mod(dt, PI);
  return fract(sin(sn) * c);
}

float unpack(vec4 rgbaDepth) {
  const vec4 bitShift = vec4(1.0, 1.0 / 256.0, 1.0 / (256.0 * 256.0), 1.0 / (256.0 * 256.0 * 256.0));
  return dot(rgbaDepth, bitShift);
}

vec2 poissonDisk[NUM_SAMPLES];

void poissonDiskSamples(const in vec2 randomSeed) {

  float ANGLE_STEP = PI2 * float(NUM_RINGS) / float(NUM_SAMPLES);
  float INV_NUM_SAMPLES = 1.0 / float(NUM_SAMPLES);

  float angle = rand_2to1(randomSeed) * PI2;
  float radius = INV_NUM_SAMPLES;
  float radiusStep = radius;

  for(int i = 0; i < NUM_SAMPLES; i++) {
    poissonDisk[i] = vec2(cos(angle), sin(angle)) * pow(radius, 0.75);
    radius += radiusStep;
    angle += ANGLE_STEP;
  }
}

void uniformDiskSamples(const in vec2 randomSeed) {

  float randNum = rand_2to1(randomSeed);
  float sampleX = rand_1to1(randNum);
  float sampleY = rand_1to1(sampleX);

  float angle = sampleX * PI2;
  float radius = sqrt(sampleY);

  for(int i = 0; i < NUM_SAMPLES; i++) {
    poissonDisk[i] = vec2(radius * cos(angle), radius * sin(angle));

    sampleX = rand_1to1(sampleY);
    sampleY = rand_1to1(sampleX);

    angle = sampleX * PI2;
    radius = sqrt(sampleY);
  }
}

float findBlocker(sampler2D shadowMap, vec2 uv, float zReceiver) {

  poissonDiskSamples(uv);

  float radiusRatio = 1.0 / TEXTURE_SIZE * BLOCKER_STRIDE;
  float totalBlockerDepth = 0.0;
  int blockerCount = 0;

  for(int i = 0; i < BLOCKER_SEARCH_NUM_SAMPLES; i++){
    
    vec2 samplerCoord = poissonDisk[i] * radiusRatio + uv;
    float shadowMapDepth = unpack(texture2D(shadowMap, samplerCoord));

    // 如果zReceiver小于shadowMapDepth，则是Blocker
    if(zReceiver > shadowMapDepth + BIAS){
      blockerCount += 1;
      totalBlockerDepth += shadowMapDepth;
    }
  }

  // 如果没有Blocker，后面计算Penumbra会出问题，需要做error catch
  if(blockerCount == 0) return -1.0;

  return totalBlockerDepth / float(blockerCount);
}

float PCF(sampler2D shadowMap, vec4 coords) {

  //uniformDiskSamples(coords.xy);
  poissonDiskSamples(coords.xy);

  // 将在PCSS中详细计算
  float radiusRatio = 1.0 / TEXTURE_SIZE * PCF_STRIDE;
  float blockerDepth = coords.z;

  int blockCount = 0;

  for(int i = 0; i < PCF_NUM_SAMPLES; i++) {

    vec2 samplerCoord = poissonDisk[i] * radiusRatio + coords.xy;
    float shadowMapDepth = unpack(texture2D(shadowMap, samplerCoord));

    // 如果实际深度大于光照深度，则看不见，返回0
    blockCount += (blockerDepth - BIAS > shadowMapDepth) ? 0 : 1;
  }
 
  return float(blockCount) / float(NUM_SAMPLES);
}

float PCSS(sampler2D shadowMap, vec4 coords) {

  float dReceiver = coords.z;

  // STEP 1: avgblocker depth
  float dBlocker = findBlocker(shadowMap, coords.xy, dReceiver);
  if(dBlocker == -1.0) return 1.0;

  // STEP 2: penumbra size
  float wPenumbra = (dReceiver - dBlocker) * W_LIGHT / dBlocker;
  
  // STEP 3: filtering
  poissonDiskSamples(coords.xy);

  float radiusRatio = 1.0 / TEXTURE_SIZE * PCF_STRIDE * wPenumbra;
  int blockCount = 0;

  for(int i = 0; i < PCF_NUM_SAMPLES; i++) {

    vec2 samplerCoord = poissonDisk[i] * radiusRatio + coords.xy;
    float shadowMapDepth = unpack(texture2D(shadowMap, samplerCoord));

    // 如果实际深度大于光照深度，则看不见，返回0
    blockCount += (dReceiver - BIAS > shadowMapDepth) ? 0 : 1;
  }

  return float(blockCount) / float(NUM_SAMPLES);
}

float useShadowMap(sampler2D shadowMap, vec4 shadowCoord) {
  float shadowMapDepth = unpack(texture2D(shadowMap, shadowCoord.xy));

  // 如果实际深度大于光照深度，则看不见，返回0
  return shadowCoord.z - BIAS > shadowMapDepth ? 0.0 : 1.0;
}

vec3 blinnPhong() {
  vec3 color = texture2D(uSampler, vTextureCoord).rgb;
  color = pow(color, vec3(2.2));

  vec3 ambient = 0.05 * color;

  vec3 lightDir = normalize(uLightPos);
  vec3 normal = normalize(vNormal);
  float diff = max(dot(lightDir, normal), 0.0);
  vec3 light_atten_coff = uLightIntensity / pow(length(uLightPos - vFragPos), 2.0);
  vec3 diffuse = diff * light_atten_coff * color;

  vec3 viewDir = normalize(uCameraPos - vFragPos);
  vec3 halfDir = normalize((lightDir + viewDir));
  float spec = pow(max(dot(halfDir, normal), 0.0), 32.0);
  vec3 specular = uKs * light_atten_coff * spec;

  vec3 radiance = (ambient + diffuse + specular);
  vec3 phongColor = pow(radiance, vec3(1.0 / 2.2));
  return phongColor;
}

void main(void) {

  float visibility;
  vec3 shadowCoord = vPositionFromLight.xyz * 0.5 + 0.5;

  //visibility = useShadowMap(uShadowMap, vec4(shadowCoord, 1.0));
  //visibility = PCF(uShadowMap, vec4(shadowCoord, 1.0));
  visibility = PCSS(uShadowMap, vec4(shadowCoord, 1.0));

  vec3 phongColor = blinnPhong();

  gl_FragColor = vec4(phongColor * visibility, 1.0);
  //gl_FragColor = vec4(phongColor, 1.0);
}
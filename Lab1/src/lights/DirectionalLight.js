class DirectionalLight {

    constructor(lightIntensity, lightColor, lightPos, focalPoint, lightUp, hasShadowMap, gl) {
        this.mesh = Mesh.cube(setTransform(0, 0, 0, 0.2, 0.2, 0.2, 0));
        this.mat = new EmissiveMaterial(lightIntensity, lightColor);
        this.lightPos = lightPos;
        this.focalPoint = focalPoint;
        this.lightUp = lightUp

        this.hasShadowMap = hasShadowMap;
        this.fbo = new FBO(gl);
        if (!this.fbo) {
            console.log("无法设置帧缓冲区对象");
            return;
        }
    }

    /* 
     * 光源处建立一个虚拟的摄像机
     *
     * 你需要使用 lightPos, focalPoint, lightUp 来构造摄像机的 LookAt 矩阵。
     *
     * 推荐使用正交投影，这可以保证场景深度信息在坐标系转换中保持线性从而便于之后使用。
     * 正交投影的参数决定了 shadow map 所覆盖的范围。 
    */
    CalcLightMVP(translate, scale) {
        // create new identity matrix 4x4
        let lightMVP = mat4.create();
        let modelMatrix = mat4.create();
        let viewMatrix = mat4.create();
        let projectionMatrix = mat4.create();

        // Model transform
        mat4.translate(modelMatrix, modelMatrix, translate);
        mat4.scale(modelMatrix, modelMatrix, scale);

        // View transform
        mat4.lookAt(viewMatrix, this.lightPos, this.focalPoint, this.lightUp);

        // Projection transform
        mat4.ortho(projectionMatrix, -100, 100, -50, 70, 0, 400);

        // MVP multiplication
        mat4.multiply(lightMVP, projectionMatrix, viewMatrix);
        mat4.multiply(lightMVP, lightMVP, modelMatrix);

        return lightMVP;
    }
}

# Install script for directory: C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/nori")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/ychen/projects/GAMES202/Lab2/prt/build/ext_build/openexr/OpenEXR/IlmImf/Debug/IlmImf.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/ychen/projects/GAMES202/Lab2/prt/build/ext_build/openexr/OpenEXR/IlmImf/Release/IlmImf.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/ychen/projects/GAMES202/Lab2/prt/build/ext_build/openexr/OpenEXR/IlmImf/MinSizeRel/IlmImf.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/ychen/projects/GAMES202/Lab2/prt/build/ext_build/openexr/OpenEXR/IlmImf/RelWithDebInfo/IlmImf.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenEXR" TYPE FILE FILES
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfForward.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfExport.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfBoxAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfCRgbaFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfChannelList.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfChannelListAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfCompressionAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDoubleAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfFloatAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfFrameBuffer.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfHeader.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfIO.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfInputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfIntAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfLineOrderAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfMatrixAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfOpaqueAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfOutputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfRgbaFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfStringAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfVecAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfHuf.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfWav.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfLut.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfArray.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfCompression.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfLineOrder.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfName.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfPixelType.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfVersion.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfXdr.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfConvert.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfPreviewImage.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfPreviewImageAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfChromaticities.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfChromaticitiesAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfKeyCode.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfKeyCodeAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfTimeCode.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfTimeCodeAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfRational.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfRationalAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfFramesPerSecond.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfStandardAttributes.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfEnvmap.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfEnvmapAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfInt64.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfRgba.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfTileDescription.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfTileDescriptionAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledInputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledOutputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledRgbaFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfRgbaYca.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfTestFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfThreading.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfB44Compressor.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfStringVectorAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfMultiView.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfAcesFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfMultiPartOutputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfGenericOutputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfMultiPartInputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfGenericInputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfPartType.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfPartHelper.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfOutputPart.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledOutputPart.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfInputPart.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledInputPart.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineOutputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineOutputPart.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineInputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineInputPart.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledInputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledInputPart.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledOutputFile.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledOutputPart.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepFrameBuffer.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepCompositing.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfCompositeDeepScanLine.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfNamespace.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfMisc.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepImageState.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepImageStateAttribute.h"
    "C:/Users/ychen/projects/GAMES202/Lab2/prt/ext/openexr/OpenEXR/IlmImf/ImfFloatVectorAttribute.h"
    )
endif()


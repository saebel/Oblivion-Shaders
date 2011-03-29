//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2073.vso /Fcshaderdump19/SLS2073.vso.dis
//
//
// Parameters:

float4 FogParam;
float4 LightPosition[3];
row_major float4x4 ModelViewProj;
row_major float4x4 ObjToCubeSpace;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   ObjToCubeSpace const_8       4
//   LightPosition[0]  const_16       1
//   FogParam       const_23      1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_4 = {0, 1, 0, 0};

    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.w = dot(const_11.xyzw, IN.position.xyzw);
    OUT.texcoord_1.x = dot(ObjToCubeSpace.xyzw, IN.position.xyzw);
    OUT.texcoord_1.y = dot(const_9.xyzw, IN.position.xyzw);
    OUT.texcoord_1.z = dot(const_10.xyzw, IN.position.xyzw);
    OUT.texcoord_2.xyzw = LightPosition[0].xyzw;
    OUT.texcoord_3.xyz = 0;
    OUT.texcoord_6.xyz = IN.position;
    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.xyz = r0.xyz;
    r1.w = 1.0 / FogParam.y;
    r1.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r1.x);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r0.w = r0.w * r1.w;
    r0.w = max(r0.w, 0);
    r0.w = min(r0.w, 1);
    OUT.texcoord_3.w = 1 - r0.w;

    return OUT;
};

// approximately 22 instruction slots used

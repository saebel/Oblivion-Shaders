//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/DISTLOD2003.vso /Fcshaderdump19/DISTLOD2003.vso.dis
//
//
// Parameters:

float4 AlphaParam;
float4 AmbientColor;
float3 DiffuseColor;
float3 DiffuseDir;
float4 EyeDir;
float4 EyePos;
float4 FogColor;
float4 FogParam;
float4 InstanceData[2];
row_major float4x4 ModelViewProj;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   DiffuseDir    const_4       1
//   DiffuseColor  const_5       1
//   EyePos        const_9       1
//   FogColor      const_10      1
//   FogParam      const_11      1
//   AlphaParam    const_12      1
//   AmbientColor  const_13      1
//   EyeDir        const_14      1
//   InstanceData[0]  const_20       1
//   InstanceData[1]  const_21       1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 color_0 : COLOR0;
    float4 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_6 = {-1, 0, 1, 0.01};
    const float4 const_7 = {-0.5, 0, 0, 0};

    float4 offset;
    float4 r0;
    float4 r1;
    float4 r2;

    offset.w = IN.texcoord_1.x;
    r2.xyw = const_6.xyw;
    r1.xz = (1.0 / length(r2.xxy * EyeDir.xyx)) * -EyeDir.xy;
    r1.yw = r1.z * const_6.xx;
    r0.xyz = r1.zxw * const_6.xzz;
    r1.xy = r0.xy * (1.0 / sqrt(dot(r1.yxw, r0.xyz)));
    r0.w = r1.x;
    r2.x = dot(r0.wyz, IN.position.xyz);
    r0.w = IN.position.w;
    r2.y = dot(r1.yzw, IN.position.xyz);
    r2.z = IN.position.z;
    r0.xyz = ((r2.w * InstanceData[0 + offset.w].w) * r2.xyz) + InstanceData[0 + offset.w];
    r2.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    r2.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    r2.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r0.w = length(EyePos.xyz - (InstanceData[0 + offset.w]));
    r1.xyzw = frac(InstanceData[0 + offset.w]);
    OUT.texcoord_4.xyz = (DiffuseColor.rgb * (r1.w * (dot(DiffuseDir.xyz, 2 * (r1.xyz - 0.5)) * IN.color_0.rgb))) + AmbientColor.rgb;	// [0,1] to [-1,+1]
    OUT.position.xyz = r2.xyz;
    OUT.color_0.a = 1 - saturate((FogParam.x - length(r2.xyz)) / FogParam.y);
    OUT.texcoord_5.w = ((AlphaParam.x < r0.w ? 1.0 : 0.0) * (saturate(((r0.w - AlphaParam.x) / -AlphaParam.y) + 1) - 1)) + 1;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.w = 1;
    OUT.texcoord_5.xyz = 0;
    OUT.color_0.rgb = FogColor.rgb;

    return OUT;
};

// approximately 59 instruction slots used

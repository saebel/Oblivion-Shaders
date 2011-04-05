//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2038.vso /Fcshaderdump19/GRASS2038.vso.dis
//
//
// Parameters:

float4 AddlParams;
float4 AlphaParam;
float4 AmbientColor;
float3 DiffuseColor;
float3 DiffuseDir;
float4 EyeVector;
float4 FogColor;
float4 FogParam;
float4 InstanceData[2];
float4 LightPosition;
row_major float4x4 ModelViewProj;
float3 ScaleMask;
float4 WindData;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   DiffuseDir    const_0       1
//   DiffuseColor  const_1       1
//   ScaleMask     const_2       1
//   LightPosition const_3       1
//   WindData      const_4       1
//   AlphaParam    const_5       1
//   AmbientColor  const_6       1
//   AddlParams    const_7       1
//   ModelViewProj[0] const_9        1
//   ModelViewProj[1] const_10        1
//   ModelViewProj[2] const_11        1
//   ModelViewProj[3] const_12        1
//   EyeVector     const_13      1
//   FogColor      const_14      1
//   FogParam      const_15      1
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
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const float4 const_8 = {-0.5, 0.01, 1, 0};
    const float4 const_16 = {-1, 1, (1.0 / 128), 0};
    const float4 const_17 = {(1.0 / (PI * 2)), 0.5, PI * 2, -PI};
    const float4 const_18 = {D3DSINCOSCONST1};
    const float4 const_19 = {D3DSINCOSCONST2};

    float4 offset;
    float4 r0;
    float4 r1;
    float3 r2;
    float3 r3;

    offset.w = IN.texcoord_1.x;
    r0.xyzw = frac(InstanceData[0 + offset.w]);
    r1.xyz = 2 * (r0.xyz - 0.5);	// [0,1] to [-1,+1]
    r0.xyz = r0.w * IN.color_0.rgb;
    r2.xyz = (r0.xyz * saturate(dot(DiffuseDir.xyz, r1.xyz))) * DiffuseColor.rgb;
    r0.xy = EyeVector.xy * EyeVector.xy;
    r1.xz = (1.0 / sqrt(r0.y + r0.x)) * -EyeVector.xy;
    r1.yw = r1.z * -const_8.xz;
    r0.xyz = r1.zxw * const_16.xyy;
    r1.xy = r0.xy * (1.0 / sqrt(dot(r1.yxw, r0.xyz)));
    r0.w = r1.x;
    r3.yz = const_8.yz;
    r3.xyz = (((r3.y * InstanceData[0 + offset.w].w) * ScaleMask.xyz) + r3.z) * IN.position.xyz;
    r1.x = dot(r0.wyz, r3.xyz);
    r1.y = dot(r1.yzw, r3.xyz);
    r0.xy = (((sin((frac(((((InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x) / 128) + WindData.w) / ((PI * 2))) + 0.5) * PI * 2) - PI) * WindData.z) * (IN.color_0.a * IN.color_0.a)) * WindData.xy) + r1.xy;
    r0.z = r3.z;
    r1.w = IN.position.w;
    r1.xyz = r0.xyz + InstanceData[0 + offset.w];
    r0.w = dot(ModelViewProj[3].xyzw, r1.xyzw);
    r0.x = dot(ModelViewProj[0].xyzw, r1.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, r1.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, r1.xyzw);
    OUT.texcoord_5.xyz = r2.xyz * AddlParams.x;
    r2.xy = saturate((length(r0.xyzw) - AlphaParam.xz) / AlphaParam.yw);
    OUT.color_0.a = 1 - saturate((FogParam.x - length(r0.xyz)) / FogParam.y);
    OUT.position.xyzw = r0.xyzw;
    OUT.texcoord_5.w = r2.x * (1 - r2.y);
    OUT.texcoord_1.xyz = (0.5 * ((LightPosition.xyz - r1.xyz) / (LightPosition.w))) + 0.5;	// [-1,+1] to [0,1]
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.xyzw = AmbientColor.rgba;
    OUT.texcoord_1.w = 0.5;
    OUT.color_0.rgb = FogColor.rgb;

    return OUT;
};

// approximately 83 instruction slots used

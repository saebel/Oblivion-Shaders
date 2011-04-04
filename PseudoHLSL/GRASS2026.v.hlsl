//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2026.vso /Fcshaderdump19/GRASS2026.vso.dis
//
//
// Parameters:

float4 AddlParams;
float4 AlphaParam;
float4 AmbientColor;
float3 DiffuseColor;
float3 DiffuseDir;
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

    const float4 const_8 = {-0.5, 0.01, 1, (1.0 / 17)};
    const int4 const_13 = {0, 2, -1, 1};
    const float4 const_16 = {(1.0 / 128), (1.0 / (PI * 2)), 0.5, 0};
    const float4 const_17 = {PI * 2, -PI, 0, 0};
    const float4 const_18 = {D3DSINCOSCONST1};
    const float4 const_19 = {D3DSINCOSCONST2};

    float4 offset;
    float4 r0;
    float4 r1;
    float3 r2;
    float3 r3;
    float2 r4;
    float3 r5;

    offset.w = IN.texcoord_1.x;
    r0.xyzw = frac(InstanceData[0 + offset.w]);
    r1.xyz = r0.xyz - 0.5;
    r0.xyz = 2 * r1.xyz;
    r2.xyz = r0.w * IN.color_0.rgb;
    r3.x = (2 * r1.y) - r0.z;
    r1.xyz = abs(r0);
    r3.yz = r0.x * const_13.xz;
    r0.w = -r0.y;
    r1.xyzw = (r1.yzxz >= r1.xxyy ? 1.0 : 0.0);
    r4.xy = r1.yw * r1.xz;
    r3.z = r4.y * r3.z;
    r3.xy = (r4.y * r3.xy) + r0.wx;
    r1.yz = (r0.xzyw * const_13.xzww) - r3.yz;
    r0.w = InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x;
    r2.xyz = (r2.xyz * saturate(dot(DiffuseDir.xyz, r0.xyz))) * DiffuseColor.rgb;
    OUT.texcoord_5.xyz = r2.xyz * AddlParams.x;
    r1.x = -r3.x;
    r1.xyz = (r4.x * r1.xyz) + r3.xyz;
    r5.xyz = normalize(r1.xyz);
    r1.x = 2 * (frac(r0.w / 17) - 0.5);	// [0,1] to [-1,+1]
    r1.yz = const_8.yz;
    r1.w = sqrt(1.0 - (r1.x * r1.x));
    r3.xyz = ((r1.y * InstanceData[0 + offset.w].w) * ScaleMask.xyz) + r1.z;
    r1.z = 0;
    r1.y = -r1.w;
    r3.xyz = r3.xyz * IN.position.xyz;
    r0.xyz = (r3.z * r0.xyz) + ((dot(r1.xyz, r3.xyz) * ((r5.yzx * r0.zxy) - (r0.yzx * r5.zxy))) + (r5.xyz * dot(r1.wxz, r3.xyz)));
    r0.xy = (((sin((frac((((r0.w / 128) + WindData.w) / (PI * 2)) + 0.5) * PI * 2) + -PI) * WindData.z) * (IN.color_0.a * IN.color_0.a)) * WindData.xy) + r0.xy;
    r1.xyz = r0.xyz + InstanceData[0 + offset.w];
    r1.w = IN.position.w;
    r0.x = dot(ModelViewProj[0].xyzw, r1.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, r1.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, r1.xyzw);
    r0.w = dot(ModelViewProj[3].xyzw, r1.xyzw);
    OUT.color_0.a = 1 - saturate((FogParam.x - length(r0.xyz)) / FogParam.y);
    OUT.position.xyzw = r0.xyzw;
    r2.xy = saturate((length(r0.xyzw) - AlphaParam.xz) / AlphaParam.yw);
    OUT.texcoord_5.w = r2.x * (1 - r2.y);
    OUT.texcoord_1.xyz = (0.5 * ((LightPosition.xyz - r1.xyz) / (LightPosition.w))) + 0.5;	// [-1,+1] to [0,1]
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.xyzw = AmbientColor.rgba;
    OUT.texcoord_1.w = 0.5;
    OUT.color_0.rgb = FogColor.rgb;

    return OUT;
};

// approximately 100 instruction slots used

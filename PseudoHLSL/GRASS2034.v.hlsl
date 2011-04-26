//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2034.vso /Fcshaderdump19/GRASS2034.vso.dis
//
//
// Parameters:
//
float4 AddlParams : register(c7);
float4 AlphaParam : register(c5);
float4 AmbientColor : register(c6);
float3 DiffuseColor : register(c1);
float3 DiffuseDir : register(c0);
float4 FogColor : register(c14);
float4 FogParam : register(c15);
float4 InstanceData[2];
float4 LightPosition : register(c3);
row_major float4x4 ModelViewProj;
float3 ScaleMask : register(c2);
float4 ShadowProjData : register(c8);
float4 ShadowProjTransform : register(c13);
float4 WindData : register(c4);
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   DiffuseDir          const_0       1
//   DiffuseColor        const_1       1
//   ScaleMask           const_2       1
//   LightPosition       const_3       1
//   WindData            const_4       1
//   AlphaParam          const_5       1
//   AmbientColor        const_6       1
//   AddlParams          const_7       1
//   ShadowProjData      const_8       1
//   ModelViewProj[0]       const_9        1
//   ModelViewProj[1]       const_10        1
//   ModelViewProj[2]       const_11        1
//   ModelViewProj[3]       const_12        1
//   ShadowProjTransform const_13      1
//   FogColor            const_14      1
//   FogParam            const_15      1
//   InstanceData[0]        const_20       1
//   InstanceData[1]        const_21       1
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
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5
#define	PI			3.14159274
#define	anglei(v)		(((v) + PI) / (2 * PI))
#define	angler(v)		(((v) * (2 * PI)) - PI)
#define	fracr(v)		angler(frac(anglei(v)))	// signed modulo % PI
#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_16 = {-0.5, 0.01, 1, (1.0 / 17)};
    const int4 const_17 = {0, 2, -1, 1};

    float1 q0;
    float4 r0;
    float4 r1;
    float3 r2;
    float3 r3;
    float3 r4;
    float3 r5;

    r0.xyzw = frac(InstanceData[0 + IN.texcoord_1.x]);
    r3.xyz = r0.xyz - 0.5;
    r2.xyz = r0.w * IN.color_0.rgb;
    q0.x = InstanceData[0 + IN.texcoord_1.x].y + InstanceData[0 + IN.texcoord_1.x].x;
    OUT.color_0.rgb = FogColor.rgb;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    r0.xyz = 2 * r3.xyz;
    r1.xyz = abs(r0.xyz);
    r0.w = -r0.y;
    r1.xyzw = (r1.yzxz >= r1.xxyy ? 1.0 : 0.0);
    r4.xy = r1.yw * r1.xz;
    r3.x = (2 * r3.y) - r0.z;
    r3.yz = r0.x * const_17.zw;
    r3.z = r4.y * r3.z;
    r3.xy = (r4.y * r3.xy) + r0.wx;
    r1.x = -r3.x;
    r1.yz = (r0.zy * const_17.zw) - r3.yz;
    r1.xyz = (r4.x * r1.xyz) + r3.xyz;
    r5.xyz = normalize(r1.xyz);
    r1.x = expand(frac(q0.x / 17));	// [0,1] to [-1,+1]
    r1.w = sqrt(1.0 - sqr(r1.x));	// arcsin = 1 / sqrt(1 - x�)
    r1.yz = const_16.yz;
    r3.xyz = (((r1.y * InstanceData[0 + IN.texcoord_1.x].w) * ScaleMask.xyz) + r1.z) * IN.position.xyz;
    r1.z = 0;
    r1.y = -r1.w;
    r4.xyz = (dot(r1.xyz, r3.xyz) * cross(r5.xyz, r0.xyz)) + (r5.xyz * dot(r1.wxz, r3.xyz));
    r1.w = IN.position.w;
    r1.xyz = (r3.z * r0.xyz) + r4.xyz;
    r4.x = dot(DiffuseDir.xyz, r0.xyz);
    r1.xy = (((sin(fracr((q0.x / 128) + WindData.w)) * WindData.z) * sqr(IN.color_0.a)) * WindData.xy) + r1.xy;
    r1.xyz = r1.xyz + InstanceData[0 + IN.texcoord_1.x];
    r0.xy = r1.xy - ShadowProjData.xy;
    OUT.texcoord_1.w = 0.5;
    OUT.texcoord_1.xyz = compress((LightPosition.xyz - r1.xyz) / LightPosition.w);	// [-1,+1] to [0,1]
    OUT.texcoord_2.xy = (r1.xy + ShadowProjTransform.xy) / ShadowProjTransform.w;
    OUT.texcoord_3.y = 1 - (r0.y / ShadowProjData.w);
    OUT.texcoord_3.x = r0.x / ShadowProjData.w;
    r0.xyzw = mul(ModelViewProj, r1.xyzw);
    OUT.color_0.a = 1 - saturate((FogParam.x - length(r0.xyz)) / FogParam.y);
    OUT.position.xyzw = r0.xyzw;
    r0.xy = saturate((length(r0.xyzw) - AlphaParam.xz) / AlphaParam.yw);
    OUT.texcoord_3.z = ShadowProjData.z;
    OUT.texcoord_4.xyzw = AmbientColor.rgba;
    OUT.texcoord_5.w = r0.x * (1 - r0.y);
    OUT.texcoord_5.xyz = ((r2.xyz * saturate(r4.x)) * DiffuseColor.rgb) * AddlParams.x;

    return OUT;
};

// approximately 108 instruction slots used

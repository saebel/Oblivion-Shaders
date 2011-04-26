//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2032.vso /Fcshaderdump19/GRASS2032.vso.dis
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
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_16 = {-0.5, 0.01, 1, (1.0 / 17)};

    float1 q0;
    float3 q3;
    float4 r0;
    float4 r1;
    float3 r2;

    r0.yz = const_16.yz;
    q0.x = InstanceData[0 + IN.texcoord_1.x].y + InstanceData[0 + IN.texcoord_1.x].x;
    r0.x = expand(frac(q0.x / 17));	// [0,1] to [-1,+1]
    r0.w = sqrt(1.0 - sqr(r0.x));	// arcsin = 1 / sqrt(1 - x�)
    r1.w = IN.position.w;
    r1.xyz = (((r0.y * InstanceData[0 + IN.texcoord_1.x].w) * ScaleMask.xyz) + r0.z) * IN.position.xyz;
    r0.z = 0;
    r0.y = -r0.w;
    r2.y = dot(r0.wxz, r1.xyz);
    r2.x = dot(r0.xyz, r1.xyz);
    r0.z = r1.z;
    r0.xy = (((sin(fracr((q0.x / 128) + WindData.w)) * WindData.z) * sqr(IN.color_0.a)) * WindData.xy) + r2.xy;
    r1.xyz = r0.xyz + InstanceData[0 + IN.texcoord_1.x];
    r2.xy = r1.xy - ShadowProjData.xy;
    r0.xyzw = frac(InstanceData[0 + IN.texcoord_1.x]);
    q3.xyz = expand(r0.xyz);	// [0,1] to [-1,+1]
    r0.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), r1.xyzw);
    OUT.color_0.rgb = FogColor.rgb;
    OUT.color_0.a = 1 - saturate((FogParam.x - length(r0.xyz)) / FogParam.y);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.w = 0.5;
    OUT.texcoord_1.xyz = compress((LightPosition.xyz - r1.xyz) / LightPosition.w);	// [-1,+1] to [0,1]
    OUT.texcoord_2.xy = (r1.xy + ShadowProjTransform.xy) / ShadowProjTransform.w;
    OUT.texcoord_3.x = r2.x / ShadowProjData.w;
    OUT.texcoord_3.y = 1 - (r2.y / ShadowProjData.w);
    r2.xyz = ((r0.w * IN.color_0.rgb) * shades(DiffuseDir.xyz, q3.xyz)) * DiffuseColor.rgb;
    r0.w = dot(ModelViewProj[3].xyzw, r1.xyzw);
    OUT.position.xyzw = r0.xyzw;
    r0.xy = saturate((length(r0.xyzw) - AlphaParam.xz) / AlphaParam.yw);
    OUT.texcoord_3.z = ShadowProjData.z;
    OUT.texcoord_4.xyzw = AmbientColor.rgba;
    OUT.texcoord_5.w = r0.x * (1 - r0.y);
    OUT.texcoord_5.xyz = r2.xyz * AddlParams.x;

    return OUT;
};

// approximately 90 instruction slots used

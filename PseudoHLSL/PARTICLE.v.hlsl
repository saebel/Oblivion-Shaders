//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PARTICLE.vso /Fcshaderdump19/PARTICLE.vso.dis
//
//
// Parameters:

float4 Acceleration;
float4 Color1;
float4 Color2;
float4 Color3;
float4 InstanceData[2];
float4 Velocity;
row_major float4x4 WorldViewProj;
float4 fVars0;
float4 fVars1;
float4 fVars2;
float4 fVars3;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   WorldViewProj[0] const_0        1
//   WorldViewProj[1] const_1        1
//   WorldViewProj[2] const_2        1
//   WorldViewProj[3] const_3        1
//   fVars0        const_4       1
//   fVars1        const_5       1
//   fVars2        const_6       1
//   fVars3        const_7       1
//   Color1        const_8       1
//   Color2        const_9       1
//   Color3        const_10      1
//   Velocity      const_11      1
//   Acceleration  const_12      1
//   InstanceData[0]  const_15       1
//   InstanceData[1]  const_16       1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_1 : COLOR1;
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const float4 const_13 = {2, 0.5, 1, 0};

    float4 offset;
    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;

    offset.w = (2 * IN.color_1.r) - frac(2 * IN.color_1.r);
    r0.xyz = InstanceData[1 + offset.w];
    r1.xzw = fVars0.xzw;
    r3.w = (r1.x - InstanceData[0 + offset.w].w) * InstanceData[1 + offset.w].w;
    r1.xyz = (r3.w * ((r1.z * r0.xyz) + Velocity.xyz)) + InstanceData[0 + offset.w];
    r5.w = 1.0 / fVars0.y;
    r6.w = r3.w * r5.w;
    r3.xy = (fVars2.zwzw < r6.w ? 1.0 : 0.0);
    r0.xyz = ((0.5 * (((r1.w * r0.xyz) + Acceleration.xyz) * (r3.w * r3.w))) + r1.xyz) - fVars3.xyz;
    r0.w = 1;
    OUT.position.z = dot(WorldViewProj[2].xyzw, r0.xyzw);
    OUT.position.w = dot(WorldViewProj[3].xyzw, r0.xyzw);
    r2.xz = fVars2.xz * r3.x;
    r2.yw = lerp(fVars2.yw, fVars2.xxzz, r3.x);
    r4.zw = const_13.zw;
    r1.xzw = ((fVars2.yywy * r4.zyzw) + r4.wywz) - r2.xzw;
    r1.y = -r2.y;
    r1.xyzw = (r3.y * r1.xyzw) + r2.xyzw;
    r2.xy = (fVars1.z * r4.zwzw) + r4.wz;
    r4.xy = lerp(r1.y, r1.x, ((r3.w * r5.w) - r1.z) / (r1.w - r1.z)) * IN.position.xy;
    r1.w = fVars1.x;
    r3.xyz = (fVars1 < r6.w ? 1.0 : 0.0);
    r1.x = r3.x * r1.w;
    r1.z = lerp(fVars1.y, fVars1.x, r3.x);
    r1.xy = lerp(r2.xy, lerp(fVars1.yzzw, r1.xzzw, r3.y), r3.z);
    r5.x = dot(WorldViewProj[0].xyzw, r0.xyzw);
    r5.y = dot(WorldViewProj[1].xyzw, r0.xyzw);
    r5.w = ((r3.w * r5.w) - r1.x) / (r1.y - r1.x);
    OUT.position.xy = ((1.0 / fVars1.w) * r4.xy) + r5.xy;
    r0.x.zw = Color1.xy - r4.zz;
    r1.xyzw = Color1.rgba;
    r1.x.zw = Color2.xy - r1.xy;
    r0.xyzw = lerp(lerp(const_13.zzzw, lerp(Color3.rgba, ((r3.x * r1.xyzw) + Color1.rgba), r3.y), r3.z), lerp(Color3.rgba, lerp(Color2.rgba, ((r3.x * r0.xyzw) + const_13.zzzw), r3.y), r3.z), r5.w);
    OUT.color_0.a = r0.w * fVars3.w;
    OUT.color_0.rgb = r0.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 73 instruction slots used

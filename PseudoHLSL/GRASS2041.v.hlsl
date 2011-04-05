//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2041.vso /Fcshaderdump19/GRASS2041.vso.dis
//
//
// Parameters:

float4 AlphaParam;
float4 FogColor;
float4 FogParam;
float4 InstanceData[2];
row_major float4x4 ModelViewProj;
float4 ObjToCube0;
float4 ObjToCube1;
float4 ObjToCube2;
float4 ObjToCube3;
float3 ScaleMask;
float4 WindData;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ObjToCube0    const_0       1
//   ObjToCube1    const_1       1
//   ScaleMask     const_2       1
//   ObjToCube2    const_3       1
//   WindData      const_4       1
//   AlphaParam    const_5       1
//   ObjToCube3    const_6       1
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
    float4 texcoord_2 : TEXCOORD2;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const float4 const_7 = {-0.5, 0.01, 1, (1.0 / 17)};
    const float4 const_8 = {(1.0 / 128), (1.0 / (PI * 2)), 0.5, 0};
    const float4 const_13 = {PI * 2, -PI, 0, 0};
    const int4 const_16 = {0, 2, -1, 1};
    const float4 const_17 = {D3DSINCOSCONST1};
    const float4 const_18 = {D3DSINCOSCONST2};

    float4 offset;
    float4 r0;
    float4 r1;
    float4 r2;
    float3 r3;
    float3 r4;

    offset.w = IN.texcoord_1.x;
    r2.xyz = frac(InstanceData[0 + offset.w]) - 0.5;
    r0.xyz = 2 * r2.xyz;
    r0.w = -r0.y;
    r1.xyz = abs(r0.xyz);
    r1.xyzw = (r1.yzxz >= r1.xxyy ? 1.0 : 0.0);
    r2.x = (2 * r2.y) - r0.z;
    r2.yz = r0.x * const_16.xz;
    r3.xy = r1.yw * r1.xz;
    r2.xy = (r3.y * r2.xy) + r0.wx;
    r0.w = InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x;
    r1.x = -r2.x;
    r2.z = r3.y * r2.z;
    r1.yz = (r0.xz * const_16.xz) - r2.yz;
    r1.xyz = (r3.x * r1.xyz) + r2.xyz;
    r4.xyz = normalize(r1.xyz);
    r1.x = 2 * (frac(r0.w / 17) - 0.5);	// [0,1] to [-1,+1]
    r1.w = sqrt(1.0 - (r1.x * r1.x));	// arcsin = 1 / sqrt(1 - x�)
    r1.yz = const_7.yz;
    r2.w = r1.y * InstanceData[0 + offset.w].w;
    r1.y = -r1.w;
    r2.xyz = (r2.w * ScaleMask.xyz) + r1.z;
    r1.z = 0;
    r2.xyz = r2.xyz * IN.position.xyz;
    r3.xyz = (dot(r1.xyz, r2.xyz) * ((r4.yzx * r0.zxy) - (r0.yzx * r4.zxy))) + (r4.xyz * dot(r1.wxz, r2.xyz));
    r0.xyz = (r2.z * r0.xyz) + r3.xyz;
    r0.xy = (((sin((frac((((r0.w / 128) + WindData.w) / (PI * 2)) + 0.5) * PI * 2) - PI) * WindData.z) * (IN.color_0.a * IN.color_0.a)) * WindData.xy) + r0.xy;
    r0.w = IN.position.w;
    r0.xyz = r0.xyz + InstanceData[0 + offset.w];
    r1.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r1.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    r0.xyzw = (r0.xyzx * const_16.wwwx) + const_16.xxxw;
    r2.xy = saturate((length(r1.xyzw) - AlphaParam.xz) / AlphaParam.yw);
    OUT.color_0.a = 1 - saturate((FogParam.x - length(r1.xyz)) / FogParam.y);
    OUT.position.xyzw = r1.xyzw;
    OUT.texcoord_5.w = r2.x * (1 - r2.y);
    OUT.texcoord_1.x = dot(ObjToCube0.xyzw, r0.xyzw);
    OUT.texcoord_1.y = dot(ObjToCube1.xyzw, r0.xyzw);
    OUT.texcoord_1.z = dot(ObjToCube2.xyzw, r0.xyzw);
    OUT.texcoord_1.w = dot(ObjToCube3.xyzw, r0.xyzw);
    OUT.texcoord_2.xyzw = r0.xyzw;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.xyzw = 0;
    OUT.texcoord_5.xyz = 0;
    OUT.color_0.rgb = FogColor.rgb;

    return OUT;
};

// approximately 95 instruction slots used

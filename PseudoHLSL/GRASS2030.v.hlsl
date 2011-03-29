//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2030.vso /Fcshaderdump19/GRASS2030.vso.dis
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
row_major float4x4 ModelViewProj;
float3 ScaleMask;
float4 ShadowProjData;
float4 ShadowProjTransform;
float4 WindData;


// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   DiffuseDir          const_0       1
//   DiffuseColor        const_1       1
//   ScaleMask           const_2       1
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
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_3 = {-0.5, 0.01, 1, (1.0 / 17)};
    const int4 const_16 = {0, 2, -1, 1};
    const float4 const_17 = {(1.0 / 128), (1.0 / (PI * 2)), 0.5, 0};
    const float4 const_18 = {PI * 2, -PI, 0, 0};
    const float4 const_19 = {D3DSINCOSCONST1};
    const float4 const_22 = {D3DSINCOSCONST2};

    OUT.color_0.rgb = FogColor.rgb;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_3.z = ShadowProjData.z;
    OUT.texcoord_4.xyzw = AmbientColor.rgba;
    r0.w = frac(IN.texcoord_1.x);
    r0.w = IN.texcoord_1.x - r0.w;
    offset.w = r0.w;
    r1.xyzw = frac(InstanceData[0 + offset.w]);
    r1.xyz = r1.xyz + -0.5;
    r0.xyz = r1.xyz + r1.xyz;
    r0.w = -r0.y;
    r1.x = (2 * r1.y) - r0.z;
    r2.xyz = abs(r0);
    r2.xyzw = (r2.yzxz >= r2.xxyy ? 1.0 : 0.0);
    r3.xy = r2.ywzw * r2.xzzw;
    r2.xy = (r3.y * r1) + r0.wxzw;
    r1.x = -r2.x;
    r1.yz = r0.x * const_16.xzww;
    r2.z = r3.y * r1.z;
    r1.yz = (r0.xzyw * const_16.xzww) - r2.yz;
    r0.w = InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x;
    r1.xyz = (r3.x * r1.xyz) + r2.xyz;
    r2.z = 0;
    r4.xyz = normalize(r1);
    r1.xyz = r0.yzxw * r4.zxyw;
    r3.xyz = (r4.yzxw * r0.zxyw) - r1.xyz;
    r1.yz = const_3.yz;
    r3.w = r1.y * InstanceData[0 + offset.w].w;
    r1.xyz = (r3.w * ScaleMask) + r1.z;
    r1.xyz = r1.xyz * IN.position;
    r2.w = r0.w * (1.0 / 17);
    r5.x = WindData.w;
    r0.w = (r0.w * (1.0 / 128)) + r5.x;
    r0.w = (r0.w * (1.0 / (PI * 2))) + 0.5;
    r0.w = frac(r0.w);
    r0.w = (r0.w * PI * 2) + -PI;
    r2.w = frac(r2.w);
    r2.w = r2.w + -0.5;
    r2.x = r2.w + r2.w;
    r2.w = (r2.x * -r2.x) + 1;
    r2.w = 1.0 / sqrt(r2.w);
    r2.w = 1.0 / r2.w;
    r2.y = -r2.w;
    r5.x = dot(r2.wxzw.xyz, r1.xyz);
    r1.x = dot(r2.xyz, r1.xyz);
    r2.xyz = r4.xyz * r5.x;
    r3.xyz = (r1.x * r3.xyz) + r2.xyz;
    r1.xyz = (r1.z * r0.xyz) + r3.xyz;
    r2.y = sin(r0.w);
    r0.w = IN.color_0.a * IN.color_0.a;
    r2.w = r2.y * WindData.z;
    r0.w = r2.w * r0.w;
    r2.xyz = r1.w * IN.color_0;
    r1.w = 1.0 / ShadowProjData.w;
    r1.xy = (r0.w * WindData.xy) + r1.xy;
    r0.w = 1.0 / ShadowProjTransform.w;
    r1.xyz = r1.xyz + InstanceData[0 + offset.w];
    r4.x = dot(DiffuseDir.xyz, r0.xyz);
    r0.xy = r1.xy - ShadowProjData.xy;
    OUT.texcoord_3.x = r0.x * r1.w;
    OUT.texcoord_3.y = (r0.y * -r1.w) + 1;
    r1.w = IN.position.w;
    r3.xy = r1.xy + ShadowProjTransform.xy;
    OUT.texcoord_2.xy = r3.xy * r0.w;
    r0.w = max(r4.x, 0);
    r0.w = min(r0.w, 1);
    r0.xyz = r2.xyz * r0.w;
    r0.w = dot(ModelViewProj[3].xyzw, r1.xyzw);
    r2.xyz = r0.xyz * DiffuseColor.rgb;
    OUT.texcoord_5.xyz = r2.xyz * AddlParams.x;
    r0.x = dot(ModelViewProj[0].xyzw, r1.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, r1.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, r1.xyzw);
    OUT.position.xyzw = r0.xyzw;
    r2.w = dot(r0.xyzw, r0.xyzw);	// normalize + length
    r2.y = 1.0 / AlphaParam.w;
    r3.w = 1.0 / sqrt(r2.w);
    r3.w = 1.0 / r3.w;
    r1.xy = r3.w - AlphaParam.xzzw;
    r2.w = 1.0 / FogParam.y;
    r2.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r1.w = 1.0 / sqrt(r2.x);
    r1.w = 1.0 / r1.w;
    r1.w = FogParam.x - r1.w;
    r1.w = r1.w * r2.w;
    r1.w = max(r1.w, 0);
    r1.w = min(r1.w, 1);
    OUT.color_0.a = 1 - r1.w;
    r2.x = 1.0 / AlphaParam.y;
    r1.xy = r1.xy * r2.xy;
    r1.xy = max(r1.xy, 0);
    r1.xy = min(r1.xy, 1);
    r1.w = 1 - r1.y;
    OUT.texcoord_5.w = r1.x * r1.w;

    return OUT;
};

// approximately 103 instruction slots used

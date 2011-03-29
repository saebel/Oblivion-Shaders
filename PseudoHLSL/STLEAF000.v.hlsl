//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STLEAF000.vso /Fcshaderdump19/STLEAF000.vso.dis
//
//
// Parameters:

float4 AmbientColor;
float4 BillboardRight;
float4 BillboardUp;
float4 DiffColor;
float4 LeafBase[48];
float4 LeafLighting;
float4 LightVector;
row_major float4x4 ModelViewProj;
float4 RockParams;
float4 RustleParams;
float SunDimmer;
float4 WindMatrices[16];


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   AmbientColor   const_5       1
//   DiffColor      const_6       1
//   SunDimmer      const_10      1
//   LightVector    const_11      1
//   BillboardRight const_13      1
//   BillboardUp    const_14      1
//   RockParams     const_15      1
//   RustleParams   const_16      1
//   LeafLighting   const_17      1
//   WindMatrices[0]   const_18      4
//   WindMatrices[1]   const_19      4
//   WindMatrices[2]   const_20      4
//   WindMatrices[3]   const_21      4
//   LeafBase       const_34     48
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {(1.0 / (PI * 2)), 0.25, 0.5, 0};
    const float4 const_7 = {(1.0 / 48), 0.499999553, 0.25, -0.00138883968};
    const float4 const_8 = {PI * 2, -PI, -2.52398507e-007, 2.47609005e-005};
    const float4 const_9 = {(1.0 / 24), -0.5, 1, 0};

    OUT.texcoord_0.xy = IN.texcoord_0;
    offset.x = IN.blendindices.z;
    r0.w = (1.0 / 48);
    r0.xy = frac(r1);
    r0.xy = (PI * 2 * r0) + -PI;
    r0.xy = r0.xy * r0.xy;
    r1.w = (IN.blendindices.z * r0.w) + RockParams.y;
    r2.w = (r1.w * 0.499999553) + 0.25;
    r2.xy = (r1 * r0) + -0.00138883968;
    r2.xy = (r2 * r0) + (1.0 / 24);
    r2.xy = (r2 * r0) + -0.5;
    r6.y = pow(2.0, r2.w);	// partial precision
    r1.w = r6.y;
    r1.w = (r1.w * PI * 2) + -PI;
    r1.w = r1.w * r1.w;
    r2.w = (IN.blendindices.z * r0.w) + RustleParams.y;
    r0.w = (r1.w * -2.52398507e-007) + 2.47609005e-005;
    r3.w = (r2.w * 0.499999553) + 0.25;
    r2.w = (r1.w * r0.w) + -0.00138883968;
    r2.w = (r1.w * r2.w) + (1.0 / 24);
    r2.w = (r1.w * r2.w) + -0.5;
    r2.w = (r1.w * r2.w) + 1;
    r2.w = r2.w * RockParams.z;
    r2.w = r2.w * RockParams.x;
    r1.xy = (r2.w * (1.0 / (PI * 2))) + const_4.yzzw;
    r1.xy = (-2.52398507e-007 * r0) + 2.47609005e-005;
    r1.xy = frac(r3);
    r1.xy = (PI * 2 * r1) + -PI;
    r1.xy = r1.xy * r1.xy;
    r6.y = pow(2.0, r3.w);	// partial precision
    r0.w = r6.y;
    r0.w = (r0.w * PI * 2) + -PI;
    r0.w = r0.w * r0.w;
    r1.w = (r0.w * -2.52398507e-007) + 2.47609005e-005;
    r1.w = (r0.w * r1.w) + -0.00138883968;
    r1.w = (r0.w * r1.w) + (1.0 / 24);
    r1.w = (r0.w * r1.w) + -0.5;
    r0.w = (r0.w * r1.w) + 1;
    r0.w = r0.w * RustleParams.z;
    r0.w = r0.w * RustleParams.x;
    r3.xy = (r0.w * (1.0 / (PI * 2))) + const_4.yzzw;
    r0.xw = (r0.yyzx * r2.yyzx) + 1;
    r0.y = -r0.w;
    r0.z = 0;
    r3.xy = (r2 * r1) + (1.0 / 24);
    r3.xy = (r3 * r1) + -0.5;
    r3.xw = (r1.yyzx * r3.yyzx) + 1;
    r1.zw = BillboardRight.zw;
    r3.z = 0;
    r1.y = dot(r3.wxzw.xyz, BillboardRight.xyz);
    r3.y = -r3.w;
    r1.x = dot(r3.xyz, BillboardRight.xyz);
    r2.xy = (-2.52398507e-007 * r1) + 2.47609005e-005;
    r2.xy = (r2 * r1) + -0.00138883968;
    r2.xyzw = IN.blendindices.w * LeafBase[offset.x];
    offset.x = IN.blendindices.y;
    r2.w = dot(r2.xyzw, r2.xyzw);	// normalize + length
    r4.x = dot(r0.zwxw.xyz, r2.xyz);
    r5.x = dot(r0.zxyw.xyz, r2.xyz);
    r0.x = dot(r3.xyz, BillboardUp.xyz);
    r0.y = dot(r3.wxzw.xyz, BillboardUp.xyz);
    r0.zw = BillboardUp.zw;
    r0.xyzw = (r4.x * r0) + r1;
    r0.w = 1.0 / sqrt(r2.w);
    r1.xyzw = r5.x * r1;
    r1.xyzw = r0 + IN.position;
    r0.x = dot(WindMatrices[0 + offset.x].xyzw, r1.xyzw);
    r0.y = dot(WindMatrices[1 + offset.x].xyzw, r1.xyzw);
    r0.z = dot(WindMatrices[2 + offset.x].xyzw, r1.xyzw);
    r2.xyz = r2.xyz * r0.w;
    r0.w = dot(WindMatrices[3 + offset.x].xyzw, r1.xyzw);
    r1.xyzw = (IN.blendindices.x * r0) + r1;
    OUT.position.w = dot(ModelViewProj[3].xyzw, r1.xyzw);
    OUT.position.x = dot(ModelViewProj[0].xyzw, r1.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, r1.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, r1.xyzw);
    r0.xyzw = r0 - r1;
    r2.xyz = (LeafLighting.y * r2) + IN.normal;
    r3.x = dot(r2.xyz, r2.xyz);	// normalize + length
    r2.w = 1.0 / sqrt(r3.x);
    r2.xyz = r2.xyz * r2.w;
    r0.x = dot(r2.xyz, LightVector.xyz);
    r0.w = max(r0.x, 0);
    r0.w = min(r0.w, 1);
    r0.xyzw = r0.w * DiffColor;
    r2.w = SunDimmer.x;
    r0.xyzw = (r2.w * r0) + AmbientColor;
    OUT.texcoord_1.w = r0.w;
    r6.y = pow(2.0, IN.blendindices.z);	// partial precision
    r2.w = r6.y;
    OUT.texcoord_1.xyz = r0.xyz * r2.w;

    return OUT;
};

// approximately 95 instruction slots used

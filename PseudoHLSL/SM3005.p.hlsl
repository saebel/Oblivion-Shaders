//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3005.pso /Fcshaderdump19/SM3005.pso.dis
//
//
// Parameters:
//
float4 AmbientColor;
sampler2D BaseMap;
float3 EyePosition;
float4 LightData[20];
float3 MatAlpha;
sampler2D NormalMap;
float4 ToggleADTS;
float4 ToggleNumLights;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   AmbientColor    const_0       1
//   EyePosition     const_1       1
//   MatAlpha        const_3       1
//   ToggleADTS      const_5       1
//   ToggleNumLights const_6       1
//   LightData[0]       const_9         1
//   LightData[1]       const_10         1
//   LightData[2]       const_11         1
//   LightData[3]       const_12         1
//   LightData[4]       const_13         1
//   LightData[5]       const_14         1
//   LightData[6]       const_15         1
//   LightData[7]       const_16         1
//   LightData[8]       const_17        1
//   LightData[9]       const_18        1
//   LightData[10]       const_19        1
//   LightData[11]       const_20        1
//   LightData[12]       const_21        1
//   LightData[13]       const_22        1
//   LightData[14]       const_23        1
//   LightData[15]       const_24        1
//   LightData[16]       const_25       1
//   LightData[17]       const_26       1
//   LightData[18]       const_27       1
//   LightData[19]       const_28       1
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 color_0 : COLOR0;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float3 texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7_centroid;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	uvtile(w)		(((w) * 0.04) - 0.02)
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const int4 const_29 = {2, -6, -7, -8};
    const int4 const_30 = {2, -10, -11, -12};
    const int4 const_31 = {2, -16, -17, -18};
    const int4 const_32 = {2, -18, -19, 0};
    const int4 const_33 = {2, -8, -9, -10};
    const int4 const_34 = {2, -12, -13, -14};
    const int4 const_35 = {2, -14, -15, -16};
    const int4 const_4 = {0, 1, 10, 2};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -4, -5, -6};

    float3 eye287;
    float3 l101;
    float3 l106;
    float3 l111;
    float3 l116;
    float3 l121;
    float3 l126;
    float3 l131;
    float3 l136;
    float3 l148;
    float3 l32;
    float3 l35;
    float1 l600;
    float3 l96;
    float3 m154;
    float3 m163;
    float3 m169;
    float3 m176;
    float3 m183;
    float3 m190;
    float3 m197;
    float3 m204;
    float3 m211;
    float3 m217;
    float4 noxel1;
    float1 q10;
    float3 q12;
    float1 q13;
    float3 q15;
    float1 q16;
    float3 q18;
    float1 q19;
    float1 q2;
    float3 q21;
    float1 q22;
    float3 q24;
    float1 q25;
    float3 q27;
    float1 q28;
    float3 q30;
    float1 q31;
    float3 q4;
    float3 q41;
    float3 q46;
    float3 q51;
    float3 q56;
    float3 q6;
    float3 q61;
    float3 q66;
    float1 q7;
    float3 q71;
    float3 q76;
    float3 q81;
    float3 q9;
    float3 q90;
    float4 r0;
    float4 r1;
    float3 r10;
    float2 r12;
    float4 r2;
    float4 r3;
    float3 r4;
    float3 r5;
    float3 r6;
    float3 r7;
    float3 r8;
    float3 r9;

#define	TanSpaceProj	float3x3(r9.xyz, r8.xyz, r7.xyz)
#define	TanSpaceProj	float3x3(r9.xyz, r8.xyz, r7.xyz)

    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r7.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r8.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r9.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    eye287.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r6.xyz = normalize(eye287.xyz);			// partial precision
    r3.xyz = const_4.xyz;
    r12.xy = (uvtile(r0.w) * r6.xy) + IN.BaseUV.xy;			// partial precision
    noxel1.xyzw = tex2D(NormalMap, r12.xy);
    r0.xyzw = expand(noxel1.xyzw);			// partial precision	// [0,1] to [-1,+1]
    r4.xyz = normalize(r0.xyz);			// partial precision
    r1.w = (ToggleNumLights.x <= 0.0 ? r3.x : r3.y);

    if (0 != r1.w) {
      l148.xyz = mul(TanSpaceProj, LightData[1].xyz);
      r2.xyz = shade(r4.xyz, l148.xyz) * LightData[0].xyz;			// partial precision
      r0.xyz = pow(abs(shades(normalize(r6.xyz + l148.xyz), r4.xyz)), ToggleNumLights.z) * LightData[0].xyz;			// partial precision
      r3.w = 1;
    }
    else {
      r3.w = 0;
      r2.xyz = 0;			// partial precision
      r0.xyz = 0;			// partial precision
    }

    q2.x = min(ToggleNumLights.y, r3.z - ToggleNumLights.x);			// partial precision
    r2.w = ((q2.x >= 0.0 ? 0 : 1) * (frac(q2.x) <= 0.0 ? 0 : 1)) + (q2.x - frac(q2.x));
    r1.w = (r2.w <= 0.0 ? 0 : 1);

    if (0 != r1.w) {
      r5.x = 2 * r3.w;
      r5.yz = r5.x - const_4.yw;
      q4.xyz = r5.x - const_4.xyw;
      r3.w = r3.w + 1;
      r10.xyz = (q4.xyz >= 0.0 ? q4.xyz : -r5.xyz);
      r1.xyzw = (r10.z <= 0.0 ? LightData[3].xyzw : (r10.y <= 0.0 ? LightData[2].xyzw : (r10.x <= 0.0 ? LightData[1].xyzw : 0)));
      q41.xyz = r1.xyz - IN.texcoord_6.xyz;
      m154.xyz = mul(TanSpaceProj, q41.xyz);
      q7.x = 1.0 - sqr(saturate(length(q41.xyz) / r1.w));			// partial precision
      l96.xyz = (r10.z <= 0.0 ? LightData[2].xyz : (r10.y <= 0.0 ? LightData[1].xyz : (r10.x <= 0.0 ? LightData[0].xyz : 0)));			// partial precision
      q6.xyz = l96.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m154.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q7.x * q6.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q7.x * dot(r4.xyz, normalize(m154.xyz)), 0) * l96.xyz) + r2.xyz;			// partial precision
    }


    if (1 != r2.w) {
      r10.xyz = (2 * r3.w) + const_7.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[5].xyzw : (r10.y == 0.0 ? LightData[4].xyzw : (r10.x == 0.0 ? LightData[3].xyzw : 0)));
      q46.xyz = r1.xyz - IN.texcoord_6.xyz;
      m163.xyz = mul(TanSpaceProj, q46.xyz);
      q10.x = 1.0 - sqr(saturate(length(q46.xyz) / r1.w));			// partial precision
      l101.xyz = (r10.z == 0.0 ? LightData[4].xyz : (r10.y == 0.0 ? LightData[3].xyz : (r10.x == 0.0 ? LightData[2].xyz : 0)));			// partial precision
      q9.xyz = l101.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m163.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q10.x * q9.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q10.x * dot(r4.xyz, normalize(m163.xyz)), 0) * l101.xyz) + r2.xyz;			// partial precision
    }


    if (2 != r2.w) {
      r10.xyz = (2 * r3.w) + const_8.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[7].xyzw : (r10.y == 0.0 ? LightData[6].xyzw : (r10.x == 0.0 ? LightData[5].xyzw : 0)));
      q51.xyz = r1.xyz - IN.texcoord_6.xyz;
      m169.xyz = mul(TanSpaceProj, q51.xyz);
      q13.x = 1.0 - sqr(saturate(length(q51.xyz) / r1.w));			// partial precision
      l106.xyz = (r10.z == 0.0 ? LightData[6].xyz : (r10.y == 0.0 ? LightData[5].xyz : (r10.x == 0.0 ? LightData[4].xyz : 0)));			// partial precision
      q12.xyz = l106.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m169.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q13.x * q12.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q13.x * dot(r4.xyz, normalize(m169.xyz)), 0) * l106.xyz) + r2.xyz;			// partial precision
    }


    if (3 != r2.w) {
      r10.xyz = (2 * r3.w) + const_29.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[9].xyzw : (r10.y == 0.0 ? LightData[8].xyzw : (r10.x == 0.0 ? LightData[7].xyzw : 0)));
      q56.xyz = r1.xyz - IN.texcoord_6.xyz;
      m176.xyz = mul(TanSpaceProj, q56.xyz);
      q16.x = 1.0 - sqr(saturate(length(q56.xyz) / r1.w));			// partial precision
      l111.xyz = (r10.z == 0.0 ? LightData[8].xyz : (r10.y == 0.0 ? LightData[7].xyz : (r10.x == 0.0 ? LightData[6].xyz : 0)));			// partial precision
      q15.xyz = l111.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m176.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q16.x * q15.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q16.x * dot(r4.xyz, normalize(m176.xyz)), 0) * l111.xyz) + r2.xyz;			// partial precision
    }


    if (4 != r2.w) {
      r10.xyz = (2 * r3.w) + const_33.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[11].xyzw : (r10.y == 0.0 ? LightData[10].xyzw : (r10.x == 0.0 ? LightData[9].xyzw : 0)));
      q61.xyz = r1.xyz - IN.texcoord_6.xyz;
      m183.xyz = mul(TanSpaceProj, q61.xyz);
      q19.x = 1.0 - sqr(saturate(length(q61.xyz) / r1.w));			// partial precision
      l116.xyz = (r10.z == 0.0 ? LightData[10].xyz : (r10.y == 0.0 ? LightData[9].xyz : (r10.x == 0.0 ? LightData[8].xyz : 0)));			// partial precision
      q18.xyz = l116.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m183.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q19.x * q18.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q19.x * dot(r4.xyz, normalize(m183.xyz)), 0) * l116.xyz) + r2.xyz;			// partial precision
    }


    if (5 != r2.w) {
      r10.xyz = (2 * r3.w) + const_30.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[13].xyzw : (r10.y == 0.0 ? LightData[12].xyzw : (r10.x == 0.0 ? LightData[11].xyzw : 0)));
      q66.xyz = r1.xyz - IN.texcoord_6.xyz;
      m190.xyz = mul(TanSpaceProj, q66.xyz);
      q22.x = 1.0 - sqr(saturate(length(q66.xyz) / r1.w));			// partial precision
      l121.xyz = (r10.z == 0.0 ? LightData[12].xyz : (r10.y == 0.0 ? LightData[11].xyz : (r10.x == 0.0 ? LightData[10].xyz : 0)));			// partial precision
      q21.xyz = l121.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m190.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q22.x * q21.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q22.x * dot(r4.xyz, normalize(m190.xyz)), 0) * l121.xyz) + r2.xyz;			// partial precision
    }


    if (6 != r2.w) {
      r10.xyz = (2 * r3.w) + const_34.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[15].xyzw : (r10.y == 0.0 ? LightData[14].xyzw : (r10.x == 0.0 ? LightData[13].xyzw : 0)));
      q71.xyz = r1.xyz - IN.texcoord_6.xyz;
      m197.xyz = mul(TanSpaceProj, q71.xyz);
      q25.x = 1.0 - sqr(saturate(length(q71.xyz) / r1.w));			// partial precision
      l126.xyz = (r10.z == 0.0 ? LightData[14].xyz : (r10.y == 0.0 ? LightData[13].xyz : (r10.x == 0.0 ? LightData[12].xyz : 0)));			// partial precision
      q24.xyz = l126.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m197.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q25.x * q24.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q25.x * dot(r4.xyz, normalize(m197.xyz)), 0) * l126.xyz) + r2.xyz;			// partial precision
    }


    if (7 != r2.w) {
      r10.xyz = (2 * r3.w) + const_35.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[17].xyzw : (r10.y == 0.0 ? LightData[16].xyzw : (r10.x == 0.0 ? LightData[15].xyzw : 0)));
      q76.xyz = r1.xyz - IN.texcoord_6.xyz;
      m204.xyz = mul(TanSpaceProj, q76.xyz);
      q28.x = 1.0 - sqr(saturate(length(q76.xyz) / r1.w));			// partial precision
      l131.xyz = (r10.z == 0.0 ? LightData[16].xyz : (r10.y == 0.0 ? LightData[15].xyz : (r10.x == 0.0 ? LightData[14].xyz : 0)));			// partial precision
      q27.xyz = l131.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m204.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q28.x * q27.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q28.x * dot(r4.xyz, normalize(m204.xyz)), 0) * l131.xyz) + r2.xyz;			// partial precision
    }


    if (8 != r2.w) {
      r10.xyz = (2 * r3.w) + const_31.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[19].xyzw : (r10.y == 0.0 ? LightData[18].xyzw : (r10.x == 0.0 ? LightData[17].xyzw : 0)));
      q81.xyz = r1.xyz - IN.texcoord_6.xyz;
      m211.xyz = mul(TanSpaceProj, q81.xyz);
      q31.x = 1.0 - sqr(saturate(length(q81.xyz) / r1.w));			// partial precision
      l136.xyz = (r10.z == 0.0 ? LightData[18].xyz : (r10.y == 0.0 ? LightData[17].xyz : (r10.x == 0.0 ? LightData[16].xyz : 0)));			// partial precision
      q30.xyz = l136.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m211.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q31.x * q30.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q31.x * dot(r4.xyz, normalize(m211.xyz)), 0) * l136.xyz) + r2.xyz;			// partial precision
    }


    if (9 != r2.w) {
      l32.xyz = LightData[19].xyz - IN.texcoord_6.xyz;
      m217.xyz = mul(TanSpaceProj, l32.xyz);
      r6.xyz = r6.xyz + normalize(m217.xyz);			// partial precision
      r1.xyz = normalize(r6.xyz);			// partial precision
      l600.x = 1.0 - sqr(saturate(length(l32.xyz) / LightData[19].w));			// partial precision
      r6.xy = (2 * r3.w) + const_32.yz;
      l35.xyz = (r6.y == 0.0 ? LightData[19].xyz : (r6.x == 0.0 ? LightData[18].xyz : 0));			// partial precision
      r2.xyz = (max(l600.x * dot(r4.xyz, normalize(m217.xyz)), 0) * l35.xyz) + r2.xyz;			// partial precision
      r0.xyz = (l600.x * (pow(abs(shades(r1.xyz, r4.xyz)), ToggleNumLights.z) * l35.xyz)) + r0.xyz;			// partial precision
    }

    r1.xyz = r2.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r3.y - ToggleADTS.x));			// partial precision
    r2.xyz = r0.w * r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, r12.xy);			// partial precision
    q90.xyz = ((r0.xyz * IN.color_0.rgb) * r1.xyz) + r2.xyz;			// partial precision
    OUT.color_0.a = MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q90.xyz)) + q90.xyz;			// partial precision

    return OUT;
};

// approximately 447 instruction slots used (3 texture, 444 arithmetic)

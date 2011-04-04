//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL016.pso /Fcshaderdump19/SM3LL016.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
float3 EyePosition;
sampler2D FaceGenMap0;
sampler2D FaceGenMap1;
float4 LightData[8];
float3 MatAlpha;
sampler2D NormalMap;
sampler2D ShadowMap;
sampler2D ShadowMask;
float4 ToggleADTS;
float4 ToggleNumLights;


// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   AmbientColor    const_0       1
//   EyePosition     const_1       1
//   MatAlpha        const_3       1
//   ToggleADTS      const_5       1
//   ToggleNumLights const_6       1
//   LightData[0]       const_9        1
//   LightData[1]       const_10        1
//   LightData[2]       const_11        1
//   LightData[3]       const_12        1
//   LightData[4]       const_13        1
//   LightData[5]       const_14        1
//   LightData[6]       const_15        1
//   LightData[7]       const_16        1
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//   ShadowMap       texture_2       1
//   ShadowMask      texture_3       1
//   FaceGenMap0     texture_4       1
//   FaceGenMap1     texture_5       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 color_0 : COLOR0;			// partial precision
    float3 input_2 : TEXCOORD3_centroid;			// partial precision
    float3 input_3 : TEXCOORD4_centroid;			// partial precision
    float3 input_4 : TEXCOORD5_centroid;			// partial precision
    float3 input_5 : TEXCOORD6_centroid;			// partial precision
    float4 texcoord_1 : TEXCOORD1;			// partial precision
    float4 input_7 : TEXCOORD7_centroid;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const int4 const_2 = {4, -1, -2, 0};
    const float4 const_4 = {-0.5, 0, 1, -1};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -4, -5, -6};
    const int4 const_17 = {2, -6, -7, 0};

    float4 r0;
    float4 r1;
    float3 r10;
    float3 r11;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;
    float3 r7;
    float3 r8;
    float3 r9;

    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = 2 * (r0.xyz - 0.5);			// partial precision	// [0,1] to [-1,+1]
    r1.xyz = EyePosition.xyz - IN.input_5.xyz;			// partial precision
    r3.xyz = normalize(r0.xyz);			// partial precision
    r6.xyz = normalize(IN.input_4.xyz);			// partial precision
    r0.z = dot(r6.xyz, r1.xyz);			// partial precision
    r4.xyz = normalize(IN.input_2.xyz);			// partial precision
    r0.x = dot(r4.xyz, r1.xyz);			// partial precision
    r7.xyz = normalize(IN.input_3.xyz);			// partial precision
    r0.y = dot(r7.xyz, r1.xyz);			// partial precision
    r11.yz = const_4.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.z : r11.y);
    r5.xyz = normalize(r0.xyz);			// partial precision
    if_ne 0, r0.w
      r0.x = dot(r4.xyz, LightData[1].xyz);			// partial precision
      r0.y = dot(r7.xyz, LightData[1].xyz);			// partial precision
      r0.w = 1 - max(dot(r3.xyz, r5.xyz), 0);			// partial precision
      r0.z = dot(r6.xyz, LightData[1].xyz);			// partial precision
      r8.xyz = max((0.5 * ((r0.w * (r0.w * r0.w)) * LightData[0].xyz)) + dot(r3.xyz, r0.xyz), 0);			// partial precision
      r0.xyzw = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      r1.xyzw = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      r0.xyz = (r0.x * (r1.xyz - 1)) + 1;			// partial precision
      r1.xyz = r8.xyz * LightData[0].xyz;			// partial precision
      r2.xyz = r1.xyz * r0.xyz;			// partial precision
      r2.w = 1;
    else
      r0.w = 0;
      r2.xyz = r0.w;			// partial precision
      r2.w = r0.w;
    endif
    r0.x = min(ToggleNumLights.y, 4 - ToggleNumLights.x);			// partial precision
    r0.y = frac(r0.x);			// partial precision
    r0.z = (r0.y <= 0.0 ? 1 : 0);
    r0.y = r0.x - r0.y;			// partial precision
    r1.w = ((r0.x >= 0.0 ? 1 : 0) * r0.z) + r0.y;
    r0.w = (r1.w <= 0.0 ? 1 : 0);
    if_ne 0, r0.w
      r1.yz = (2 * r2.w) + const_2.yz;
      r9.xyz = (r0 >= 0.0 ? -r1.xyz : ((2 * r2.w) + const_2.wyz));
      r0.xyzw = (r9.z <= 0.0 ? ((r9.y <= 0.0 ? (r9.x <= 0.0 ? r11.y : LightData[1].xyzw) : LightData[2].xyzw)) : LightData[3].xyzw);
      r1.z = 1 - max(dot(r3.xyz, r5.xyz), 0);			// partial precision
      r5.w = r1.z * (r1.z * r1.z);			// partial precision
      r1.xyz = r0.xyz - IN.input_5.xyz;
      r0.xyz = (r9.z <= 0.0 ? ((r9.y <= 0.0 ? (r9.x <= 0.0 ? r11.y : LightData[0].xyz) : LightData[1].xyz)) : LightData[2].xyz);			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r4.w = length(r1.xyz);
      r0.w = saturate(r4.w / r0.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r8.xyz = normalize(r10.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = ((r3.w * r0.xyz) + ((r5.w * r0.xyz) * 0.5)) * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 1, r1.w
      r9.xyz = (2 * r2.w) + const_7.yzw;
      r0.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : ((r9.y == 0.0 ? LightData[4].xyzw : (r9.x == 0.0 ? LightData[3].xyzw : r11.y))));
      r1.z = 1 - max(dot(r3.xyz, r5.xyz), 0);			// partial precision
      r5.w = r1.z * (r1.z * r1.z);			// partial precision
      r1.xyz = r0.xyz - IN.input_5.xyz;
      r0.xyz = (r9.z == 0.0 ? LightData[4].xyz : ((r9.y == 0.0 ? LightData[3].xyz : (r9.x == 0.0 ? LightData[2].xyz : r11.y))));			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r4.w = length(r1.xyz);
      r0.w = saturate(r4.w / r0.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r8.xyz = normalize(r10.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = ((r3.w * r0.xyz) + ((r5.w * r0.xyz) * 0.5)) * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 2, r1.w
      r9.xyz = (2 * r2.w) + const_8.yzw;
      r0.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : ((r9.y == 0.0 ? LightData[6].xyzw : (r9.x == 0.0 ? LightData[5].xyzw : r11.y))));
      r1.z = 1 - max(dot(r3.xyz, r5.xyz), 0);			// partial precision
      r5.w = r1.z * (r1.z * r1.z);			// partial precision
      r1.xyz = r0.xyz - IN.input_5.xyz;
      r0.xyz = (r9.z == 0.0 ? LightData[6].xyz : ((r9.y == 0.0 ? LightData[5].xyz : (r9.x == 0.0 ? LightData[4].xyz : r11.y))));			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r4.w = length(r1.xyz);
      r0.w = saturate(r4.w / r0.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r8.xyz = normalize(r10.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = ((r3.w * r0.xyz) + ((r5.w * r0.xyz) * 0.5)) * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 3, r1.w
      r1.xyz = LightData[7].xyz - IN.input_5.xyz;
      r0.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r3.w = dot(r3.xyz, r5.xyz);			// partial precision
      r4.x = dot(r4.xyz, r1.xyz);
      r4.y = dot(r7.xyz, r1.xyz);
      r4.z = dot(r6.xyz, r1.xyz);
      r1.w = max(dot(r3.xyz, normalize(r4.xyz)), 0);			// partial precision
      r1.z = 1 - max(r3.w, 0);			// partial precision
      r1.xy = (2 * r2.w) + const_17.yz;
      r0.xyz = (r1.y == 0.0 ? LightData[7].xyz : (r1.x == 0.0 ? LightData[6].xyz : r11.y));			// partial precision
      r2.w = 1.0 / LightData[7].w;
      r0.w = saturate(sqrt(r0.w) * r2.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = ((r1.w * r0.xyz) + (((r1.z * (r1.z * r1.z)) * r0.xyz) * 0.5)) * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
    endif
    r0.xyzw = tex2D(FaceGenMap0, IN.texcoord_0.xy);			// partial precision
    r1.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = (2 * r1.xyz) + r0.xyz;			// partial precision
    r1.xyzw = tex2D(FaceGenMap1, IN.texcoord_0.xy);			// partial precision
    r1.xyz = (2 * ((r0.xyz * (2 * r1.xyz)) * IN.color_0.rgb)) * (r2.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r11.z - ToggleADTS.x)));			// partial precision
    OUT.color_0.rgb = (IN.input_7.w * (IN.input_7.xyz - r1.xyz)) + r1.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

    return OUT;
};

// approximately 217 instruction slots used (6 texture, 211 arithmetic)

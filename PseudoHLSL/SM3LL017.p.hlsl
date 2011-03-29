//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL017.pso /Fcshaderdump19/SM3LL017.pso.dis
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
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const int4 const_2 = {4, -1, -2, 0};
    const int4 const_4 = {2, -4, -5, -6};
    const float4 const_7 = {-0.5, 0, 1, -1};
    const int4 const_8 = {2, -6, -7, 0};
    const int4 const_17 = {2, -2, -3, -4};

    r11.yz = const_7.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.z : r11.y);
    r1.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyz = r1.xyz + -0.5;			// partial precision
    r0.xyz = r0.xyz + r0.xyz;			// partial precision
    r1.xyz = normalize(r0);			// partial precision
    r2.xyz = EyePosition.xyz - IN.input_5;			// partial precision
    r5.xyz = normalize(r0);			// partial precision
    r6.xyz = normalize(IN.input_2);			// partial precision
    r0.x = dot(r6.xyz, r2.xyz);			// partial precision
    r7.xyz = normalize(IN.input_4);			// partial precision
    r8.xyz = normalize(IN.input_3);			// partial precision
    r0.y = dot(r8.xyz, r2.xyz);			// partial precision
    r0.z = dot(r7.xyz, r2.xyz);			// partial precision
    if_ne r0.w, -r0.w
      r0.xyz = normalize(r2);			// partial precision
      r0.w = saturate(dot(r0.xyz, r1.xyz));			// partial precision
      r3.w = pow(abs(r0.w), ToggleNumLights.z);			// partial precision
      r0.xyzw = tex2D(ShadowMask, IN.texcoord_1.zwzw);			// partial precision
      r3.x = dot(r6.xyz, LightData[1].xyz);			// partial precision
      r3.y = dot(r8.xyz, LightData[1].xyz);			// partial precision
      r3.z = dot(r7.xyz, LightData[1].xyz);			// partial precision
      r2.xyz = r5.xyz + r3.xyz;			// partial precision
      r2.xyzw = tex2D(ShadowMap, IN.texcoord_1);			// partial precision
      r2.w = dot(r1.xyz, r5.xyz);			// partial precision
      r0.w = max(r2.w, 0);			// partial precision
      r0.w = 1 - r0.w;			// partial precision
      r0.z = r0.w * r0.w;			// partial precision
      r0.z = r0.w * r0.z;			// partial precision
      r0.w = dot(r1.xyz, r3.xyz);			// partial precision
      r2.w = 1;
      r2.xyz = r2.xyz + -1;			// partial precision
      r2.xyz = (r0.x * r2) + 1;			// partial precision
      r3.xyz = r0.z * LightData[0].xyz;			// partial precision
      r3.xyz = (--0.5 * r3) + r0.w;			// partial precision
      r0.xyz = max(r3.xyz, 0);			// partial precision
      r0.xyz = r0.xyz * LightData[0].xyz;			// partial precision
      r3.xyz = r3.w * LightData[0].xyz;			// partial precision
      r3.xyz = r2.xyz * r3.xyz;			// partial precision
      r4.xyz = r2.xyz * r0.xyz;			// partial precision
    else
      r0.w = 0;			// partial precision
      r2.w = r0.w;
      r3.xyz = r0.w;			// partial precision
      r4.xyz = r0.w;			// partial precision
    endif
    r0.w = 4;			// partial precision
    r2.z = r0.w - ToggleNumLights.x;			// partial precision
    r0.x = min(ToggleNumLights.y, r2.z);			// partial precision
    r0.w = (r0.x >= 0.0 ? 1 : 0);
    r0.y = frac(r0.x);			// partial precision
    r0.z = (r0.y <= 0.0 ? 1 : 0);
    r0.y = r0.x - r0.y;			// partial precision
    r3.w = (r0.w * r0.z) + r0.y;
    r0.w = (r3.w <= 0.0 ? 1 : 0);
    if_ne r0.w, -r0.w
      r2.x = r2.w + r2.w;
      r0.xyz = r2.x + const_2.wyzw;
      r2.w = r2.w + 1;
      r5.w = dot(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (r0 >= 0.0 ? -r2 : r0);
      r0.xyzw = (r9.x <= 0.0 ? r11.y : LightData[1]);			// partial precision
      r0.xyzw = (r9.y <= 0.0 ? r0 : LightData[2]);			// partial precision
      r0.xyzw = (r9.z <= 0.0 ? r0 : LightData[3]);
      r0.w = 1.0 / r0.w;			// partial precision
      r2.yz = r2.x + const_2.yz;
      r2.xyz = r0.xyz - IN.input_5;
      r4.w = dot(r2.xyz, r2.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = saturate(r4.w * r0.w);
      r0.w = (r0.w * -r0.w) + 1;			// partial precision
      r0.xyz = (r9.x <= 0.0 ? r11.y : LightData[0]);			// partial precision
      r0.xyz = (r9.y <= 0.0 ? r0 : LightData[1]);			// partial precision
      r0.xyz = (r9.z <= 0.0 ? r0 : LightData[2]);			// partial precision
      r4.w = max(r5.w, 0);			// partial precision
      r4.w = 1 - r4.w;			// partial precision
      r6.w = r4.w * r4.w;			// partial precision
      r4.w = r4.w * r6.w;			// partial precision
      r9.x = dot(r6.xyz, r2.xyz);
      r9.y = dot(r8.xyz, r2.xyz);
      r9.z = dot(r7.xyz, r2.xyz);
      r2.xyz = normalize(r9);			// partial precision
      r10.xyz = r5.xyz + r2.xyz;			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r5.w = saturate(dot(r9.xyz, r1.xyz));			// partial precision
      r6.w = dot(r1.xyz, r2.xyz);			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r2.xyz = r2.xyz * --0.5;			// partial precision
      r4.w = max(r6.w, 0);			// partial precision
      r2.xyz = (r4.w * r0.xyz) + r2.xyz;			// partial precision
      r4.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r9.xyz = r0.w * r2.xyz;			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r0.xyz = max(r9.xyz, 0);			// partial precision
      r3.xyz = (r0.w * r2.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    endif
    if_lt 1, r3.w
      r5.w = dot(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_17.yzww;
      r0.xyzw = (r9.x == 0.0 ? LightData[3] : r11.y);			// partial precision
      r0.xyzw = (r9.y == 0.0 ? LightData[4] : r0);			// partial precision
      r0.xyzw = (r9.z == 0.0 ? LightData[5] : r0);
      r0.w = 1.0 / r0.w;			// partial precision
      r2.w = r2.w + 1;
      r2.xyz = r0.xyz - IN.input_5;
      r4.w = dot(r2.xyz, r2.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = saturate(r4.w * r0.w);
      r0.w = (r0.w * -r0.w) + 1;			// partial precision
      r0.xyz = (r9.x == 0.0 ? LightData[2] : r11.y);			// partial precision
      r0.xyz = (r9.y == 0.0 ? LightData[3] : r0);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[4] : r0);			// partial precision
      r4.w = max(r5.w, 0);			// partial precision
      r4.w = 1 - r4.w;			// partial precision
      r6.w = r4.w * r4.w;			// partial precision
      r4.w = r4.w * r6.w;			// partial precision
      r9.x = dot(r6.xyz, r2.xyz);
      r9.y = dot(r8.xyz, r2.xyz);
      r9.z = dot(r7.xyz, r2.xyz);
      r2.xyz = normalize(r9);			// partial precision
      r10.xyz = r5.xyz + r2.xyz;			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r5.w = saturate(dot(r9.xyz, r1.xyz));			// partial precision
      r6.w = dot(r1.xyz, r2.xyz);			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r2.xyz = r2.xyz * --0.5;			// partial precision
      r4.w = max(r6.w, 0);			// partial precision
      r2.xyz = (r4.w * r0.xyz) + r2.xyz;			// partial precision
      r4.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r9.xyz = r0.w * r2.xyz;			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r0.xyz = max(r9.xyz, 0);			// partial precision
      r3.xyz = (r0.w * r2.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    endif
    if_lt --2, r3.w
      r5.w = dot(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_4.yzww;
      r0.xyzw = (r9.x == 0.0 ? LightData[5] : r11.y);			// partial precision
      r0.xyzw = (r9.y == 0.0 ? LightData[6] : r0);			// partial precision
      r0.xyzw = (r9.z == 0.0 ? LightData[7] : r0);
      r0.w = 1.0 / r0.w;			// partial precision
      r2.w = r2.w + 1;
      r2.xyz = r0.xyz - IN.input_5;
      r4.w = dot(r2.xyz, r2.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = saturate(r4.w * r0.w);
      r0.w = (r0.w * -r0.w) + 1;			// partial precision
      r0.xyz = (r9.x == 0.0 ? LightData[4] : r11.y);			// partial precision
      r0.xyz = (r9.y == 0.0 ? LightData[5] : r0);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[6] : r0);			// partial precision
      r4.w = max(r5.w, 0);			// partial precision
      r4.w = 1 - r4.w;			// partial precision
      r6.w = r4.w * r4.w;			// partial precision
      r4.w = r4.w * r6.w;			// partial precision
      r9.x = dot(r6.xyz, r2.xyz);
      r9.y = dot(r8.xyz, r2.xyz);
      r9.z = dot(r7.xyz, r2.xyz);
      r2.xyz = normalize(r9);			// partial precision
      r10.xyz = r5.xyz + r2.xyz;			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r5.w = saturate(dot(r9.xyz, r1.xyz));			// partial precision
      r6.w = dot(r1.xyz, r2.xyz);			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r2.xyz = r2.xyz * --0.5;			// partial precision
      r4.w = max(r6.w, 0);			// partial precision
      r2.xyz = (r4.w * r0.xyz) + r2.xyz;			// partial precision
      r4.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r9.xyz = r0.w * r2.xyz;			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r0.xyz = max(r9.xyz, 0);			// partial precision
      r3.xyz = (r0.w * r2.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    endif
    if_lt --3, r3.w
      r0.xyz = LightData[7].xyz - IN.input_5;
      r0.w = dot(r0.xyz, r0.xyz);	// normalize + length
      r0.w = 1.0 / sqrt(r0.w);
      r0.w = 1.0 / r0.w;
      r2.xyz = normalize(r6);			// partial precision
      r4.w = dot(r1.xyz, r5.xyz);			// partial precision
      r6.x = dot(r6.xyz, r0.xyz);
      r6.y = dot(r8.xyz, r0.xyz);
      r6.z = dot(r7.xyz, r0.xyz);
      r0.xyz = normalize(r6);			// partial precision
      r3.w = saturate(dot(r0.xyz, r1.xyz));			// partial precision
      r0.z = 1.0 / LightData[7].w;
      r0.w = saturate(r0.w * r0.z);
      r0.w = (r0.w * -r0.w) + 1;			// partial precision
      r0.z = max(r4.w, 0);			// partial precision
      r6.xyz = r5.xyz + r2.xyz;			// partial precision
      r5.xy = (2 * r2.w) + const_8.yzzw;
      r2.w = 1 - r0.z;			// partial precision
      r0.xyz = (r5.x == 0.0 ? LightData[6] : r11.y);			// partial precision
      r0.xyz = (r5.y == 0.0 ? LightData[7] : r0);			// partial precision
      r4.w = r2.w * r2.w;			// partial precision
      r2.w = r2.w * r4.w;			// partial precision
      r4.w = dot(r1.xyz, r2.xyz);			// partial precision
      r1.xyz = r0.xyz * r2.w;			// partial precision
      r1.xyz = r1.xyz * --0.5;			// partial precision
      r2.w = max(r4.w, 0);			// partial precision
      r1.xyz = (r2.w * r0.xyz) + r1.xyz;			// partial precision
      r2.w = pow(abs(r3.w), ToggleNumLights.z);			// partial precision
      r2.xyz = r0.w * r1.xyz;			// partial precision
      r1.xyz = r0.xyz * r2.w;			// partial precision
      r0.xyz = max(r2.xyz, 0);			// partial precision
      r3.xyz = (r0.w * r1.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    endif
    r0.xyzw = tex2D(FaceGenMap0, IN.texcoord_0);			// partial precision
    r1.xyz = r0.xyz + -0.5;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    r0.xyz = (--2 * r1.xyz) + r0.xyz;			// partial precision
    r2.xyzw = tex2D(FaceGenMap1, IN.texcoord_0);			// partial precision
    r1.xyz = r2.xyz + r2.xyz;			// partial precision
    r1.xyz = r0.xyz * r1.xyz;			// partial precision
    r0.z = ToggleADTS.x;			// partial precision
    r1.xyz = r1.xyz * IN.color_0;			// partial precision
    r1.xyz = r1.xyz + r1.xyz;			// partial precision
    r2.w = r11.z - ToggleADTS.x;			// partial precision
    r0.xyz = (r0.z * AmbientColor) + r2.w;			// partial precision
    r0.xyz = r4.xyz + r0.xyz;			// partial precision
    r2.xyz = r1.w * r3.xyz;			// partial precision
    r1.xyz = (r1.xyz * r0.xyz) + r2.xyz;			// partial precision
    r0.xyz = IN.input_7 - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.input_7.w * r0.xyz) + r1.xyz;			// partial precision

    return OUT;
};

// approximately 269 instruction slots used (6 texture, 263 arithmetic)

//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL000.pso /Fcshaderdump19/SM3LL000.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
float4 LightData[8];
float3 MatAlpha;
sampler2D NormalMap;
float4 ToggleADTS;
float4 ToggleNumLights;


// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   AmbientColor    const_0       1
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
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 color_0 : COLOR0;			// partial precision
    float3 input_2 : TEXCOORD3_centroid;			// partial precision
    float3 input_3 : TEXCOORD4_centroid;			// partial precision
    float3 input_4 : TEXCOORD5_centroid;			// partial precision
    float3 input_5 : TEXCOORD6_centroid;			// partial precision
    float4 input_6 : TEXCOORD7_centroid;			// partial precision
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_1 = {-0.5, 0, 1, 4};
    const int4 const_2 = {2, -4, -5, -6};
    const int4 const_4 = {2, -6, -7, 0};
    const int4 const_7 = {-1, -2, 0, 2};
    const int4 const_8 = {2, -2, -3, -4};

    r2.yzw = const_1.yzw;
    r0.w = r2.w - ToggleNumLights.x;			// partial precision
    r1.x = min(ToggleNumLights.y, r0.w);			// partial precision
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyz = r0.xyz + -0.5;			// partial precision
    r0.xyz = r0.xyz + r0.xyz;			// partial precision
    r3.xyz = normalize(r0);			// partial precision
    r4.xyz = normalize(IN.input_2);			// partial precision
    r0.x = dot(r4.xyz, LightData[1].xyz);			// partial precision
    r5.xyz = normalize(IN.input_4);			// partial precision
    r0.z = dot(r5.xyz, LightData[1].xyz);			// partial precision
    r6.xyz = normalize(IN.input_3);			// partial precision
    r0.y = dot(r6.xyz, LightData[1].xyz);			// partial precision
    r1.w = frac(r1.x);			// partial precision
    r0.w = r1.x - r1.w;			// partial precision
    r1.y = (r1.w <= 0.0 ? 1 : 0);
    r1.z = (r1.x >= 0.0 ? 1 : 0);
    r2.w = (r1.z * r1.y) + r0.w;
    r0.w = 1;
    r1.w = dot(r3.xyz, r0.xyz);			// partial precision
    r0.z = max(r1.w, 0);			// partial precision
    r0.xyz = r0.z * LightData[0].xyz;			// partial precision
    r0.xyzw = (ToggleNumLights.x <= 0.0 ? r0 : r2.y);
    r1.w = (r2.w <= 0.0 ? 1 : 0);
    if_ne r1.w, -r1.w
      r7.x = r0.w + r0.w;
      r0.w = r0.w + 1;
      r1.xyz = r7.x + const_7.zxyw;
      r7.yz = r7.x + const_7.xxyw;
      r7.xyz = (r1 >= 0.0 ? -r7 : r1);
      r1.xyzw = (r7.x <= 0.0 ? r2.y : LightData[1]);
      r1.xyzw = (r7.y <= 0.0 ? r1 : LightData[2]);
      r1.xyzw = (r7.z <= 0.0 ? r1 : LightData[3]);
      r1.w = 1.0 / r1.w;			// partial precision
      r8.xyz = r1.xyz - IN.input_5;
      r1.z = dot(r8.xyz, r8.xyz);	// normalize + length
      r2.x = 1.0 / sqrt(r1.z);
      r2.x = 1.0 / r2.x;
      r2.x = saturate(r2.x * r1.w);
      r2.x = (r2.x * -r2.x) + 1;			// partial precision
      r9.x = dot(r4.xyz, r8.xyz);
      r9.y = dot(r6.xyz, r8.xyz);
      r9.z = dot(r5.xyz, r8.xyz);
      r8.xyz = normalize(r9);			// partial precision
      r1.w = dot(r3.xyz, r8.xyz);			// partial precision
      r2.x = r1.w * r2.x;			// partial precision
      r1.w = max(r2.x, 0);			// partial precision
      r1.xyz = (r7.x <= 0.0 ? r2.y : LightData[0]);			// partial precision
      r1.xyz = (r7.y <= 0.0 ? r1 : LightData[1]);			// partial precision
      r1.xyz = (r7.z <= 0.0 ? r1 : LightData[2]);			// partial precision
      r0.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
    endif
    if_lt 1, r2.w
      r7.xyz = (2 * r0.w) + const_8.yzww;
      r1.xyzw = (r7.x == 0.0 ? LightData[3] : r2.y);
      r1.xyzw = (r7.y == 0.0 ? LightData[4] : r1);
      r1.xyzw = (r7.z == 0.0 ? LightData[5] : r1);
      r1.w = 1.0 / r1.w;			// partial precision
      r8.xyz = r1.xyz - IN.input_5;
      r1.z = dot(r8.xyz, r8.xyz);	// normalize + length
      r2.x = 1.0 / sqrt(r1.z);
      r2.x = 1.0 / r2.x;
      r2.x = saturate(r2.x * r1.w);
      r2.x = (r2.x * -r2.x) + 1;			// partial precision
      r9.x = dot(r4.xyz, r8.xyz);
      r9.y = dot(r6.xyz, r8.xyz);
      r9.z = dot(r5.xyz, r8.xyz);
      r8.xyz = normalize(r9);			// partial precision
      r1.w = dot(r3.xyz, r8.xyz);			// partial precision
      r2.x = r1.w * r2.x;			// partial precision
      r1.w = max(r2.x, 0);			// partial precision
      r1.xyz = (r7.x == 0.0 ? LightData[2] : r2.y);			// partial precision
      r1.xyz = (r7.y == 0.0 ? LightData[3] : r1);			// partial precision
      r1.xyz = (r7.z == 0.0 ? LightData[4] : r1);			// partial precision
      r1.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r1.w = r0.w + 1;
    else
      r1.w = r0.w;
      r1.xyz = r0.xyz;			// partial precision
    endif
    if_lt 2, r2.w
      r7.xyz = (2 * r1.w) + const_2.yzww;
      r0.xyzw = (r7.x == 0.0 ? LightData[5] : r2.y);
      r0.xyzw = (r7.y == 0.0 ? LightData[6] : r0);
      r0.xyzw = (r7.z == 0.0 ? LightData[7] : r0);
      r0.w = 1.0 / r0.w;			// partial precision
      r1.w = r1.w + 1;
      r8.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r8.xyz, r8.xyz);	// normalize + length
      r2.x = 1.0 / sqrt(r0.z);
      r2.x = 1.0 / r2.x;
      r2.x = saturate(r2.x * r0.w);
      r2.x = (r2.x * -r2.x) + 1;			// partial precision
      r9.x = dot(r4.xyz, r8.xyz);
      r9.y = dot(r6.xyz, r8.xyz);
      r9.z = dot(r5.xyz, r8.xyz);
      r8.xyz = normalize(r9);			// partial precision
      r0.w = dot(r3.xyz, r8.xyz);			// partial precision
      r2.x = r0.w * r2.x;			// partial precision
      r0.w = max(r2.x, 0);			// partial precision
      r0.xyz = (r7.x == 0.0 ? LightData[4] : r2.y);			// partial precision
      r0.xyz = (r7.y == 0.0 ? LightData[5] : r0);			// partial precision
      r0.xyz = (r7.z == 0.0 ? LightData[6] : r0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
    endif
    if_lt --3, r2.w
      r0.xyz = LightData[7].xyz - IN.input_5;
      r0.w = dot(r0.xyz, r0.xyz);	// normalize + length
      r0.w = 1.0 / sqrt(r0.w);
      r2.w = 1.0 / r0.w;
      r2.x = 1.0 / LightData[7].w;
      r4.x = dot(r4.xyz, r0.xyz);
      r4.y = dot(r6.xyz, r0.xyz);
      r4.z = dot(r5.xyz, r0.xyz);
      r0.xyz = normalize(r4);			// partial precision
      r0.w = dot(r3.xyz, r0.xyz);			// partial precision
      r0.z = saturate(r2.w * r2.x);
      r0.z = (r0.z * -r0.z) + 1;			// partial precision
      r3.xy = (2 * r1.w) + const_4.yzzw;
      r1.w = r0.w * r0.z;			// partial precision
      r0.w = max(r1.w, 0);			// partial precision
      r0.xyz = (r3.x == 0.0 ? LightData[6] : r2.y);			// partial precision
      r0.xyz = (r3.y == 0.0 ? LightData[7] : r0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
    endif
    r0.w = ToggleADTS.x;			// partial precision
    r0.z = r2.z - ToggleADTS.x;			// partial precision
    r0.xyz = (r0.w * AmbientColor) + r0.z;			// partial precision
    r1.xyz = r1.xyz + r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    r0.xyz = r0.xyz * IN.color_0;			// partial precision
    r1.xyz = r1.xyz * r0.xyz;			// partial precision
    r0.xyz = IN.input_6 - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.input_6.w * r0.xyz) + r1.xyz;			// partial precision

    return OUT;
};

// approximately 151 instruction slots used (2 texture, 149 arithmetic)

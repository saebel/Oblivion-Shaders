//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3017.pso /Fcshaderdump19/SM3017.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
float3 EyePosition;
sampler2D FaceGenMap0;
sampler2D FaceGenMap1;
float4 LightData[16];
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
//   LightData[8]       const_17       1
//   LightData[9]       const_18       1
//   LightData[10]       const_19       1
//   LightData[11]       const_20       1
//   LightData[12]       const_21       1
//   LightData[13]       const_22       1
//   LightData[14]       const_23       1
//   LightData[15]       const_24       1
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

    const float4 const_2 = {-0.5, 0, 1, -1};
    const int4 const_4 = {8, -1, -2, 0};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -6, -7, -8};
    const int4 const_25 = {2, -8, -9, -10};
    const int4 const_26 = {2, -10, -11, -12};
    const int4 const_27 = {2, -12, -13, -14};
    const int4 const_28 = {2, -14, -15, 0};
    const int4 const_29 = {2, -4, -5, -6};

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

    r1.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r1.xyz = normalize(2 * (r1.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r11.yz = const_2.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.z : r11.y);
    r2.xyz = EyePosition.xyz - IN.input_5.xyz;			// partial precision
    r6.xyz = normalize(IN.input_2.xyz);			// partial precision
    r0.x = dot(r6.xyz, r2.xyz);			// partial precision
    r8.xyz = normalize(IN.input_3.xyz);			// partial precision
    r0.y = dot(r8.xyz, r2.xyz);			// partial precision
    r7.xyz = normalize(IN.input_4.xyz);			// partial precision
    r0.z = dot(r7.xyz, r2.xyz);			// partial precision
    r5.xyz = normalize(r0.xyz);			// partial precision

    if (0 != r0.w) {
      r0.xyzw = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      r0.w = 1 - max(dot(r1.xyz, r5.xyz), 0);			// partial precision
      r0.z = r0.w * (r0.w * r0.w);			// partial precision
      r3.x = dot(r6.xyz, LightData[1].xyz);			// partial precision
      r3.y = dot(r8.xyz, LightData[1].xyz);			// partial precision
      r3.z = dot(r7.xyz, LightData[1].xyz);			// partial precision
      r0.w = dot(r1.xyz, r3.xyz);			// partial precision
      r2.xyzw = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      r2.xyz = (r0.x * (r2.xyz - 1)) + 1;			// partial precision
      r0.xyz = max((0.5 * (r0.z * LightData[0].xyz)) + r0.w, 0) * LightData[0].xyz;			// partial precision
      r2.w = 1;
      r3.w = pow(abs(saturate(dot(normalize(r5.xyz + r3.xyz), r1.xyz))), ToggleNumLights.z);			// partial precision
      r3.xyz = r2.xyz * (r3.w * LightData[0].xyz);			// partial precision
      r4.xyz = r2.xyz * r0.xyz;			// partial precision
    }
    else {
      r2.w = 0;
      r3.xyz = 0;			// partial precision
      r4.xyz = 0;			// partial precision
    }

    r0.x = min(ToggleNumLights.y, 8 - ToggleNumLights.x);			// partial precision
    r0.y = frac(r0.x);			// partial precision
    r3.w = ((r0.x >= 0.0 ? 1 : 0) * (r0.y <= 0.0 ? 1 : 0)) + (r0.x - r0.y);
    r0.w = (r3.w <= 0.0 ? 1 : 0);

    if (0 != r0.w) {
      r2.x = 2 * r2.w;
      r0.xyz = r2.x + const_4.wyz;
      r2.yz = r2.x + const_4.yz;
      r9.xyz = (r0.xyz >= 0.0 ? -r2.xyz : r0.xyz);
      r0.xyzw = (r9.z <= 0.0 ? (r9.y <= 0.0 ? (r9.x <= 0.0 ? r11.y : LightData[1].xyzw) : LightData[2].xyzw) : LightData[3].xyzw);
      r2.xyz = r0.xyz - IN.input_5.xyz;
      r0.w = saturate(length(r2.xyz) / r0.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r0.xyz = (r9.z <= 0.0 ? (r9.y <= 0.0 ? (r9.x <= 0.0 ? r11.y : LightData[0].xyz) : LightData[1].xyz) : LightData[2].xyz);			// partial precision
      r9.x = dot(r6.xyz, r2.xyz);
      r9.y = dot(r8.xyz, r2.xyz);
      r9.z = dot(r7.xyz, r2.xyz);
      r2.xyz = normalize(r9.xyz);			// partial precision
      r10.xyz = r5.xyz + r2.xyz;			// partial precision
      r4.w = 1 - max(dot(r1.xyz, r5.xyz), 0);			// partial precision
      r5.w = saturate(dot(normalize(r10.xyz), r1.xyz));			// partial precision
      r6.w = dot(r1.xyz, r2.xyz);			// partial precision
      r9.xyz = r0.w * ((max(r6.w, 0) * r0.xyz) + ((r0.xyz * (r4.w * (r4.w * r4.w))) * 0.5));			// partial precision
      r4.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r0.xyz = max(r9.xyz, 0);			// partial precision
      r2.w = r2.w + 1;
      r3.xyz = (r0.w * r2.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    }


    if (1 != r3.w) {
      r9.xyz = (2 * r2.w) + const_7.yzw;
      r0.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : (r9.y == 0.0 ? LightData[4].xyzw : (r9.x == 0.0 ? LightData[3].xyzw : r11.y)));
      r2.xyz = r0.xyz - IN.input_5.xyz;
      r0.w = saturate(length(r2.xyz) / r0.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[4].xyz : (r9.y == 0.0 ? LightData[3].xyz : (r9.x == 0.0 ? LightData[2].xyz : r11.y)));			// partial precision
      r9.x = dot(r6.xyz, r2.xyz);
      r9.y = dot(r8.xyz, r2.xyz);
      r9.z = dot(r7.xyz, r2.xyz);
      r2.xyz = normalize(r9.xyz);			// partial precision
      r10.xyz = r5.xyz + r2.xyz;			// partial precision
      r4.w = 1 - max(dot(r1.xyz, r5.xyz), 0);			// partial precision
      r5.w = saturate(dot(normalize(r10.xyz), r1.xyz));			// partial precision
      r6.w = dot(r1.xyz, r2.xyz);			// partial precision
      r9.xyz = r0.w * ((max(r6.w, 0) * r0.xyz) + ((r0.xyz * (r4.w * (r4.w * r4.w))) * 0.5));			// partial precision
      r4.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r0.xyz = max(r9.xyz, 0);			// partial precision
      r2.w = r2.w + 1;
      r3.xyz = (r0.w * r2.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    }


    if (2 != r3.w) {
      r9.xyz = (2 * r2.w) + const_29.yzw;
      r0.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : (r9.y == 0.0 ? LightData[6].xyzw : (r9.x == 0.0 ? LightData[5].xyzw : r11.y)));
      r2.xyz = r0.xyz - IN.input_5.xyz;
      r0.w = saturate(length(r2.xyz) / r0.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[6].xyz : (r9.y == 0.0 ? LightData[5].xyz : (r9.x == 0.0 ? LightData[4].xyz : r11.y)));			// partial precision
      r9.x = dot(r6.xyz, r2.xyz);
      r9.y = dot(r8.xyz, r2.xyz);
      r9.z = dot(r7.xyz, r2.xyz);
      r2.xyz = normalize(r9.xyz);			// partial precision
      r10.xyz = r5.xyz + r2.xyz;			// partial precision
      r4.w = 1 - max(dot(r1.xyz, r5.xyz), 0);			// partial precision
      r5.w = saturate(dot(normalize(r10.xyz), r1.xyz));			// partial precision
      r6.w = dot(r1.xyz, r2.xyz);			// partial precision
      r9.xyz = r0.w * ((max(r6.w, 0) * r0.xyz) + ((r0.xyz * (r4.w * (r4.w * r4.w))) * 0.5));			// partial precision
      r4.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r0.xyz = max(r9.xyz, 0);			// partial precision
      r2.w = r2.w + 1;
      r3.xyz = (r0.w * r2.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    }


    if (3 != r3.w) {
      r9.xyz = (2 * r2.w) + const_8.yzw;
      r0.xyzw = (r9.z == 0.0 ? LightData[9].xyzw : (r9.y == 0.0 ? LightData[8].xyzw : (r9.x == 0.0 ? LightData[7].xyzw : r11.y)));
      r2.xyz = r0.xyz - IN.input_5.xyz;
      r0.w = saturate(length(r2.xyz) / r0.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[8].xyz : (r9.y == 0.0 ? LightData[7].xyz : (r9.x == 0.0 ? LightData[6].xyz : r11.y)));			// partial precision
      r9.x = dot(r6.xyz, r2.xyz);
      r9.y = dot(r8.xyz, r2.xyz);
      r9.z = dot(r7.xyz, r2.xyz);
      r2.xyz = normalize(r9.xyz);			// partial precision
      r10.xyz = r5.xyz + r2.xyz;			// partial precision
      r4.w = 1 - max(dot(r1.xyz, r5.xyz), 0);			// partial precision
      r5.w = saturate(dot(normalize(r10.xyz), r1.xyz));			// partial precision
      r6.w = dot(r1.xyz, r2.xyz);			// partial precision
      r9.xyz = r0.w * ((max(r6.w, 0) * r0.xyz) + ((r0.xyz * (r4.w * (r4.w * r4.w))) * 0.5));			// partial precision
      r4.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r0.xyz = max(r9.xyz, 0);			// partial precision
      r2.w = r2.w + 1;
      r3.xyz = (r0.w * r2.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    }


    if (4 != r3.w) {
      r9.xyz = (2 * r2.w) + const_25.yzw;
      r0.xyzw = (r9.z == 0.0 ? LightData[11].xyzw : (r9.y == 0.0 ? LightData[10].xyzw : (r9.x == 0.0 ? LightData[9].xyzw : r11.y)));
      r2.xyz = r0.xyz - IN.input_5.xyz;
      r0.w = saturate(length(r2.xyz) / r0.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[10].xyz : (r9.y == 0.0 ? LightData[9].xyz : (r9.x == 0.0 ? LightData[8].xyz : r11.y)));			// partial precision
      r9.x = dot(r6.xyz, r2.xyz);
      r9.y = dot(r8.xyz, r2.xyz);
      r9.z = dot(r7.xyz, r2.xyz);
      r2.xyz = normalize(r9.xyz);			// partial precision
      r10.xyz = r5.xyz + r2.xyz;			// partial precision
      r4.w = 1 - max(dot(r1.xyz, r5.xyz), 0);			// partial precision
      r5.w = saturate(dot(normalize(r10.xyz), r1.xyz));			// partial precision
      r6.w = dot(r1.xyz, r2.xyz);			// partial precision
      r9.xyz = r0.w * ((max(r6.w, 0) * r0.xyz) + ((r0.xyz * (r4.w * (r4.w * r4.w))) * 0.5));			// partial precision
      r4.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r0.xyz = max(r9.xyz, 0);			// partial precision
      r2.w = r2.w + 1;
      r3.xyz = (r0.w * r2.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    }


    if (5 != r3.w) {
      r9.xyz = (2 * r2.w) + const_26.yzw;
      r0.xyzw = (r9.z == 0.0 ? LightData[13].xyzw : (r9.y == 0.0 ? LightData[12].xyzw : (r9.x == 0.0 ? LightData[11].xyzw : r11.y)));
      r2.xyz = r0.xyz - IN.input_5.xyz;
      r0.w = saturate(length(r2.xyz) / r0.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[12].xyz : (r9.y == 0.0 ? LightData[11].xyz : (r9.x == 0.0 ? LightData[10].xyz : r11.y)));			// partial precision
      r9.x = dot(r6.xyz, r2.xyz);
      r9.y = dot(r8.xyz, r2.xyz);
      r9.z = dot(r7.xyz, r2.xyz);
      r2.xyz = normalize(r9.xyz);			// partial precision
      r10.xyz = r5.xyz + r2.xyz;			// partial precision
      r4.w = 1 - max(dot(r1.xyz, r5.xyz), 0);			// partial precision
      r5.w = saturate(dot(normalize(r10.xyz), r1.xyz));			// partial precision
      r6.w = dot(r1.xyz, r2.xyz);			// partial precision
      r9.xyz = r0.w * ((max(r6.w, 0) * r0.xyz) + ((r0.xyz * (r4.w * (r4.w * r4.w))) * 0.5));			// partial precision
      r4.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r0.xyz = max(r9.xyz, 0);			// partial precision
      r2.w = r2.w + 1;
      r3.xyz = (r0.w * r2.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    }


    if (6 != r3.w) {
      r9.xyz = (2 * r2.w) + const_27.yzw;
      r0.xyzw = (r9.z == 0.0 ? LightData[15].xyzw : (r9.y == 0.0 ? LightData[14].xyzw : (r9.x == 0.0 ? LightData[13].xyzw : r11.y)));
      r2.xyz = r0.xyz - IN.input_5.xyz;
      r0.w = saturate(length(r2.xyz) / r0.w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[14].xyz : (r9.y == 0.0 ? LightData[13].xyz : (r9.x == 0.0 ? LightData[12].xyz : r11.y)));			// partial precision
      r9.x = dot(r6.xyz, r2.xyz);
      r9.y = dot(r8.xyz, r2.xyz);
      r9.z = dot(r7.xyz, r2.xyz);
      r2.xyz = normalize(r9.xyz);			// partial precision
      r10.xyz = r5.xyz + r2.xyz;			// partial precision
      r4.w = 1 - max(dot(r1.xyz, r5.xyz), 0);			// partial precision
      r5.w = saturate(dot(normalize(r10.xyz), r1.xyz));			// partial precision
      r6.w = dot(r1.xyz, r2.xyz);			// partial precision
      r9.xyz = r0.w * ((max(r6.w, 0) * r0.xyz) + ((r0.xyz * (r4.w * (r4.w * r4.w))) * 0.5));			// partial precision
      r4.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r2.xyz = r0.xyz * r4.w;			// partial precision
      r0.xyz = max(r9.xyz, 0);			// partial precision
      r2.w = r2.w + 1;
      r3.xyz = (r0.w * r2.xyz) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + r0.xyz;			// partial precision
    }


    if (7 != r3.w) {
      r0.xyz = LightData[15].xyz - IN.input_5.xyz;
      r0.w = saturate(length(r0.xyz) / LightData[15].w);
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r6.x = dot(r6.xyz, r0.xyz);
      r6.y = dot(r8.xyz, r0.xyz);
      r6.z = dot(r7.xyz, r0.xyz);
      r2.xyz = normalize(r6.xyz);			// partial precision
      r4.w = dot(r1.xyz, r5.xyz);			// partial precision
      r6.xyz = r5.xyz + r2.xyz;			// partial precision
      r5.xy = (2 * r2.w) + const_28.yz;
      r0.xyz = (r5.y == 0.0 ? LightData[15].xyz : (r5.x == 0.0 ? LightData[14].xyz : r11.y));			// partial precision
      r2.w = 1 - max(r4.w, 0);			// partial precision
      r3.xyz = (r0.w * (r0.xyz * pow(abs(saturate(dot(normalize(r6.xyz), r1.xyz))), ToggleNumLights.z))) + r3.xyz;			// partial precision
      r4.xyz = r4.xyz + max(r0.w * ((max(dot(r1.xyz, r2.xyz), 0) * r0.xyz) + ((r0.xyz * (r2.w * (r2.w * r2.w))) * 0.5)), 0);			// partial precision
    }

    r0.xyzw = tex2D(FaceGenMap0, IN.texcoord_0.xy);			// partial precision
    r1.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r2.xyzw = tex2D(FaceGenMap1, IN.texcoord_0.xy);			// partial precision
    r1.xyz = ((2 * ((((2 * r1.xyz) + r0.xyz) * (2 * r2.xyz)) * IN.color_0.rgb)) * (r4.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r11.z - ToggleADTS.x)))) + (r1.w * r3.xyz);			// partial precision
    OUT.color_0.rgb = (IN.input_7.w * (IN.input_7.xyz - r1.xyz)) + r1.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

    return OUT;
};

// approximately 453 instruction slots used (6 texture, 447 arithmetic)

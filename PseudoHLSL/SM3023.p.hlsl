//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3023.pso /Fcshaderdump19/SM3023.pso.dis
//
//
// Parameters:
//
sampler2D BaseMap : register(s0);
float4 LightColor : register(c9);
float4 LightData : register(c10);
sampler2D ShadowMap : register(s2);
float4 ToggleADTS : register(c5);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   ToggleADTS   const_5       1
//   LightColor   const_9       1
//   LightData    const_10      1
//   BaseMap      texture_0       1
//   ShadowMap    texture_2       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;
    float4 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 texcoord_2 : TEXCOORD2_centroid;	// only .w			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {0.5, 1, 15, 0};
    const float4 const_1 = {-(1.0 / 256), 1, -1, 0};
    const float4 const_3 = {0.01, 0.02, -0.01, -0.02};

    float1 l0;
    float1 q2;
    float1 q3;
    float1 q4;
    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float3 r4;
    float4 r5;

    r5.xyw = const_0.xyw;
    r5.z = saturate(length(IN.texcoord_6.xyz - LightData.xyz) / (r5.x * LightData.w));
    r0.xy = compress(IN.texcoord_1.xy / IN.texcoord_1.w);			// partial precision	// [-1,+1] to [0,1]
    l0.x = IN.texcoord_1.z / LightData.w;
    q2.x = 1.0 / ((r5.z <= 0.0 ? 1 : (1 - r5.z)) * 15);			// partial precision
    r0.zw = 1 - r0.y;			// partial precision
    r1.xyz = tex2D(ShadowMap, saturate(r0.xz >= 0.0 ? r0.xwzw : 0));
    r3.xy = (const_1.yz * r0.xy) + const_1.wy;			// partial precision
    r0.w = ((-(1.0 / 256) - (r1.x - l0.x)) >= 0.0 ? 0 : 1);			// partial precision
    r1.xyzw = max((q2.x * const_3.xxyy) + r3.xyxy, 0);			// partial precision
    r2.xyz = tex2D(ShadowMap, saturate(r1.xy));
    r1.xyz = tex2D(ShadowMap, saturate(r1.zw));
    r0.z = r2.x - l0.x;
    r0.w = r0.w + ((-(1.0 / 256) - r0.z) >= 0.0 ? 0 : 1);			// partial precision
    r0.z = r1.x - l0.x;
    r0.w = r0.w + ((-(1.0 / 256) - r0.z) >= 0.0 ? 0 : 1);			// partial precision
    r1.xyzw = max((q2.x * const_3.zxwy) + r3.xyxy, 0);			// partial precision
    r2.xyz = tex2D(ShadowMap, saturate(r1.xy));
    r1.xyz = tex2D(ShadowMap, saturate(r1.zw));
    r0.z = r2.x - l0.x;
    r0.w = r0.w + ((-(1.0 / 256) - r0.z) >= 0.0 ? 0 : 1);			// partial precision
    r0.z = r1.x - l0.x;
    r0.w = r0.w + ((-(1.0 / 256) - r0.z) >= 0.0 ? 0 : 1);			// partial precision
    r1.xyzw = max((q2.x * const_3.xzyw) + r3.xyxy, 0);			// partial precision
    r2.xyz = tex2D(ShadowMap, saturate(r1.xy));
    r1.xyz = tex2D(ShadowMap, saturate(r1.zw));
    r0.z = r2.x - l0.x;
    r0.w = r0.w + ((-(1.0 / 256) - r0.z) >= 0.0 ? 0 : 1);			// partial precision
    r0.z = r1.x - l0.x;
    r0.w = r0.w + ((-(1.0 / 256) - r0.z) >= 0.0 ? 0 : 1);			// partial precision
    r1.xyzw = max((q2.x * const_3.zzww) + r3.xyxy, 0);			// partial precision
    r2.xyz = tex2D(ShadowMap, saturate(r1.xy));
    r1.xyz = tex2D(ShadowMap, saturate(r1.zw));
    r0.w = r0.w + ((-(1.0 / 256) - (r2.x - l0.x)) >= 0.0 ? 0 : 1);			// partial precision
    r0.z = r0.w + ((-(1.0 / 256) - (r1.x - l0.x)) >= 0.0 ? 0 : 1);			// partial precision
    r0.w = r3.y;			// partial precision
    r2.y = saturate(r0.w);			// partial precision
    r3.y = r3.x;			// partial precision
    r1.xyzw = q2.x * const_3.xyzw;			// partial precision
    r2.x = saturate(r0.x + r1.w);			// partial precision
    r4.xyz = tex2D(ShadowMap, r2.xy);
    r5.x = r4.x - l0.x;
    r3.zw = (1 - r0.y) + r1.xy;			// partial precision
    r2.xyzw = max(r3.xzxw, 0);			// partial precision
    r4.xyz = tex2D(ShadowMap, saturate(r2.xy));
    r2.xyz = tex2D(ShadowMap, saturate(r2.zw));
    r0.z = r0.z + ((-(1.0 / 256) - (r4.x - l0.x)) >= 0.0 ? 0 : 1);			// partial precision
    r0.z = r0.z + ((-(1.0 / 256) - (r2.x - l0.x)) >= 0.0 ? 0 : 1);			// partial precision
    r3.xz = (1 - r0.y) + r1.zw;			// partial precision
    r2.xyzw = max(r3.yxyz, 0);			// partial precision
    r3.xyz = tex2D(ShadowMap, saturate(r2.xy));
    r2.xyz = tex2D(ShadowMap, saturate(r2.zw));
    r2.w = r0.z + ((-(1.0 / 256) - (r3.x - l0.x)) >= 0.0 ? 0 : 1);			// partial precision
    r0.xyz = r0.x + r1.zyx;			// partial precision
    r1.xyzw = max(r0.zwyw, 0);			// partial precision
    r0.y = r2.w + ((-(1.0 / 256) - (r2.x - l0.x)) >= 0.0 ? 0 : 1);			// partial precision
    r2.xyz = tex2D(ShadowMap, saturate(r1.xy));
    r1.xyz = tex2D(ShadowMap, saturate(r1.zw));
    r1.w = r0.y + ((-(1.0 / 256) - (r2.x - l0.x)) >= 0.0 ? 0 : 1);			// partial precision
    r0.xyz = tex2D(ShadowMap, saturate(r0.xw));
    q3.x = (r1.w + ((-(1.0 / 256) - (r1.x - l0.x)) >= 0.0 ? 0 : 1)) + ((-(1.0 / 256) - (r0.x - l0.x)) >= 0.0 ? 0 : 1);			// partial precision
    r0.w = (ToggleADTS.w <= 0.0 ? r5.w : r5.y);
    q4.x = (LightColor.a * (saturate((q3.x + ((-(1.0 / 256) - r5.x) >= 0.0 ? 0 : 1)) / 15) - 1)) + r5.y;			// partial precision
    r1.w = 1 - q4.x;			// partial precision
    r2.xyz = lerp(r5.y - ((r1.w * 0.6) * LightColor.rgb), 1, sqr(r5.z));			// partial precision
    r1.xyz = 1 - r2.xyz;			// partial precision

    if (0 != r0.w) {
      r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
      r2.w = r0.w;			// partial precision
    }
    else {
      r2.w = 1;
    }

    OUT.color_0.a = min(min(r2.w, 1), r1.w);			// partial precision
    OUT.color_0.rgb = (IN.texcoord_2.w * r1.xyz) + r2.xyz;			// partial precision

    return OUT;
};

// approximately 159 instruction slots used (18 texture, 141 arithmetic)

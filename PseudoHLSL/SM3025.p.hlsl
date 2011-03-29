//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3025.pso /Fcshaderdump19/SM3025.pso.dis
//
//
// Parameters:

sampler2D BaseMap;
sampler2D DecalMap;
float4 PSDecalOffsets[8];
float4 PSNumDecals;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSNumDecals    const_6       1
//   PSDecalOffsets const_9       8
//   BaseMap        texture_0       1
//   DecalMap       texture_1       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float3 texcoord_4 : TEXCOORD4;
    float3 texcoord_5 : TEXCOORD5;
    float3 texcoord_6 : TEXCOORD6;
    float3 texcoord_7 : TEXCOORD7;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const int4 const_0 = {8, 0, 1, 2};
    const int4 const_1 = {7, 0, 0, 0};
    const int4 const_2 = {3, 4, 5, 6};

    r1.w = 8;			// partial precision
    r0.x = min(PSNumDecals.x, r1.w);			// partial precision
    r0.w = (r0.x >= 0.0 ? 1 : 0);			// partial precision
    r0.y = frac(r0.x);			// partial precision
    r0.z = (r0.y <= 0.0 ? 1 : 0);			// partial precision
    r0.y = r0.x - r0.y;			// partial precision
    r1.xyzw = tex2D(DecalMap, r0);			// partial precision
    r2.z = (r0.w * r0.z) + r0.y;
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.xy = saturate(IN.texcoord_1);			// partial precision
    r0.xy = (const_10.ywzw * r0) + const_10.xzzw;			// partial precision
    if_lt 1, r2.z
      r2.w = r1.w * IN.texcoord_1.z;			// partial precision
      r0.xyz = r1.xyz * r2.w;			// partial precision
    else
      r1.w = 0;			// partial precision
      r0.xyz = r1.w;			// partial precision
      r2.w = r1.w;			// partial precision
    endif
    r1.xy = saturate(IN.texcoord_2);			// partial precision
    r1.xy = (const_11.ywzw * r1) + const_11.xzzw;			// partial precision
    r1.xyzw = tex2D(DecalMap, r1);			// partial precision
    if_lt 2, r2.z
      r1.w = r1.w * IN.texcoord_2.z;			// partial precision
      r1.xyz = r1.xyz - r0.xyz;			// partial precision
      r0.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r2.w = r2.w + r1.w;			// partial precision
    endif
    r1.xy = saturate(IN.texcoord_3);			// partial precision
    r1.xy = (const_12.ywzw * r1) + const_12.xzzw;			// partial precision
    r1.xyzw = tex2D(DecalMap, r1);			// partial precision
    if_lt 3, r2.z
      r1.w = r1.w * IN.texcoord_3.z;			// partial precision
      r1.xyz = r1.xyz - r0.xyz;			// partial precision
      r0.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r2.w = r2.w + r1.w;			// partial precision
    endif
    r1.xy = saturate(IN.texcoord_4);			// partial precision
    r1.xy = (const_13.ywzw * r1) + const_13.xzzw;			// partial precision
    r1.xyzw = tex2D(DecalMap, r1);			// partial precision
    if_lt 4, r2.z
      r1.w = r1.w * IN.texcoord_4.z;			// partial precision
      r1.xyz = r1.xyz - r0.xyz;			// partial precision
      r0.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r2.w = r2.w + r1.w;			// partial precision
    endif
    r1.xy = saturate(IN.texcoord_5);			// partial precision
    r1.xy = (const_14.ywzw * r1) + const_14.xzzw;			// partial precision
    r1.xyzw = tex2D(DecalMap, r1);			// partial precision
    if_lt 5, r2.z
      r1.w = r1.w * IN.texcoord_5.z;			// partial precision
      r1.xyz = r1.xyz - r0.xyz;			// partial precision
      r0.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r2.w = r2.w + r1.w;			// partial precision
    endif
    r1.xy = saturate(IN.texcoord_6);			// partial precision
    r1.xy = (const_15.ywzw * r1) + const_15.xzzw;			// partial precision
    r1.xyzw = tex2D(DecalMap, r1);			// partial precision
    if_lt 6, r2.z
      r1.w = r1.w * IN.texcoord_6.z;			// partial precision
      r1.xyz = r1.xyz - r0.xyz;			// partial precision
      r0.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r2.w = r2.w + r1.w;			// partial precision
    endif
    r1.xy = saturate(IN.texcoord_7);			// partial precision
    r1.xy = (const_16.ywzw * r1) + const_16.xzzw;			// partial precision
    r1.xyzw = tex2D(DecalMap, r1);			// partial precision
    if_lt 7, r2.z
      r1.w = r1.w * IN.texcoord_7.z;			// partial precision
      r1.xyz = r1.xyz - r0.xyz;			// partial precision
      OUT.color_0.rgb = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r0.z = r2.w + r1.w;			// partial precision
      r0.z = saturate(r0.z);			// partial precision
    else
      OUT.color_0.rgb = r0.xyz;			// partial precision
      r0.z = r2.w;			// partial precision
      r0.z = saturate(r0.z);			// partial precision
    endif
    OUT.color_0.a = r0.w * r0.z;			// partial precision

    return OUT;
};

// approximately 79 instruction slots used (8 texture, 71 arithmetic)

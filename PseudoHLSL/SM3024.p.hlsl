//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3024.pso /Fcshaderdump19/SM3024.pso.dis
//
//
// Parameters:

sampler2D DecalMap;
float4 PSDecalOffsets[8];
float4 PSNumDecals;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSNumDecals    const_6       1
//   PSDecalOffsets const_9       8
//   DecalMap       texture_1       1
//



// Structures:

struct VS_OUTPUT {
    float3 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float3 texcoord_4 : TEXCOORD4;
    float3 texcoord_5 : TEXCOORD5;
    float3 texcoord_6 : TEXCOORD6;
    float3 texcoord_7 : TEXCOORD7;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const int4 const_0 = {8, 0, 1, 2};
    const int4 const_1 = {7, 0, 0, 0};
    const int4 const_2 = {3, 4, 5, 6};

    float4 r0;
    float4 r1;
    float4 r2;

    r0.x = min(PSNumDecals.x, 8);			// partial precision
    r0.y = frac(r0.x);			// partial precision
    r2.w = ((r0.x >= 0.0 ? 1 : 0) * (r0.y <= 0.0 ? 1 : 0)) + (r0.x - r0.y);
    r0.xyzw = tex2D(DecalMap, (const_9.yw * saturate(IN.texcoord_0.xy)) + const_9.xz);			// partial precision
    r1.w = (r2.w <= 0.0 ? 1 : 0);			// partial precision

    if (0 != r1.w) {
      r1.w = r0.w * IN.texcoord_0.z;			// partial precision
      r1.xyz = r0.xyz * r1.w;			// partial precision
    }
    else {
      r1.w = 0;			// partial precision
      r1.xyz = 0;			// partial precision
    }

    r0.xyzw = tex2D(DecalMap, (const_10.yw * saturate(IN.texcoord_1.xy)) + const_10.xz);			// partial precision

    if (1 != r2.w) {
      r0.w = r0.w * IN.texcoord_1.z;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
      r1.xyz = (r0.w * (r0.xyz - r1.xyz)) + r1.xyz;			// partial precision
    }

    r0.xyzw = tex2D(DecalMap, (const_11.yw * saturate(IN.texcoord_2.xy)) + const_11.xz);			// partial precision

    if (2 != r2.w) {
      r0.w = r0.w * IN.texcoord_2.z;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
      r1.xyz = (r0.w * (r0.xyz - r1.xyz)) + r1.xyz;			// partial precision
    }

    r0.xyzw = tex2D(DecalMap, (const_12.yw * saturate(IN.texcoord_3.xy)) + const_12.xz);			// partial precision

    if (3 != r2.w) {
      r0.w = r0.w * IN.texcoord_3.z;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
      r1.xyz = (r0.w * (r0.xyz - r1.xyz)) + r1.xyz;			// partial precision
    }

    r0.xyzw = tex2D(DecalMap, (const_13.yw * saturate(IN.texcoord_4.xy)) + const_13.xz);			// partial precision

    if (4 != r2.w) {
      r0.w = r0.w * IN.texcoord_4.z;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
      r1.xyz = (r0.w * (r0.xyz - r1.xyz)) + r1.xyz;			// partial precision
    }

    r0.xyzw = tex2D(DecalMap, (const_14.yw * saturate(IN.texcoord_5.xy)) + const_14.xz);			// partial precision

    if (5 != r2.w) {
      r0.w = r0.w * IN.texcoord_5.z;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
      r1.xyz = (r0.w * (r0.xyz - r1.xyz)) + r1.xyz;			// partial precision
    }

    r0.xyzw = tex2D(DecalMap, (const_15.yw * saturate(IN.texcoord_6.xy)) + const_15.xz);			// partial precision

    if (6 != r2.w) {
      r0.w = r0.w * IN.texcoord_6.z;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
      r1.xyz = (r0.w * (r0.xyz - r1.xyz)) + r1.xyz;			// partial precision
    }

    r0.xyzw = tex2D(DecalMap, (const_16.yw * saturate(IN.texcoord_7.xy)) + const_16.xz);			// partial precision

    if (7 != r2.w) {
      r0.w = r0.w * IN.texcoord_7.z;			// partial precision
      r0.xyz = r0.xyz - r1.xyz;			// partial precision
      OUT.color_0.rgb = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = r1.w + r0.w;			// partial precision
      OUT.color_0.a = saturate(r0.w);			// partial precision
    }
    else {
      OUT.color_0.rgb = r1.xyz;			// partial precision
      OUT.color_0.a = saturate(r1.w);			// partial precision
    }


    return OUT;
};

// approximately 87 instruction slots used (8 texture, 79 arithmetic)

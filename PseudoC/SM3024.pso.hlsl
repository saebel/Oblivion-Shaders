//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3024.pso /Fcshaderdump19/SM3024.pso.dis
//
//
// Parameters:
//
//   sampler2D DecalMap;
//   float4 PSDecalOffsets[8];
//   float4 PSNumDecals;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSNumDecals    const_6       1
//   PSDecalOffsets const_9       8
//   DecalMap       texture_1       1
//

    const int4 const_0 = {8, 0, 1, 2};
    const int4 const_1 = {7, 0, 0, 0};
    const int4 const_2 = {3, 4, 5, 6};
    float3 IN.texcoord_0 : TEXCOORD0;
    float3 IN.texcoord_1 : TEXCOORD1;
    float3 IN.texcoord_2 : TEXCOORD2;
    float3 IN.texcoord_3 : TEXCOORD3;
    float3 IN.texcoord_4 : TEXCOORD4;
    float3 IN.texcoord_5 : TEXCOORD5;
    float3 IN.texcoord_6 : TEXCOORD6;
    float3 IN.texcoord_7 : TEXCOORD7;
    sampler2D DecalMap;
    r1.w = const_0.x;			// partial precision
    r0.x = min(PSNumDecals.x, r1.w);			// partial precision
    r0.w = (r0.x >= 0.0 ? const_0.z : const_0.y);			// partial precision
    r0.y = r0.x - floor(r0.x);			// partial precision
    r0.z = (r0.y <= 0.0 ? const_0.z : const_0.y);			// partial precision
    r0.y = r0.x - r0.y;			// partial precision
    r2.w = (r0.w * r0.z) + r0.y;
    r0.xy = saturate(IN.texcoord_0);			// partial precision
    r1.w = (r2.w <= 0.0 ? const_0.z : const_0.y);			// partial precision
    r0.xy = (const_9.ywzw * r0) + const_9.xzzw;			// partial precision
    r0 = tex2D(DecalMap, r0);			// partial precision
    if_ne r1.w, -r1.w
      r1.w = r0.w * IN.texcoord_0.z;			// partial precision
      r1.xyz = r0 * r1.w;			// partial precision
    else
      r0.w = const_0.y;
      r1.xyz = r0.w;			// partial precision
      r1.w = r0.w;			// partial precision
    endif
    r0.xy = saturate(IN.texcoord_1);			// partial precision
    r0.xy = (const_10.ywzw * r0) + const_10.xzzw;			// partial precision
    r0 = tex2D(DecalMap, r0);			// partial precision
    if_lt const_0.z, r2.w
      r0.w = r0.w * IN.texcoord_1.z;			// partial precision
      r0.xyz = r0 - r1;			// partial precision
      r1.xyz = (r0.w * r0) + r1;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
    endif
    r0.xy = saturate(IN.texcoord_2);			// partial precision
    r0.xy = (const_11.ywzw * r0) + const_11.xzzw;			// partial precision
    r0 = tex2D(DecalMap, r0);			// partial precision
    if_lt const_0.w, r2.w
      r0.w = r0.w * IN.texcoord_2.z;			// partial precision
      r0.xyz = r0 - r1;			// partial precision
      r1.xyz = (r0.w * r0) + r1;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
    endif
    r0.xy = saturate(IN.texcoord_3);			// partial precision
    r0.xy = (const_12.ywzw * r0) + const_12.xzzw;			// partial precision
    r0 = tex2D(DecalMap, r0);			// partial precision
    if_lt const_2.x, r2.w
      r0.w = r0.w * IN.texcoord_3.z;			// partial precision
      r0.xyz = r0 - r1;			// partial precision
      r1.xyz = (r0.w * r0) + r1;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
    endif
    r0.xy = saturate(IN.texcoord_4);			// partial precision
    r0.xy = (const_13.ywzw * r0) + const_13.xzzw;			// partial precision
    r0 = tex2D(DecalMap, r0);			// partial precision
    if_lt const_2.y, r2.w
      r0.w = r0.w * IN.texcoord_4.z;			// partial precision
      r0.xyz = r0 - r1;			// partial precision
      r1.xyz = (r0.w * r0) + r1;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
    endif
    r0.xy = saturate(IN.texcoord_5);			// partial precision
    r0.xy = (const_14.ywzw * r0) + const_14.xzzw;			// partial precision
    r0 = tex2D(DecalMap, r0);			// partial precision
    if_lt const_2.z, r2.w
      r0.w = r0.w * IN.texcoord_5.z;			// partial precision
      r0.xyz = r0 - r1;			// partial precision
      r1.xyz = (r0.w * r0) + r1;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
    endif
    r0.xy = saturate(IN.texcoord_6);			// partial precision
    r0.xy = (const_15.ywzw * r0) + const_15.xzzw;			// partial precision
    r0 = tex2D(DecalMap, r0);			// partial precision
    if_lt const_2.w, r2.w
      r0.w = r0.w * IN.texcoord_6.z;			// partial precision
      r0.xyz = r0 - r1;			// partial precision
      r1.xyz = (r0.w * r0) + r1;			// partial precision
      r1.w = r1.w + r0.w;			// partial precision
    endif
    r0.xy = saturate(IN.texcoord_7);			// partial precision
    r0.xy = (const_16.ywzw * r0) + const_16.xzzw;			// partial precision
    r0 = tex2D(DecalMap, r0);			// partial precision
    if_lt const_1.x, r2.w
      r0.w = r0.w * IN.texcoord_7.z;			// partial precision
      r0.xyz = r0 - r1;			// partial precision
      OUT.color_0.rgb = (r0.w * r0) + r1;			// partial precision
      r0.w = r1.w + r0.w;			// partial precision
      OUT.color_0.a = saturate(r0.w);			// partial precision
    else
      OUT.color_0.rgb = r1;			// partial precision
      r0.w = r1.w;			// partial precision
      OUT.color_0.a = saturate(r0.w);			// partial precision
    endif

// approximately 87 instruction slots used (8 texture, 79 arithmetic)

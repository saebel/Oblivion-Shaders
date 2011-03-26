    const int4 const_0 = {2, -1, 1, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    sampler2D texture_0;
    sampler2D texture_1;
    r0 = tex2D(texture_1, IN.texcoord_1);			// partial precision
    r1 = tex2D(texture_0, IN.texcoord_0);			// partial precision
    r0.xyz = (2 * r0) + -1;			// partial precision
    r2.xyz = normalize(r0);			// partial precision
    r0.xyz = (IN.texcoord_3 * 2) + -1;			// partial precision
    r1.w = saturate(dot(r0, r2));			// partial precision
    r0.xyz = const_2;			// partial precision
    r0.xyz = (r1.w * r0) + const_1;			// partial precision
    r0.xyz = r1 * r0;			// partial precision
    r0.xyz = r0 * IN.texcoord_2;			// partial precision
    r0.w = 1;			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 14 instruction slots used (2 texture, 12 arithmetic)

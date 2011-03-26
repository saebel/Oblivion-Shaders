    const int4 const_0 = {1, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    sampler2D texture_0;
    sampler2D texture_1;
    r0 = tex2D(texture_0, IN.texcoord_0);			// partial precision
    r1 = tex2D(texture_1, IN.texcoord_1);			// partial precision
    r0.xyz = r0 * r1;			// partial precision
    r0.xyz = r0 * IN.texcoord_2;			// partial precision
    r0.w = 1;			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 6 instruction slots used (2 texture, 4 arithmetic)

    const_0 = {1, 0, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xy;			// partial precision
    texcoord input_2.xyz;			// partial precision			// centroid
    sampler texture_0;
    sampler texture_1;
    r0 = texture_0[texcoord_0];			// partial precision
    r1 = texture_1[texcoord_1];			// partial precision
    r0.xyz = r0 * r1;			// partial precision
    r0.xyz = r0 * texcoord_2;			// partial precision
    r0.w = const_0.x;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 6 instruction slots used (2 texture, 4 arithmetic)

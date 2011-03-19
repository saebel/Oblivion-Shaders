    const_0 = {2, -1, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xy;			// partial precision
    texcoord input_2.xyz;			// partial precision			// centroid
    color input_0;
    color input_1;
    sampler texture_0;
    sampler texture_1;
    r0 = texture_0[texcoord_0];			// partial precision
    r1 = texture_1[texcoord_1];			// partial precision
    r1.w = (const_3.x * input_0.x) + (const_3.y * input_0.y) + (const_3.z * input_0.z) + (const_3.w * input_0.w);			// partial precision
    r2.w = (const_4.x * input_1.x) + (const_4.y * input_1.y) + (const_4.z * input_1.z) + (const_4.w * input_1.w);			// partial precision
    r1.w = r1.w - r2.w;			// partial precision
    r0.w = (r1.w * const_0.x) - r0.w;			// partial precision
    r2.w = sat(r0.w - const_0.y);			// partial precision
    r0.xyz = r0 * r1;			// partial precision
    r2.xyz = r0 * texcoord_2;			// partial precision
    rendertarget_0 = r2;			// partial precision

// approximately 10 instruction slots used (2 texture, 8 arithmetic)

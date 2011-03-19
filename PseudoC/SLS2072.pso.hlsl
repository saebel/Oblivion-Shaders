    const_0 = {2, -1, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xy;			// partial precision
    texcoord input_2.xyz;			// partial precision			// centroid
    texcoord input_3.xyz;			// partial precision			// centroid
    color input_0;
    color input_1;
    sampler texture_0;
    sampler texture_1;
    r0 = texture_1[texcoord_1];			// partial precision
    r1 = texture_0[texcoord_0];			// partial precision
    r0.xyz = (const_0.x * r0) + const_0.y;			// partial precision
    r2.xyz = norm(r0);			// partial precision
    r0.xyz = (const_0.x * texcoord_3) + const_0.y;			// partial precision
    r0.x = sat((r0.x * r2.x) + (r0.y * r2.y) + (r0.z * r2.z));			// partial precision
    r0.xyz = r0.x * const_2;			// partial precision
    r0.xyz = r1 * r0;			// partial precision
    r0.xyz = r0 * texcoord_2;			// partial precision
    r1.x = (const_3.x * input_0.x) + (const_3.y * input_0.y) + (const_3.z * input_0.z) + (const_3.w * input_0.w);			// partial precision
    r1.y = (const_4.x * input_1.x) + (const_4.y * input_1.y) + (const_4.z * input_1.z) + (const_4.w * input_1.w);			// partial precision
    r1.x = r1.x - r1.y;			// partial precision
    r1.x = (r1.x * const_0.x) - r1.w;			// partial precision
    r0.w = sat(r1.x - const_0.y);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 17 instruction slots used (2 texture, 15 arithmetic)

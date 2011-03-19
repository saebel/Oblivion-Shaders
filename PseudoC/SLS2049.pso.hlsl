    const_0 = {2, -1, 1, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xy;			// partial precision
    texcoord input_2.xyz;			// partial precision			// centroid
    texcoord input_3.xyz;			// partial precision			// centroid
    texcoord input_4;			// partial precision
    color input_0;
    color input_1;
    sampler texture_0;
    sampler texture_1;
    sampler texture_2;
    sampler texture_3;
    r0 = texture_1[texcoord_1];			// partial precision
    r0.xyz = (const_0.x * r0) + const_0.y;			// partial precision
    r1.xyz = norm(r0);			// partial precision
    r0.xyz = (const_0.x * texcoord_3) + const_0.y;			// partial precision
    r0.x = sat((r0.x * r1.x) + (r0.y * r1.y) + (r0.z * r1.z));			// partial precision
    r0.xyz = r0.x * const_2;			// partial precision
    r1.x = texcoord_4.z;			// partial precision
    r1.y = texcoord_4.w;			// partial precision
    r1 = texture_3[r1];			// partial precision
    r2 = texture_2[texcoord_4];			// partial precision
    r3 = texture_0[texcoord_0];			// partial precision
    r0.w = r2.x - const_0.y;			// partial precision
    r0.w = (r1.x * r0.w) - const_0.z;			// partial precision
    r0.xyz = (r0.w * r0) + const_1;			// partial precision
    r0.xyz = r3 * r0;			// partial precision
    r0.xyz = r0 * texcoord_2;			// partial precision
    r1.x = (const_3.x * input_0.x) + (const_3.y * input_0.y) + (const_3.z * input_0.z) + (const_3.w * input_0.w);			// partial precision
    r1.y = (const_4.x * input_1.x) + (const_4.y * input_1.y) + (const_4.z * input_1.z) + (const_4.w * input_1.w);			// partial precision
    r1.x = r1.x - r1.y;			// partial precision
    r1.x = (r1.x * const_0.x) - r3.w;			// partial precision
    r0.w = sat(r1.x - const_0.y);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 24 instruction slots used (4 texture, 20 arithmetic)

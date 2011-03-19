    const_0 = {2, -1, 1, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xy;			// partial precision
    texcoord input_2.xyz;			// partial precision			// centroid
    texcoord input_3.xyz;			// partial precision			// centroid
    sampler texture_0;
    sampler texture_1;
    r0 = texture_1[texcoord_1];			// partial precision
    r1 = texture_0[texcoord_0];			// partial precision
    r0.xyz = (const_0.x * r0) + const_0.y;			// partial precision
    r2.xyz = norm(r0);			// partial precision
    r0.xyz = (const_0.x * texcoord_3) + const_0.y;			// partial precision
    r1.w = sat((r0.x * r2.x) + (r0.y * r2.y) + (r0.z * r2.z));			// partial precision
    r0.xyz = const_2;			// partial precision
    r0.xyz = (r1.w * r0) - const_1;			// partial precision
    r0.xyz = r1 * r0;			// partial precision
    r0.xyz = r0 * texcoord_2;			// partial precision
    r0.w = const_0.z;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 14 instruction slots used (2 texture, 12 arithmetic)

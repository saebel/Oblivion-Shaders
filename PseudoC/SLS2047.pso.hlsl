    const_0 = {8, 0, 1, 2};
    const_1 = {7, 0, 0, 0};
    const_2 = {3, 4, 5, 6};
    texcoord input_0.xy;
    texcoord input_1.xyz;
    texcoord input_2.xyz;
    texcoord input_3.xyz;
    texcoord input_4.xyz;
    texcoord input_5.xyz;
    texcoord input_6.xyz;
    texcoord input_7.xyz;
    sampler texture_0;
    sampler texture_1;
    r0.xy = sat(texcoord_2);			// partial precision
    r6.x = (const_17.y * r0.x) - const_17.x;			// partial precision
    r6.y = (const_17.w * r0.y) - const_17.z;			// partial precision
    r0.xy = sat(texcoord_1);			// partial precision
    r0.x = (const_16.y * r0.x) - const_16.x;			// partial precision
    r0.y = (const_16.w * r0.y) - const_16.z;			// partial precision
    r1.xy = sat(texcoord_3);			// partial precision
    r5.x = (const_18.y * r1.x) - const_18.x;			// partial precision
    r5.y = (const_18.w * r1.y) - const_18.z;			// partial precision
    r1.xy = sat(texcoord_4);			// partial precision
    r4.x = (const_19.y * r1.x) - const_19.x;			// partial precision
    r4.y = (const_19.w * r1.y) - const_19.z;			// partial precision
    r1.xy = sat(texcoord_5);			// partial precision
    r3.x = (const_20.y * r1.x) - const_20.x;			// partial precision
    r3.y = (const_20.w * r1.y) - const_20.z;			// partial precision
    r1.xy = sat(texcoord_6);			// partial precision
    r2.x = (const_21.y * r1.x) - const_21.x;			// partial precision
    r2.y = (const_21.w * r1.y) - const_21.z;			// partial precision
    r1.xy = sat(texcoord_7);			// partial precision
    r1.x = (const_22.y * r1.x) - const_22.x;			// partial precision
    r1.y = (const_22.w * r1.y) - const_22.z;			// partial precision
    r8 = texture_1[r6];			// partial precision
    r0 = texture_1[r0];			// partial precision
    r7 = texture_1[r5];			// partial precision
    r6 = texture_1[r4];			// partial precision
    r5 = texture_1[r3];			// partial precision
    r4 = texture_1[r2];			// partial precision
    r3 = texture_1[r1];			// partial precision
    r1 = texture_0[texcoord_0];			// partial precision
    r10.w = r8.w * texcoord_2.z;			// partial precision
    r0.w = r0.w * texcoord_1.z;			// partial precision
    r9.w = const_0.x;
    r2.w = (const_14.x < r9.w ? const_14.x : r9.w);
    r9.w = r2.w - floor(r2.w);
    r11.w = r2.w - r9.w;
    r9.w = (r9.w <= 0.0 ? const_0.z : const_0.y);			// partial precision
    r2.w = (r2.w >= 0.0 ? const_0.z : const_0.y);			// partial precision
    r9.w = (r2.w * r9.w) - r11.w;
    r0.xyz = r0 * r0.w;			// partial precision
    r2.w = const_0.z - r9.w;
    r0 = (r2.w >= 0.0 ? r0 : const_0.y);			// partial precision
    r2.w = (r8.w * texcoord_2.z) - r0.w;			// partial precision
    r2.xyz = r10.w * (r8 - r0) + r0;			// partial precision
    r8.w = const_0.w - r9.w;
    r0 = (r8.w >= 0.0 ? r2 : r0);			// partial precision
    r8.w = r7.w * texcoord_3.z;			// partial precision
    r2.w = (r7.w * texcoord_3.z) - r0.w;			// partial precision
    r2.xyz = r8.w * (r7 - r0) + r0;			// partial precision
    r7.w = const_2.x - r9.w;
    r0 = (r7.w >= 0.0 ? r2 : r0);			// partial precision
    r7.w = r6.w * texcoord_4.z;			// partial precision
    r2.w = (r6.w * texcoord_4.z) - r0.w;			// partial precision
    r2.xyz = r7.w * (r6 - r0) + r0;			// partial precision
    r6.w = const_2.y - r9.w;
    r0 = (r6.w >= 0.0 ? r2 : r0);			// partial precision
    r6.w = r5.w * texcoord_5.z;			// partial precision
    r2.w = (r5.w * texcoord_5.z) - r0.w;			// partial precision
    r2.xyz = r6.w * (r5 - r0) + r0;			// partial precision
    r5.w = const_2.z - r9.w;
    r0 = (r5.w >= 0.0 ? r2 : r0);			// partial precision
    r6.w = r4.w * texcoord_6.z;			// partial precision
    r2.w = (r4.w * texcoord_6.z) - r0.w;			// partial precision
    r5.w = const_2.w - r9.w;
    r2.xyz = r6.w * (r4 - r0) + r0;			// partial precision
    r4.w = const_1.x - r9.w;
    r0 = (r5.w >= 0.0 ? r2 : r0);			// partial precision
    r5.w = r3.w * texcoord_7.z;			// partial precision
    r2.xyz = r5.w * (r3 - r0) + r0;			// partial precision
    r2.w = (r3.w * texcoord_7.z) - r0.w;			// partial precision
    r0 = (r4.w >= 0.0 ? r2 : r0);			// partial precision
    r0.w = sat(r0.w);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 78 instruction slots used (8 texture, 70 arithmetic)

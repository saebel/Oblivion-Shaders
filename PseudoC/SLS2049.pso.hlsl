    const int4 const_0 = {2, -1, 1, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    float4 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D texture_0;
    sampler2D texture_1;
    sampler2D texture_2;
    sampler2D texture_3;
    r0 = tex2D(texture_1, IN.texcoord_1);			// partial precision
    r0.xyz = (2 * r0) + -1;			// partial precision
    r1.xyz = normalize(r0);			// partial precision
    r0.xyz = (IN.texcoord_3 * 2) + -1;			// partial precision
    r0.x = saturate(dot(r0, r1));			// partial precision
    r0.xyz = r0.x * const_2;			// partial precision
    r1.x = IN.texcoord_4.z;			// partial precision
    r1.y = IN.texcoord_4.w;			// partial precision
    r1 = tex2D(texture_3, r1);			// partial precision
    r2 = tex2D(texture_2, IN.texcoord_4);			// partial precision
    r3 = tex2D(texture_0, IN.texcoord_0);			// partial precision
    r0.w = r2.x + -1;			// partial precision
    r0.w = (r1.x * r0.w) + 1;			// partial precision
    r0.xyz = (r0.w * r0) + const_1;			// partial precision
    r0.xyz = r3 * r0;			// partial precision
    r0.xyz = r0 * IN.texcoord_2;			// partial precision
    r1.x = dot(const_3, IN.color_0);			// partial precision
    r1.y = dot(const_4, IN.color_1);			// partial precision
    r1.x = r1.x + r1.y;			// partial precision
    r1.x = (r1.x * 2) + r3.w;			// partial precision
    r0.w = saturate(r1.x + -1);			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 24 instruction slots used (4 texture, 20 arithmetic)

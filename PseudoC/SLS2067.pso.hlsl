    const int4 const_0 = {2, -1, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D texture_0;
    sampler2D texture_1;
    r0.xyzw = tex2D(texture_1, IN.texcoord_1);			// partial precision
    r1.xyzw = tex2D(texture_0, IN.texcoord_0);			// partial precision
    r0.xyz = (2 * r0) + -1;			// partial precision
    r2.xyz = normalize(r0);			// partial precision
    r0.xyz = (IN.texcoord_3 * 2) + -1;			// partial precision
    r0.x = saturate(dot(r0.xyz, r2.xyz));			// partial precision
    r2.xyz = const_2.xyz;			// partial precision
    r0.xyz = (r0.x * r2.xyz) + const_1.xyz;			// partial precision
    r0.xyz = r1.xyz * r0.xyz;			// partial precision
    r0.xyz = r0.xyz * IN.texcoord_2;			// partial precision
    r1.x = dot(const_3.xyzw, IN.color_0.rgba);			// partial precision
    r1.y = dot(const_4.xyzw, IN.color_1.rgba);			// partial precision
    r1.x = r1.x + r1.y;			// partial precision
    r1.x = (r1.x * 2) + r1.w;			// partial precision
    r0.w = saturate(r1.x + -1);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 18 instruction slots used (2 texture, 16 arithmetic)

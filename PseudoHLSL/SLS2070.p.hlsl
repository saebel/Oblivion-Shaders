

// Structures:

struct VS_INPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
};

struct VS_OUTPUT {
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_0 = {2, -1, 0, 0};

    r0.xyzw = tex2D(texture_0, IN.texcoord_0);			// partial precision
    r1.xyzw = tex2D(texture_1, IN.texcoord_1);			// partial precision
    r0.xyz = r0.xyz * r1.xyz;			// partial precision
    r1.w = dot(const_3.xyzw, IN.color_0.rgba);			// partial precision
    r2.w = dot(const_4.xyzw, IN.color_1.rgba);			// partial precision
    r1.w = r1.w + r2.w;			// partial precision
    r0.w = (r1.w * 2) + r0.w;			// partial precision
    r2.w = saturate(r0.w + -1);			// partial precision
    r2.xyz = r0.xyz * IN.texcoord_2;			// partial precision
    OUT.color_0.rgba = r2.xyzw;			// partial precision

    return OUT;
};

// approximately 10 instruction slots used (2 texture, 8 arithmetic)

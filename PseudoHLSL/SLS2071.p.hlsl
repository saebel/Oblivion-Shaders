

// Structures:

struct VS_INPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_0 = {2, -1, 1, 0};

    float4 r0;
    float4 r1;

    r0.xyzw = tex2D(texture_1, IN.texcoord_1.xy);			// partial precision
    r0.w = 1;			// partial precision
    r1.xyzw = tex2D(texture_0, IN.texcoord_0.xy);			// partial precision
    r0.xyz = (r1.xyz * (saturate(dot((IN.texcoord_3 * 2) - 1, normalize((2 * r0.xyz) - 1))) * const_2.xyz)) * IN.texcoord_2.xyz;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 13 instruction slots used (2 texture, 11 arithmetic)

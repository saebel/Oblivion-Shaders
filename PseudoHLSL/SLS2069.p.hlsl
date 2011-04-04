

// Structures:

struct VS_INPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const int4 const_0 = {1, 0, 0, 0};

    float4 r0;
    float4 r1;

    r0.xyzw = tex2D(texture_0, IN.texcoord_0.xy);			// partial precision
    r1.xyzw = tex2D(texture_1, IN.texcoord_1.xy);			// partial precision
    r0.xyz = (r0.xyz * r1.xyz) * IN.texcoord_2.xyz;			// partial precision
    r0.w = 1;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 6 instruction slots used (2 texture, 4 arithmetic)

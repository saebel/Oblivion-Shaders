

// Structures:

struct VS_INPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
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

    const int4 const_0 = {2, -1, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;

    r0.xyzw = tex2D(texture_0, IN.texcoord_0.xy);			// partial precision
    r1.xyzw = tex2D(texture_1, IN.texcoord_1.xy);			// partial precision
    r2.w = saturate(((dot(const_3.xyzw, IN.color_0.rgba) + dot(const_4.xyzw, IN.color_1.rgba) * 2) + r0.w) - 1);			// partial precision
    r2.xyz = (r0.xyz * r1.xyz) * IN.texcoord_2.xyz;			// partial precision
    OUT.color_0.rgba = r2.xyzw;			// partial precision

    return OUT;
};

// approximately 10 instruction slots used (2 texture, 8 arithmetic)

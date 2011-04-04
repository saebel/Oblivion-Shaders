

// Structures:

struct VS_INPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
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

    const int4 const_0 = {2, -1, 1, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;

    r0.xyzw = tex2D(texture_1, IN.texcoord_1.xy);			// partial precision
    r1.xyz = normalize((2 * r0.xyz) - 1);			// partial precision
    r0.xyz = (IN.texcoord_3 * 2) - 1;			// partial precision
    r0.x = saturate(dot(r0.xyz, r1.xyz));			// partial precision
    r1.x = IN.texcoord_4.z;			// partial precision
    r1.y = IN.texcoord_4.w;			// partial precision
    r1.xyzw = tex2D(texture_3, r1.xy);			// partial precision
    r2.xyzw = tex2D(texture_2, IN.texcoord_4.xy);			// partial precision
    r3.xyzw = tex2D(texture_0, IN.texcoord_0.xy);			// partial precision
    r0.xyz = (r3.xyz * ((((r1.x * (r2.x - 1)) + 1) * (r0.x * const_2.xyz)) + const_1.xyz)) * IN.texcoord_2.xyz;			// partial precision
    r0.w = 1;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 20 instruction slots used (4 texture, 16 arithmetic)

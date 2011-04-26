//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2063.pso /Fcshaderdump19/SLS2063.pso.dis
//
//
// Parameters:
//
sampler2D NormalMap : register(s0);
float PSRefractionPower : register(c25);
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   PSRefractionPower const_25      1
//   NormalMap         texture_0       1
//


// Structures:

struct VS_OUTPUT {
    float3 NormalUV : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float2 q0;
    float4 r0;

    r0.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    r0.z = PSRefractionPower.x;			// partial precision
    q0.xy = ((1.0 - 0.1 * max(-0.1, min(expand(r0.xy), 0.1))) + IN.texcoord_1.xy) / IN.NormalUV.z;			// partial precision
    r0.xy = compress(q0.xy);			// partial precision	// [-1,+1] to [0,1]
    OUT.color_0.a = 1;			// partial precision
    OUT.color_0.rgb = r0.xyz;			// partial precision

    return OUT;
};

// approximately 12 instruction slots used (1 texture, 11 arithmetic)

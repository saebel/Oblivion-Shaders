//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1006.pso /Fcshaderdump19/SLS1006.pso.dis
//
//
// Parameters:
//
sampler2D DiffuseMap;
float4 EmittanceColor;
sampler2D LayerMap;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   EmittanceColor const_6       1
//   DiffuseMap     texture_0       1
//   LayerMap       texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 LayerUV : TEXCOORD0;
    float2 color_0 : COLOR0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float3 q0;
    float4 r0;
    float4 r1;

    r1.xyzw = tex2D(LayerMap, IN.LayerUV.xy);
    r0.xyzw = tex2D(DiffuseMap, IN.LayerUV.xy);
    q0.xyz = (2 * ((IN.color_0.g * (EmittanceColor.rgb - 0.5)) + 0.5)) * lerp(r0.xyz, r1.xyz, r1.w);	// [0,1] to [-1,+1]
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = q0.xyz;

    return OUT;
};

// approximately 10 instruction slots used (2 texture, 8 arithmetic)

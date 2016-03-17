//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GDECAL.pso /Fcshaderdump19/GDECAL.pso.dis
//
//
// Parameters:

sampler2D Unknown;	// s0
sampler2D DecalMap;	// s1
float4 PSDecalOffsets;

// Structures:

struct VS_OUTPUT {
    float4 position : POSITION;
    float3 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float2 pos;
    float4 src;

    pos = saturate(IN.texcoord_0);				// partial precision
    pos.x = (PSDecalOffsets.y * pos.x) + PSDecalOffsets.x;	// partial precision
    pos.y = (PSDecalOffsets.w * pos.y) + PSDecalOffsets.z;	// partial precision

    src = tex2D(DecalMap, pos);					// partial precision

    OUT.color_0.rgb = src.rgb * IN.texcoord_0.z;		// partial precision
    OUT.color_0.a   = src.a   * IN.texcoord_0.z;		// partial precision

    return OUT;
};

// approximately 9 instruction slots used (1 texture, 8 arithmetic)
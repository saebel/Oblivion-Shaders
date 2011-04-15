//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GDECAL.pso /Fcshaderdump19/GDECAL.pso.dis
//
//
// Parameters:
//
sampler2D DecalMap;
float4 PSDecalOffsets;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSDecalOffsets const_15      1
//   DecalMap       texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float3 DecalUV_0 : TEXCOORD0;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0;
    float4 r1;

    r1.xyzw = tex2D(DecalMap, (PSDecalOffsets.yw * saturate(IN.DecalUV_0.xy)) + PSDecalOffsets.xz);			// partial precision
    r0.xyz = r1.xyz;			// partial precision
    r0.w = IN.DecalUV_0.z;			// partial precision
    r0.xyzw = r0.xyzw * IN.DecalUV_0.z;			// partial precision
    OUT.color_0.a = r1.w * r0.w;			// partial precision
    OUT.color_0.rgb = r0.xyz;			// partial precision

    return OUT;
};

// approximately 9 instruction slots used (1 texture, 8 arithmetic)

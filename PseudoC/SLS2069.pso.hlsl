//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa SLS2069.pso /FcSLS2069.pso.dis
//
//
// Parameters:
//
//   sampler2D BaseMap;
//   sampler2D GlowMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BaseMap      texture_0       1
//   GlowMap      texture_1       1
//

    const int4 const_0 = {1, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    sampler2D BaseMap;
    sampler2D GlowMap;
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.texcoord_1.xy);			// partial precision
    r0.xyz = r0.xyz * r1.xyz;			// partial precision
    r0.xyz = r0.xyz * IN.texcoord_2.xyz;			// partial precision
    r0.w = 1;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 6 instruction slots used (2 texture, 4 arithmetic)

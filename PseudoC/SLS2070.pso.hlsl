//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa SLS2070.pso /FcSLS2070.pso.dis
//
//
// Parameters:
//
//   sampler2D BaseMap;
//   sampler2D GlowMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   PSLightColor[1] const_3        1
//   PSLightColor[2] const_4        1
//   BaseMap      texture_0       1
//   GlowMap      texture_1       1
//

    const int4 const_0 = {2, -1, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D GlowMap;
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.texcoord_1.xy);			// partial precision
    r1.w = dot(PSLightColor[1].rgba, IN.color_0.rgba);			// partial precision
    r2.w = dot(PSLightColor[2].rgba, IN.color_1.rgba);			// partial precision
    r1.w = r1.w + r2.w;			// partial precision
    r0.w = (r1.w * 2) + r0.w;			// partial precision
    r2.w = saturate(r0.w - 1);			// partial precision
    r0.xyz = r0.xyz * r1.xyz;			// partial precision
    r2.xyz = r0.xyz * IN.texcoord_2.xyz;			// partial precision
    OUT.color_0.rgba = r2.xyzw;			// partial precision

// approximately 10 instruction slots used (2 texture, 8 arithmetic)

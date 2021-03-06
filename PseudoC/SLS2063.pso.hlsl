//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2063.pso /Fcshaderdump19/SLS2063.pso.dis
//
//
// Parameters:
//
//   sampler2D NormalMap;
//   float PSRefractionPower;
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   PSRefractionPower const_25      1
//   NormalMap         texture_0       1
//

    const float4 const_0 = {-0.5, 0.1, -0.1, 1.0 - 0.1};
    const int4 const_1 = {1, 0, 0, 0};
    float3 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    sampler2D NormalMap;
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r0.xy = r0.xy - 0.5;
    r0.xy = 2 * r0.xy;			// partial precision
    r1.xy = min(r0.xy, 0.1);			// partial precision
    r0.xy = max(-0.1, r1.xy);			// partial precision
    r0.xy = (1.0 - 0.1 * r0.xy) + IN.texcoord_1.xy;			// partial precision
    r0.w = 1.0 / IN.texcoord_0.z;			// partial precision
    r0.xy = r0.xy * r0.w;			// partial precision
    r0.xy = (0.5 * r0.xy) - -0.5;			// partial precision
    r0.z = PSRefractionPower.x;			// partial precision
    r0.w = 1;
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 12 instruction slots used (1 texture, 11 arithmetic)

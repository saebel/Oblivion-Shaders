//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3030.pso /Fcshaderdump19/SM3030.pso.dis
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
//   PSRefractionPower const_8       1
//   NormalMap         texture_0       1
//

    const float4 const_0 = {-0.5, 0, 0.5, 0};
    texcoord IN.input_0.xyw;			// partial precision
    float IN.texcoord_1 : TEXCOORD1;			// partial precision
    sampler2D NormalMap;
    r0.xyzw = tex2D(NormalMap, IN.input_0.xy);
    r0.xy = r0.xy - 0.5;
    r0.xy = 2 * r0.xy;
    r0.w = dot(r0.xy, r0.xy) + 0;
    r0.w = 1.0 / sqrt(r0.w);
    r0.xy = r0.xy * r0.w;			// partial precision
    r0.w = 1.0 / IN.input_0.w;			// partial precision
    r0.xy = r0.xy * r0.w;			// partial precision
    OUT.color_0.xy = (0.5 * r0.xy) + 0.5;			// partial precision
    r0.w = IN.texcoord_1.x * IN.texcoord_1.x;			// partial precision
    OUT.color_0.a = r0.w * 0.5;			// partial precision
    OUT.color_0.b = PSRefractionPower.x;			// partial precision

// approximately 12 instruction slots used (1 texture, 11 arithmetic)

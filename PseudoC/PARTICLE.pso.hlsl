//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PARTICLE.pso /Fcshaderdump19/PARTICLE.pso.dis
//
//
// Parameters:
//
//   sampler2D SourceTexture;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   SourceTexture texture_0       1
//

    float4 IN.color_0 : COLOR0;
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    sampler2D SourceTexture;
    r0.xyzw = tex2D(SourceTexture, IN.texcoord_0.xy);			// partial precision
    r0.xyzw = r0.xyzw * IN.color_0.rgba;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 3 instruction slots used (1 texture, 2 arithmetic)

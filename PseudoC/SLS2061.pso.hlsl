//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2061.pso /Fcshaderdump19/SLS2061.pso.dis
//
//
// Parameters:
//
//   sampler2D BaseMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BaseMap      texture_0       1
//

    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float4 texcoord_1 : TEXCOORD1;			// partial precision
    sampler2D BaseMap;
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r1.w = 1.0 / IN.texcoord_1.w;			// partial precision
    r1.w = r1.w * IN.texcoord_1.z;			// partial precision
    r0.xyz = saturate(r1.w);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 5 instruction slots used (1 texture, 4 arithmetic)

//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR003.pso /Fcshaderdump19/HDR003.pso.dis
//
//
// Parameters:
//
//   sampler2D Src0;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   Src0         texture_0       1
//

    const int4 const_0 = {1, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    sampler2D Src0;
    r0 = tex2D(Src0, IN.texcoord_0);
    r0.w = const_0.x;
    OUT.color_0 = r0;

    // - full screen Shader
    // - copy input to output, set w to 1
    //
    // out.xyzw = [in.xyz,1]

// approximately 3 instruction slots used (1 texture, 2 arithmetic)

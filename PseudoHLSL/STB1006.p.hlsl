//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1006.pso /Fcshaderdump19/STB1006.pso.dis
//
//
// Parameters:

sampler2D DiffuseMap;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   DiffuseMap   texture_0       1
//

    IN.texcoord_0.xyzw = tex2D(DiffuseMap, texcoord_0);
    r0.xyz = IN.texcoord_0 * IN.input_0;
  + r0.w = IN.texcoord_0.w;

// approximately 2 instruction slots used (1 texture, 1 arithmetic)


// Structures:

struct VS_OUTPUT {
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;



    return OUT;
};


//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1018.vso /Fcshaderdump19/SLS1018.vso.dis
//
//
// Parameters:
//
//   float3 FogColor;
//   float4 FogParam;
//   row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   FogParam      const_23      1
//   FogColor      const_24      1
//

    const int4 const_4 = {0, 1, 0, 0};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    r0.x = dot(ModelViewProj[0], IN.position);
    r0.y = dot(ModelViewProj[1], IN.position);
    r0.z = dot(ModelViewProj[2], IN.position);
    r1.x = dot(r0, r0);	// normalize + length
    r0.w = 1.0 / sqrt(r1.x);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    r0.w = r0.w * r1.w;
    r0.w = max(r0.w, 0);
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.w = min(r0.w, 1);
    OUT.position.xyz = r0;
    OUT.color_0.a = 1 - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.color_0.rgb = FogColor;

// approximately 16 instruction slots used

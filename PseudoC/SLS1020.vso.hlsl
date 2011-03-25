//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1020.vso /Fcshaderdump19/SLS1020.vso.dis
//
//
// Parameters:
//
//   float3 LightDirection[3];
//   row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   LightDirection[0] const_13       1
//

    const int4 const_4 = {0, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    r0.x = dot(LightDirection[0], IN.normal);
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.w = max(r0.x, const_4.x);
    OUT.color_0.rgb = min(r0.w, const_4.y);
    OUT.texcoord_0.xy = IN.texcoord_0;

// approximately 8 instruction slots used

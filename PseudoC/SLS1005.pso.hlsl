//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1005.pso /Fcshaderdump19/SLS1005.pso.dis
//
//
// Parameters:
//
//   sampler2D Decal2Map;
//   sampler2D DecalMap;
//   sampler2D DiffuseMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   DiffuseMap   texture_0       1
//   DecalMap     texture_1       1
//   Decal2Map    texture_2       1
//

    const float4 const_0 = {-0.5, 2, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    sampler2D DiffuseMap;
    sampler2D DecalMap;
    sampler2D Decal2Map;
    r2.xyzw = tex2D(Decal2Map, IN.texcoord_2.xy);
    r1.xyzw = tex2D(DecalMap, IN.texcoord_1.xy);
    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);
    r2.xyz = 2 * r2.xyz;
    r1.xyz = r1.xyz - 0.5;
    r0.xyz = (2 * r1.xyz) + r0.xyz;
    r0.xyz = r2.xyz * r0.xyz;
    r0.xyz = 2 * r0.xyz;
    OUT.color_0.rgba = r0.xyzw;

// approximately 9 instruction slots used (3 texture, 6 arithmetic)

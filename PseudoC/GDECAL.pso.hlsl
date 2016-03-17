//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GDECAL.pso /Fcshaderdump19/GDECAL.pso.dis
//
//
// Parameters:
//
//   sampler2D DecalMap;
//   float4 PSDecalOffsets;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSDecalOffsets const_15      1
//   DecalMap       texture_1       1
//

    float3 texcoord_0 : TEXCOORD0;
    sampler2D DecalMap;
    r0.xy = saturate(IN.texcoord_0.xy);
    r0.x = (PSDecalOffsets.y * r0.x) + PSDecalOffsets.x;
    r0.y = (PSDecalOffsets.w * r0.y) + PSDecalOffsets.z;
    r1.xyzw = tex2D(DecalMap, r0.xy);
    r0.xyz = r1.xyz;
    r0.w = IN.texcoord_0.z;
    r0.xyzw = r0.xyzw * IN.texcoord_0.z;
    r0.w = r1.w * r0.w;
    OUT.color_0.rgba = r0.xyzw;

// approximately 9 instruction slots used (1 texture, 8 arithmetic)
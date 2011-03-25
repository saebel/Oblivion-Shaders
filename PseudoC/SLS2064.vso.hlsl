//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2064.vso /Fcshaderdump19/SLS2064.vso.dis
//
//
// Parameters:
//
//   float3 LightDirection[3];
//   row_major float4x4 ModelViewProj;
//   float4 ShadowProjData;
//   float4 ShadowProjTransform;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   ModelViewProj[0]       const_0        1
//   ModelViewProj[1]       const_1        1
//   ModelViewProj[2]       const_2        1
//   ModelViewProj[3]       const_3        1
//   LightDirection[0]      const_13       1
//   ShadowProjTransform const_23      1
//   ShadowProjData      const_24      1
//

    const float4 const_4 = {0.001953125, 0, 1, 0};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    float4 IN.texcoord_2 : TEXCOORD2;
    r0.xy = ShadowProjTransform.zwzw - IN.position;
    r0.xy = r0 * r0;
    r0.w = r0.y + r0.x;
    r0.w = 1.0 / sqrt(r0.w);
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    r0.w = 1.0 / r0.w;
    r0.w = ShadowProjData.x - r0.w;
    r1.w = 1.0 / ShadowProjData.y;
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    r0.w = r0.w * r1.w;
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    r0.w = max(r0.w, const_4.y);
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.w = min(r0.w, const_4.z);
    OUT.texcoord_2.w = const_4.z - r0.w;
    r0.w = const_4.x;
    r0.xy = (IN.texcoord_0 * r0.w) + ShadowProjTransform;
    OUT.texcoord_0.xy = r0;
    OUT.texcoord_1.xy = r0;
    OUT.texcoord_2.xyz = const_4.z;
    OUT.texcoord_3.xyz = LightDirection[0];
    OUT.color_0 = IN.texcoord_1;
    OUT.color_1 = IN.texcoord_2;

// approximately 23 instruction slots used

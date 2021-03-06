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

    const float4 const_4 = {(1.0 / 512), 0, 1, 0};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    float4 IN.texcoord_2 : TEXCOORD2;
    r0.xy = ShadowProjTransform.zw - IN.position.xy;
    r0.xy = r0.xy * r0.xy;
    r0.w = r0.y + r0.x;
    r0.w = 1.0 / sqrt(r0.w);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.w = 1.0 / r0.w;
    r0.w = ShadowProjData.x - r0.w;
    r1.w = 1.0 / ShadowProjData.y;
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.w = r0.w * r1.w;
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    r0.w = max(r0.w, 0);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r0.w = min(r0.w, 1);
    OUT.texcoord_2.w = 1 - r0.w;
    r0.w = (1.0 / 512);
    r0.xy = (IN.texcoord_0.xy * r0.w) + ShadowProjTransform.xy;
    OUT.texcoord_0.xy = r0.xy;
    OUT.texcoord_1.xy = r0.xy;
    OUT.texcoord_2.xyz = 1;
    OUT.texcoord_3.xyz = LightDirection[0].xyz;
    OUT.color_0.rgba = IN.texcoord_1.xyzw;
    OUT.color_1.rgba = IN.texcoord_2.xyzw;

// approximately 23 instruction slots used

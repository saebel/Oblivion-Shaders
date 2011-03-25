//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1029.vso /Fcshaderdump19/SLS1029.vso.dis
//
//
// Parameters:
//
//   float4 LightPosition[3];
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
//   LightPosition[0] const_16       1
//

    const float4 const_4 = {0.5, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_1 : TEXCOORD1;
    float4 IN.texcoord_2 : TEXCOORD2;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    r0.xyz = LightPosition[0] - IN.position;
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    r1.x = dot(r0, r0);	// normalize + length
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.w = 1.0 / sqrt(r1.x);
    r1.xyz = r0 * r0.w;
    r0.w = 1.0 / r0.w;
    r0.x = dot(IN.tangent, r1);
    r0.y = dot(IN.binormal, r1);
    r0.z = dot(IN.normal, r1);
    r1.w = 1.0 / LightPosition[0].w;
    r1.x = dot(r0, r0);	// normalize + length
    r0.w = (r0.w * -r1.w) + const_4.y;
    r1.w = 1.0 / sqrt(r1.x);
    r0.w = max(r0.w, const_4.z);
    r0.xyz = r0 * r1.w;
    r0.w = min(r0.w, const_4.y);
    OUT.texcoord_3.xyz = (const_4.x * r0) + const_4.x;
    OUT.texcoord_2.xyz = r0.w * IN.color_0;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.xy = IN.texcoord_0;
    OUT.color_0 = IN.texcoord_1;
    OUT.color_1 = IN.texcoord_2;

// approximately 25 instruction slots used

//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2012.vso /Fcshaderdump19/SKIN2012.vso.dis
//
//
// Parameters:

float4 EyePosition;
float3 LightDirection[3];
float4 LightPosition[3];
row_major float4x4 ModelViewProj;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   LightDirection[0] const_13       1
//   LightPosition[0]  const_16       1
//   LightPosition[1]  const_17       1
//   LightPosition[2]  const_18       1
//   EyePosition    const_25      1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {0.5, 0, 0, 0};

    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_4.w = 0.5;
    OUT.texcoord_4.xyz = (0.5 * r2) + 0.5;
    OUT.texcoord_5.w = 0.5;
    OUT.texcoord_5.xyz = (0.5 * r0) + 0.5;
    r1.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r1.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r1.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    r0.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r0.x);
    OUT.texcoord_1.xyz = r1.xyz * r0.w;
    r0.xyz = normalize(r2);
    r1.xyz = LightPosition[1].xyz - IN.position;
    r2.xyz = EyePosition.xyz - IN.position;
    r2.x = dot(IN.tangent.xyz, r0.xyz);
    r2.y = dot(IN.binormal.xyz, r0.xyz);
    r2.z = dot(IN.normal.xyz, r0.xyz);
    r0.x = dot(r2.xyz, r2.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r0.x);
    OUT.texcoord_7.xyz = r2.xyz * r0.w;
    r0.w = 1.0 / LightPosition[1].w;
    r2.xyz = r1.xyz * r0.w;
    r0.w = 1.0 / LightPosition[2].w;
    r1.xyz = normalize(r0);
    OUT.texcoord_3.x = dot(IN.tangent.xyz, r1.xyz);
    OUT.texcoord_3.y = dot(IN.binormal.xyz, r1.xyz);
    OUT.texcoord_3.z = dot(IN.normal.xyz, r1.xyz);
    r0.xyz = normalize(r1);
    OUT.texcoord_2.x = dot(IN.tangent.xyz, r0.xyz);
    OUT.texcoord_2.y = dot(IN.binormal.xyz, r0.xyz);
    OUT.texcoord_2.z = dot(IN.normal.xyz, r0.xyz);
    r0.xyz = LightPosition[2].xyz - IN.position;
    r0.xyz = r0.xyz * r0.w;

    return OUT;
};

// approximately 43 instruction slots used

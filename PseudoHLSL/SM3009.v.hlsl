//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3009.vso /Fcshaderdump19/SM3009.vso.dis
//
//
// Parameters:
//
float3 EyePosition;
row_major float4x4 ModelViewProj;
row_major float4x4 ObjToCubeSpace;
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
//   ObjToCubeSpace[0] const_10       1
//   ObjToCubeSpace[1] const_11       1
//   ObjToCubeSpace[2] const_12       1
//   EyePosition    const_14      1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float3 normal : NORMAL;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float4 color_0 : COLOR0;

#define	TanSpaceProj	float3x3(IN.tangent.xyz, IN.binormal.xyz, IN.normal.xyz)
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float4 texcoord_3 : TEXCOORD3;
    float3 color_0 : COLOR0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    float3 q0;
    float3 r0;

    q0.xyz = mul(float3x4(ObjToCubeSpace[0].xyzw, ObjToCubeSpace[1].xyzw, ObjToCubeSpace[2].xyzw), IN.position.xyzw);
    OUT.color_0.rgb = IN.color_0.rgb;
    OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    r0.xyz = EyePosition.xyz - q0.xyz;
    OUT.texcoord_1.xyz = mul(TanSpaceProj, ObjToCubeSpace[0].xyz);
    OUT.texcoord_1.w = r0.x;
    OUT.texcoord_2.w = r0.y;
    OUT.texcoord_2.xyz = mul(TanSpaceProj, ObjToCubeSpace[1].xyz);
    OUT.texcoord_3.w = r0.z;
    OUT.texcoord_3.xyz = mul(TanSpaceProj, ObjToCubeSpace[2].xyz);

    return OUT;
};

// approximately 22 instruction slots used

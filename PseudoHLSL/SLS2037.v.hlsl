//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2037.vso /Fcshaderdump19/SLS2037.vso.dis
//
//
// Parameters:

float4 EyePosition;
row_major float4x4 ModelViewProj;
row_major float4x4 ObjToCubeSpace;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   ObjToCubeSpace[0] const_8        1
//   ObjToCubeSpace[1] const_9        1
//   ObjToCubeSpace[2] const_10        1
//   EyePosition    const_25      1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float3 normal : NORMAL;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float4 color_0 : COLOR0;
};

struct VS_OUTPUT {
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {0.1, 0, 0, 0};

    OUT.color_0.rgb = IN.color_0;
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.z = dot(IN.normal.xyz, ObjToCubeSpace[0].xyz);
    OUT.texcoord_2.z = dot(IN.normal.xyz, ObjToCubeSpace[1].xyz);
    OUT.texcoord_3.z = dot(IN.normal.xyz, ObjToCubeSpace[2].xyz);
    r0.xyz = IN.binormal * 0.1;
    OUT.texcoord_1.y = dot(r0.xyz, ObjToCubeSpace[0].xyz);
    OUT.texcoord_2.y = dot(r0.xyz, ObjToCubeSpace[1].xyz);
    OUT.texcoord_3.y = dot(r0.xyz, ObjToCubeSpace[2].xyz);
    r0.x = dot(ObjToCubeSpace[0].xyzw, IN.position.xyzw);
    r0.y = dot(ObjToCubeSpace[1].xyzw, IN.position.xyzw);
    r0.z = dot(ObjToCubeSpace[2].xyzw, IN.position.xyzw);
    r1.xyz = IN.tangent * 0.1;
    OUT.texcoord_1.x = dot(r1.xyz, ObjToCubeSpace[0].xyz);
    OUT.texcoord_2.x = dot(r1.xyz, ObjToCubeSpace[1].xyz);
    OUT.texcoord_3.x = dot(r1.xyz, ObjToCubeSpace[2].xyz);
    r1.xyz = EyePosition.xyz - r0.xyz;
    r0.xyz = normalize(r1);
    OUT.texcoord_1.w = r0.x;
    OUT.texcoord_2.w = r0.y;
    OUT.texcoord_3.w = r0.z;

    return OUT;
};

// approximately 27 instruction slots used

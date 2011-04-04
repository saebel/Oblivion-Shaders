//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3008.vso /Fcshaderdump19/SM3008.vso.dis
//
//
// Parameters:

float3 EyePosition;
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

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const int4 const_4 = {1, 0, 0, 0};

    float3 r0;

    r0.x = dot(ObjToCubeSpace[0].xyzw, IN.position.xyzw);
    r0.y = dot(ObjToCubeSpace[1].xyzw, IN.position.xyzw);
    r0.z = dot(ObjToCubeSpace[2].xyzw, IN.position.xyzw);
    r0.xyz = EyePosition.xyz - r0.xyz;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_1.x = dot(IN.tangent.xyz, ObjToCubeSpace[0].xyz);
    OUT.texcoord_1.y = dot(IN.binormal.xyz, ObjToCubeSpace[0].xyz);
    OUT.texcoord_1.z = dot(IN.normal.xyz, ObjToCubeSpace[0].xyz);
    OUT.texcoord_2.x = dot(IN.tangent.xyz, ObjToCubeSpace[1].xyz);
    OUT.texcoord_2.y = dot(IN.binormal.xyz, ObjToCubeSpace[1].xyz);
    OUT.texcoord_2.z = dot(IN.normal.xyz, ObjToCubeSpace[1].xyz);
    OUT.texcoord_3.x = dot(IN.tangent.xyz, ObjToCubeSpace[2].xyz);
    OUT.texcoord_3.y = dot(IN.binormal.xyz, ObjToCubeSpace[2].xyz);
    OUT.texcoord_3.z = dot(IN.normal.xyz, ObjToCubeSpace[2].xyz);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.w = r0.x;
    OUT.texcoord_2.w = r0.y;
    OUT.texcoord_3.w = r0.z;
    OUT.color_0.rgb = 1;

    return OUT;
};

// approximately 22 instruction slots used

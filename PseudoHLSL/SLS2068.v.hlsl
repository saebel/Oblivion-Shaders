//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2068.vso /Fcshaderdump19/SLS2068.vso.dis
//
//
// Parameters:

row_major float4x4 ModelViewProj;
row_major float4x4 WorldViewTranspose;


// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   ModelViewProj[0]      const_0        1
//   ModelViewProj[1]      const_1        1
//   ModelViewProj[2]      const_2        1
//   ModelViewProj[3]      const_3        1
//   WorldViewTranspose[0] const_4        1
//   WorldViewTranspose[1] const_5        1
//   WorldViewTranspose[2] const_6        1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float3 texcoord_0 : TEXCOORD0;
    float1 texcoord_1 : TEXCOORD1;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const float4 const_7 = {0.5, 5, -4.4, 0};

    float3 r0;

    r0.x = dot(WorldViewTranspose[0].xyz, IN.normal.xyz);
    r0.y = dot(WorldViewTranspose[1].xyz, IN.normal.xyz);
    r0.z = dot(WorldViewTranspose[2].xyz, IN.normal.xyz);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_0.xyz = (0.5 * r0.xyz) + 0.5;
    r0.y = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.texcoord_1.x = (r0.y * 5) - 4.4;
    OUT.position.z = r0.y;

    return OUT;
};

// approximately 10 instruction slots used

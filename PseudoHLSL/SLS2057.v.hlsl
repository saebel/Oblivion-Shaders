//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2057.vso /Fcshaderdump19/SLS2057.vso.dis
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
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float3 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const float4 const_6 = {0.1, -0.1, (1.0 / 750), 0.8};
    const int4 const_7 = {1, 0, 0, 0};

    float2 r0;

    r0.x = dot(WorldViewTranspose[0].xyz, IN.normal.xyz);
    r0.y = dot(WorldViewTranspose[1].xyz, IN.normal.xyz);
    r0.xy = min(r0.xy, 0.1);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_1.xy = max(r0.xy, -0.1);
    r0.y = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.z = r0.y;
    OUT.texcoord_0.z = max((r0.y / 750)) + 0.8, 1;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 12 instruction slots used

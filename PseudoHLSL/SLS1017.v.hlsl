//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1017.vso /Fcshaderdump19/SLS1017.vso.dis
//
//
// Parameters:

float3 FogColor;
float4 FogParam;
row_major float4x4 ModelViewProj;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   FogParam      const_23      1
//   FogColor      const_24      1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float4 position : POSITION;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const int4 const_4 = {0, 1, 0, 0};

    float3 r0;

    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xyz = r0.xyz;
    OUT.color_0.a = 1 - saturate((FogParam.x - length(r0.xyz)) / FogParam.y);
    OUT.color_0.rgb = FogColor.rgb;

    return OUT;
};

// approximately 15 instruction slots used

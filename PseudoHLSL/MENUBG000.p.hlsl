//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/MENUBG000.pso /Fcshaderdump19/MENUBG000.pso.dis
//
//
// Parameters:

float BlendValue;
sampler2D Src0;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BlendValue   const_1       1
//   Src0         texture_0       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const float4 const_0 = {0.299, 0.587000012, 0.114, 0.14};
    const float4 const_2 = {0.11, -0.04, 1, 0};
    const float4 const_3 = {1, 0.955688059, 0.619858086, 0};
    const float4 const_4 = {1, -0.271581799, -0.646873832, 0};
    const float4 const_5 = {1, -1.1081773, 1.70506454, 0};

    float4 r0;
    float4 r1;
    float3 r2;

    r1.xyzw = tex2D(Src0, IN.texcoord_0.xy);
    r0.x = dot(const_0.xyz, r1.xyz) + 0.14;
    r0.yz = const_2.zxyw;
    r2.x = dot(const_3.xyz, r0.xyz);
    r2.y = dot(const_4.xyz, r0.xyz);
    r2.z = dot(const_5.xyz, r0.xyz);
    r0.xyz = lerp(r2.xyz, r1.xyz, BlendValue.x);
    r0.w = 1;
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 11 instruction slots used (1 texture, 10 arithmetic)

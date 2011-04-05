//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3035.pso /Fcshaderdump19/SM3035.pso.dis
//
//
// Parameters:

float4 FillColor;
sampler2D NormalMap;
float4 RimColor;
sampler2D SourceTexture;
float4 fVars;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   FillColor     const_0       1
//   RimColor      const_1       1
//   fVars         const_2       1
//   NormalMap     texture_0       1
//   SourceTexture texture_1       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float3 input_2 : TEXCOORD3_centroid;
    float4 color_1 : COLOR1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_3 = {-0.5, 0, 1, 0};

    float4 r0;
    float4 r1;

    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r1.w = pow(abs(1 - max(dot(2 * (r0.xyz - 0.5), IN.input_2.xyz), 0)), fVars.x);	// [0,1] to [-1,+1]
    r0.xyzw = tex2D(SourceTexture, IN.texcoord_1.xy);
    r0.w = r0.w * FillColor.a;
    r0.xyz = (r0.xyz + FillColor.rgb) * r0.w;
    r0.xyzw = (r1.w * RimColor.rgba) + r0.xyzw;
    OUT.color_0.rgb = (IN.color_1.a * (IN.color_1.rgb - r0.xyz)) + r0.xyz;
    OUT.color_0.a = r0.w;

    return OUT;
};

// approximately 17 instruction slots used (2 texture, 15 arithmetic)

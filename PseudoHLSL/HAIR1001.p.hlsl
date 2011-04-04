//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR1001.pso /Fcshaderdump19/HAIR1001.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D AnisoMap;
sampler2D DiffuseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
float4 Toggles;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   Toggles      const_7       1
//   DiffuseMap   texture_0       1
//   NormalMap    texture_1       1
//   AnisoMap     texture_3       1
//

    IN.texcoord_0.xyzw = tex2D(DiffuseMap, texcoord_0.xy);
    IN.texcoord_1.xyzw = tex2D(DiffuseMap, texcoord_0.xy);
    texm3x2pad IN.texcoord_2, 2 * ((IN.texcoord_1) - 0.5)
    texm3x2IN.texcoord_3 = tex2D(DiffuseMap, texcoord_0.xy);, 2 * ((IN.texcoord_1) - 0.5)
    r0.xyzw = IN.texcoord_3.xyzw * IN.input_0.w;
    r1.xyz = r0.w * PSLightColor[0].rgb;
    r0.xyz = saturate((PSLightColor[0].rgb * r0.xyz) + IN.input_0.xyz);
    r0.xyz = saturate(r0.xyz + AmbientColor.rgb);
    r0.xyz = IN.texcoord_0.xyz * r0.xyz;
    mul_x2 r0.xyz, r0, const_7
    r1.xyz = IN.texcoord_1.w * r1.xyz;
  + r0.w = IN.texcoord_0.w * AmbientColor.a;
    r0.xyz = (IN.texcoord_0.xyz * r1.xyz) + r0.xyz;

// approximately 12 instruction slots used (4 texture, 8 arithmetic)


// Structures:

struct VS_OUTPUT {
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5




    return OUT;
};


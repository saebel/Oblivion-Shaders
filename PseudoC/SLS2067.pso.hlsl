//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa SLS2067.pso /FcSLS2067.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   PSLightColor[1] const_3        1
//   PSLightColor[2] const_4        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//

    const int4 const_0 = {2, -1, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    r0.xyzw = tex2D(NormalMap, IN.texcoord_1.xy);			// partial precision
    r1.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = (2 * r0.xyz) - 1;			// partial precision
    r2.xyz = normalize(r0.xyz);			// partial precision
    r0.xyz = (IN.texcoord_3.xyz * 2) - 1;			// partial precision
    r0.x = saturate(dot(r0.xyz, r2.xyz));			// partial precision
    r2.xyz = PSLightColor[0].rgb;			// partial precision
    r0.xyz = (r0.x * r2.xyz) + AmbientColor.rgb;			// partial precision
    r0.xyz = r1.xyz * r0.xyz;			// partial precision
    r0.xyz = r0.xyz * IN.texcoord_2.xyz;			// partial precision
    r1.x = dot(PSLightColor[1].rgba, IN.color_0.rgba);			// partial precision
    r1.y = dot(PSLightColor[2].rgba, IN.color_1.rgba);			// partial precision
    r1.x = r1.x + r1.y;			// partial precision
    r1.x = (r1.x * 2) + r1.w;			// partial precision
    r0.w = saturate(r1.x - 1);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 18 instruction slots used (2 texture, 16 arithmetic)

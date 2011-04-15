//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2054.pso /Fcshaderdump19/SLS2054.pso.dis
//
//
// Parameters:
//
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   float4 Toggles;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   PSLightColor[1] const_3        1
//   PSLightColor[2] const_4        1
//   Toggles      const_7       1
//   NormalMap    texture_1       1
//

    const float4 const_0 = {-0.5, 0.2, 0.5, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    sampler2D NormalMap;
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r1.xyz = IN.texcoord_3.xyz - 0.5;			// partial precision
    r1.xyz = 2 * r1.xyz;			// partial precision
    r0.xyz = r0.xyz - 0.5;
    r2.xyz = 2 * r0.xyz;			// partial precision
    r0.xyz = normalize(r2.xyz);			// partial precision
    r2.x = saturate(dot(r0.xyz, r1.xyz));			// partial precision
    r1.xyz = IN.texcoord_2.xyz - 0.5;
    r1.w = pow(abs(r2.x), Toggles.z);			// partial precision
    r1.xyz = 2 * r1.xyz;			// partial precision
    r2.w = r0.w * r1.w;			// partial precision
    r0.x = dot(r0.xyz, r1.xyz);			// partial precision
    r3.w = r0.x + 0.5;			// partial precision
    r0.w = 0.2 - r0.x;			// partial precision
    r1.w = max(r3.w, 0);			// partial precision
    r1.w = r2.w * r1.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? r1.w : r2.w);			// partial precision
    r0.xyz = r0.w * PSLightColor[0].rgb;			// partial precision
    r0.w = dot(PSLightColor[1].rgba, IN.color_0.rgba);
    r1.w = dot(PSLightColor[2].rgba, IN.color_1.rgba);
    r0.xyz = r0.xyz * IN.texcoord_1.xyz;			// partial precision
    r0.w = r0.w + r1.w;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 27 instruction slots used (1 texture, 26 arithmetic)

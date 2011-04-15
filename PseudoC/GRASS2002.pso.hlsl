//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/GRASS2002.pso /Fcshaderdump19/GRASS2002.pso.dis
//
//
// Parameters:
//
//   float4 AlphaTestRef;
//   sampler2D DiffuseMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AlphaTestRef const_3       1
//   DiffuseMap   texture_0       1
//

    const int4 const_0 = {0, 1, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float4 IN.color_0 : COLOR0;
    sampler2D DiffuseMap;
    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);			// partial precision
    r1.xyz = IN.texcoord_5.xyz;			// partial precision
    r1.xyz = r1.xyz + IN.texcoord_4.xyz;			// partial precision
    r2.xyz = (-r0.xyz * r1.xyz) + IN.color_0.rgb;			// partial precision
    r0.w = AlphaTestRef.x - r0.w;			// partial precision
    r2.xyz = r2.xyz * IN.color_0.a;			// partial precision
    r0.w = (r0.w >= 0.0 ? 0 : 1);			// partial precision
    r0.xyz = (r0.xyz * r1.xyz) + r2.xyz;			// partial precision
    r0.w = r0.w * IN.texcoord_5.w;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 10 instruction slots used (1 texture, 9 arithmetic)

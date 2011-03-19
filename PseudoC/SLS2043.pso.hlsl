//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2043.pso /Fcshaderdump19/SLS2043.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   samplerCUBE EnvironmentCubeMap;
//   sampler2D NormalMap;
//   float4 Toggles;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   AmbientColor       AmbientColor       1
//   Toggles            Toggles       1
//   NormalMap          NormalMap       1
//   EnvironmentCubeMap EnvironmentCubeMap       1
//

    const_0 = {-0.5, 1, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1;			// partial precision			// centroid
    texcoord input_2;			// partial precision			// centroid
    texcoord input_3;			// partial precision			// centroid
    color input_0.xyz;
    sampler NormalMap;
    dcl_cube EnvironmentCubeMap
    r1 = NormalMap[texcoord_0];			// partial precision
    r0.x = texcoord_1.w;			// partial precision
    r0.y = texcoord_2.w;			// partial precision
    r0.z = texcoord_3.w;			// partial precision
    r2.xyz = norm(r0);			// partial precision
    r0.xyz = r1 - const_0.x;
    r1.xyz = r0 - r0;			// partial precision
    r0.xyz = norm(r1);			// partial precision
    r1.x = (r0.x * texcoord_1.x) + (r0.y * texcoord_1.y) + (r0.z * texcoord_1.z);			// partial precision
    r1.y = (r0.x * texcoord_2.x) + (r0.y * texcoord_2.y) + (r0.z * texcoord_2.z);			// partial precision
    r1.z = (r0.x * texcoord_3.x) + (r0.y * texcoord_3.y) + (r0.z * texcoord_3.z);			// partial precision
    r0.xyz = norm(r1);			// partial precision
    r3.x = (r0.x * r2.x) + (r0.y * r2.y) + (r0.z * r2.z);			// partial precision
    r1.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);			// partial precision
    r0.w = r3.x - r3.x;			// partial precision
    r1.xyz = r2 * r1.x;			// partial precision
    r0.xyz = (r0.w * r0) - r1;			// partial precision
    r0 = EnvironmentCubeMap[r0];			// partial precision
    r0.xyz = r1.w * r0;			// partial precision
    r0.xyz = r0 * AmbientColor.w;			// partial precision
    r1.xyz = r0 * input_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r0.w = const_0.y;
    rendertarget_0 = r0;			// partial precision

// approximately 30 instruction slots used (2 texture, 28 arithmetic)

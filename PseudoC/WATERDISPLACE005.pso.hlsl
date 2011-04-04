//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE005.pso
//    /Fcshaderdump19/WATERDISPLACE005.pso.dis
//
//
// Parameters:
//
//   sampler2D DisplaceMap;
//   float fDamp;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   fDamp        const_3       1
//   DisplaceMap  texture_0       1
//

    const float4 const_0 = {-(1.0 / 256), 0, (1.0 / 256), 2};
    const float4 const_1 = {-(1.0 / 256), (1.0 / 256), 1, 0.5};
    const float4 const_2 = {0, -(1.0 / 256), 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    sampler2D DisplaceMap;
    r7.xy = IN.texcoord_0.xy - const_0.xy;
    r6.xy = IN.texcoord_0.xy + const_0.xy;
    r5.xy = IN.texcoord_0.xy + -(1.0 / 256);
    r4.xy = IN.texcoord_0.xy + const_1.xy;
    r3.xy = IN.texcoord_0.xy - const_1.xy;
    r2.xy = IN.texcoord_0.xy + (1.0 / 256);
    r1.xy = IN.texcoord_0.xy + const_2.xy;
    r0.xy = IN.texcoord_0.xy - const_2.xy;
    r7.xyzw = tex2D(DisplaceMap, r7.xy);
    r6.xyzw = tex2D(DisplaceMap, r6.xy);
    r5.xyzw = tex2D(DisplaceMap, r5.xy);
    r4.xyzw = tex2D(DisplaceMap, r4.xy);
    r3.xyzw = tex2D(DisplaceMap, r3.xy);
    r2.xyzw = tex2D(DisplaceMap, r2.xy);
    r1.xyzw = tex2D(DisplaceMap, r1.xy);
    r0.xyzw = tex2D(DisplaceMap, r0.xy);
    r0.w = abs(r7.x);
    r0.w = r0.w * fDamp.x;
    r1.w = abs(r6.x);
    r1.w = r1.w * fDamp.x;
    r1.w = 2 * r1.w;
    r4.w = abs(r5.x);
    r1.w = (fDamp.x * -r4.w) - r1.w;
    r2.w = abs(r4.x);
    r1.w = (fDamp.x * -r2.w) + r1.w;
    r3.w = abs(r3.x);
    r1.w = (fDamp.x * r3.w) + r1.w;
    r0.w = (2 * r0.w) + r1.w;
    r1.w = abs(r2.x);
    r0.w = (fDamp.x * r1.w) + r0.w;
    r5.w = abs(r1.x);
    r5.w = r5.w * fDamp.x;
    r5.w = 2 * r5.w;
    r4.w = (fDamp.x * -r4.w) - r5.w;
    r3.w = (fDamp.x * -r3.w) + r4.w;
    r3.w = (fDamp.x * r2.w) + r3.w;
    r2.w = abs(r0.x);
    r2.w = r2.w * fDamp.x;
    r0.x = -r0.w;
    r0.w = (2 * r2.w) + r3.w;
    r0.y = (fDamp.x * r1.w) + r0.w;
    r0.z = 1;
    r1.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r0.z = 1.0 / sqrt(r1.x);
    r0.xy = r0.xy * r0.z;
    r0.xyz = (0.5 * r0.xyz) + 0.5;
    r0.w = 1;
    OUT.color_0.rgba = r0.xyzw;

// approximately 48 instruction slots used (8 texture, 40 arithmetic)

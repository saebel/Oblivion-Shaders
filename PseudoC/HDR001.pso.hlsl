//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR001.pso /Fcshaderdump19/HDR001.pso.dis
//
//
// Parameters:
//
//   float4 BlurOffsets[16];
//   float2 BlurScale;
//   sampler2D Src0;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BlurScale    const_2       1
//   BlurOffsets[0]  const_3       1
//   BlurOffsets[1]  const_4       1
//   BlurOffsets[2]  const_5       1
//   BlurOffsets[3]  const_6       1
//   BlurOffsets[4]  const_7       1
//   BlurOffsets[5]  const_8       1
//   BlurOffsets[6]  const_9       1
//   BlurOffsets[7]  const_10      1
//   BlurOffsets[8]  const_11      1
//   Src0         texture_0       1
//

    const float4 const_0 = {128, 2.5, 1, 0};
    float2 texcoord_0 : TEXCOORD0;
    sampler2D Src0;
    r0.z = 2.5;
    r3.w = r0.z - BlurOffsets[1].x;
    r0.w = IN.texcoord_0.x * 128;
    r1.w = frac(r0.w);
    r2.w = r0.z - BlurOffsets[1].y;
    r0.w = IN.texcoord_0.y * 128;
    r0.x = (r1.w <= 0.0 ? r3.w : BlurOffsets[1].x);
    r0.w = frac(r0.w);
    r0.y = (r0.w <= 0.0 ? r2.w : BlurOffsets[1].y);
    r8.xy = (BlurScale.xy * r0.xy) + IN.texcoord_0.xy;
    r2.w = r0.z - BlurOffsets[0].x;
    r0.x = (r1.w <= 0.0 ? r2.w : BlurOffsets[0].x);
    r2.w = r0.z - BlurOffsets[0].y;
    r0.y = (r0.w <= 0.0 ? r2.w : BlurOffsets[0].y);
    r7.xy = (BlurScale.xy * r0.xy) + IN.texcoord_0.xy;
    r2.w = r0.z - BlurOffsets[2].x;
    r0.x = (r1.w <= 0.0 ? r2.w : BlurOffsets[2].x);
    r2.w = r0.z - BlurOffsets[2].y;
    r0.y = (r0.w <= 0.0 ? r2.w : BlurOffsets[2].y);
    r6.xy = (BlurScale.xy * r0.xy) + IN.texcoord_0.xy;
    r2.w = r0.z - BlurOffsets[3].x;
    r0.x = (r1.w <= 0.0 ? r2.w : BlurOffsets[3].x);
    r2.w = r0.z - BlurOffsets[3].y;
    r0.y = (r0.w <= 0.0 ? r2.w : BlurOffsets[3].y);
    r5.xy = (BlurScale.xy * r0.xy) + IN.texcoord_0.xy;
    r2.w = r0.z - BlurOffsets[4].x;
    r0.x = (r1.w <= 0.0 ? r2.w : BlurOffsets[4].x);
    r2.w = r0.z - BlurOffsets[4].y;
    r0.y = (r0.w <= 0.0 ? r2.w : BlurOffsets[4].y);
    r4.xy = (BlurScale.xy * r0.xy) + IN.texcoord_0.xy;
    r2.w = r0.z - BlurOffsets[5].x;
    r0.x = (r1.w <= 0.0 ? r2.w : BlurOffsets[5].x);
    r2.w = r0.z - BlurOffsets[5].y;
    r0.y = (r0.w <= 0.0 ? r2.w : BlurOffsets[5].y);
    r3.xy = (BlurScale.xy * r0.xy) + IN.texcoord_0.xy;
    r2.w = r0.z - BlurOffsets[6].x;
    r0.x = (r1.w <= 0.0 ? r2.w : BlurOffsets[6].x);
    r2.w = r0.z - BlurOffsets[6].y;
    r0.y = (r0.w <= 0.0 ? r2.w : BlurOffsets[6].y);
    r2.xy = (BlurScale.xy * r0.xy) + IN.texcoord_0.xy;
    r2.w = r0.z - BlurOffsets[7].x;
    r0.x = (r1.w <= 0.0 ? r2.w : BlurOffsets[7].x);
    r2.w = r0.z - BlurOffsets[7].y;
    r0.y = (r0.w <= 0.0 ? r2.w : BlurOffsets[7].y);
    r1.xy = (BlurScale.xy * r0.xy) + IN.texcoord_0.xy;
    r2.w = r0.z - BlurOffsets[8].x;
    r0.x = (r1.w <= 0.0 ? r2.w : BlurOffsets[8].x);
    r1.w = r0.z - BlurOffsets[8].y;
    r0.y = (r0.w <= 0.0 ? r1.w : BlurOffsets[8].y);
    r0.xy = (BlurScale.xy * r0.xy) + IN.texcoord_0.xy;
    r8.xyzw = tex2D(Src0, r8.xy);
    r7.xyzw = tex2D(Src0, r7.xy);
    r6.xyzw = tex2D(Src0, r6.xy);
    r5.xyzw = tex2D(Src0, r5.xy);
    r4.xyzw = tex2D(Src0, r4.xy);
    r3.xyzw = tex2D(Src0, r3.xy);
    r2.xyzw = tex2D(Src0, r2.xy);
    r1.xyzw = tex2D(Src0, r1.xy);
    r0.xyzw = tex2D(Src0, r0.xy);
    r8.xyz = r8.xyz * BlurOffsets[1].z;
    r7.xyz = (BlurOffsets[0].z * r7.xyz) + r8.xyz;
    r6.xyz = (BlurOffsets[2].z * r6.xyz) + r7.xyz;
    r5.xyz = (BlurOffsets[3].z * r5.xyz) + r6.xyz;
    r4.xyz = (BlurOffsets[4].z * r4.xyz) + r5.xyz;
    r3.xyz = (BlurOffsets[5].z * r3.xyz) + r4.xyz;
    r2.xyz = (BlurOffsets[6].z * r2.xyz) + r3.xyz;
    r1.xyz = (BlurOffsets[7].z * r1.xyz) + r2.xyz;
    r0.xyz = (BlurOffsets[8].z * r0.xyz) + r1.xyz;
    r0.w = 1;
    OUT.color_0.rgba = r0.xyzw;

// approximately 70 instruction slots used (9 texture, 61 arithmetic)

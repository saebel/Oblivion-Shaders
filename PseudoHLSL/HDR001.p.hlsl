//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR001.pso /Fcshaderdump19/HDR001.pso.dis
//
//
#define	ScreenSpace	Src0
// Parameters:
//
float4 BlurOffsets[16];
float2 BlurScale : register(c2);
sampler2D ScreenSpace : register(s0);
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
//   ScreenSpace         texture_0       1
//


// Structures:

struct VS_OUTPUT {
    float2 ScreenOffset : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float1 q0;
    float1 q1;
    float3 q13;
    float3 q5;
    float3 q9;
    float2 r0;
    float3 t10;
    float3 t11;
    float3 t12;
    float3 t2;
    float3 t3;
    float3 t4;
    float3 t6;
    float3 t7;
    float3 t8;

    q1.x = frac(IN.ScreenOffset.y * 128);
    q0.x = frac(IN.ScreenOffset.x * 128);
    r0.y = (q1.x <= 0.0 ? (2.5 - BlurOffsets[1].y) : BlurOffsets[1].y);
    r0.x = (q0.x <= 0.0 ? (2.5 - BlurOffsets[1].x) : BlurOffsets[1].x);
    t2.xyz = tex2D(ScreenSpace, (BlurScale.xy * r0.xy) + IN.ScreenOffset.xy);
    r0.y = (q1.x <= 0.0 ? (2.5 - BlurOffsets[0].y) : BlurOffsets[0].y);
    r0.x = (q0.x <= 0.0 ? (2.5 - BlurOffsets[0].x) : BlurOffsets[0].x);
    t3.xyz = tex2D(ScreenSpace, (BlurScale.xy * r0.xy) + IN.ScreenOffset.xy);
    r0.y = (q1.x <= 0.0 ? (2.5 - BlurOffsets[2].y) : BlurOffsets[2].y);
    r0.x = (q0.x <= 0.0 ? (2.5 - BlurOffsets[2].x) : BlurOffsets[2].x);
    t4.xyz = tex2D(ScreenSpace, (BlurScale.xy * r0.xy) + IN.ScreenOffset.xy);
    r0.y = (q1.x <= 0.0 ? (2.5 - BlurOffsets[3].y) : BlurOffsets[3].y);
    r0.x = (q0.x <= 0.0 ? (2.5 - BlurOffsets[3].x) : BlurOffsets[3].x);
    t6.xyz = tex2D(ScreenSpace, (BlurScale.xy * r0.xy) + IN.ScreenOffset.xy);
    r0.y = (q1.x <= 0.0 ? (2.5 - BlurOffsets[4].y) : BlurOffsets[4].y);
    r0.x = (q0.x <= 0.0 ? (2.5 - BlurOffsets[4].x) : BlurOffsets[4].x);
    t7.xyz = tex2D(ScreenSpace, (BlurScale.xy * r0.xy) + IN.ScreenOffset.xy);
    r0.y = (q1.x <= 0.0 ? (2.5 - BlurOffsets[5].y) : BlurOffsets[5].y);
    r0.x = (q0.x <= 0.0 ? (2.5 - BlurOffsets[5].x) : BlurOffsets[5].x);
    t8.xyz = tex2D(ScreenSpace, (BlurScale.xy * r0.xy) + IN.ScreenOffset.xy);
    r0.y = (q1.x <= 0.0 ? (2.5 - BlurOffsets[6].y) : BlurOffsets[6].y);
    r0.x = (q0.x <= 0.0 ? (2.5 - BlurOffsets[6].x) : BlurOffsets[6].x);
    t10.xyz = tex2D(ScreenSpace, (BlurScale.xy * r0.xy) + IN.ScreenOffset.xy);
    r0.y = (q1.x <= 0.0 ? (2.5 - BlurOffsets[7].y) : BlurOffsets[7].y);
    r0.x = (q0.x <= 0.0 ? (2.5 - BlurOffsets[7].x) : BlurOffsets[7].x);
    t11.xyz = tex2D(ScreenSpace, (BlurScale.xy * r0.xy) + IN.ScreenOffset.xy);
    r0.y = (q1.x <= 0.0 ? (2.5 - BlurOffsets[8].y) : BlurOffsets[8].y);
    r0.x = (q0.x <= 0.0 ? (2.5 - BlurOffsets[8].x) : BlurOffsets[8].x);
    t12.xyz = tex2D(ScreenSpace, (BlurScale.xy * r0.xy) + IN.ScreenOffset.xy);
    q5.xyz = (BlurOffsets[2].z * t4.xyz) + ((BlurOffsets[0].z * t3.xyz) + (t2.xyz * BlurOffsets[1].z));
    q9.xyz = (BlurOffsets[5].z * t8.xyz) + ((BlurOffsets[4].z * t7.xyz) + ((BlurOffsets[3].z * t6.xyz) + q5.xyz));
    q13.xyz = (BlurOffsets[8].z * t12.xyz) + ((BlurOffsets[7].z * t11.xyz) + ((BlurOffsets[6].z * t10.xyz) + q9.xyz));
    OUT.color_0.a = 1;
    OUT.color_0.rgb = q13.xyz;

    return OUT;
};

// approximately 70 instruction slots used (9 texture, 61 arithmetic)

//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/MAP000.pso /Fcshaderdump19/MAP000.pso.dis
//
//
// Parameters:

float4 CameraPos;
sampler2D Src0;
sampler2D Src1;
sampler2D Src2;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   CameraPos    const_1       1
//   Src0         texture_0       1
//   Src1         texture_1       1
//   Src2         texture_2       1
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

    const float4 const_0 = {0.2, 0.2, 0.15, 0.1};
    const float4 const_2 = {0.5, 0.25, 0.75, 0};
    const float4 const_3 = {0.458999991, 0.231000006, 0.128999993, 0};
    const int4 const_4 = {1, -1, 2, 10};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;
    float4 r7;
    float4 r8;
    float4 r9;

    r4.xy = (const_4.xy * CameraPos.xy) + IN.texcoord_0.xy;
    r0.x = r4.x;
    r0.y = IN.texcoord_0.y;
    r2.xyzw = tex2D(Src0, r0.xy);
    r0.xyzw = tex2D(Src2, IN.texcoord_0.xy);
    r0.w = 1;
    r5.xy = IN.texcoord_0.xy - CameraPos.xy;
    r1.x = r5.x;
    r1.y = IN.texcoord_0.y;
    r6.y = r5.y;
    r8.xyzw = tex2D(Src0, r5.xy);
    r5.xyzw = (2 * (tex2D(Src0, r1.xy))) + r8.xyzw;
    r1.xyzw = tex2D(Src1, IN.texcoord_0.xy);
    r7.xy = (-const_4.xy * CameraPos.xy) + IN.texcoord_0.xy;
    r3.y = r7.y;
    r6.x = IN.texcoord_0.x;
    r9.xyzw = (2 * (tex2D(Src0, r6.xy))) + r8.xyzw;
    r6.xyzw = tex2D(Src0, r4.xy);
    r4.xyzw = tex2D(Src0, IN.texcoord_0.xy + CameraPos.xy);
    r7.xyzw = tex2D(Src0, r7.xy);
    r2.xyzw = ((2 * -r2.xyzw) + ((r7.xyzw + r5.xyzw) - r6.xyzw)) - r4.xyzw;
    r3.x = IN.texcoord_0.x;
    r3.xyzw = ((2 * -(tex2D(Src0, r3.xy))) + ((r6.xyzw + r9.xyzw) - r7.xyzw)) - r4.xyzw;
    r2.xyzw = (r2.xyzw * r2.xyzw) + (r3.xyzw * r3.xyzw);
    r0.xyz = lerp(const_3.xyz, ((0.75 * r0.xyz) + (r1.xyz * 0.25)), min(dot(const_0.xyz, r2.xyz) + min(r2.w * 10, 0.1), 0.5));
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 46 instruction slots used (10 texture, 36 arithmetic)

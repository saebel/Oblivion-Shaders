//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/BOLT.vso /Fcshaderdump19/BOLT.vso.dis
//
//
// Parameters:

row_major float4x4 ModelViewProj;
float4 SegmentData[2];
float4 fVars0;
float4 fVars1;
float4 fVars2;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   fVars0        const_4       1
//   fVars1        const_5       1
//   fVars2        const_6       1
//   SegmentData[0]   const_14       1
//   SegmentData[1]   const_15       1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 color_1 : COLOR1;
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_7 = {-1, 1, 0, -2};

    float1 offset;
    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;

    r2.w = ((IN.color_1.r >= fVars0.y ? 1.0 : 0.0) * -fVars0.y) + IN.color_1.r;
    offset.x = r2.w;
    r3.xyz = const_7.xyz;
    r0.xyzw = (SegmentData[0 + offset.x].xyzx * r3.yyyz) + r3.zzzy;
    r4.w = fVars0.z - pow(2.0, fVars0.z);
    r6.w = (1.0 / r4.w) * IN.color_1.r;
    r5.w = pow(2.0, abs(r6.w));
    OUT.position.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    offset.x = r2.w - 1;
    r1.xyzw = (SegmentData[0 + offset.x].xyzx * r3.yyyz) + r3.zzzy;
    offset.x = r2.w;
    r4.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    r4.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    r0.w = ((r6.w == 0 ? 1.0 : 0.0) * (2 * r5.w)) - r5.w;
    r0.w = (r0.w * r4.w) - pow(2.0, r4.w * r0.w);
    r2.xyzw = (SegmentData[1 + offset.x].xyzx * r3.yyyz) + r3.zzzy;
    r6.x = dot(ModelViewProj[0].xyzw, r2.xyzw);
    r6.y = dot(ModelViewProj[1].xyzw, r2.xyzw);
    r2.xy = r6.xy - r4.xy;
    r6.xy = r2.xy * r2.xy;
    r2.xy = r2.xy * (1.0 / sqrt(r6.y + r6.x));
    r5.x = dot(ModelViewProj[0].xyzw, r1.xyzw);
    r5.y = dot(ModelViewProj[1].xyzw, r1.xyzw);
    r1.xy = normalize(r5.xy - r4.xy) + r2.xy;
    r0.xy = (-2 * (r1.xy * ((determinant(float2x2(r1.xy, r2.xy)) < 0 ? 1.0 : 0.0)))) + r1.xy;
    r1.xy = r0.xy * r0.xy;
    r3.w = r3.x + fVars1.y;
    r5.w = (r0.w < fVars1.x ? 1.0 : 0.0);
    OUT.position.xy = ((((((IN.color_1.r * r1.w) - pow(2.0, r6.w)) * fVars1.w) + fVars1.z) * IN.position.x) * (r0.xy * (1.0 / sqrt(r1.y + r1.x)))) + r4.xy;
    r6.w = ((r0.w >= r3.w ? 1.0 : 0.0) * -r5.w) + 1;
    r3.w = ((((r0.w * fVars2.x) >= r3.w ? 1.0 : 0.0)) * -r6.w) + r6.w;
    r2.w = ((r5.w * (r3.z < fVars2.x ? 1.0 : 0.0)) * -r3.w) + r3.w;
    OUT.color_0.a = (((r0.w >= r4.w ? 1.0 : 0.0) * -r2.w) + r2.w) * fVars2.y;
    OUT.color_0.rgb = 1;
    OUT.texcoord_0.xy = IN.position.xy;

    return OUT;
};

// approximately 73 instruction slots used

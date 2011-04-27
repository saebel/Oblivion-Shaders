//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa SLS2047.pso /FcSLS2047.pso.dis
//
//
// Parameters:
//
sampler2D BaseMap : register(s0);
sampler2D DecalMap : register(s1);
float4 PSDecalOffsets[8] : register(c15);
float4 PSNumDecals : register(c14);
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSNumDecals    const_14      1
//   PSDecalOffsets[0] const_15       1
//   PSDecalOffsets[1] const_16       1
//   PSDecalOffsets[2] const_17       1
//   PSDecalOffsets[3] const_18       1
//   PSDecalOffsets[4] const_19       1
//   PSDecalOffsets[5] const_20       1
//   PSDecalOffsets[6] const_21       1
//   PSDecalOffsets[7] const_22       1
//   BaseMap        texture_0       1
//   DecalMap       texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float3 texcoord_4 : TEXCOORD4;
    float3 texcoord_5 : TEXCOORD5;
    float3 texcoord_6 : TEXCOORD6;
    float3 texcoord_7 : TEXCOORD7;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float1 q0;
    float1 q2;
    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;
    float4 r7;
    float4 r8;

    r1.xy = saturate(IN.texcoord_3.xy);			// partial precision
    r0.xy = saturate(IN.texcoord_2.xy);			// partial precision
    q0.x = min(PSNumDecals.x, 8);
    q2.x = (q0.x >= 0.0 ? 0 : (frac(q0.x) <= 0.0 ? 0 : 1)) + (q0.x - frac(q0.x));
    r5.y = (PSDecalOffsets[3].w * r1.y) + PSDecalOffsets[3].z;			// partial precision
    r5.x = (PSDecalOffsets[3].y * r1.x) + PSDecalOffsets[3].x;			// partial precision
    r7.xyzw = tex2D(DecalMap, r5.xy);			// partial precision
    r1.xy = saturate(IN.texcoord_4.xy);			// partial precision
    r4.y = (PSDecalOffsets[4].w * r1.y) + PSDecalOffsets[4].z;			// partial precision
    r4.x = (PSDecalOffsets[4].y * r1.x) + PSDecalOffsets[4].x;			// partial precision
    r1.xy = saturate(IN.texcoord_5.xy);			// partial precision
    r3.y = (PSDecalOffsets[5].w * r1.y) + PSDecalOffsets[5].z;			// partial precision
    r3.x = (PSDecalOffsets[5].y * r1.x) + PSDecalOffsets[5].x;			// partial precision
    r5.xyzw = tex2D(DecalMap, r3.xy);			// partial precision
    r1.xy = saturate(IN.texcoord_6.xy);			// partial precision
    r2.y = (PSDecalOffsets[6].w * r1.y) + PSDecalOffsets[6].z;			// partial precision
    r2.x = (PSDecalOffsets[6].y * r1.x) + PSDecalOffsets[6].x;			// partial precision
    r1.xy = saturate(IN.texcoord_7.xy);			// partial precision
    r1.y = (PSDecalOffsets[7].w * r1.y) + PSDecalOffsets[7].z;			// partial precision
    r1.x = (PSDecalOffsets[7].y * r1.x) + PSDecalOffsets[7].x;			// partial precision
    r3.xyzw = tex2D(DecalMap, r1.xy);			// partial precision
    r1.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r6.y = (PSDecalOffsets[2].w * r0.y) + PSDecalOffsets[2].z;			// partial precision
    r6.x = (PSDecalOffsets[2].y * r0.x) + PSDecalOffsets[2].x;			// partial precision
    r8.xyzw = tex2D(DecalMap, r6.xy);			// partial precision
    r6.xyzw = tex2D(DecalMap, r4.xy);			// partial precision
    r4.xyzw = tex2D(DecalMap, r2.xy);			// partial precision
    r0.xy = saturate(IN.texcoord_1.xy);			// partial precision
    r0.y = (PSDecalOffsets[1].w * r0.y) + PSDecalOffsets[1].z;			// partial precision
    r0.x = (PSDecalOffsets[1].y * r0.x) + PSDecalOffsets[1].x;			// partial precision
    r0.xyzw = tex2D(DecalMap, r0.xy);			// partial precision
    r0.w = r0.w * IN.texcoord_1.z;			// partial precision
    r0.xyz = r0.xyz * r0.w;			// partial precision
    r0.xyzw = (1 >= q2.x ? 0 : r0.xyzw);			// partial precision
    r2.xyz = lerp(r0.xyz, r8.xyz, r8.w * IN.texcoord_2.z);			// partial precision
    r2.w = (r8.w * IN.texcoord_2.z) + r0.w;			// partial precision
    r0.xyzw = (2 >= q2.x ? r0.xyzw : r2.xyzw);			// partial precision
    r2.xyz = lerp(r0.xyz, r7.xyz, r7.w * IN.texcoord_3.z);			// partial precision
    r2.w = (r7.w * IN.texcoord_3.z) + r0.w;			// partial precision
    r0.xyzw = (3 >= q2.x ? r0.xyzw : r2.xyzw);			// partial precision
    r2.xyz = lerp(r0.xyz, r6.xyz, r6.w * IN.texcoord_4.z);			// partial precision
    r2.w = (r6.w * IN.texcoord_4.z) + r0.w;			// partial precision
    r0.xyzw = (4 >= q2.x ? r0.xyzw : r2.xyzw);			// partial precision
    r2.xyz = lerp(r0.xyz, r5.xyz, r5.w * IN.texcoord_5.z);			// partial precision
    r2.w = (r5.w * IN.texcoord_5.z) + r0.w;			// partial precision
    r0.xyzw = (5 >= q2.x ? r0.xyzw : r2.xyzw);			// partial precision
    r2.xyz = lerp(r0.xyz, r4.xyz, r4.w * IN.texcoord_6.z);			// partial precision
    r2.w = (r4.w * IN.texcoord_6.z) + r0.w;			// partial precision
    r0.xyzw = (6 >= q2.x ? r0.xyzw : r2.xyzw);			// partial precision
    r2.xyz = lerp(r0.xyz, r3.xyz, r3.w * IN.texcoord_7.z);			// partial precision
    r2.w = (r3.w * IN.texcoord_7.z) + r0.w;			// partial precision
    r0.xyzw = (7 >= q2.x ? r0.xyzw : r2.xyzw);			// partial precision
    OUT.color_0.a = saturate(r0.w);			// partial precision
    OUT.color_0.rgb = r0.xyz;			// partial precision

    return OUT;
};

// approximately 78 instruction slots used (8 texture, 70 arithmetic)

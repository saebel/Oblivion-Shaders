//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3017.vso /Fcshaderdump19/SM3017.vso.dis
//
//
// Parameters:

float4 DecalFade[8];
row_major float4x4 DecalProjection[8];
row_major float4x4 ModelViewProj;


// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   ModelViewProj[0]   const_0        1
//   ModelViewProj[1]   const_1        1
//   ModelViewProj[2]   const_2        1
//   ModelViewProj[3]   const_3        1
//   DecalFade       const_32      8
//   DecalProjection[0] const_40         1
//   DecalProjection[1] const_41         1
//   DecalProjection[2] const_42         1
//   DecalProjection[3] const_43         1
//   DecalProjection[4] const_44         1
//   DecalProjection[5] const_45         1
//   DecalProjection[6] const_46         1
//   DecalProjection[7] const_47         1
//   DecalProjection[8] const_48        1
//   DecalProjection[9] const_49        1
//   DecalProjection[10] const_50        1
//   DecalProjection[11] const_51        1
//   DecalProjection[12] const_52        1
//   DecalProjection[13] const_53        1
//   DecalProjection[14] const_54        1
//   DecalProjection[15] const_55        1
//   DecalProjection[16] const_56       1
//   DecalProjection[17] const_57       1
//   DecalProjection[18] const_58       1
//   DecalProjection[19] const_59       1
//   DecalProjection[20] const_60      1
//   DecalProjection[21] const_61      1
//   DecalProjection[22] const_62      1
//   DecalProjection[23] const_63      1
//   DecalProjection[24] const_64      1
//   DecalProjection[25] const_65      1
//   DecalProjection[26] const_66      1
//   DecalProjection[27] const_67      1
//   DecalProjection[28] const_68      1
//   DecalProjection[29] const_69      1
//   DecalProjection[30] const_70      1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float3 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float3 texcoord_4 : TEXCOORD4;
    float3 texcoord_5 : TEXCOORD5;
    float3 texcoord_6 : TEXCOORD6;
    float3 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {0.0125000002, 0.5, 0, 1};
    const float4 const_5 = {10, (1.0 / 256), 1, 0};

    float3 r0;
    float2 r1;

    r0.x = DecalProjection[0].w;
    r0.y = DecalProjection[1].w;
    r0.z = DecalProjection[2].w;
    r0.xyz = r0.xyz + IN.position.xyz;
    r1.x = dot(DecalProjection[0].xyz, r0.xyz);
    r1.y = dot(DecalProjection[1].xyz, r0.xyz);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_0.xy = (0.0125000002 * r1.xy) + 0.5;
    OUT.texcoord_0.z = ((abs(dot(DecalProjection[2].xyz, r0.xyz)) / -256) + 1) * (pow(abs(1 - max(dot(IN.normal.xyz, DecalProjection[2].xyz), 0)), 10) * const_32.x);
    r0.x = DecalProjection[4].w;
    r0.y = DecalProjection[5].w;
    r0.z = DecalProjection[6].w;
    r0.xyz = r0.xyz + IN.position.xyz;
    r1.x = dot(DecalProjection[4].xyz, r0.xyz);
    r1.y = dot(DecalProjection[5].xyz, r0.xyz);
    OUT.texcoord_1.xy = (0.0125000002 * r1.xy) + 0.5;
    OUT.texcoord_1.z = ((abs(dot(DecalProjection[6].xyz, r0.xyz)) / -256) + 1) * (pow(abs(1 - max(dot(IN.normal.xyz, DecalProjection[6].xyz), 0)), 10) * const_33.x);
    r0.x = DecalProjection[8].w;
    r0.y = DecalProjection[9].w;
    r0.z = DecalProjection[10].w;
    r0.xyz = r0.xyz + IN.position.xyz;
    r1.x = dot(DecalProjection[8].xyz, r0.xyz);
    r1.y = dot(DecalProjection[9].xyz, r0.xyz);
    OUT.texcoord_2.xy = (0.0125000002 * r1.xy) + 0.5;
    OUT.texcoord_2.z = ((abs(dot(DecalProjection[10].xyz, r0.xyz)) / -256) + 1) * (pow(abs(1 - max(dot(IN.normal.xyz, DecalProjection[10].xyz), 0)), 10) * const_34.x);
    r0.x = DecalProjection[12].w;
    r0.y = DecalProjection[13].w;
    r0.z = DecalProjection[14].w;
    r0.xyz = r0.xyz + IN.position.xyz;
    r1.x = dot(DecalProjection[12].xyz, r0.xyz);
    r1.y = dot(DecalProjection[13].xyz, r0.xyz);
    OUT.texcoord_3.xy = (0.0125000002 * r1.xy) + 0.5;
    OUT.texcoord_3.z = ((abs(dot(DecalProjection[14].xyz, r0.xyz)) / -256) + 1) * (pow(abs(1 - max(dot(IN.normal.xyz, DecalProjection[14].xyz), 0)), 10) * const_35.x);
    r0.x = DecalProjection[16].w;
    r0.y = DecalProjection[17].w;
    r0.z = DecalProjection[18].w;
    r0.xyz = r0.xyz + IN.position.xyz;
    r1.x = dot(DecalProjection[16].xyz, r0.xyz);
    r1.y = dot(DecalProjection[17].xyz, r0.xyz);
    OUT.texcoord_4.xy = (0.0125000002 * r1.xy) + 0.5;
    OUT.texcoord_4.z = ((abs(dot(DecalProjection[18].xyz, r0.xyz)) / -256) + 1) * (pow(abs(1 - max(dot(IN.normal.xyz, DecalProjection[18].xyz), 0)), 10) * const_36.x);
    r0.x = DecalProjection[20].w;
    r0.y = DecalProjection[21].w;
    r0.z = DecalProjection[22].w;
    r0.xyz = r0.xyz + IN.position.xyz;
    r1.x = dot(DecalProjection[20].xyz, r0.xyz);
    r1.y = dot(DecalProjection[21].xyz, r0.xyz);
    OUT.texcoord_5.xy = (0.0125000002 * r1.xy) + 0.5;
    OUT.texcoord_5.z = ((abs(dot(DecalProjection[22].xyz, r0.xyz)) / -256) + 1) * (pow(abs(1 - max(dot(IN.normal.xyz, DecalProjection[22].xyz), 0)), 10) * const_37.x);
    r0.x = DecalProjection[24].w;
    r0.y = DecalProjection[25].w;
    r0.z = DecalProjection[26].w;
    r0.xyz = r0.xyz + IN.position.xyz;
    r1.x = dot(DecalProjection[24].xyz, r0.xyz);
    r1.y = dot(DecalProjection[25].xyz, r0.xyz);
    OUT.texcoord_6.xy = (0.0125000002 * r1.xy) + 0.5;
    OUT.texcoord_6.z = ((abs(dot(DecalProjection[26].xyz, r0.xyz)) / -256) + 1) * (pow(abs(1 - max(dot(IN.normal.xyz, DecalProjection[26].xyz), 0)), 10) * const_38.x);
    r0.x = DecalProjection[28].w;
    r0.y = DecalProjection[29].w;
    r0.z = DecalProjection[30].w;
    r0.xyz = r0.xyz + IN.position.xyz;
    r1.x = dot(DecalProjection[28].xyz, r0.xyz);
    r1.y = dot(DecalProjection[29].xyz, r0.xyz);
    OUT.texcoord_7.xy = (0.0125000002 * r1.xy) + 0.5;
    OUT.texcoord_7.z = ((abs(dot(DecalProjection[30].xyz, r0.xyz)) / -256) + 1) * (pow(abs(1 - max(dot(IN.normal.xyz, DecalProjection[30].xyz), 0)), 10) * const_39.x);

    return OUT;
};

// approximately 140 instruction slots used

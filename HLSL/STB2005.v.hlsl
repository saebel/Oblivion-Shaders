//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2005.vso /Fcshaderdump19/STB2005.vso.dis
//
//
// Parameters:

float3 FogColor;
float4 FogParam;
float3 LightDirection[3];
row_major float4x4 ModelViewProj;
row_major float4x4 ShadowProj;
float4 ShadowProjData;
float4 ShadowProjTransform;
float4 WindMatrices[16];

// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float4 color_0 : COLOR0;
    float4 fog : COLOR1;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_4 = {1, 0, 0, 0};

    /* +term: wind ------------------------------------------------------------- */
    float4 InstanceWind, InstanceProj;
    float offset = IN.blendindices.y;

    InstanceWind.x = dot(WindMatrices[0 + offset], IN.position);
    InstanceWind.y = dot(WindMatrices[1 + offset], IN.position);
    InstanceWind.z = dot(WindMatrices[2 + offset], IN.position);
    InstanceWind.w = dot(WindMatrices[3 + offset], IN.position);

    InstanceWind =                      InstanceWind  - IN.position;
    InstanceWind = (IN.blendindices.x * InstanceWind) + IN.position;

    InstanceProj.x = dot(ModelViewProj[0], InstanceWind);
    InstanceProj.y = dot(ModelViewProj[1], InstanceWind);
    InstanceProj.z = dot(ModelViewProj[2], InstanceWind);
    InstanceProj.w = dot(ModelViewProj[3], InstanceWind);

    OUT.position.xyzw = InstanceProj;

    /* +term: directional diffuse light (sun) ---------------------------------- */
    float3x3 rotation = float3x3(IN.tangent, IN.binormal, IN.normal);
    float3 rotlight = mul(rotation, LightDirection[0]);

    OUT.texcoord_1.xyz = (0.5 * rotlight) + 0.5;

    /* +term: shadow-mapping --------------------------------------------------- */
    float4 shdvec;
    float4 shdv1;
    float4 shdv2;

    shdvec.x = dot(ShadowProj[0], InstanceWind);
    shdvec.y = dot(ShadowProj[1], InstanceWind);
    shdvec.z = 0;
    shdvec.w = dot(ShadowProj[3], InstanceWind);

    shdv1.xy = shdvec + (shdvec.w * ShadowProjTransform);
    shdv1.z = 0;
    shdv1.w = 1.0 / (shdvec.w * ShadowProjTransform.w);

    shdv2.xy = shdvec - (ShadowProjData);
    shdv2.z = 0;
    shdv2.w = 1.0 / (ShadowProjData.w);

    shdvec.xy = (shdv1    * shdv1.w);
    shdvec.z  = (shdv2.x *  shdv2.w) + 0;
    shdvec.w  = (shdv2.y * -shdv2.w) + 1;

    OUT.texcoord_7.xyzw = shdvec;

    /* +term: fog -------------------------------------------------------------- */
    float fdensity = min(max((FogParam.x - length(InstanceProj.xyz)) / FogParam.y, 0), 1);

    OUT.fog.rgb = FogColor;
    OUT.fog.a = 1 - fdensity;

    /* +term: copy ------------------------------------------------------------- */
    OUT.color_0 = (IN.blendindices.z * const_4.xxxy) + const_4.yyyx;
    OUT.texcoord_0.xy = IN.texcoord_0;

    return OUT;
};

// approximately 45 instruction slots used

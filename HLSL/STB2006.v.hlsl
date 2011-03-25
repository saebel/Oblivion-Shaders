//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2006.vso /Fcshaderdump19/STB2006.vso.dis
//
//
// Parameters:

float3 FogColor;
float4 FogParam;
float3 LightDirection[3];
float4 LightPosition[3];
row_major float4x4 ModelViewProj;
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
    float4 texcoord_4 : TEXCOORD4;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {0.5, 0, 1, 0};

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

    /* +term: directional point light (torch) ---------------------------------- */
    float3 pntvec;
    float3 pntdir;
    float3 pntmod;

    pntvec = LightPosition[1] - InstanceWind;
    pntdir = pntvec / LightPosition[1].w;
    pntvec = pntvec / length(pntvec);
    pntdir = (0.5 * pntdir) + 0.5;

    pntmod.x = dot(IN.tangent,  pntvec);
    pntmod.y = dot(IN.binormal, pntvec);
    pntmod.z = dot(IN.normal,   pntvec);

    OUT.texcoord_4.xyz = pntmod;
    OUT.texcoord_4.w = 0.5;

    /* +term: fog -------------------------------------------------------------- */
    float fdensity = min(max((FogParam.x - length(InstanceProj.xyz)) / FogParam.y, 0), 1);

    OUT.fog.rgb = FogColor;
    OUT.fog.a = 1 - fdensity;

    /* +term: copy ------------------------------------------------------------- */
    OUT.color_0 = (IN.blendindices.z * const_4.zzzy) + const_4.yyyz;
    OUT.texcoord_0.xy = IN.texcoord_0;

    return OUT;
};

// approximately 45 instruction slots used

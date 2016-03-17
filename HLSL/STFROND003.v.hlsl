//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STFROND003.vso /Fcshaderdump19/STFROND003.vso.dis
//
//
// Parameters:

float4 AmbientColor;
float4 DiffColor;
float4 DiffColorPt;
float3 FogColor;
float4 FogParam;
float4 LightPos;
float4 LightRadius;
row_major float4x4 ModelViewProj;
float SunDimmer;
float4 WindMatrices[16];

// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 ilum : TEXCOORD1;
    float4 fog : TEXCOORD2;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

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

    /* +term: directional point light (torch) ---------------------------------- */
    float3 pntvec;
    float pntdst;
    float3 pntcol;

    pntvec = LightPos - InstanceWind;
    pntdst = length(pntvec);
    pntvec = normalize(pntvec);

    pntdst = min(max(pntdst / LightRadius.x, 0), 1);
    pntdst = (pntdst * -pntdst) + 1;

    /* +term: directional diffuse light (sun) ---------------------------------- */
    float dotnrmlit = min(max(dot(IN.normal, pntvec), 0), 1);
    float3 envcol;

    pntcol = dotnrmlit * DiffColorPt;
    envcol = dotnrmlit * DiffColor;

    pntcol = pntcol * pntdst;
    envcol = (SunDimmer.x * envcol) + AmbientColor;
    /* -term */

    OUT.ilum.rgb = (IN.color_0 * envcol) + pntcol;

    /* +term: fog -------------------------------------------------------------- */
    float fdensity = min(max((FogParam.x - length(InstanceProj.xyz)) / FogParam.y, 0), 1);

    OUT.fog.rgb = FogColor;
    OUT.fog.a = 1 - fdensity;

    /* +term: copy ------------------------------------------------------------- */
    OUT.texcoord_0.xy = IN.texcoord_0;

    return OUT;
};

// approximately 43 instruction slots used
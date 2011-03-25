//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2013.vso /Fcshaderdump19/STB2013.vso.dis
//
//
// Parameters:

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
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float4 texcoord_6 : TEXCOORD6;
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
    float3 pntvec0, pntvec1, pntvec2;
    float3 pntdir0, pntdir1, pntdir2;
    float3 pntmod0, pntmod1, pntmod2;

    pntvec0 = LightPosition[0] - InstanceWind;
    pntdir0 = pntvec0 / LightPosition[0].w;
    pntvec0 = pntvec0 / length(pntvec0);
    pntdir0 = (0.5 * pntdir0) + 0.5;

    pntvec1 = LightPosition[1] - InstanceWind;
    pntdir1 = pntvec1 / LightPosition[1].w;
    pntvec1 = pntvec1 / length(pntvec1);
    pntdir1 = (0.5 * pntdir1) + 0.5;

    pntvec2 = LightPosition[2] - InstanceWind;
    pntdir2 = pntvec2 / LightPosition[2].w;
    pntvec2 = pntvec2 / length(pntvec2);
    pntdir2 = (0.5 * pntdir2) + 0.5;

    pntmod0.x = dot(IN.tangent,  pntvec0);
    pntmod0.y = dot(IN.binormal, pntvec0);
    pntmod0.z = dot(IN.normal,   pntvec0);

    pntmod1.x = dot(IN.tangent,  pntvec1);
    pntmod1.y = dot(IN.binormal, pntvec1);
    pntmod1.z = dot(IN.normal,   pntvec1);

    pntmod2.x = dot(IN.tangent,  pntvec2);
    pntmod2.y = dot(IN.binormal, pntvec2);
    pntmod2.z = dot(IN.normal,   pntvec2);

    OUT.texcoord_1.xyz = pntmod0;
    OUT.texcoord_2.xyz = pntmod1;
    OUT.texcoord_3.xyz = pntmod2;
    OUT.texcoord_4.xyz = pntdir0;
    OUT.texcoord_4.w = 0.5;
    OUT.texcoord_5.xyz = pntdir1;
    OUT.texcoord_5.w = 0.5;
    OUT.texcoord_6.xyz = pntdir2;
    OUT.texcoord_6.w = 0.5;

    /* +term: copy ------------------------------------------------------------- */
    OUT.texcoord_0.xy = IN.texcoord_0;

    return OUT;
};

// approximately 48 instruction slots used
//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1003.vso /Fcshaderdump19/STB1003.vso.dis
//
//
// Parameters:

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
    float3 color_0 : COLOR0;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
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

    /* +term: directional diffuse light (sun) ---------------------------------- */
    float3x3 rotation = float3x3(IN.tangent, IN.binormal, IN.normal);
    float3 rotlight = mul(rotation, LightDirection[0]);

    OUT.color_0.rgb = (0.5 * rotlight) + 0.5;

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

    OUT.texcoord_1.xy = pntdir;
    OUT.texcoord_2.x = pntdir.z;
    OUT.texcoord_2.y = 0.5;
    OUT.texcoord_3.xyz = pntmod;

    /* +term: copy ------------------------------------------------------------- */
    OUT.texcoord_0.xy = IN.texcoord_0;

    return OUT;
};

// approximately 29 instruction slots used
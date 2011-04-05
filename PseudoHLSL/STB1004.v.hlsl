//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1004.vso /Fcshaderdump19/STB1004.vso.dis
//
//
// Parameters:

float3 LightDirection[3];
row_major float4x4 ModelViewProj;
float4 WindMatrices[16];


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   LightDirection[0] const_13       1
//   WindMatrices[0]   const_38      4
//   WindMatrices[1]   const_39      4
//   WindMatrices[2]   const_40      4
//   WindMatrices[3]   const_41      4
//



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
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {0.5, 0, 0, 0};

    float1 offset;
    float4 r0;

    offset.x = IN.blendindices.y;
    r0.w = dot(WindMatrices[3 + offset.x], IN.position.xyzw);
    r0.x = dot(WindMatrices[0 + offset.x], IN.position.xyzw);
    r0.y = dot(WindMatrices[1 + offset.x], IN.position.xyzw);
    r0.z = dot(WindMatrices[2 + offset.x], IN.position.xyzw);
    r0.xyzw = (IN.blendindices.x * (r0.xyzw - IN.position.xyzw)) + IN.position.xyzw;
    OUT.position.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r0.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r0.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r0.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    OUT.texcoord_1.xyz = (0.5 * r0.xyz) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 17 instruction slots used

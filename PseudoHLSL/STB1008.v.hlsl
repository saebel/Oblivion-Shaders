//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1008.vso /Fcshaderdump19/STB1008.vso.dis
//
//
// Parameters:

float4 EyePosition;
float4 LightPosition[3];
row_major float4x4 ModelViewProj;
float4 WindMatrices[16];


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   LightPosition[0] const_16       1
//   EyePosition   const_25      1
//   WindMatrices[0]  const_38      4
//   WindMatrices[1]  const_39      4
//   WindMatrices[2]  const_40      4
//   WindMatrices[3]  const_41      4
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float3 color_0 : COLOR0;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {0.5, 0, 0, 0};

    float1 offset;
    float4 r0;
    float3 r1;
    float3 r2;

    offset.x = IN.blendindices.y;
    r0.w = dot(WindMatrices[3 + offset.x], IN.position.xyzw);
    r0.x = dot(WindMatrices[0 + offset.x], IN.position.xyzw);
    r0.y = dot(WindMatrices[1 + offset.x], IN.position.xyzw);
    r0.z = dot(WindMatrices[2 + offset.x], IN.position.xyzw);
    r0.xyzw = (IN.blendindices.x * (r0.xyzw - IN.position.xyzw)) + IN.position.xyzw;
    r1.xyz = LightPosition[0].xyz - r0.xyz;
    r2.xyz = normalize(normalize(r1.xyz) + normalize(EyePosition.xyz - r0.xyz));
    OUT.position.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r0.x = dot(IN.tangent.xyz, IN.normal.xyz);
    r0.y = dot(IN.binormal.xyz, IN.normal.xyz);
    r0.z = dot(IN.normal.xyz, IN.normal.xyz);
    OUT.texcoord_3.x = dot(IN.tangent.xyz, r2.xyz);
    OUT.texcoord_3.y = dot(IN.binormal.xyz, r2.xyz);
    OUT.texcoord_3.z = dot(IN.normal.xyz, r2.xyz);
    OUT.color_0.rgb = (0.5 * r0.xyz) + 0.5;	// [-1,+1] to [0,1]
    r0.xyz = r1.xyz / LightPosition[0].w;
    OUT.texcoord_1.xy = (0.5 * r0.xy) + 0.5;
    OUT.texcoord_2.x = (r0.z * 0.5) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.y = 0.5;

    return OUT;
};

// approximately 37 instruction slots used

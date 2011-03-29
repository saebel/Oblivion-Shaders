//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2004.vso /Fcshaderdump19/SLS2004.vso.dis
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


// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   ModelViewProj[0]       const_0        1
//   ModelViewProj[1]       const_1        1
//   ModelViewProj[2]       const_2        1
//   ModelViewProj[3]       const_3        1
//   LightDirection[0]      const_13       1
//   FogParam            const_23      1
//   FogColor            const_24      1
//   ShadowProj[0]          const_28       1
//   ShadowProj[1]          const_29       1
//   ShadowProj[2]          const_30       1
//   ShadowProj[3]          const_31       1
//   ShadowProjData      const_32      1
//   ShadowProjTransform const_33      1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_4 = {1, 0, 0, 0};

    OUT.color_1.rgb = FogColor.rgb;
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.xyz = LightDirection[0].xyz;
    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    r1.w = dot(ShadowProj[3].xyzw, IN.position.xyzw);
    r0.y = r1.w * ShadowProjTransform.w;
    r1.x = dot(ShadowProj[0].xyzw, IN.position.xyzw);
    r1.y = dot(ShadowProj[1].xyzw, IN.position.xyzw);
    r2.w = 1.0 / FogParam.y;
    r2.xy = (r1.w * ShadowProjTransform.xy) + r1.xy;
    r1.w = 1.0 / ShadowProjData.w;
    r1.xy = r1.xy - ShadowProjData.xy;
    OUT.texcoord_7.w = (r1.y * -r1.w) + 1;
    OUT.texcoord_7.z = r1.x * r1.w;
    r0.w = 1.0 / r0.y;
    OUT.texcoord_7.xy = r0.w * r2.xy;
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.xyz = r0.xyz;
    r3.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r3.x);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r0.w = r0.w * r2.w;
    r0.w = max(r0.w, 0);
    r0.w = min(r0.w, 1);
    OUT.color_1.a = 1 - r0.w;

    return OUT;
};

// approximately 28 instruction slots used

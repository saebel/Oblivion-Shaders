//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3012.vso /Fcshaderdump19/SM3012.vso.dis
//
//
// Parameters:

float3 BoundWorldCenter;
float3 EyePosition;
row_major float4x4 ModelViewProj;
row_major float4x4 ObjToCubeSpace;


// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   ModelViewProj[0]    const_0        1
//   ModelViewProj[1]    const_1        1
//   ModelViewProj[2]    const_2        1
//   ModelViewProj[3]    const_3        1
//   ObjToCubeSpace[0]   const_10       1
//   ObjToCubeSpace[1]   const_11       1
//   ObjToCubeSpace[2]   const_12       1
//   EyePosition      const_14      1
//   BoundWorldCenter const_20      1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 color_0 : COLOR0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const int4 const_4 = {-2, 3, 0, 0};
    const float4 const_5 = {0.5, -0.8, 6.66666651, 1};

    float3 r0;
    float4 r1;

    r0.x = dot(ObjToCubeSpace[0].xyzw, IN.position.xyzw);
    r0.y = dot(ObjToCubeSpace[1].xyzw, IN.position.xyzw);
    r0.z = dot(ObjToCubeSpace[2].xyzw, IN.position.xyzw);
    r1.xyz = normalize(r0.xyz - BoundWorldCenter.xyz);
    r0.xyz = EyePosition.xyz - r0.xyz;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_1.xyz = (0.5 * r1.xyz) + 0.5;	// [-1,+1] to [0,1]
    r1.w = saturate(((dot(r1.xyz, normalize(r0.xyz)) / length(r1.xyz)) - 0.8) * 6.66666651);
    OUT.texcoord_2.xyz = r0.xyz;
    OUT.texcoord_1.w = ((r1.w * -2) + 3) * (r1.w * r1.w);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.color_0.rgb = 1;

    return OUT;
};

// approximately 27 instruction slots used

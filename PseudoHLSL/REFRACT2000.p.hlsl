//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/REFRACT2000.pso /Fcshaderdump19/REFRACT2000.pso.dis
//
//
// Parameters:

sampler2D Src0;
sampler2D Src1;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   Src0         texture_0       1
//   Src1         texture_1       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 2, 0, 1};

    float4 r0;
    float2 r1;

    r0.xyzw = tex2D(Src1, IN.texcoord_1.xy);
    r1.x = (2 * -(r0.z * (r0.x - 0.5))) + IN.texcoord_0.x;
    r1.y = (2 * (r0.z * (r0.y - 0.5))) + IN.texcoord_0.y;	// [0,1] to [-1,+1]
    r0.xyzw = tex2D(Src1, r1.xy);
    r0.xyzw = lerp(tex2D(Src0, r1.xy), (tex2D(Src0, IN.texcoord_0.xy)), ((r0.w * r0.w) <= 0.0 ? 1 : 0));
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 15 instruction slots used (4 texture, 11 arithmetic)

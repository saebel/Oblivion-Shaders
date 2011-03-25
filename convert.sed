# version-numbers
/    ps_3_0/d
/    ps_2_x/d
/    ps_1_3/d
/    vs_3_0/d
/    vs_2_0/d
/    vs_1_1/d

# constants
s/def \(c[0-9]\+\), \([e0-9\.\-]\+\), \([e0-9\.\-]\+\), \([e0-9\.\-]\+\), \([e0-9\.\-]\+\)/\1 = {\2, \3, \4, \5};/g

# operators (_pp)
# PseudoC vs. HLSL
# s/\(.*\)_centroid \([^\t]*\)/\1 \2\t\t\t\/\/ centroid/g
s/\([a-z0-9_]\+\)_centroid/centroid \1/g
s/\(.*\)_pp \([^\t]*\)/\1 \2\t\t\t\/\/ partial precision/g
s/expp \(.*\)/exp \1\t\/\/ partial precision/g

# inputs (pixel)
s/dcl_position \([a-z0-9_\.]\+\)/position \1;/g
s/dcl_blendweight \([a-z0-9_\.]\+\)/blendweight \1;/g
s/dcl_blendindices \([a-z0-9_\.]\+\)/blendindices \1;/g
s/dcl_color\([0-9]\+\) \([a-z0-9_\.]\+\)/color_\1 \2;/g
s/dcl_texcoord\([0-9]\+\) \([a-z0-9_\.]\+\)/texcoord_\1 \2;/g
s/dcl_texcoord \([v]\+\)\([0-9\.xyzw]\+\)/texcoord \1\2;/g
s/dcl_texcoord \([o]\+\)\([0-9\.xyzw]\+\)/texcoord \1\2;/g
s/dcl_tangent \([v0-9]\+\)\([a-z0-9_\.]\+\)/tangent \1\2;/g
s/dcl_binormal \([v0-9]\+\)\([a-z0-9_\.]\+\)/binormal \1\2;/g
s/dcl_normal \([v0-9]\+\)\([a-z0-9_\.]\+\)/normal \1\2;/g
s/dcl_color\([0-9]\+\) \([a-z0-9_\.]\+\)/color_\1 \2;/g
s/dcl_color \([v]\+\)\([0-9\.xyzw]\+\)/color \1\2;/g
s/dcl_color \([o]\+\)\([0-9\.xyzw]\+\)/color \1\2;/g
# PseudoC vs. HLSL
# s/dcl_2d \([s0-9]\+\)\([a-z0-9_\.]\+\)/sampler \1\2;/g
s/dcl_2d \([s0-9]\+\)\([a-z0-9_\.]\+\)/sampler2D \1\2;/g
s/dcl_cube \([s0-9]\+\)\([a-z0-9_\.]\+\)/samplerCUBE \1\2;/g
s/dcl v\([0-9]\+\)\([a-z0-9_\.]*\)/color_\1 input_\1\2;/g
s/dcl t\([0-9]\+\)\([a-z0-9_\.]*\)/texcoord_\1 texcoord_\1\2;/g
# s/dcl s\([a-z0-9_\.]\+\)/sampler2D texture_\1;/g
s/dcl s\([a-z0-9_\.]\+\)/sampler texture_\1;/g
s/tex \([a-zINOUT0-9_\.]\+\)/\1 = tex2D(s0, texcoord_0);/g
# s/tex t\([0-9]\+\)\([a-z0-9_\.]*\)/texture_\1 = tex2D(s0, texcoord_0);/g

# output registers (pixel)
s/oC\([0-9]\+\)/OUT.color_\1/g
s/oDepth/OUT.depth/g

# output registers (vertex)
s/\([^a-zA-Z]\)oPos/\1OUT.position/g
s/\([^a-zA-Z]\)oFog/\1OUT.fog/g
s/\([^a-zA-Z]\)oPts/\1OUT.pointsize/g
s/\([^a-zA-Z]\)oD\([0-9]\+\)/\1OUT.color_\2/g
s/\([^a-zA-Z]\)oT\([0-9]\+\)/\1OUT.texcoord_\2/g
s/\([^a-zA-Z]\)a0/\1offset/g
# output registers (vertex 2.x)
s/\([^a-zA-Z]\)t\([0-9]\+\)/\1IN.texcoord_\2/g
s/\([^a-zA-Z]\)o\([0-9]\+\)/\1OUT.output_\2/g
s/\([^a-zA-Z]\)v\([0-9]\+\)/\1IN.input_\2/g
s/\([^a-zA-Z]\)s\([0-9]\+\)/\1texture_\2/g
s/\([^a-zA-Z]\)c\([0-9]\+\)/\1const_\2/g

# modifiers (vertex)
### s/\([INOUT\.]*[a-z0-9_]\+\)_sat\([a-zINOUT0-9_\.]*\)/sat(\1\2)/g
s/\([INOUT\.]*[a-z0-9_]\+\)_sat\([a-zINOUT0-9_\.]*\)/sat \1\2/g

# PseudoC vs. HLSL
# s/lrp \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = \2 * (\3 - \4) + \4;/g
s/lrp \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = lerp(\3, \4, \2);/g
# PseudoC vs. HLSL
# s/dp2add \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\2.x * \3.x) + (\2.y * \3.y) + \4;/g
# s/dp3 \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\2.x * \3.x) + (\2.y * \3.y) + (\2.z * \3.z);/g
# s/dp4 \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\2.x * \3.x) + (\2.y * \3.y) + (\2.z * \3.z) + (\2.w * \3.w);/g
s/dp2add \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), -\([][a-zINOUT0-9_\.]\+\)/\1 = dot(\2.xy, \3.xy) - \4;/g
s/dp2add \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.]\+\)/\1 = dot(\2.xy, \3.xy) + \4;/g
s/dp3 \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = dot(\2, \3);/g
s/dp4 \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = dot(\2, \3);/g

# operators (pixel & vertex)
s/add \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\), -\([][a-zINOUT0-9_\.]\+\)/\1 = \2 - \3;/g
s/add \([][a-zINOUT0-9_\.]\+\), -\([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\)/\1 = \3 - \2;/g
s/add \([][a-zINOUT0-9_\.]\+\), -\([][a-zINOUT0-9_\.]\+\), -\([][a-zINOUT0-9_\.]\+\)/\1 = -(\2 + \3);/g
s/add \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\)/\1 = \2 + \3;/g

s/sincos \([][a-zINOUT0-9_]\+\).x, \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.]\+\)/\1.x = cos(\2);/g
s/sincos \([][a-zINOUT0-9_]\+\).y, \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.]\+\)/\1.y = sin(\2);/g
s/sincos \([][a-zINOUT0-9_]\+\).xy, \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.]\+\)/\1.x = cos(\2); \1.y = sin(\2);/g
s/sincos \([][a-zINOUT0-9_]\+\).xy, \([][a-zINOUT0-9_\.\-]\+\)/\1.x = cos(\2); \1.y = sin(\2);/g
# cmp d, -abs(x), a, b	=>	d = -abs(x) >= 0.0 ? a : b	=>	d = x == 0.0 ? a : b
s/cmp \([][a-zINOUT0-9_\.]\+\), -\([a-zINOUT0-9]\+\)_abs\([][a-zINOUT0-9_\.]*\), \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\)/\1 = (\2\3 == 0.0 ? \4 : \5);/g
# cmp d, -    x , a, b	=>	d = -    x  >= 0.0 ? a : b	=>	d = x <= 0.0 ? a : b
s/cmp \([][a-zINOUT0-9_\.]\+\), -\([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\2 <= 0.0 ? \4 : \3);/g
s/cmp \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\2 >= 0.0 ? \4 : \3);/g
s/cnd \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\2 > 0.5 ? \4 : \3);/g
s/mul \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = \2 * \3;/g
s/mad \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), -\([][a-zINOUT0-9_\.\-]\+\)/\1 = (\3 * \2) - \4;/g
s/mad \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\3 * \2) + \4;/g
s/mad \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), -\([][a-zINOUT0-9_\.]\+\)/\1 = (\2 * \3) - \4;/g
s/mad \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.]\+\)/\1 = (\2 * \3) + \4;/g
s/mov \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = \2;/g
s/mova \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = \2;/g
# PseudoC vs. HLSL
# s/texld \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\)/\1 = \3[\2];/g
# s/texldp \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\)/\1 = \3[\2];/g
s/texld \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\)/\1 = tex2D(\3, \2);/g
s/texldp \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.]\+\)/\1 = tex2Dproj(\3, \2);/g

# operators (vertex)
s/sge \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\2 >= \3 ? 1.0 : 0.0);/g
s/slt \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\2 < \3 ? 1.0 : 0.0);/g
# PseudoC vs. HLSL
# s/max \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\2 >= \3 ? \2 : \3);/g
# s/min \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = (\2 < \3 ? \2 : \3);/g
s/max \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = max(\2, \3);/g
s/min \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = min(\2, \3);/g
s/nrm \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = normalize(\2);/g
s/rsq \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = 1.0 \/ sqrt(\2);/g
s/rcp \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = 1.0 \/ \2;/g
s/frc \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = frac(\2);/g
s/exp \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = pow(2.0, \2);/g
s/abs \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = abs(\2);/g
s/pow \([][a-zINOUT0-9_\.]\+\), \([][a-zINOUT0-9_\.\-]\+\), \([][a-zINOUT0-9_\.\-]\+\)/\1 = pow(abs(\2), \3);/g

# modifiers (vertex)
s/\([INOUT\.]*[a-z0-9_]\+\)_abs\([a-zINOUT0-9_\.]*\)/abs(\1\2)/g
s/\([INOUT\.]*[a-z0-9_]\+\)_bx2\([a-zINOUT0-9_\.]*\)/2 * ((\1\2) - 0.5)/g
s/sat \([][a-zINOUT0-9_\.]*\) = \([^;]*\);/\1 = saturate(\2);/g

# convert to HLSL
s/\([INOUT\.]*[a-z0-9_]\+\) = {\([0-9\-]\+\), \([0-9\-]\+\)};/const int2 \1 = {\2, \3};/g
s/\([INOUT\.]*[a-z0-9_]\+\) = {\([0-9\-]\+\), \([0-9\-]\+\), \([0-9\-]\+\)};/const int3 \1 = {\2, \3, \4};/g
s/\([INOUT\.]*[a-z0-9_]\+\) = {\([0-9\-]\+\), \([0-9\-]\+\), \([0-9\-]\+\), \([0-9\-]\+\)};/const int4 \1 = {\2, \3, \4, \5};/g

s/\([INOUT\.]*[a-z0-9_]\+\) = {\([e0-9\.\-]\+\), \([e0-9\.\-]\+\)};/const float2 \1 = {\2, \3};/g
s/\([INOUT\.]*[a-z0-9_]\+\) = {\([e0-9\.\-]\+\), \([e0-9\.\-]\+\), \([e0-9\.\-]\+\)};/const float3 \1 = {\2, \3, \4};/g
s/\([INOUT\.]*[a-z0-9_]\+\) = {\([e0-9\.\-]\+\), \([e0-9\.\-]\+\), \([e0-9\.\-]\+\), \([e0-9\.\-]\+\)};/const float4 \1 = {\2, \3, \4, \5};/g

s/position \([INOUT\.]*\)\([a-z0-9_]\+\);/float4 \2 : POSITION;/g
s/blendweight \([INOUT\.]*\)\([a-z0-9_]\+\);/float3 \2 : BLENDWEIGHT;/g
s/blendindices \([INOUT\.]*\)\([a-z0-9_]\+\);/float4 \2 : BLENDINDICES;/g
s/tangent \([INOUT\.]*\)\([a-z0-9_]\+\);/float3 \2 : TANGENT;/g
s/binormal \([INOUT\.]*\)\([a-z0-9_]\+\);/float3 \2 : BINORMAL;/g
s/normal \([INOUT\.]*\)\([a-z0-9_]\+\);/float3 \2 : NORMAL;/g
s/texcoord \([INOUT\.]*\)\([a-z0-9_]\+\).xyz;/float3 \2 : TEXCOORD0;/g
s/texcoord \([INOUT\.]*\)\([a-z0-9_]\+\).xy;/float2 \2 : TEXCOORD0;/g
s/texcoord \([INOUT\.]*\)\([a-z0-9_]\+\).x;/float \2 : TEXCOORD0;/g
s/texcoord \([INOUT\.]*\)\([a-z0-9_]\+\);/float4 \2 : TEXCOORD0;/g
s/texcoord_\([0-9]\+\) \([INOUT\.]*\)\([a-z0-9_]\+\).xyz;/float3 \3 : TEXCOORD\1;/g
s/texcoord_\([0-9]\+\) \([INOUT\.]*\)\([a-z0-9_]\+\).xy;/float2 \3 : TEXCOORD\1;/g
s/texcoord_\([0-9]\+\) \([INOUT\.]*\)\([a-z0-9_]\+\).x;/float \3 : TEXCOORD\1;/g
s/texcoord_\([0-9]\+\) \([INOUT\.]*\)\([a-z0-9_]\+\);/float4 \3 : TEXCOORD\1;/g
s/centroid \+\(.*\)TEXCOORD\([0-9]\+\);/\1TEXCOORD\2_centroid;/g
s/color \([INOUT\.]*\)\([a-z0-9_]\+\).xyz;/float3 \2 : COLOR0;/g
s/color \([INOUT\.]*\)\([a-z0-9_]\+\).xy;/float2 \2 : COLOR0;/g
s/color \([INOUT\.]*\)\([a-z0-9_]\+\).y;/float2 \2 : COLOR0;/g
s/color \([INOUT\.]*\)\([a-z0-9_]\+\).x;/float \2 : COLOR0;/g
s/color \([INOUT\.]*\)\([a-z0-9_]\+\);/float4 \2 : COLOR0;/g
s/color_\([0-9]\+\) \([INOUT\.]*\)\([a-z0-9_]\+\).xyz;/float3 \3 : COLOR\1;/g
s/color_\([0-9]\+\) \([INOUT\.]*\)\([a-z0-9_]\+\).xy;/float2 \3 : COLOR\1;/g
s/color_\([0-9]\+\) \([INOUT\.]*\)\([a-z0-9_]\+\).y;/float2 \3 : COLOR\1;/g
s/color_\([0-9]\+\) \([INOUT\.]*\)\([a-z0-9_]\+\).x;/float \3 : COLOR\1;/g
s/color_\([0-9]\+\) \([INOUT\.]*\)\([a-z0-9_]\+\);/float4 \3 : COLOR\1;/g

# repair
s/const int\([0-9]\+\) const float\([0-9]\+\)/const int\1/g

# constants
s/-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668/D3DSINCOSCONST1/g
s/-0.020833334, -0.125, 1, 0.5/D3DSINCOSCONST2/g
s/0.000122070313/(1.0 \/ 8192)/g
s/0.000624999986/(1.0 \/ 1600)/g
s/0.00133333332/(1.0 \/ 750)/g
s/0.00333333341/(1.0 \/ 300)/g
s/0.00390625/(1.0 \/ 256)/g
s/0.0078125/(1.0 \/ 128)/g
s/0.020833334/(1.0 \/ 48)/g
s/0.0416666418/(1.0 \/ 24)/g
s/0.0588235296/(1.0 \/ 17)/g
s/0.055555556/(1.0 \/ 18)/g
s/0.0666666701/(1.0 \/ 15)/g
s/0.111111112/(1.0 \/ 9)/g
s/0.142857149/(1.0 \/ 7)/g
s/0.333333343/(1.0 \/ 3)/g
s/2.85714293/(1.0 \/ 0.35)/g
s/0.000732423679/(3.0 \/ 4096)/g
s/0.000199999995/0.0002/g
s/0.00100000005/0.001/g
s/0.00999999978/0.01/g
s/0.0199999996/0.02/g
s/0.0250000004/0.025/g
s/0.0399999991/0.04/g
s/0.0500000007/0.05/g
s/0.075000003/0.075/g
s/0.100000001/0.1/g
s/0.109999999/0.11/g
s/0.140000001/0.14/g
s/0.150000006/0.15/g
s/0.200000003/0.2/g
s/0.209999993/0.21/g
s/0.298999995/0.299/g
s/0.300000012/0.3/g
s/0.400000006/0.4/g
s/0.50999999/0.5 + 0.01/g
s/0.49000001/0.5 - 0.01/g
s/0.550000012/0.55/g
s/0.589999974/0.59/g
s/0.600000024/0.6/g
s/0.699999988/0.7/g
s/0.730000019/0.73/g
s/0.779999971/0.78/g
s/0.800000012/0.8/g
s/0.850000024/0.85/g
s/0.899999976/1.0 - 0.1/g
s/1.60000002/1.6/g
s/4.4000001/4.4/g
s/6.28318548/PI \* 2/g
s/3.14159274/PI/g
s/1.57079637/PI \/ 2/g
s/0.159154937/(1.0 \/ (PI \* 2))/g

# expressions
# a - a = 0.0
s/r\([][a-zINOUT0-9_\.]\+\) = r\([][a-zINOUT0-9_\.\-]\+\) - r\2;/r\1 = 0.0;/g
# dot(a, a) = normalize + length
s/r\([][a-zINOUT0-9_\.]\+\) = dot(r\([][a-zINOUT0-9_\.\-]\+\), r\2);/r\1 = dot(r\2, r\2);\t\/\/ normalize + length/g

s/\([0-9]\+\)\]\[offset/\1 + offset/g
s/color_\([0-9]\+\).xyzw\([^xyzw]\+\)/color_\1.rgba\2/g
s/color_\([0-9]\+\).xyz\([^xyzw]\+\)/color_\1.rgb\2/g
s/color_\([0-9]\+\).x\([^xyzw]\+\)/color_\1.r\2/g
s/color_\([0-9]\+\).y\([^xyzw]\+\)/color_\1.g\2/g
s/color_\([0-9]\+\).z\([^xyzw]\+\)/color_\1.b\2/g
s/color_\([0-9]\+\).w\([^xyzw]\+\)/color_\1.a\2/g
s/\(Color\|Tint\|Emit\)\([][0-9]*\).xyzw\([^xyzw]\+\)/\1\2.rgba\3/g
s/\(Color\|Tint\|Emit\)\([][0-9]*\).xyz\([^xyzw]\+\)/\1\2.rgb\3/g
s/\(Color\|Tint\|Emit\)\([][0-9]*\).x\([^xyzw]\+\)/\1\2.r\3/g
s/\(Color\|Tint\|Emit\)\([][0-9]*\).y\([^xyzw]\+\)/\1\2.g\3/g
s/\(Color\|Tint\|Emit\)\([][0-9]*\).z\([^xyzw]\+\)/\1\2.b\3/g
s/\(Color\|Tint\|Emit\)\([][0-9]*\).w\([^xyzw]\+\)/\1\2.a\3/g
# s/\(Color\|Tint\|Emit\|Alpha\)\([][0-9]*\).xyzw\([^xyzw]\+\)/\1\2.rgba\3/g
# s/\(Color\|Tint\|Emit\|Alpha\)\([][0-9]*\).xyz\([^xyzw]\+\)/\1\2.rgb\3/g
# s/\(Color\|Tint\|Emit\|Alpha\)\([][0-9]*\).x\([^xyzw]\+\)/\1\2.r\3/g
# s/\(Color\|Tint\|Emit\|Alpha\)\([][0-9]*\).y\([^xyzw]\+\)/\1\2.g\3/g
# s/\(Color\|Tint\|Emit\|Alpha\)\([][0-9]*\).z\([^xyzw]\+\)/\1\2.b\3/g
# s/\(Color\|Tint\|Emit\|Alpha\)\([][0-9]*\).w\([^xyzw]\+\)/\1\2.a\3/g

s/IN.IN./IN./g
s/OUT.OUT./OUT./g

# substitutions against numeric constants, can't be done in convert.sed

# (r0.x * -r0.x) + 1
s/(\([][a-zINOUT0-9_\.]\+\) [\*] [\-]\1) [\+] 1;/1.0 - (\1 * \1);/g
s/([\-]\([][a-zINOUT0-9_\.]\+\) [\*] \1) [\+] 1;/1.0 - (\1 * \1);/g

# + -0.5
# + -PI
s/[\+] [\-]\([ePI0-9\.]\+\)/- \1/g

# --3
s/[\-][\-]\([e0-9.]\+\)/\1/g

# tex2D(,.xy)
# texCUBE(,.xyz)
s/tex2D(\([^,()]\+\), \([INOUT.]*[][a-z0-9_\-]\+\))/tex2D(\1, \2.xy)/
s/tex2DProj(\([^,()]\+\), \([INOUT.]*[][a-z0-9_\-]\+\))/tex2D(\1, \2.xy)/
s/texCUBE(\([^,()]\+\), \([INOUT.]*[][a-z0-9_\-]\+\))/texCUBE(\1, \2.xyz)/
# r1.xyzw = tex2D(ShadowMask, IN.texcoord_1.zwzw);			// partial precision
s/\([][a-zINOUT0-9_]\+\)\.xyzw = tex2D(\([^,]\+\), \([INOUT.]*[][a-z0-9_\-]\+\)\.\([xyzw][xyzw]\)\([xyzw]*\));/\1.xyzw = tex2D(\2, \3.\4);/g

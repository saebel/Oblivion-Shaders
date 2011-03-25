s/\([0-9]\+\)\]\[offset/\1 + offset/g
s/color_\([0-9]\+\).xyzw\([^xyzw]\+\)/color_\1.rgba\2/g
s/color_\([0-9]\+\).xyz\([^xyzw]\+\)/color_\1.rgb\2/g
s/color_\([0-9]\+\).x\([^xyzw]\+\)/color_\1.r\2/g
s/color_\([0-9]\+\).y\([^xyzw]\+\)/color_\1.g\2/g
s/color_\([0-9]\+\).z\([^xyzw]\+\)/color_\1.b\2/g
s/color_\([0-9]\+\).w\([^xyzw]\+\)/color_\1.a\2/g
s/Color\([][0-9]*\).xyzw\([^xyzw]\+\)/Color\1.rgba\2/g
s/Color\([][0-9]*\).xyz\([^xyzw]\+\)/Color\1.rgb\2/g
s/Color\([][0-9]*\).x\([^xyzw]\+\)/Color\1.r\2/g
s/Color\([][0-9]*\).y\([^xyzw]\+\)/Color\1.g\2/g
s/Color\([][0-9]*\).z\([^xyzw]\+\)/Color\1.b\2/g
s/Color\([][0-9]*\).w\([^xyzw]\+\)/Color\1.a\2/g

s/IN.IN./IN./g
s/OUT.OUT./OUT./g

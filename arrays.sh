#!/bin/bash

perl  <$1	\
  -p -e "s/(.*)WorldViewProj( *)c0( *)4/\$1WorldViewProj[0]\$2c0\$3 1\n\$1WorldViewProj[1]\$2c1\$3 1\n\$1WorldViewProj[2]\$2c2\$3 1\n\$1WorldViewProj[3]\$2c3\$3 1/"	\
 | perl	\
  -p -e "s/(.*)ModelViewProj( *)c0( *)4/\$1ModelViewProj[0]\$2c0\$3 1\n\$1ModelViewProj[1]\$2c1\$3 1\n\$1ModelViewProj[2]\$2c2\$3 1\n\$1ModelViewProj[3]\$2c3\$3 1/"	\
 | perl	\
  -p -e "s/(.*)ModelViewProj( *)c9( *)4/\$1ModelViewProj[0]\$2c9\$3 1\n\$1ModelViewProj[1]\$2c10\$3 1\n\$1ModelViewProj[2]\$2c11\$3 1\n\$1ModelViewProj[3]\$2c12\$3 1/"	\
 | perl	\
  -p -e "s/(.*)SkinModelViewProj( *)c1( *)4/\$1SkinModelViewProj[0]\$2c1\$3 1\n\$1SkinModelViewProj[1]\$2c2\$3 1\n\$1SkinModelViewProj[2]\$2c3\$3 1\n\$1SkinModelViewProj[3]\$2c4\$3 1/"	\
 | perl	\
  -p -e "s/(.*)SkinModelViewProj( *)c4( *)4/\$1SkinModelViewProj[0]\$2c4\$3 1\n\$1SkinModelViewProj[1]\$2c5\$3 1\n\$1SkinModelViewProj[2]\$2c6\$3 1\n\$1SkinModelViewProj[3]\$2c7\$3 1/"	\
 | perl	\
  -p -e "s/(.*)WorldMat( *)c4( *)4/\$1WorldMat[0]\$2c4\$3 1\n\$1WorldMat[1]\$2c5\$3 1\n\$1WorldMat[2]\$2c6\$3 1\n\$1WorldMat[3]\$2c7\$3 1/"	\
 | perl	\
  -p -e "s/(.*)ObjToCubeMap( *)c8( *)4/\$1ObjToCubeMap[0]\$2c8\$3 1\n\$1ObjToCubeMap[1]\$2c9\$3 1\n\$1ObjToCubeMap[2]\$2c10\$3 1\n\$1ObjToCubeMap[3]\$2c11\$3 1/"	\
 | perl	\
  -p -e "s/(.*)ObjToCubeMap( *)c10( *)4/\$1ObjToCubeMap[0]\$2c10\$3 1\n\$1ObjToCubeMap[1]\$2c11\$3 1\n\$1ObjToCubeMap[2]\$2c12\$3 1\n\$1ObjToCubeMap[3]\$2c13\$3 1/"	\
 | perl	\
  -p -e "s/(.*)ObjToCubeSpace( *)c8( *)2/\$1ObjToCubeSpace[0]\$2c8\$3 1\n\$1ObjToCubeSpace[1]\$2c9\$3 1/"	\
 | perl	\
  -p -e "s/(.*)ObjToCubeSpace( *)c8( *)3/\$1ObjToCubeSpace[0]\$2c8\$3 1\n\$1ObjToCubeSpace[1]\$2c9\$3 1\n\$1ObjToCubeSpace[2]\$2c10\$3 1/"	\
 | perl	\
  -p -e "s/(.*)ObjToCubeSpace( *)c8( *)4/\$1ObjToCubeSpace[0]\$2c8\$3 1\n\$1ObjToCubeSpace[1]\$2c9\$3 1\n\$1ObjToCubeSpace[2]\$2c10\$3 1\n\$1ObjToCubeSpace[3]\$2c11\$3 1/"	\
 | perl	\
  -p -e "s/(.*)ObjToCubeSpace( *)c10( *)3/\$1ObjToCubeSpace[0]\$2c10\$3 1\n\$1ObjToCubeSpace[1]\$2c11\$3 1\n\$1ObjToCubeSpace[2]\$2c12\$3 1/"	\
 | perl	\
  -p -e "s/(.*)SkinToCubeSpace( *)c9( *)3/\$1SkinToCubeSpace[0]\$2c9\$3 1\n\$1SkinToCubeSpace[1]\$2c10\$3 1\n\$1SkinToCubeSpace[2]\$2c11\$3 1/"	\
 | perl	\
  -p -e "s/(.*)SkinToCubeSpace( *)c27( *)3/\$1SkinToCubeSpace[0]\$2c27\$3 1\n\$1SkinToCubeSpace[1]\$2c28\$3 1\n\$1SkinToCubeSpace[2]\$2c29\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightDirection( *)c13( *)1/\$1LightDirection[0]\$2c13\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightDirection( *)c13( *)2/\$1LightDirection[0]\$2c13\$3 1\n\$1LightDirection[1]\$2c14\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightDirection( *)c13( *)3/\$1LightDirection[0]\$2c13\$3 1\n\$1LightDirection[1]\$2c14\$3 1\n\$1LightDirection[2]\$2c15\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightPosition( *)c16( *)1/\$1LightPosition[0]\$2c16\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightPosition( *)c16( *)2/\$1LightPosition[0]\$2c16\$3 1\n\$1LightPosition[1]\$2c17\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightPosition( *)c16( *)3/\$1LightPosition[0]\$2c16\$3 1\n\$1LightPosition[1]\$2c17\$3 1\n\$1LightPosition[2]\$2c18\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightColor( *)c19( *)1/\$1LightColor[0]\$2c19\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightColor( *)c19( *)2/\$1LightColor[0]\$2c19\$3 1\n\$1LightColor[1]\$2c20\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightColor( *)c19( *)3/\$1LightColor[0]\$2c19\$3 1\n\$1LightColor[1]\$2c20\$3 1\n\$1LightColor[2]\$2c21\$3 1/"	\
 | perl	\
  -p -e "s/(.*)PSLightColor( *)c2( *)1/\$1PSLightColor[0]\$2c2\$3 1/"	\
 | perl	\
  -p -e "s/(.*)PSLightColor( *)c2( *)2/\$1PSLightColor[0]\$2c2\$3 1\n\$1PSLightColor[1]\$2c3\$3 1/"	\
 | perl	\
  -p -e "s/(.*)PSLightColor( *)c2( *)3/\$1PSLightColor[0]\$2c2\$3 1\n\$1PSLightColor[1]\$2c3\$3 1\n\$1PSLightColor[2]\$2c4\$3 1/"	\
 | perl	\
  -p -e "s/(.*)BlendColor( *)c4( *)1/\$1BlendColor[0]\$2c4\$3 1/"	\
 | perl	\
  -p -e "s/(.*)BlendColor( *)c4( *)2/\$1BlendColor[0]\$2c4\$3 1\n\$1BlendColor[1]\$2c5\$3 1/"	\
 | perl	\
  -p -e "s/(.*)BlendColor( *)c4( *)3/\$1BlendColor[0]\$2c4\$3 1\n\$1BlendColor[1]\$2c5\$3 1\n\$1BlendColor[2]\$2c6\$3 1/"	\
 | perl	\
  -p -e "s/(.*)Model( *)c8( *)3/\$1Model[0]\$2c8\$3 1\n\$1Model[1]\$2c9\$3 1\n\$1Model[2]\$2c10\$3 1/"	\
 | perl	\
  -p -e "s/(.*)WorldView( *)c5( *)3/\$1WorldView[0]\$2c5\$3 1\n\$1WorldView[1]\$2c6\$3 1\n\$1WorldView[2]\$2c7\$3 1/"	\
 | perl	\
  -p -e "s/(.*)WorldViewTranspose( *)c5( *)2/\$1WorldViewTranspose[0]\$2c5\$3 1\n\$1WorldViewTranspose[1]\$2c6\$3 1/"	\
 | perl	\
  -p -e "s/(.*)WorldViewTranspose( *)c5( *)3/\$1WorldViewTranspose[0]\$2c5\$3 1\n\$1WorldViewTranspose[1]\$2c6\$3 1\n\$1WorldViewTranspose[2]\$2c7\$3 1/"	\
 | perl	\
  -p -e "s/(.*)WorldViewTranspose( *)c4( *)2/\$1WorldViewTranspose[0]\$2c4\$3 1\n\$1WorldViewTranspose[1]\$2c5\$3 1/"	\
 | perl	\
  -p -e "s/(.*)WorldViewTranspose( *)c4( *)3/\$1WorldViewTranspose[0]\$2c4\$3 1\n\$1WorldViewTranspose[1]\$2c5\$3 1\n\$1WorldViewTranspose[2]\$2c6\$3 1/"	\
 | perl	\
  -p -e "s/(.*)SkinWorldView( *)c6( *)3/\$1SkinWorldView[0]\$2c6\$3 1\n\$1SkinWorldView[1]\$2c7\$3 1\n\$1SkinWorldView[2]\$2c8\$3 1/"	\
 | perl	\
  -p -e "s/(.*)SkinWorldViewTranspose( *)c6( *)2/\$1SkinWorldViewTranspose[0]\$2c6\$3 1\n\$1SkinWorldViewTranspose[1]\$2c7\$3 1/"	\
 | perl	\
  -p -e "s/(.*)SkinWorldViewTranspose( *)c6( *)3/\$1SkinWorldViewTranspose[0]\$2c6\$3 1\n\$1SkinWorldViewTranspose[1]\$2c7\$3 1\n\$1SkinWorldViewTranspose[2]\$2c8\$3 1/"	\
 | perl	\
  -p -e "s/(.*)SkinWorldViewTranspose( *)c5( *)2/\$1SkinWorldViewTranspose[0]\$2c5\$3 1\n\$1SkinWorldViewTranspose[1]\$2c6\$3 1/"	\
 | perl	\
  -p -e "s/(.*)SkinWorldViewTranspose( *)c5( *)3/\$1SkinWorldViewTranspose[0]\$2c5\$3 1\n\$1SkinWorldViewTranspose[1]\$2c6\$3 1\n\$1SkinWorldViewTranspose[2]\$2c7\$3 1/"	\
 | perl	\
  -p -e "s/(.*)ShadowProj( *)c21( *)4/\$1ShadowProj[0]\$2c21\$3 1\n\$1ShadowProj[1]\$2c22\$3 1\n\$1ShadowProj[2]\$2c23\$3 1\n\$1ShadowProj[3]\$2c24\$3 1/"	\
 | perl	\
  -p -e "s/(.*)ShadowProj( *)c28( *)4/\$1ShadowProj[0]\$2c28\$3 1\n\$1ShadowProj[1]\$2c29\$3 1\n\$1ShadowProj[2]\$2c30\$3 1\n\$1ShadowProj[3]\$2c31\$3 1/"	\
 | perl	\
  -p -e "s/(.*)Bones( *)c14( *)54/\$1Bones[0]\$2c14\$3 18\n\$1Bones[1]\$2c15\$3 18\n\$1Bones[2]\$2c16\$3 18/" 	\
 | perl	\
  -p -e "s/(.*)Bones( *)c42( *)54/\$1Bones[0]\$2c42\$3 18\n\$1Bones[1]\$2c43\$3 18\n\$1Bones[2]\$2c44\$3 18/" 	\
 | perl	\
  -p -e "s/(.*)Bones( *)c31( *)54/\$1Bones[0]\$2c31\$3 18\n\$1Bones[1]\$2c32\$3 18\n\$1Bones[2]\$2c33\$3 18/" 	\
 | perl	\
  -p -e "s/(.*)WindMatrices( *)c18( *)4/\$1WindMatrices[0]\$2c18\$3 1\n\$1WindMatrices[1]\$2c19\$3 1\n\$1WindMatrices[2]\$2c20\$3 1\n\$1WindMatrices[3]\$2c21\$3 1/" 	\
 | perl	\
  -p -e "s/(.*)WindMatrices( *)c18( *)16/\$1WindMatrices[0]\$2c18\$3 4\n\$1WindMatrices[1]\$2c19\$3 4\n\$1WindMatrices[2]\$2c20\$3 4\n\$1WindMatrices[3]\$2c21\$3 4/" 	\
 | perl	\
  -p -e "s/(.*)WindMatrices( *)c38( *)16/\$1WindMatrices[0]\$2c38\$3 4\n\$1WindMatrices[1]\$2c39\$3 4\n\$1WindMatrices[2]\$2c40\$3 4\n\$1WindMatrices[3]\$2c41\$3 4/" 	\
 | perl	\
  -p -e "s/(.*)SegmentData( *)c14( *)2/\$1SegmentData[0]\$2c14\$3 1\n\$1SegmentData[1]\$2c15\$3 1/"	\
 | perl	\
  -p -e "s/(.*)InstanceData( *)c20( *)2/\$1InstanceData[0]\$2c20\$3 1\n\$1InstanceData[1]\$2c21\$3 1/"	\
 | perl	\
  -p -e "s/(.*)InstanceData( *)c15( *)2/\$1InstanceData[0]\$2c15\$3 1\n\$1InstanceData[1]\$2c16\$3 1/"	\
 | perl	\
  -p -e "s/(.*)RotationMatrix( *)c8( *)2/\$1RotationMatrix[0]\$2c8\$3 1\n\$1RotationMatrix[1]\$2c9\$3 1/"	\
 | perl	\
  -p -e "s/(.*)TranslationMatrix( *)c8( *)2/\$1TranslationMatrix[0]\$2c8\$3 1\n\$1TranslationMatrix[1]\$2c9\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightData( *)c9( *)30/\$1LightData\$2c9\$3 20\n\$1LightData[20]\$2c29\$3 1\n\$1LightData[21]\$2c30\$3 1\n\$1LightData[22]\$2c31\$3 1\n\$1LightData[23]\$2c32\$3 1\n\$1LightData[24]\$2c33\$3 1\n\$1LightData[25]\$2c34\$3 1\n\$1LightData[26]\$2c35\$3 1\n\$1LightData[27]\$2c36\$3 1\n\$1LightData[28]\$2c37\$3 1\n\$1LightData[29]\$2c38\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightData( *)c9( *)20/\$1LightData\$2c9\$3 16\n\$1LightData[16]\$2c25\$3 1\n\$1LightData[17]\$2c26\$3 1\n\$1LightData[18]\$2c27\$3 1\n\$1LightData[19]\$2c28\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightData( *)c9( *)16/\$1LightData\$2c9\$3 8\n\$1LightData[8]\$2c17\$3 1\n\$1LightData[9]\$2c18\$3 1\n\$1LightData[10]\$2c19\$3 1\n\$1LightData[11]\$2c20\$3 1\n\$1LightData[12]\$2c21\$3 1\n\$1LightData[13]\$2c22\$3 1\n\$1LightData[14]\$2c23\$3 1\n\$1LightData[15]\$2c24\$3 1/"	\
 | perl	\
  -p -e "s/(.*)LightData( *)c9( *)8/\$1LightData[0]\$2c9\$3 1\n\$1LightData[1]\$2c10\$3 1\n\$1LightData[2]\$2c11\$3 1\n\$1LightData[3]\$2c12\$3 1\n\$1LightData[4]\$2c13\$3 1\n\$1LightData[5]\$2c14\$3 1\n\$1LightData[6]\$2c15\$3 1\n\$1LightData[7]\$2c16\$3 1/"	\
 | perl	\
  -p -e "s/(.*)DecalFade( *)c31( *)8/\$1DecalFade[0]\$2c31\$3 1\n\$1DecalFade[1]\$2c32\$3 1\n\$1DecalFade[2]\$2c33\$3 1\n\$1DecalFade[3]\$2c34\$3 1\n\$1DecalFade[4]\$2c35\$3 1\n\$1DecalFade[5]\$2c36\$3 1\n\$1DecalFade[6]\$2c37\$3 1\n\$1DecalFade[7]\$2c38\$3 1/"	\
 | perl	\
  -p -e "s/(.*)DecalProjection( *)c40( *)31/\$1DecalProjection\$2c40\$3 20\n\$1DecalProjection[20]\$2c60\$3 1\n\$1DecalProjection[21]\$2c61\$3 1\n\$1DecalProjection[22]\$2c62\$3 1\n\$1DecalProjection[23]\$2c63\$3 1\n\$1DecalProjection[24]\$2c64\$3 1\n\$1DecalProjection[25]\$2c65\$3 1\n\$1DecalProjection[26]\$2c66\$3 1\n\$1DecalProjection[27]\$2c67\$3 1\n\$1DecalProjection[28]\$2c68\$3 1\n\$1DecalProjection[29]\$2c69\$3 1\n\$1DecalProjection[30]\$2c70\$3 1/"	\
 | perl	\
  -p -e "s/(.*)DecalProjection( *)c40( *)20/\$1DecalProjection\$2c40\$3 16\n\$1DecalProjection[16]\$2c56\$3 1\n\$1DecalProjection[17]\$2c57\$3 1\n\$1DecalProjection[18]\$2c58\$3 1\n\$1DecalProjection[19]\$2c59\$3 1/"	\
 | perl	\
  -p -e "s/(.*)DecalProjection( *)c40( *)16/\$1DecalProjection\$2c40\$3 8\n\$1DecalProjection[8]\$2c48\$3 1\n\$1DecalProjection[9]\$2c49\$3 1\n\$1DecalProjection[10]\$2c50\$3 1\n\$1DecalProjection[11]\$2c51\$3 1\n\$1DecalProjection[12]\$2c52\$3 1\n\$1DecalProjection[13]\$2c53\$3 1\n\$1DecalProjection[14]\$2c54\$3 1\n\$1DecalProjection[15]\$2c55\$3 1/"	\
 | perl	\
  -p -e "s/(.*)DecalProjection( *)c40( *)8/\$1DecalProjection[0]\$2c40\$3 1\n\$1DecalProjection[1]\$2c41\$3 1\n\$1DecalProjection[2]\$2c42\$3 1\n\$1DecalProjection[3]\$2c43\$3 1\n\$1DecalProjection[4]\$2c44\$3 1\n\$1DecalProjection[5]\$2c45\$3 1\n\$1DecalProjection[6]\$2c46\$3 1\n\$1DecalProjection[7]\$2c47\$3 1/"	\
 | perl	\
  -p -e "s/(.*)PSDecalOffsets( *)c15( *)8/\$1PSDecalOffsets[0]\$2c15\$3 1\n\$1PSDecalOffsets[1]\$2c16\$3 1\n\$1PSDecalOffsets[2]\$2c17\$3 1\n\$1PSDecalOffsets[3]\$2c18\$3 1\n\$1PSDecalOffsets[4]\$2c19\$3 1\n\$1PSDecalOffsets[5]\$2c20\$3 1\n\$1PSDecalOffsets[6]\$2c21\$3 1\n\$1PSDecalOffsets[7]\$2c22\$3 1/"	\
 >$2

#   PSDecalOffsets  c15      8
#   DecalProjection c40     31
#   DecalFade       c31     8
#   LightData       c9      8
#   LightData       c9      16
#   LightData       c9      20
#   LightData       c9      30
# 9 10 11 12 13  14 15 16 17 18
# 9 10 11 12 13  14 15 16 17 18
# 9 10 11 12 13  14 15 16 17 18

#   SegmentData   c14      2
#   RotationMatrix c8       2
#   InstanceData  c20      2
#   InstanceData  c15      2
#   LightPosition  c16      2
#   LightColor     c19      2
#   TranslationMatrix c8       2

#   WorldViewProj       c0       4
#   ModelViewProj       c0       4
#   SkinModelViewProj   c1       4
#   PSLightColor        c2       3
#   WorldViewTranspose  c4       3
#   SkinModelViewProj   c4       4
#   WorldMat            c4       4
#   BlendColor          c4       3
#   WorldViewTranspose  c5       3
#   SkinWorldViewTranspose c5       3
#   SkinWorldViewTranspose c6       3
#   WorldView           c5       3
#   SkinWorldView       c6       3
#   ObjToCubeSpace      c8       3
#   ObjToCubeSpace      c8       4
#   ObjToCubeMap        c8       4
#   Model               c8       3
#   ModelViewProj       c9       4
#   SkinToCubeSpace     c9       3
#   ObjToCubeSpace      c10      3
#   ObjToCubeMap        c10      4
#   LightDirection      c13      1
#   LightPosition       c16      3
#   LightColor          c19      2
#   LightColor          c19      3
#   ShadowProj          c21      4
#   SkinToCubeSpace     c27      3
#   ShadowProj          c28      4
#   Bones               c31     54
#   Bones               c42     54
#   Bones               c14     54

# ...
#   LightData       c4      1
#   LightData       c10     1
#   LightData       c9      8
#   LightData       c9      16
#   LightData       c9      20
#   LightData       c9      30
#   WindMatrices   const_18     16
#   Leaf
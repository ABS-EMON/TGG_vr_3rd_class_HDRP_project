// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using Boxophobic.StyledGUI;
using UnityEngine.Rendering;
using System.Collections.Generic;
using System.Globalization;

#if UNITY_EDITOR
using UnityEditor;
#endif

namespace TheVisualEngineLite
{
    public class TVELiteUtils
    {
        const string minimumVersionFor2021_3 = "2021.3.35";
        const string minimumVersionFor2022_3 = "2022.3.18";
        const string minimumVersionFor6000_0 = "6000.0.23";
        const string minimumVersionFor6000_1 = "6000.1.0";

        // Settings Utils
        public static void SetMaterialSettings(Material material)
        {
            var shaderName = material.shader.name;
            var projectPipeline = TVELiteUtils.GetProjectPipeline();

            if (!material.HasProperty("_IsTVEShader"))
            {
                return;
            }

            if (!material.HasProperty("_IsLiteShader"))
            {
                return;
            }

            if (material.HasProperty("_IsVersion"))
            {
                var version = material.GetInt("_IsVersion");
                if (version < 1100)
                {
                    if (material.shader.name == ("BOXOPHOBIC/The Visual Engine Lite/Geometry/Plant Standard Lit"))
                    {
                        material.SetFloat("_SubsurfaceValue", 0);
                        material.SetFloat("_MotionValue_30", 0);
                    }

                    if (material.HasProperty("_DetailMeshMode"))
                    {
                        var mode = material.GetInt("_DetailMeshMode");

                        if (mode == 0)
                        {
                            material.SetFloat("_DetailMeshMode", 30);
                        }

                        if (mode == 1)
                        {
                            material.SetFloat("_DetailMeshMode", 0);
                        }
                    }

                    material.SetInt("_IsVersion", 1100);
                }

                // Bumped version because 1200 was used before by mistake
                if (version < 1201)
                {
                    if (material.HasProperty("_EmissiveColor"))
                    {
                        var color = material.GetColor("_EmissiveColor");

                        if (material.GetColor("_EmissiveColor").r > 0 || material.GetColor("_EmissiveColor").g > 0 || material.GetColor("_EmissiveColor").b > 0)
                        {
                            material.SetInt("_EmissiveMode", 1);
                        }
                    }

                    material.SetInt("_IsVersion", 1201);
                }

                // Refresh is needed to apply new keywords
                if (version < 1230)
                {
                    material.SetInt("_IsVersion", 1230);
                }


#if UNITY_EDITOR
                if (version < 1400)
                {
                    int isPlant = 1;

                    string oldShader = material.shader.name;
                    Shader newShader = null;

                    if (oldShader.Contains("Prop"))
                    {
                        isPlant = 0;

                        if (oldShader.Contains("Impostor"))
                        {
                            if (oldShader.Contains("Standard"))
                            {
                                newShader = Shader.Find("BOXOPHOBIC/The Visual Engine/Impostors/Octa Standard Lit (Lite)");
                            }

                            if (oldShader.Contains("Subsurface"))
                            {
                                newShader = Shader.Find("BOXOPHOBIC/The Visual Engine/Impostors/Octa Subsurface Lit (Lite)");
                            }
                        }
                        else
                        {
                            if (oldShader.Contains("Standard"))
                            {
                                newShader = Shader.Find("BOXOPHOBIC/The Visual Engine/Geometry/General Standard Lit (Lite)");
                            }

                            if (oldShader.Contains("Subsurface"))
                            {
                                newShader = Shader.Find("BOXOPHOBIC/The Visual Engine/Geometry/General Subsurface Lit (Lite)");
                            }
                        }
                    }

                    if (newShader != null)
                    {
                        material.shader = newShader;
                    }

                    // Render
                    material.SetFloat("_RenderNormal", GetMaterialSerializedFloat(material, "_RenderNormals", 0.0f));

                    // Globals
                    material.SetFloat("_GlobalPaintLayerValue", GetMaterialSerializedFloat(material, "_LayerColorsValue", 0.0f));
                    material.SetFloat("_GlobalGlowLayerValue", GetMaterialSerializedFloat(material, "_LayerColorsValue", 0.0f));
                    material.SetFloat("_GlobalAtmoLayerValue", GetMaterialSerializedFloat(material, "_LayerExtrasValue", 0.0f));
                    material.SetFloat("_GLobalFormLayerValue", GetMaterialSerializedFloat(material, "_LayerVertexValue", 0.0f));
                    material.SetFloat("_GlobalFlowLayerValue", GetMaterialSerializedFloat(material, "_LayerMotionValue", 0.0f));

                    material.SetFloat("_GlobalPaintPivotValue", GetMaterialSerializedFloat(material, "_ColorsPositionMode", 0.0f));
                    material.SetFloat("_GlobalGlowPivotValue", GetMaterialSerializedFloat(material, "_ColorsPositionMode", 0.0f));
                    material.SetFloat("_GlobalAtmoPivotValue", GetMaterialSerializedFloat(material, "_ExtrasPositionMode", 0.0f));
                    material.SetFloat("_GlobalFormPivotValue", GetMaterialSerializedFloat(material, "_VertexPositionMode", 1.0f));
                    material.SetFloat("_GlobalFlowPivotValue", GetMaterialSerializedFloat(material, "_MotionPositionMode", 0.5f));

                    material.SetFloat("_TintingIntensityValue", GetMaterialSerializedFloat(material, "_GlobalColors", 0.0f));
                    material.SetFloat("_OverlayIntensityValue", GetMaterialSerializedFloat(material, "_GlobalOverlay", 0.0f));
                    material.SetFloat("_OverlayProjValue", GetMaterialSerializedFloat(material, "_OverlayProjectionValue", 0.5f));
                    material.SetFloat("_WetnessIntensityValue", GetMaterialSerializedFloat(material, "_GlobalWetness", 0.0f));
                    material.SetFloat("_EmissiveIntensityValue", GetMaterialSerializedFloat(material, "_GlobalEmissive", 0.0f));
                    material.SetFloat("_CutoutIntensityValue", GetMaterialSerializedFloat(material, "_GlobalAlpha", 0.0f) * isPlant);

                    // Main
                    material.SetTexture("_MainShaderTex", GetMaterialSerializedTexture(material, "_MainMaskTex", null));
                    material.SetFloat("_MainCoordMode", GetMaterialSerializedFloat(material, "_MainUVScaleMode", 0));
                    material.SetVector("_MainCoordValue", GetMaterialSerializedVector(material, "_MainUVs", new Vector4(1, 1, 0, 0)));
                    material.SetFloat("_MainAlphaClipValue", GetMaterialSerializedFloat(material, "_AlphaClipValue", 0.5f));

                    material.SetVector("_MainMultiRemap", GetMaterialSerializedVector(material, "_MainMaskMinValue", "_MainMaskMaxValue", Vector4.zero));

                    // Second
                    var secondMode = (int)GetMaterialSerializedFloat(material, "_DetailMode", 0.0f);

                    if (secondMode == 0)
                    {
                        material.SetFloat("_SecondIntensityValue", 0);
                    }

                    if (secondMode == 1)
                    {
                        material.SetFloat("_SecondIntensityValue", GetMaterialSerializedFloat(material, "_DetailValue", 0.0f));
                    }

                    material.SetTexture("_SecondShaderTex", GetMaterialSerializedTexture(material, "_SecondMaskTex", null));

                    material.SetFloat("_SecondSampleMode", GetMaterialSerializedFloat(material, "_SecondUVsMode", 0));
                    material.SetFloat("_SecondCoordMode", GetMaterialSerializedFloat(material, "_SecondUVScaleMode", 0));
                    material.SetVector("_SecondCoordValue", GetMaterialSerializedVector(material, "_SecondUVs", new Vector4(1, 1, 0, 0)));

                    material.SetFloat("_SecondAlphaClipValue", GetMaterialSerializedFloat(material, "_AlphaClipValue", 0.5f));
                    material.SetVector("_SecondMultiRemap", GetMaterialSerializedVector(material, "_SecondMaskMinValue", "_SecondMaskMaxValue", Vector4.zero));

                    material.SetFloat("_SecondBlendAlbedoValue", 1 - GetMaterialSerializedFloat(material, "_DetailBlendMode", 1.0f));
                    material.SetFloat("_SecondBlendNormalValue", GetMaterialSerializedFloat(material, "_DetailNormalValue", 0.0f));
                    material.SetFloat("_SecondBlendAlphaValue", 1 - GetMaterialSerializedFloat(material, "_DetailAlphaMode", 1.0f));

                    var secondMeshMode = (int)GetMaterialSerializedFloat(material, "_DetailMeshMode", 0.0f);

                    if (secondMeshMode == 0)
                    {
                        material.SetFloat("_SecondProjValue", 0);
                        material.SetVector("_SecondProjRemap", Vector4.zero);
                        material.SetFloat("_SecondMeshValue", 1);
                        material.SetVector("_SecondMeshRemap", GetMaterialSerializedVector(material, "_SecondMeshMinValue", "_SecondMeshMaxValue", new Vector4(0, 1, 0, 0)));
                    }

                    if (secondMeshMode == 1)
                    {
                        material.SetFloat("_SecondProjValue", 1);
                        material.SetVector("_SecondProjRemap", GetMaterialSerializedVector(material, "_SecondMeshMinValue", "_SecondMeshMaxValue", new Vector4(0, 1, 0, 0)));
                        material.SetFloat("_SecondMeshValue", 0);
                        material.SetVector("_SecondMeshRemap", Vector4.zero);
                    }

                    var secondMaskMode = (int)GetMaterialSerializedFloat(material, "_DetailMaskMode", 0.0f);

                    if (secondMaskMode == 0)
                    {
                        material.SetTexture("_SecondMaskTex", GetMaterialSerializedTexture(material, "_MainMaskTex", null));
                    }

                    if (secondMaskMode == 1)
                    {
                        material.SetTexture("_SecondMaskTex", GetMaterialSerializedTexture(material, "_SecondMaskTex", null));
                    }

                    var secondMaskRemap = GetMaterialSerializedVector(material, "_DetailMaskMinValue", "_DetailMaskMaxValue", new Vector4(0, 1, 0, 0));

                    if (secondMaskRemap.x == 0 && secondMaskRemap.y == 0)
                    {
                        material.SetFloat("_SecondMaskValue", 0);
                        material.SetVector("_SecondMaskRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_SecondMaskValue", 1);
                        material.SetVector("_SecondMaskRemap", GetMaterialSerializedVector(material, "_DetailMaskMinValue", "_DetailMaskMaxValue", new Vector4(0, 1, 0, 0)));
                    }

                    material.SetVector("_SecondBlendRemap", GetMaterialSerializedVector(material, "_DetailBlendMinValue", "_DetailBlendMaxValue", new Vector4(0, 1, 0, 0)));

                    // Occlusion
                    var occlusionColor = GetMaterialSerializedVector(material, "_VertexOcclusionColor", Vector4.zero);
                    var occlusionValue = (occlusionColor.x + occlusionColor.y + occlusionColor.z) / 3;

                    if (occlusionValue != 1)
                    {
                        material.SetFloat("_OcclusionIntensityValue", 1);
                    }

                    material.SetVector("_OcclusionColorTwo", GetMaterialSerializedVector(material, "_VertexOcclusionColor", Vector4.one));
                    material.SetVector("_OcclusionMeshRemap", GetMaterialSerializedVector(material, "_VertexOcclusionMinValue", "_VertexOcclusionMaxValue", new Vector4(0, 1, 0, 0)));

                    // Gradient
                    if (isPlant == 1)
                    {
                        var gradientColor1 = GetMaterialSerializedVector(material, "_GradientColorOne", Vector4.one);
                        var gradientColor2 = GetMaterialSerializedVector(material, "_GradientColorTwo", Vector4.one);
                        var gradientValue = (gradientColor1.x + gradientColor1.y + gradientColor1.z + gradientColor2.x + gradientColor2.y + gradientColor2.z) / 6;

                        if (gradientValue != 1)
                        {
                            material.SetFloat("_GradientIntensityValue", 1);
                        }

                        material.SetVector("_GradientMeshRemap", GetMaterialSerializedVector(material, "_GradientMaskMinValue", "_GradientMaskMaxValue", new Vector4(0, 1, 0, 0)));
                    }

                    // Emissive
                    var emissiveMode = (int)GetMaterialSerializedFloat(material, "_EmissiveMode", 0.0f);

                    if (emissiveMode == 0)
                    {
                        material.SetFloat("_EmissiveIntensityValue", 0);
                    }

                    if (emissiveMode == 1)
                    {
                        material.SetFloat("_EmissiveIntensityValue", GetMaterialSerializedFloat(material, "_EmissivePhaseValue", 0.0f));
                    }

                    material.SetVector("_EmissiveCoordValue", GetMaterialSerializedVector(material, "_EmissiveUVs", new Vector4(1, 1, 0, 0)));

                    material.SetFloat("_EmissivePowerMode", GetMaterialSerializedFloat(material, "_EmissiveIntensityMode", 0.0f));
                    material.SetFloat("_EmissivePowerValue", GetMaterialSerializedFloat(material, "_EmissiveIntensityValue", 1.0f));
                    material.SetTexture("_EmissiveMaskTex", GetMaterialSerializedTexture(material, "_EmissiveTex", null));

                    var emissiveMaskRemap = GetMaterialSerializedVector(material, "_EmissiveTexMinValue", "_EmissiveTexMinValue", new Vector4(0, 1, 0, 0));

                    if (emissiveMaskRemap.x == 0 && emissiveMaskRemap.y == 0)
                    {
                        material.SetFloat("_EmissiveMaskValue", 0);
                        material.SetVector("_EmissiveMaskRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_EmissiveMaskValue", 1);
                        material.SetVector("_EmissiveMaskRemap", GetMaterialSerializedVector(material, "_EmissiveTexMinValue", "_EmissiveTexMaxValue", new Vector4(0, 1, 0, 0)));
                    }

                    // Subsurface
                    material.SetFloat("_SubsurfaceIntensityValue", GetMaterialSerializedFloat(material, "_SubsurfaceValue", 0.0f) * isPlant);
                    material.SetFloat("_SubsurfaceMultiValue", GetMaterialSerializedFloat(material, "_SubsurfaceMaskValue", 1.0f));

                    // Size Fade
                    if (GetMaterialSerializedFloat(material, "_SizeFadeStartValue", 0.0f) > 0 || GetMaterialSerializedFloat(material, "_SizeFadeEndValue", 0.0f) > 0 || GetMaterialSerializedFloat(material, "_GlobalSize", 0.0f) > 0)
                    {
                        material.SetFloat("_SizeFadeIntensityValue", 1);
                    }

                    material.SetFloat("_SizeFadeElementMode", GetMaterialSerializedFloat(material, "_GlobalSize", 1.0f));

                    material.SetFloat("_SizeFadeDistMinValue", GetMaterialSerializedFloat(material, "_SizeFadeStartValue", 0.0f));
                    material.SetFloat("_SizeFadeDistMaxValue", GetMaterialSerializedFloat(material, "_SizeFadeEndValue", 0.0f));

                    // Perspective
                    material.SetFloat("_PerspectiveIntensityValue", GetMaterialSerializedFloat(material, "_PerspectivePushValue", 0.0f));

                    // Vertex
                    var pivotsMode = GetMaterialSerializedFloat(material, "_VertexPivotMode", 0.0f);

                    if (pivotsMode == 1)
                    {
                        material.SetFloat("_ObjectPivotMode", 2);
                    }

                    var boundsRadius = 1.0f;
                    var boundsHeight = 1.0f;

                    var boundsData = GetMaterialSerializedVector(material, "_MaxBoundsInfo", Vector4.one);

                    if (boundsData.x == 0)
                    {
                        boundsRadius = GetMaterialSerializedFloat(material, "_BoundsRadiusValue", 1.0f);
                    }
                    else
                    {
                        boundsRadius = boundsData.x;
                    }

                    if (boundsData.y == 0)
                    {
                        boundsHeight = GetMaterialSerializedFloat(material, "_BoundsHeightValue", 1.0f);
                    }
                    else
                    {
                        boundsHeight = boundsData.y;
                    }

                    material.SetFloat("_ObjectRadiusValue", Mathf.Round(boundsRadius * 100) / 100);
                    material.SetFloat("_ObjectHeightValue", Mathf.Round(boundsHeight * 100) / 100);

                    // Motion
                    var highlight = GetMaterialSerializedVector(material, "_MotionHighlightColor", Vector4.zero);

                    material.SetFloat("_MotionHighlightValue", Mathf.Max(Mathf.Max(highlight.x, highlight.y), highlight.z) / 10 * isPlant);

                    material.SetFloat("_MotionSmallSquashValue", GetMaterialSerializedFloat(material, "_MotionAmplitude_20", 0.0f) * isPlant);

                    // Must be tree
                    if (pivotsMode == 0)
                    {
                        material.SetFloat("_MotionBaseIntensityValue", GetMaterialSerializedFloat(material, "_MotionAmplitude_10", 0.0f) * 1.0f * isPlant);

                        //material.SetFloat("_MotionBasePivotValue", Mathf.Clamp01(boundsData.y / 10));
                        //material.SetFloat("_MotionSmallPivotValue", Mathf.Clamp01(boundsData.y / 20));

                        material.SetFloat("_MotionBasePivotValue", 0.8f);
                        material.SetFloat("_MotionSmallPivotValue", 0.6f);
                    }

                    // Must be grass
                    if (pivotsMode == 1)
                    {
                        material.SetFloat("_MotionBaseIntensityValue", GetMaterialSerializedFloat(material, "_MotionAmplitude_10", 0.0f) * 2.0f * isPlant);

                        material.SetFloat("_MotionBasePivotValue", 0.0f);
                        material.SetFloat("_MotionSmallPivotValue", 0.0f);
                    }

                    if (GetMaterialSerializedFloat(material, "_MotionVariation_10", 0.0f) > 0)
                    {
                        material.SetFloat("_MotionBasePhaseValue", 0.2f);
                    }

                    if (GetMaterialSerializedFloat(material, "_MotionVariation_20", 0.0f) > 0)
                    {
                        material.SetFloat("_MotionSmallPhaseValue", 0.5f);
                    }

                    material.SetFloat("_MotionTinyIntensityValue", GetMaterialSerializedFloat(material, "_MotionAmplitude_32", 0.0f) * isPlant);
                    material.SetFloat("_MotionTinyTillingValue", GetMaterialSerializedFloat(material, "_MotionScale_32", 20.0f));
                    material.SetFloat("_MotionTinySpeedValue", GetMaterialSerializedFloat(material, "_MotionSpeed_32", 20.0f));
                    material.SetFloat("_MotionTinyPhaseValue", GetMaterialSerializedFloat(material, "_MotionVariation_32", 0.0f) / 40);

                    material.SetFloat("_MotionPushIntensityValue", GetMaterialSerializedFloat(material, "_InteractionAmplitude", 0.0f) * isPlant);
                    material.SetFloat("_MotionPushElementMode", isPlant);

                    if (material.shader.name.Contains("Lite"))
                    {
                        var occlusionMask = GetMaterialSerializedFloat(material, "_VertexOcclusionMaskMode", 0.0f);

                        if (occlusionMask == 0)
                        {
                            material.SetFloat("_OcclusionMeshMode", 5);
                        }
                        else
                        {
                            material.SetFloat("_OcclusionMeshMode", occlusionMask / 10 - 1);
                        }

                        var gradientMask = GetMaterialSerializedFloat(material, "_GradientMaskMode", 0.0f);

                        if (gradientMask == 0)
                        {
                            material.SetFloat("_GradientMeshMode", 4);
                        }
                        else
                        {
                            material.SetFloat("_GradientMeshMode", occlusionMask / 10 - 1);
                        }

                        var phaseMode = GetMaterialSerializedFloat(material, "_MotionVariationMode", 0.0f);

                        if (phaseMode == 0)
                        {
                            material.SetFloat("_MotionBasePhaseValue", 0);
                            material.SetFloat("_MotionSmallPhaseValue", 0);
                        }
                        else
                        {
                            material.SetFloat("_ObjectPhaseMode", phaseMode / 10 - 1);
                        }

                        // Lite uses automatic height mask
                        material.SetFloat("_MotionBaseMaskMode", 4);

                        var motionSmallMask = GetMaterialSerializedFloat(material, "_MotionMaskMode_20", 0.0f);

                        if (motionSmallMask == 0)
                        {
                            material.SetFloat("_MotionSmallMaskMode", 5);
                        }
                        else
                        {
                            material.SetFloat("_MotionSmallMaskMode", motionSmallMask / 10 - 1);
                        }

                        var motionTinyMask = GetMaterialSerializedFloat(material, "_MotionMaskMode_30", 0.0f);

                        if (motionTinyMask == 0)
                        {
                            material.SetFloat("_MotionTinyMaskMode", 8);
                        }
                        else
                        {
                            material.SetFloat("_MotionTinyMaskMode", motionTinyMask / 10 - 1);
                        }
                    }

                    // Impostors
                    material.SetTexture("_MasksA", GetMaterialSerializedTexture(material, "_Mask", null));
                    material.SetFloat("_ImpostorAlphaClipValue", GetMaterialSerializedFloat(material, "_AI_Clip", 0.5f));

                    material.SetInt("_IsConverted", 1);
                    material.SetInt("_IsVersion", 1400);
                }

                if (version < 1410)
                {
                    // Second Layer
                    var secondMask = GetMaterialSerializedVector(material, "_SecondMaskRemap", Vector4.zero);

                    if (secondMask.x == 0 && secondMask.y == 0)
                    {
                        material.SetFloat("_SecondMaskValue", 0);
                        material.SetVector("_SecondMaskRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_SecondMaskValue", 1);
                    }

                    var secondProj = GetMaterialSerializedVector(material, "_SecondProjRemap", Vector4.zero);

                    if (secondProj.x == 0 && secondProj.y == 0)
                    {
                        material.SetFloat("_SecondProjValue", 0);
                        material.SetVector("_SecondProjRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_SecondProjValue", 1);
                    }

                    var secondMesh = GetMaterialSerializedVector(material, "_SecondMeshRemap", Vector4.zero);

                    if (secondMesh.x == 0 && secondMesh.y == 0)
                    {
                        material.SetFloat("_SecondMeshValue", 0);
                        material.SetVector("_SecondMeshRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_SecondMeshValue", 1);
                    }

                    // Third Layer
                    var thirdMask = GetMaterialSerializedVector(material, "_ThirdMaskRemap", Vector4.zero);

                    if (thirdMask.x == 0 && thirdMask.y == 0)
                    {
                        material.SetFloat("_ThirdMaskValue", 0);
                        material.SetVector("_ThirdMaskRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_ThirdMaskValue", 1);
                    }

                    var thirdProj = GetMaterialSerializedVector(material, "_ThirdProjRemap", Vector4.zero);

                    if (thirdProj.x == 0 && thirdProj.y == 0)
                    {
                        material.SetFloat("_ThirdProjValue", 0);
                        material.SetVector("_ThirdProjRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_ThirdProjValue", 1);
                    }

                    var thirdMesh = GetMaterialSerializedVector(material, "_ThirdMeshRemap", Vector4.zero);

                    if (thirdMesh.x == 0 && thirdMesh.y == 0)
                    {
                        material.SetFloat("_ThirdMeshValue", 0);
                        material.SetVector("_ThirdMeshRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_ThirdMeshValue", 1);
                    }

                    // Tinting Layer
                    var tintingMesh = GetMaterialSerializedVector(material, "_TintingMeshRemap", Vector4.zero);

                    if (tintingMesh.x == 0 && tintingMesh.y == 0)
                    {
                        material.SetFloat("_TintingMeshValue", 0);
                        material.SetVector("_TintingMeshRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_TintingMeshValue", 1);
                    }

                    // Dryness Layer
                    var drynessMesh = GetMaterialSerializedVector(material, "_DrynessMeshRemap", Vector4.zero);

                    if (drynessMesh.x == 0 && drynessMesh.y == 0)
                    {
                        material.SetFloat("_DrynessMeshValue", 0);
                        material.SetVector("_DrynessMeshRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_DrynessMeshValue", 1);
                    }

                    // Overlay Layer
                    var overlayMesh = GetMaterialSerializedVector(material, "_OverlayMeshRemap", Vector4.zero);

                    if (overlayMesh.x == 0 && overlayMesh.y == 0)
                    {
                        material.SetFloat("_OverlayMeshValue", 0);
                        material.SetVector("_OverlayMeshRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_OverlayMeshValue", 1);
                    }

                    // Cutout Layer
                    var cutoutMesh = GetMaterialSerializedVector(material, "_CutoutMeshRemap", Vector4.zero);

                    if (cutoutMesh.x == 0 && cutoutMesh.y == 0)
                    {
                        material.SetFloat("_CutoutMeshValue", 0);
                        material.SetVector("_CutoutMeshRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_CutoutMeshValue", 1);
                    }

                    // Emissive Layer
                    var emissiveMask = GetMaterialSerializedVector(material, "_EmissiveMaskRemap", Vector4.zero);

                    if (emissiveMask.x == 0 && emissiveMask.y == 0)
                    {
                        material.SetFloat("_EmissiveMaskValue", 0);
                        material.SetVector("_EmissiveMaskRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_EmissiveMaskValue", 1);
                    }

                    var emissiveMesh = GetMaterialSerializedVector(material, "_EmissiveMeshRemap", Vector4.zero);

                    if (emissiveMesh.x == 0 && emissiveMesh.y == 0)
                    {
                        material.SetFloat("_EmissiveMeshValue", 0);
                        material.SetVector("_EmissiveMeshRemap", new Vector4(0, 1, 0, 0));
                    }
                    else
                    {
                        material.SetFloat("_EmissiveMeshValue", 1);
                    }

                    // Decoupe bounds from Small Motion
                    var objectRadius = GetMaterialSerializedFloat(material, "_ObjectRadiusValue", 1);
                    var motionSmall = GetMaterialSerializedFloat(material, "_MotionSmallIntensityValue", 0);

                    material.SetFloat("_MotionSmallIntensityValue", motionSmall * objectRadius);

                    material.SetInt("_IsVersion", 1410);
                }

                if (version < 2020)
                {
                    // Typo fix
                    material.SetFloat("_ThirdBlendIntensityValue", GetMaterialSerializedFloat(material, "_ThitdBlendIntensityValue", 1));
                    material.SetFloat("_ThirdBlendShaderValue", GetMaterialSerializedFloat(material, "_ThitdBlendShaderValue", 1));

                    material.SetInt("_IsVersion", 2020);
                }

                if (version < 2030)
                {
                    // Optimize tex if not used
                    if (material.HasProperty("_SecondMaskValue"))
                    {
                        var value = material.GetFloat("_SecondMaskValue");

                        if (value == 0)
                        {
                            if (material.HasProperty("_SecondMaskTex"))
                            {
                                material.SetTexture("_SecondMaskTex", null);
                            }
                        }
                    }

                    // Optimize tex if not used
                    if (material.HasProperty("_ThirdMaskValue"))
                    {
                        var value = material.GetFloat("_ThirdMaskValue");

                        if (value == 0)
                        {
                            if (material.HasProperty("_ThirdMaskTex"))
                            {
                                material.SetTexture("_ThirdMaskTex", null);
                            }
                        }
                    }

                    if (material.HasProperty("_MotionNoiseTex"))
                    {
                        material.SetTexture("_MotionNoiseTex", Resources.Load<CustomRenderTexture>("Internal MotionTexRTLite"));
                    }

                    material.SetInt("_IsVersion", 2030);
                }

                if (version < 2040)
                {
                    if (shaderName.Contains("Impostors"))
                    {
                        var impostorMask = GetMaterialSerializedTexture(material, "_MasksA", null);

                        if (impostorMask != null)
                        {
                            if (impostorMask.name.EndsWith("MasksA"))
                            {
                                // New shading format
                                material.SetInt("_ImpostorMaskMode", 3);
                                material.SetTexture("_Shader", impostorMask);
                            }
                            else
                            {
                                // Old packed format
                                material.SetInt("_ImpostorMaskMode", 2);
                                material.SetTexture("_Packed", impostorMask);
                            }
                        }

                        // Set previously not supported to 0
                        material.SetFloat("_TintingMeshValue", 0);
                        material.SetFloat("_DrynessMeshValue", 0);
                        material.SetFloat("_OverlayMeshValue", 0);
                        material.SetFloat("_CutoutMeshValue", 0);

                        material.SetFloat("_ImpostorOcclusionValue", 0);
                    }

                    // Update Proximity
                    material.SetFloat("_DitherProximityMinValue", GetMaterialSerializedFloat(material, "_DitherProximityDistValue", 1));

                    // Set Motion Textures
                    if (material.HasProperty("_MotionNoiseTex"))
                    {
                        material.SetTexture("_MotionNoiseTex", Resources.Load<Texture2D>("Internal MotionTex"));
                    }

                    if (material.HasProperty("_MotionNoiseTexRT"))
                    {
                        material.SetTexture("_MotionNoiseTexRT", Resources.Load<CustomRenderTexture>("Internal MotionTexRT"));
                    }

                    // Copy Motion Settings
                    material.SetFloat("_MotionBaseSpeedValue", GetMaterialSerializedFloat(material, "_MotionSpeedValue", 5));
                    material.SetFloat("_MotionBaseTillingValue", GetMaterialSerializedFloat(material, "_MotionTillingValue", 5));

                    material.SetFloat("_MotionSmallSpeedValue", GetMaterialSerializedFloat(material, "_MotionSpeedValue", 5));
                    material.SetFloat("_MotionSmallTillingValue", GetMaterialSerializedFloat(material, "_MotionTillingValue", 5));

                    material.SetFloat("_MotionBaseDelayValue", GetMaterialSerializedFloat(material, "_MotionDelayValue", 0));

                    material.SetInt("_IsVersion", 2040);
                }

                if (version < 2050)
                {
                    // Typo fix
                    material.SetVector("_OverlayBlendRemap", GetMaterialSerializedVector(material, "_OverlayBlendRemap1", new Vector4(0.1f, 0.2f, 0, 0)));

                    // Set global sliders
                    // Set global sliders                  
                    if (GetMaterialSerializedFloat(material, "_SecondElementMode", 1) == 0)
                    {
                        material.SetFloat("_SecondGlobalValue", 0);
                    }

                    if (GetMaterialSerializedFloat(material, "_ThirdElementMode", 1) == 0)
                    {
                        material.SetFloat("_ThirdGlobalValue", 0);
                    }

                    if (GetMaterialSerializedFloat(material, "_TerrainElementMode", 1) == 0)
                    {
                        material.SetFloat("_TerrainGlobalValue", 0);
                    }

                    if (GetMaterialSerializedFloat(material, "_TintingElementMode", 1) == 0)
                    {
                        material.SetFloat("_TintingGlobalValue", 0);
                    }

                    if (GetMaterialSerializedFloat(material, "_DrynessElementMode", 1) == 0)
                    {
                        material.SetFloat("_DrynessGlobalValue", 0);
                    }

                    if (GetMaterialSerializedFloat(material, "_OverlayElementMode", 1) == 0)
                    {
                        material.SetFloat("_OverlayGlobalValue", 0);
                    }

                    if (GetMaterialSerializedFloat(material, "_WetnessElementMode", 1) == 0)
                    {
                        material.SetFloat("_WetnessGlobalValue", 0);
                    }

                    if (GetMaterialSerializedFloat(material, "_CutoutElementMode", 1) == 0)
                    {
                        material.SetFloat("_CutoutGlobalValue", 0);
                    }

                    if (GetMaterialSerializedFloat(material, "_EmissiveElementMode", 1) == 0)
                    {
                        material.SetFloat("_EmissiveGlobalValue", 0);
                    }

                    if (GetMaterialSerializedFloat(material, "_SubsurfaceElementMode", 1) == 0)
                    {
                        material.SetFloat("_SubsurfaceGlobalValue", 0);
                    }

                    if (GetMaterialSerializedFloat(material, "_SizefadeElementMode", 1) == 0)
                    {
                        material.SetFloat("_SizeFadeGlobalValue", 0);
                    }

                    // Global Pivots
                    material.SetFloat("_GlobalMoveLayerValue", GetMaterialSerializedFloat(material, "_MotionPushLayerValue", 0f));
                    material.SetFloat("_GlobalMovePivotValue", GetMaterialSerializedFloat(material, "_MotionPushPivotValue", 1f));
                    material.SetFloat("_MotionElementMode", GetMaterialSerializedFloat(material, "_MotionPushElementMode", 0f));

                    // Wind Mode
                    var windMode = GetMaterialSerializedFloat(material, "_MotionWindMode", 1);

                    if (windMode == 0 || windMode == 1)
                    {
                        // Copy motion tilling for Optimized Mode, but keep Advanced mode unchanged
                        material.SetFloat("_MotionBaseTillingValue", GetMaterialSerializedFloat(material, "_MotionTillingValue", 5));
                        material.SetFloat("_MotionSmallTillingValue", GetMaterialSerializedFloat(material, "_MotionTillingValue", 5));
                    }

                    var motionWave = GetMaterialSerializedFloat(material, "_MotionHighlightValue", 0);
                    var motionBase = GetMaterialSerializedFloat(material, "_MotionBaseIntensityValue", 0);
                    var motionSmall = GetMaterialSerializedFloat(material, "_MotionSmallIntensityValue", 0);
                    var motionTiny = GetMaterialSerializedFloat(material, "_MotionTinyIntensityValue", 0);
                    var motionPush = GetMaterialSerializedFloat(material, "_MotionPushIntensityValue", 0);

                    var motionEnabled = motionWave + motionBase + motionSmall + motionTiny;

                    if (motionEnabled == 0)
                    {
                        material.SetFloat("_MotionIntensityValue", 0);
                    }

                    if (motionPush > 0)
                    {
                        material.SetFloat("_MotionPushElementMode", 1);
                    }
                    else
                    {
                        material.SetFloat("_MotionPushElementMode", 0);
                    }

                    material.SetFloat("_MotionTinyTillingValue", GetMaterialSerializedFloat(material, "_MotionTinyTillingValue", 20) * 2.5f);
                    material.SetFloat("_MotionTinySpeedValue", GetMaterialSerializedFloat(material, "_MotionTinySpeedValue", 20) * 0.5f);
                    material.SetFloat("_MotionBasePhaseValue", GetMaterialSerializedFloat(material, "_MotionBasePhaseValue", 0) * 0.5f);
                    material.SetFloat("_MotionSmallPhaseValue", GetMaterialSerializedFloat(material, "_MotionSmallPhaseValue", 0) * 0.5f);

                    material.SetInt("_IsVersion", 2050);
                }
#endif

            }

            // Set Internal Render Values
            if (material.HasProperty("_RenderCull"))
            {
                material.SetInt("_render_cull", material.GetInt("_RenderCull"));
            }

            if (material.HasProperty("_RenderZWrite"))
            {
                material.SetInt("_render_zw", material.GetInt("_RenderZWrite"));
            }

            int renderMode = GetMaterialInt(material, "_RenderMode");
            int renderClip = GetMaterialInt(material, "_RenderClip") + GetMaterialInt(material, "_DitherConstantValue") + GetMaterialInt(material, "_CutoutIntensityValue");
            int renderDecals = GetMaterialInt(material, "_RenderDecals");
            int renderSSR = GetMaterialInt(material, "_RenderDecals");

            int queue = 0;
            int priority = 0;

            if (material.HasProperty("_RenderQueue") && material.HasProperty("_RenderPriority"))
            {
                queue = material.GetInt("_RenderQueue");
                priority = material.GetInt("_RenderPriority");
            }

            // User Defined, render type changes needed
            if (queue == 2)
            {
                if (material.renderQueue == 2000)
                {
                    material.SetOverrideTag("RenderType", "Opaque");
                }

                if (material.renderQueue > 2449 && material.renderQueue < 3000)
                {
                    material.SetOverrideTag("RenderType", "AlphaTest");
                }

                if (material.renderQueue > 2999)
                {
                    material.SetOverrideTag("RenderType", "Transparent");
                }
            }

            // Opaque
            if (renderMode == 0)
            {
                if (queue != 2)
                {
                    material.SetOverrideTag("RenderType", "AlphaTest");
                    //material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.AlphaTest + priority;

                    if (renderClip == 0)
                    {
                        if (renderDecals == 0)
                        {
                            material.renderQueue = 2000 + priority;
                        }
                        else
                        {
                            material.renderQueue = 2225 + priority;
                        }
                    }
                    else
                    {
                        if (renderDecals == 0)
                        {
                            material.renderQueue = 2450 + priority;
                        }
                        else
                        {
                            material.renderQueue = 2475 + priority;
                        }
                    }
                }

                // Standard and Universal Render Pipeline
                material.SetInt("_render_src", (int)UnityEngine.Rendering.BlendMode.One);
                material.SetInt("_render_dst", (int)UnityEngine.Rendering.BlendMode.Zero);
                material.SetInt("_render_zw", 1);
                material.SetInt("_render_premul", 0);

                // Set Main Color alpha to 1
                if (material.HasProperty("_MainColor"))
                {
                    var color = material.GetColor("_MainColor");
                    material.SetColor("_MainColor", new Color(color.r, color.g, color.b, 1.0f));
                }

                if (material.HasProperty("_MainColorTwo"))
                {
                    var color = material.GetColor("_MainColorTwo");
                    material.SetColor("_MainColorTwo", new Color(color.r, color.g, color.b, 1.0f));
                }

                // HD Render Pipeline
                material.DisableKeyword("_SURFACE_TYPE_TRANSPARENT");
                material.DisableKeyword("_ENABLE_FOG_ON_TRANSPARENT");

                material.DisableKeyword("_BLENDMODE_ALPHA");
                material.DisableKeyword("_BLENDMODE_ADD");
                material.DisableKeyword("_BLENDMODE_PRE_MULTIPLY");

                material.SetInt("_RenderQueueType", 1);
                material.SetInt("_SurfaceType", 0);
                material.SetInt("_BlendMode", 0);
                material.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.One);
                material.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.Zero);
                material.SetInt("_AlphaSrcBlend", (int)UnityEngine.Rendering.BlendMode.One);
                material.SetInt("_AlphaDstBlend", (int)UnityEngine.Rendering.BlendMode.Zero);
                material.SetInt("_ZWrite", 1);
                material.SetInt("_TransparentZWrite", 1);
                material.SetInt("_ZTestDepthEqualForOpaque", 3);

                if (renderClip == 0)
                {
                    material.SetInt("_ZTestGBuffer", 4);
                }
                else
                {
                    material.SetInt("_ZTestGBuffer", 3);
                }

                //material.SetInt("_ZTestGBuffer", 4);
                material.SetInt("_ZTestTransparent", 4);

                material.SetShaderPassEnabled("TransparentBackface", false);
                material.SetShaderPassEnabled("TransparentBackfaceDebugDisplay", false);
                material.SetShaderPassEnabled("TransparentDepthPrepass", false);
                material.SetShaderPassEnabled("TransparentDepthPostpass", false);
            }
            // Transparent
            else
            {
                if (queue != 2)
                {
                    material.SetOverrideTag("RenderType", "Transparent");
                    material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent + priority;
                }

                int zwrite = 1;

                if (material.HasProperty("_RenderZWrite"))
                {
                    zwrite = material.GetInt("_RenderZWrite");
                }

                // Standard and Universal Render Pipeline
                material.SetInt("_render_src", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
                material.SetInt("_render_dst", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                material.SetInt("_render_premul", 0);

                // HD Render Pipeline
                material.EnableKeyword("_SURFACE_TYPE_TRANSPARENT");
                material.EnableKeyword("_ENABLE_FOG_ON_TRANSPARENT");

                material.EnableKeyword("_BLENDMODE_ALPHA");
                material.DisableKeyword("_BLENDMODE_ADD");
                material.DisableKeyword("_BLENDMODE_PRE_MULTIPLY");

                material.SetInt("_RenderQueueType", 5);
                material.SetInt("_SurfaceType", 1);
                material.SetInt("_BlendMode", 0);
                material.SetInt("_SrcBlend", 1);
                material.SetInt("_DstBlend", 10);
                material.SetInt("_AlphaSrcBlend", 1);
                material.SetInt("_AlphaDstBlend", 10);
                material.SetInt("_ZWrite", zwrite);
                material.SetInt("_TransparentZWrite", zwrite);
                material.SetInt("_ZTestDepthEqualForOpaque", 4);
                material.SetInt("_ZTestGBuffer", 4);
                material.SetInt("_ZTestTransparent", 4);

                material.SetShaderPassEnabled("TransparentBackface", true);
                material.SetShaderPassEnabled("TransparentBackfaceDebugDisplay", true);
                material.SetShaderPassEnabled("TransparentDepthPrepass", true);
                material.SetShaderPassEnabled("TransparentDepthPostpass", true);
            }

            // Set Receive Mode in HDRP
            if (projectPipeline == "High Definition")
            {
                if (material.HasProperty("_RenderDecals"))
                {
                    if (renderDecals == 0)
                    {
                        material.EnableKeyword("_DISABLE_DECALS");
                    }
                    else
                    {
                        material.DisableKeyword("_DISABLE_DECALS");
                    }
                }

                if (material.HasProperty("_RenderSSR"))
                {
                    if (renderSSR == 0)
                    {
                        material.EnableKeyword("_DISABLE_SSR");

                        material.SetInt("_StencilRef", 0);
                        material.SetInt("_StencilRefDepth", 0);
                        material.SetInt("_StencilRefDistortionVec", 4);
                        material.SetInt("_StencilRefGBuffer", 2);
                        material.SetInt("_StencilRefMV", 32);
                        material.SetInt("_StencilWriteMask", 6);
                        material.SetInt("_StencilWriteMaskDepth", 8);
                        material.SetInt("_StencilWriteMaskDistortionVec", 4);
                        material.SetInt("_StencilWriteMaskGBuffer", 14);
                        material.SetInt("_StencilWriteMaskMV", 40);
                    }
                    else
                    {
                        material.DisableKeyword("_DISABLE_SSR");

                        material.SetInt("_StencilRef", 0);
                        material.SetInt("_StencilRefDepth", 8);
                        material.SetInt("_StencilRefDistortionVec", 4);
                        material.SetInt("_StencilRefGBuffer", 10);
                        material.SetInt("_StencilRefMV", 40);
                        material.SetInt("_StencilWriteMask", 6);
                        material.SetInt("_StencilWriteMaskDepth", 8);
                        material.SetInt("_StencilWriteMaskDistortionVec", 4);
                        material.SetInt("_StencilWriteMaskGBuffer", 14);
                        material.SetInt("_StencilWriteMaskMV", 40);
                    }
                }
            }

            // Set Cull Mode
            if (material.HasProperty("_RenderCull"))
            {
                int cull = material.GetInt("_RenderCull");

                material.SetInt("_CullMode", cull);
                material.SetInt("_TransparentCullMode", cull);
                material.SetInt("_CullModeForward", cull);

                // Needed for HD Render Pipeline
                material.DisableKeyword("_DOUBLESIDED_ON");
            }

            // Set Normals Mode
            if (material.HasProperty("_RenderNormal"))
            {
                int normals = material.GetInt("_RenderNormal");

                // Standard, Universal, HD Render Pipeline
                // Flip 0
                if (normals == 0)
                {
                    material.SetVector("_render_normal", new Vector4(-1, -1, -1, 0));
                    material.SetVector("_DoubleSidedConstants", new Vector4(-1, -1, -1, 0));
                }
                // Mirror 1
                else if (normals == 1)
                {
                    material.SetVector("_render_normal", new Vector4(1, 1, -1, 0));
                    material.SetVector("_DoubleSidedConstants", new Vector4(1, 1, -1, 0));
                }
                // None 2
                else if (normals == 2)
                {
                    material.SetVector("_render_normal", new Vector4(1, 1, 1, 0));
                    material.SetVector("_DoubleSidedConstants", new Vector4(1, 1, 1, 0));
                }
            }

            // Set Specular Mode
            if (material.HasProperty("_RenderSpecular"))
            {
                var mode = material.GetInt("_RenderSpecular");

                if (mode == 0)
                {
                    material.EnableKeyword("_SPECULARHIGHLIGHTS_OFF");
                }
                else
                {
                    material.DisableKeyword("_SPECULARHIGHLIGHTS_OFF");
                }
            }

            // Set Shadows Mode
            if (material.HasProperty("_RenderShadow"))
            {
                var mode = material.GetInt("_RenderShadow");

                if (mode == 0)
                {
                    material.EnableKeyword("_RECEIVE_SHADOWS_OFF");
                }
                else
                {
                    material.DisableKeyword("_RECEIVE_SHADOWS_OFF");
                }
            }

            // Set Render Coverage
            if (material.HasProperty("_RenderCoverage"))
            {
                if (renderClip == 0)
                {
                    material.SetInt("_render_coverage", 0);
                }
                else
                {
                    SetMaterialFloat(material, "_RenderCoverage", "_render_coverage");
                }
            }
            else
            {
                material.SetInt("_render_coverage", 0);
            }

#if UNITY_EDITOR
            // Assign Default HD Foliage profile
            if (material.HasProperty("_SubsurfaceDiffusion"))
            {
                // Workaround when the old HDRP 12 diffusion is not found
                if (material.GetFloat("_SubsurfaceDiffusion") == 3.5648174285888672f && AssetDatabase.GUIDToAssetPath("78322c7f82657514ebe48203160e3f39") == "")
                {
                    material.SetFloat("_SubsurfaceDiffusion", 0);
                }

                // Workaround when the old HDRP 14 diffusion is not found
                if (material.GetFloat("_SubsurfaceDiffusion") == 2.6486763954162598f && AssetDatabase.GUIDToAssetPath("879ffae44eefa4412bb327928f1a96dd") == "")
                {
                    material.SetFloat("_SubsurfaceDiffusion", 0);
                }

                // Search for one of Unity's diffusion profile
                if (material.GetFloat("_SubsurfaceDiffusion") == 0)
                {
                    // HDRP 12 Profile
                    if (AssetDatabase.GUIDToAssetPath("78322c7f82657514ebe48203160e3f39") != "")
                    {
                        material.SetFloat("_SubsurfaceDiffusion", 3.5648174285888672f);
                        material.SetVector("_SubsurfaceDiffusion_Asset", new Vector4(228889264007084710000000000000000000000f, 0.000000000000000000000000012389357880079404f, 0.00000000000000000000000000000000000076932702684439582f, 0.00018220426863990724f));
                    }

                    // HDRP 14 Profile
                    if (AssetDatabase.GUIDToAssetPath("879ffae44eefa4412bb327928f1a96dd") != "")
                    {
                        material.SetFloat("_SubsurfaceDiffusion", 2.6486763954162598f);
                        material.SetVector("_SubsurfaceDiffusion_Asset", new Vector4(-36985449400010195000000f, 20.616847991943359f, -0.00000000000000000000000000052916750040661612f, -1352014335655804900f));
                    }

                    // HDRP 16 Profile
                    if (AssetDatabase.GUIDToAssetPath("2384dbf2c1c420f45a792fbc315fbfb1") != "")
                    {
                        material.SetFloat("_SubsurfaceDiffusion", 3.8956573009490967f);
                        material.SetVector("_SubsurfaceDiffusion_Asset", new Vector4(-8695930962161997000000000000000f, -50949593547561853000000000000000f, -0.010710084810853004f, -0.0000000055696536271909736f));
                    }
                }
            }

            if (material.HasProperty("_IsConverted"))
            {
                var mode = material.GetInt("_IsConverted");

                if (mode == 0)
                {
                    Texture2D albedoTex = null;
                    Texture2D normalTex = null;
                    Texture2D shaderTex = null;

                    if (albedoTex == null)
                    {
                        albedoTex = GetMaterialSerializedTexture(material, "_MainTex", null);
                    }

                    if (albedoTex == null)
                    {
                        albedoTex = GetMaterialSerializedTexture(material, "_BaseMap", null);
                    }

                    if (albedoTex == null)
                    {
                        albedoTex = GetMaterialSerializedTexture(material, "_BaseColorMap", null);
                    }

                    if (normalTex == null)
                    {
                        normalTex = GetMaterialSerializedTexture(material, "_BumpMap", null);
                    }

                    if (normalTex == null)
                    {
                        normalTex = GetMaterialSerializedTexture(material, "_NormalMap", null);
                    }

                    if (shaderTex == null)
                    {
                        shaderTex = GetMaterialSerializedTexture(material, "_SpecGlossMap", null);
                    }

                    if (shaderTex == null)
                    {
                        shaderTex = GetMaterialSerializedTexture(material, "_MaskMap", null);
                    }

                    if (albedoTex != null)
                    {
                        material.SetTexture("_MainAlbedoTex", albedoTex);
                    }

                    if (normalTex != null)
                    {
                        material.SetTexture("_MainNormalTex", normalTex);
                    }

                    if (shaderTex != null)
                    {
                        material.SetTexture("_MainShaderTex", shaderTex);
                    }

                    material.SetInt("_IsConverted", 1);
                }
            }
#endif

            if (material.HasProperty("_NoiseTex3D"))
            {
                if (material.GetTexture("_NoiseTex3D") == null)
                {
                    material.SetTexture("_NoiseTex3D", Resources.Load<Texture3D>("Internal NoiseTex3DLite"));
                }
            }

            if (material.HasProperty("_OverlayNormalTex"))
            {
                if (material.GetTexture("_OverlayNormalTex") == null)
                {
                    material.SetTexture("_OverlayNormalTex", Resources.Load<Texture2D>("Internal SnowTexLite"));
                }
            }

            if (material.HasProperty("_MotionNoiseTex"))
            {
                if (material.GetTexture("_MotionNoiseTex") == null)
                {
                    material.SetTexture("_MotionNoiseTex", Resources.Load<Texture2D>("Internal MotionTexLite"));
                }
            }

            SetMaterialCoords(material, "_MainCoordMode", "_MainCoordValue", "_main_coord_value");
            SetMaterialCoords(material, "_SecondCoordMode", "_SecondCoordValue", "_second_coord_value");
            SetMaterialCoords(material, "_SecondMaskCoordMode", "_SecondMaskCoordValue", "_second_mask_coord_value");
            SetMaterialCoords(material, "_ThirdCoordMode", "_ThirdCoordValue", "_third_coord_value");
            SetMaterialCoords(material, "_ThirdMaskCoordMode", "_ThirdMaskCoordValue", "_third_mask_coord_value");
            SetMaterialCoords(material, "_OverlayCoordMode", "_OverlayCoordValue", "_overlay_coord_value");
            SetMaterialCoords(material, "_OverlayMaskCoordMode", "_OverlayMaskCoordValue", "_overlay_mask_coord_value");
            SetMaterialCoords(material, "_EmissiveCoordMode", "_EmissiveCoordValue", "_emissive_coord_value");

            SetMaterialOptions(material, "_ObjectPhaseMode", "_object_phase_mode");
            SetMaterialOptions(material, "_SecondMeshMode", "_second_vert_mode");
            SetMaterialOptions(material, "_ThirdMeshMode", "_third_vert_mode");
            SetMaterialOptions(material, "_EmissiveMeshMode", "_emissive_vert_mode");
            SetMaterialOptions(material, "_OcclusionMeshMode", "_occlusion_vert_mode");
            SetMaterialOptions(material, "_GradientMeshMode", "_gradient_vert_mode");
            SetMaterialOptions(material, "_OverlayMeshMode", "_overlay_vert_mode");
            SetMaterialOptions(material, "_NormalMeshMode", "_normal_vert_mode");

            SetMaterialReciprocal(material, "_MainMultiRemap");
            SetMaterialReciprocal(material, "_MainOcclusionRemap");
            SetMaterialReciprocal(material, "_MainSmoothnessRemap");
            SetMaterialReciprocal(material, "_SecondMultiRemap");
            SetMaterialReciprocal(material, "_SecondOcclusionRemap");
            SetMaterialReciprocal(material, "_SecondSmoothnessRemap");
            SetMaterialReciprocal(material, "_SecondMaskRemap");
            SetMaterialReciprocal(material, "_SecondLumaRemap");
            SetMaterialReciprocal(material, "_SecondProjRemap");
            SetMaterialReciprocal(material, "_SecondMeshRemap");
            SetMaterialReciprocal(material, "_SecondBlendRemap");
            SetMaterialReciprocal(material, "_ThirdMultiRemap");
            SetMaterialReciprocal(material, "_ThirdOcclusionRemap");
            SetMaterialReciprocal(material, "_ThirdSmoothnessRemap");
            SetMaterialReciprocal(material, "_ThirdMaskRemap");
            SetMaterialReciprocal(material, "_ThirdLumaRemap");
            SetMaterialReciprocal(material, "_ThirdProjRemap");
            SetMaterialReciprocal(material, "_ThirdMeshRemap");
            SetMaterialReciprocal(material, "_ThirdBlendRemap");
            SetMaterialReciprocal(material, "_OcclusionMeshRemap");
            SetMaterialReciprocal(material, "_GradientMeshRemap");
            SetMaterialReciprocal(material, "_OverlayMaskRemap");
            SetMaterialReciprocal(material, "_OverlayLumaRemap");
            SetMaterialReciprocal(material, "_OverlayProjRemap");
            SetMaterialReciprocal(material, "_OverlayMeshRemap");
            SetMaterialReciprocal(material, "_OverlayBlendRemap");
            SetMaterialReciprocal(material, "_EmissiveMaskRemap");
            SetMaterialReciprocal(material, "_EmissiveMeshRemap");
            SetMaterialReciprocal(material, "_MotionBaseMaskRemap");
            SetMaterialReciprocal(material, "_MotionSmallMaskRemap");
            SetMaterialReciprocal(material, "_MotionTinyMaskRemap");
            SetMaterialReciprocal(material, "_NormalMeshRemap");

            SetMaterialFloat(material, "_ImpostorAlphaClipValue", "_AI_Clip");
            SetMaterialFloat(material, "_GlobalWindLayerValue", "_global_wind_layer_value");
            SetMaterialFloat(material, "_GlobalPushLayerValue", "_global_push_layer_value");
            SetMaterialVector(material, "_MotionHighlightColor", "_motion_highlight_color");

            if (material.HasProperty("_ObjectModelMode"))
            {
                var mode = material.GetInt("_ObjectModelMode");

                if (mode == 0)
                {
                    material.EnableKeyword("TVE_LEGACY");
                }
                else
                {
                    material.DisableKeyword("TVE_LEGACY");
                }
            }

            SetMaterialKeyword(material, "_ObjectPivotMode", new string[] { "TVE_PIVOT_OFF", "TVE_PIVOT_BAKED", "TVE_PIVOT_PROC" });
            SetMaterialKeyword(material, "_RenderFilter", new string[] { "TVE_FILTER_DEFAULT", "TVE_FILTER_POINT", "TVE_FILTER_LOW", "TVE_FILTER_MEDIUM", "TVE_FILTER_HIGH" });
            SetMaterialKeyword(material, "_RenderClip", "TVE_ALPHA_CLIP");
            SetMaterialKeyword(material, "_ImpostorMaskMode", new string[] { "TVE_IMPOSTOR_MASK_OFF", "TVE_IMPOSTOR_MASK_DEFAULT", "TVE_IMPOSTOR_MASK_PACKED", "TVE_IMPOSTOR_MASK_SHADING" });
            SetMaterialKeyword(material, "_MainSampleMode", new string[] { "TVE_MAIN_SAMPLE_MAIN_UV", "TVE_MAIN_SAMPLE_EXTRA_UV", "TVE_MAIN_SAMPLE_PLANAR_2D", "TVE_MAIN_SAMPLE_PLANAR_3D", "TVE_MAIN_SAMPLE_STOCHASTIC_2D", "TVE_MAIN_SAMPLE_STOCHASTIC_3D" });

            SetMaterialKeyword(material, "_SecondIntensityValue", "TVE_SECOND");
            SetMaterialKeyword(material, "_SecondIntensityValue", "_SecondSampleMode", new string[] { "TVE_SECOND_SAMPLE_MAIN_UV", "TVE_SECOND_SAMPLE_EXTRA_UV", "TVE_SECOND_SAMPLE_PLANAR_2D", "TVE_SECOND_SAMPLE_PLANAR_3D", "TVE_SECOND_SAMPLE_STOCHASTIC_2D", "TVE_SECOND_SAMPLE_STOCHASTIC_3D" });
            SetMaterialKeyword(material, "_SecondIntensityValue", "_SecondMaskSampleMode", new string[] { "TVE_SECOND_MASK_SAMPLE_MAIN_UV", "TVE_SECOND_MASK_SAMPLE_EXTRA_UV", "TVE_SECOND_MASK_SAMPLE_PLANAR_2D", "TVE_SECOND_MASK_SAMPLE_PLANAR_3D" });
            SetMaterialKeyword(material, "_SecondIntensityValue", "_SecondElementMode", "TVE_SECOND_ELEMENT");

            SetMaterialKeyword(material, "_ThirdIntensityValue", "TVE_THIRD");
            SetMaterialKeyword(material, "_ThirdIntensityValue", "_ThirdSampleMode", new string[] { "TVE_THIRD_SAMPLE_MAIN_UV", "TVE_THIRD_SAMPLE_EXTRA_UV", "TVE_THIRD_SAMPLE_PLANAR_2D", "TVE_THIRD_SAMPLE_PLANAR_3D", "TVE_THIRD_SAMPLE_STOCHASTIC_2D", "TVE_THIRD_SAMPLE_STOCHASTIC_3D" });
            SetMaterialKeyword(material, "_ThirdIntensityValue", "_ThirdMaskSampleMode", new string[] { "TVE_THIRD_MASK_SAMPLE_MAIN_UV", "TVE_THIRD_MASK_SAMPLE_EXTRA_UV", "TVE_THIRD_MASK_SAMPLE_PLANAR_2D", "TVE_THIRD_MASK_SAMPLE_PLANAR_3D" });
            SetMaterialKeyword(material, "_ThirdIntensityValue", "_ThirdElementMode", "TVE_THIRD_ELEMENT");

            SetMaterialKeyword(material, "_OcclusionIntensityValue", "TVE_OCCLUSION");
            SetMaterialKeyword(material, "_GradientIntensityValue", "TVE_GRADIENT");

            SetMaterialKeyword(material, "_OverlayIntensityValue", "TVE_OVERLAY");
            SetMaterialKeyword(material, "_OverlayIntensityValue", "_OverlayTextureMode", "TVE_OVERLAY_TEX");
            SetMaterialKeyword(material, "_OverlayIntensityValue", "_OverlaySampleMode", new string[] { "TVE_OVERLAY_SAMPLE_PLANAR_2D", "TVE_OVERLAY_SAMPLE_PLANAR_3D", "TVE_OVERLAY_SAMPLE_STOCHASTIC_2D", "TVE_OVERLAY_SAMPLE_STOCHASTIC_3D" });
            SetMaterialKeyword(material, "_OverlayIntensityValue", "_OverlayMaskSampleMode", new string[] { "TVE_OVERLAY_MASK_SAMPLE_MAIN_UV", "TVE_OVERLAY_MASK_SAMPLE_EXTRA_UV" });
            SetMaterialKeyword(material, "_OverlayIntensityValue", "_OverlayElementMode", "TVE_OVERLAY_ELEMENT");

            SetMaterialKeyword(material, "_EmissiveIntensityValue", "TVE_EMISSIVE");
            SetMaterialKeyword(material, "_EmissiveIntensityValue", "_EmissiveSampleMode", new string[] { "TVE_EMISSIVE_SAMPLE_MAIN_UV", "TVE_EMISSIVE_SAMPLE_EXTRA_UV" });
            SetMaterialKeyword(material, "_EmissiveIntensityValue", "_EmissiveElementMode", "TVE_EMISSIVE_ELEMENT");

            SetMaterialKeyword(material, "_SubsurfaceIntensityValue", "TVE_SUBSURFACE");
            SetMaterialKeyword(material, "_SubsurfaceIntensityValue", "_SubsurfaceElementMode", "TVE_SUBSURFACE_ELEMENT");

            SetMaterialKeyword(material, "_MotionIntensityValue", "TVE_MOTION");

            SetMaterialKeyword(material, new string[] { "_NormalFlattenValue", "_NormalSphereValue", "_NormalComputeValue", "_NormalBlanketValue" }, "TVE_NORMAL");

            if (material.HasProperty("_MotionBaseMaskMode"))
            {
                var mode = material.GetInt("_MotionBaseMaskMode");

                if (mode < 4)
                {
                    material.SetFloat("_motion_base_mask_mode", 0);
                    SetMaterialOptions(material, "_MotionBaseMaskMode", "_motion_base_vert_mode");
                }
                else
                {
                    material.SetFloat("_motion_base_mask_mode", 1);
                    SetMaterialOptions(material, "_MotionBaseMaskMode", "_motion_base_proc_mode", 4);
                }
            }

            if (material.HasProperty("_MotionSmallMaskMode"))
            {
                var mode = material.GetInt("_MotionSmallMaskMode");

                if (mode < 4)
                {
                    material.SetFloat("_motion_small_mask_mode", 0);
                    SetMaterialOptions(material, "_MotionSmallMaskMode", "_motion_small_vert_mode");
                }
                else
                {
                    material.SetFloat("_motion_small_mask_mode", 1);
                    SetMaterialOptions(material, "_MotionSmallMaskMode", "_motion_small_proc_mode", 4);
                }
            }

            if (material.HasProperty("_MotionTinyMaskMode"))
            {
                var mode = material.GetInt("_MotionTinyMaskMode");

                if (mode < 4)
                {
                    material.SetFloat("_motion_tiny_mask_mode", 0);
                    SetMaterialOptions(material, "_MotionTinyMaskMode", "_motion_tiny_vert_mode");
                }
                else
                {
                    material.SetFloat("_motion_tiny_mask_mode", 0);
                    SetMaterialOptions(material, "_MotionTinyMaskMode", "_motion_tiny_proc_mode", 4);
                }
            }

            bool hasMotion = false;

            if (material.HasProperty("_MotionIntensityValue"))
            {
                var value = material.GetFloat("_MotionIntensityValue");

                if (value > 0)
                {
                    hasMotion = true;
                }
            }

            if (material.HasProperty("_MotionSmallIntensityValue"))
            {
                var value = material.GetFloat("_MotionSmallIntensityValue");

                if (value > 0)
                {
                    material.SetFloat("_MotionSmallMode", 1);
                }
                else
                {
                    material.SetFloat("_MotionSmallMode", 0);
                }
            }

            if (material.HasProperty("_RenderMotion"))
            {
                var mode = material.GetFloat("_RenderMotion");

                if (mode == 0)
                {
                    if (hasMotion)
                    {
                        material.SetShaderPassEnabled("MotionVectors", true);
                    }
                    else
                    {
                        material.SetShaderPassEnabled("MotionVectors", false);
                    }
                }
                else if (mode == 1)
                {
                    material.SetShaderPassEnabled("MotionVectors", false);
                }
                else if (mode == 2)
                {
                    material.SetShaderPassEnabled("MotionVectors", false);
                }
            }
            else
            {
                material.SetShaderPassEnabled("MotionVectors", false);
            }

            if (material.HasProperty("_EmissiveIntensityValue"))
            {
                // Set Intensity Mode
                if (material.HasProperty("_EmissivePowerMode") && material.HasProperty("_EmissivePowerValue"))
                {
                    float power = material.GetInt("_EmissivePowerMode");
                    float value = material.GetFloat("_EmissivePowerValue");

                    if (power == 0)
                    {
                        material.SetFloat("_emissive_power_value", value);
                    }
                    else if (power == 1)
                    {
                        material.SetFloat("_emissive_power_value", (12.5f / 100.0f) * Mathf.Pow(2f, value));
                    }
                }

                // Set GI Mode
                if (material.HasProperty("_EmissiveFlagMode"))
                {
                    int flag = material.GetInt("_EmissiveFlagMode");

                    if (flag == 0)
                    {
                        material.globalIlluminationFlags = MaterialGlobalIlluminationFlags.None;
                    }
                    else if (flag == 1)
                    {
                        material.globalIlluminationFlags = MaterialGlobalIlluminationFlags.AnyEmissive;
                    }
                    else if (flag == 2)
                    {
                        material.globalIlluminationFlags = MaterialGlobalIlluminationFlags.BakedEmissive;
                    }
                    else if (flag == 3)
                    {
                        material.globalIlluminationFlags = MaterialGlobalIlluminationFlags.RealtimeEmissive;
                    }
                }
            }

            // Set Legacy props for external bakers
            if (material.HasProperty("_AlphaClipValue"))
            {
                material.SetFloat("_Cutoff", material.GetFloat("_AlphaClipValue"));
            }

            // Set Legacy props for external bakers
            if (material.HasProperty("_MainColor"))
            {
                material.SetColor("_Color", material.GetColor("_MainColor"));
            }

            // Set BlinnPhong Spec Color
            if (material.HasProperty("_SpecColor"))
            {
                material.SetColor("_SpecColor", Color.white);
            }

            if (material.HasTexture("_MainAlbedoTex"))
            {
                if (material.HasTexture("_MainTex"))
                {
                    material.SetTexture("_MainTex", material.GetTexture("_MainAlbedoTex"));
                }
            }

            if (material.HasTexture("_MainNormalTex"))
            {
                if (material.HasTexture("_BumpMap"))
                {
                    material.SetTexture("_BumpMap", material.GetTexture("_MainNormalTex"));
                }
            }

            if (material.HasProperty("_MainCoordValue"))
            {
                if (material.HasTexture("_MainTex"))
                {
                    material.SetTextureScale("_MainTex", new Vector2(material.GetVector("_MainCoordValue").x, material.GetVector("_MainCoordValue").y));
                    material.SetTextureOffset("_MainTex", new Vector2(material.GetVector("_MainCoordValue").z, material.GetVector("_MainCoordValue").w));
                }

                if (material.HasTexture("_BumpMap"))
                {
                    material.SetTextureScale("_BumpMap", new Vector2(material.GetVector("_MainCoordValue").x, material.GetVector("_MainCoordValue").y));
                    material.SetTextureOffset("_BumpMap", new Vector2(material.GetVector("_MainCoordValue").z, material.GetVector("_MainCoordValue").w));
                }
            }

            if (material.HasProperty("_SubsurfaceIntensityValue"))
            {
                // Legacy Surface Shader
                SetMaterialFloat(material, "_SubsurfaceScatteringValue", "_Translucency");
                SetMaterialFloat(material, "_SubsurfaceNormalValue", "_TransNormalDistortion");

                // Lit Template
                SetMaterialFloat(material, "_SubsurfaceScatteringValue", "_TransStrength");
                SetMaterialFloat(material, "_SubsurfaceNormalValue", "_TransNormal");
                SetMaterialFloat(material, "_SubsurfaceAngleValue", "_TransScattering");
                SetMaterialFloat(material, "_SubsurfaceDirectValue", "_TransDirect");
                SetMaterialFloat(material, "_SubsurfaceAmbientValue", "_TransAmbient");
                SetMaterialFloat(material, "_SubsurfaceShadowValue", "_TransShadow");
            }

#if UNITY_EDITOR
            // Add ID for material sharing debug
            if (material.HasProperty("_IsIdentifier"))
            {
                var id = material.GetInt("_IsIdentifier");

                if (id == 0)
                {
                    material.SetInt("_IsIdentifier", (int)UnityEngine.Random.Range(1, 100));
                }
            }

            // Detect if the shaders is custom compiled
            if (AssetDatabase.GetAssetPath(material.shader).Contains("Core"))
            {
                material.SetInt("_IsCustomShader", 0);
            }
            else
            {
                material.SetInt("_IsCustomShader", 1);
            }

            // Enable Nature Rendered support
            material.SetOverrideTag("NatureRendererInstancing", "True");

            // Set Internal shader type
            if (shaderName.Contains("Vertex Lit"))
            {
                material.SetInt("_IsVertexShader", 1);
                material.SetInt("_IsSimpleShader", 0);
                material.SetInt("_IsStandardShader", 0);
                material.SetInt("_IsSubsurfaceShader", 0);
            }

            if (shaderName.Contains("Simple Lit"))
            {
                material.SetInt("_IsVertexShader", 0);
                material.SetInt("_IsSimpleShader", 1);
                material.SetInt("_IsStandardShader", 0);
                material.SetInt("_IsSubsurfaceShader", 0);
            }

            if (shaderName.Contains("Standard Lit"))
            {
                material.SetInt("_IsVertexShader", 0);
                material.SetInt("_IsSimpleShader", 0);
                material.SetInt("_IsStandardShader", 1);
                material.SetInt("_IsSubsurfaceShader", 0);
            }

            if (shaderName.Contains("Subsurface Lit"))
            {
                material.SetInt("_IsVertexShader", 0);
                material.SetInt("_IsSimpleShader", 0);
                material.SetInt("_IsStandardShader", 0);
                material.SetInt("_IsSubsurfaceShader", 1);
            }
#endif
        }

        // Material Utils
        public static void SetMaterialFloat(Material material, string valueProp, string internalProp)
        {
            if (material.HasProperty(valueProp))
            {
                material.SetFloat(internalProp, material.GetFloat(valueProp));
            }
        }

        public static void SetMaterialVector(Material material, string valueProp, string internalProp)
        {
            if (material.HasProperty(valueProp))
            {
                material.SetVector(internalProp, material.GetVector(valueProp));
            }
        }

        public static void SetMaterialTexture(Material material, string valueProp, string internalProp)
        {
            if (material.HasProperty(valueProp))
            {
                material.SetTexture(internalProp, material.GetTexture(valueProp));
            }
        }

        public static void SetMaterialCoords(Material material, string modeProp, string valueProp, string internalProp)
        {
            if (material.HasProperty(modeProp) && material.HasProperty(valueProp))
            {
                var mode = material.GetInt(modeProp);
                var value = material.GetVector(valueProp);

                if (mode == 0)
                {
                    material.SetVector(internalProp, value);
                }

                if (mode == 1)
                {
                    material.SetVector(internalProp, new Vector4(1 / value.x, 1 / value.y, value.z, value.w));
                }
            }
        }

        public static void SetMaterialBounds(Material material, string modeProp, string valueProp, string internalProp)
        {
            var offset = 0.0f;

            if (material.HasProperty(modeProp) && material.HasProperty(valueProp))
            {
                var mode = material.GetInt(modeProp);

                if (mode == 1)
                {
                    offset = 0.5f;
                }

                var value = material.GetVector(valueProp);
                var scale = new Vector2(1 / value.z, 1 / value.w);
                var pos = new Vector2(value.x * scale.x - offset, value.y * scale.y - offset) * -1;

                material.SetVector(internalProp, new Vector4(scale.x, scale.y, pos.x, pos.y));
            }
        }

        public static void SetMaterialOptions(Material material, string modeProp, string valueProp, int start)
        {
            if (material.HasProperty(modeProp))
            {
                var mode = material.GetInt(modeProp) - start;

                if (mode == 0)
                {
                    material.SetVector(valueProp, new Vector4(1, 0, 0, 0));
                }

                if (mode == 1)
                {
                    material.SetVector(valueProp, new Vector4(0, 1, 0, 0));
                }

                if (mode == 2)
                {
                    material.SetVector(valueProp, new Vector4(0, 0, 1, 0));
                }

                if (mode == 3)
                {
                    material.SetVector(valueProp, new Vector4(0, 0, 0, 1));
                }
            }
        }

        public static void SetMaterialOptions(Material material, string modeProp, string valueProp)
        {
            SetMaterialOptions(material, modeProp, valueProp, 0);
        }

        public static void SetMaterialReciprocal(Material material, string valueProp)
        {
            if (material.HasProperty(valueProp))
            {
                var value = material.GetVector(valueProp);

                material.SetVector(valueProp, new Vector4(value.x, value.y, 1 / (value.y - value.x), value.w));
            }
        }

        public static void SetMaterialKeyword(Material material, string property, string keyword)
        {
            if (material.HasFloat(property))
            {
                var mode = material.GetFloat(property);

                if (mode == 0)
                {
                    material.DisableKeyword(keyword);
                }
                else
                {
                    material.EnableKeyword(keyword);
                }
            }
        }

        public static void SetMaterialKeyword(Material material, string feature, string property, string keyword)
        {
            if (material.HasFloat(feature) && material.HasFloat(property))
            {
                var featureMode = material.GetFloat(feature);

                if (featureMode > 0)
                {
                    var propertyMode = material.GetFloat(property);

                    if (propertyMode == 0)
                    {
                        material.DisableKeyword(keyword);
                    }
                    else
                    {
                        material.EnableKeyword(keyword);
                    }
                }
                else
                {
                    material.DisableKeyword(keyword);
                }
            }
        }

        public static void SetMaterialKeyword(Material material, string property, string[] keywords)
        {
            if (material.HasFloat(property))
            {
                var mode = material.GetFloat(property);

                for (int i = 0; i < keywords.Length; i++)
                {
                    if (i == mode)
                    {
                        material.EnableKeyword(keywords[i]);
                    }
                    else
                    {
                        material.DisableKeyword(keywords[i]);
                    }
                }
            }
        }

        public static void SetMaterialKeyword(Material material, string feature, string property, string[] keywords)
        {
            if (material.HasFloat(feature) && material.HasFloat(property))
            {
                var featureMode = material.GetFloat(feature);

                if (featureMode > 0)
                {
                    var propertyMode = material.GetFloat(property);

                    for (int i = 0; i < keywords.Length; i++)
                    {
                        if (i == propertyMode)
                        {
                            material.EnableKeyword(keywords[i]);
                        }
                        else
                        {
                            material.DisableKeyword(keywords[i]);
                        }
                    }
                }
                else
                {
                    for (int i = 0; i < keywords.Length; i++)
                    {
                        material.DisableKeyword(keywords[i]);
                    }
                }
            }
        }

        public static void SetMaterialKeyword(Material material, string[] properties, string keyword)
        {
            float enableKeyword = 0;

            for (int i = 0; i < properties.Length; i++)
            {
                var property = properties[i];

                if (material.HasProperty(property))
                {
                    enableKeyword += material.GetFloat(property);
                }
            }

            if (enableKeyword > 0)
            {
                material.EnableKeyword(keyword);
            }
            else
            {
                material.DisableKeyword(keyword);
            }
        }

        public static float GetMaterialFloat(Material material, string property)
        {
            float value = 0;

            if (material.HasFloat(property))
            {
                value = material.GetFloat(property);
            }

            return value;
        }

        public static int GetMaterialInt(Material material, string property)
        {
            int value = 0;

            if (material.HasFloat(property))
            {
                value = material.GetInt(property);
            }

            return value;
        }

#if UNITY_EDITOR
        // GameObject Utils
        public static void GetChildRecursive(GameObject go, List<GameObject> gameObjects)
        {
            foreach (Transform child in go.transform)
            {
                if (child == null)
                    continue;

                gameObjects.Add(child.gameObject);
                GetChildRecursive(child.gameObject, gameObjects);
            }
        }

        // Material Utils
        public static void UnloadMaterialFromMemory(Material material)
        {
            var shader = material.shader;

            for (int i = 0; i < ShaderUtil.GetPropertyCount(shader); i++)
            {
                if (ShaderUtil.GetPropertyType(shader, i) == ShaderUtil.ShaderPropertyType.TexEnv)
                {
                    var propName = ShaderUtil.GetPropertyName(shader, i);
                    var texture = material.GetTexture(propName);

                    if (texture != null)
                    {
                        Resources.UnloadAsset(texture);
                    }
                }
            }
        }


        public static float GetMaterialSerializedFloat(Material material, string internalName, float defaultValue)
        {
            float value = defaultValue;

            if (EditorUtility.IsPersistent(material))
            {
                var so = new SerializedObject(material);
                var itr = so.GetIterator();

                while (itr.Next(true))
                {
                    if (itr.displayName == internalName)
                    {
                        if (itr.hasChildren)
                        {
                            var itrC = itr.Copy();
                            itrC.Next(true); //Walk into child ("First")
                            itrC.Next(false); //Walk into sibling ("Second")

                            value = itrC.floatValue;
                        }
                    }
                }
            }

            return value;
        }

        public static Vector4 GetMaterialSerializedVector(Material material, string internalName, Vector4 defaultValue)
        {
            Vector4 value = defaultValue;

            if (EditorUtility.IsPersistent(material))
            {
                var so = new SerializedObject(material);
                var itr = so.GetIterator();

                while (itr.Next(true))
                {
                    if (itr.displayName == internalName)
                    {
                        if (itr.hasChildren)
                        {
                            var itrC = itr.Copy();
                            itrC.Next(true); //Walk into child ("First")
                            itrC.Next(false); //Walk into sibling ("Second")

                            value = itrC.colorValue;
                        }
                    }
                }
            }

            return value;
        }

        public static Vector4 GetMaterialSerializedVector(Material material, string internalNameMin, string internalNameMax, Vector4 defaultValue)
        {
            Vector4 value = defaultValue;

            value.x = GetMaterialSerializedFloat(material, internalNameMin, 0);
            value.y = GetMaterialSerializedFloat(material, internalNameMax, 1);

            if (value.x > value.y)
            {
                value.w = 1;
            }

            return value;
        }

        public static Texture2D GetMaterialSerializedTexture(Material material, string internalName, Texture2D defaultValue)
        {
            Texture2D value = defaultValue;

            if (EditorUtility.IsPersistent(material))
            {
                var so = new SerializedObject(material);
                var itr = so.GetIterator();

                while (itr.Next(true))
                {
                    if (itr.displayName == internalName)
                    {
                        if (itr.hasChildren)
                        {
                            var itrC = itr.Copy();
                            itrC.Next(true); //Walk into child ("First")
                            itrC.Next(false); //Walk into sibling ("Second")

                            if (itrC.hasChildren)
                            {
                                var itrT = itrC.Copy();
                                itrT.Next(true); //Walk into child ("First")
                                value = (Texture2D)itrT.objectReferenceValue;
                            }
                        }
                    }
                }
            }

            return value;
        }

        public static void CopyMaterialProperties(Material oldMaterial, Material newMaterial)
        {
            var oldShader = oldMaterial.shader;
            var newShader = newMaterial.shader;

            for (int i = 0; i < ShaderUtil.GetPropertyCount(oldShader); i++)
            {
                for (int j = 0; j < ShaderUtil.GetPropertyCount(newShader); j++)
                {
                    var propertyName = ShaderUtil.GetPropertyName(oldShader, i);
                    var propertyType = ShaderUtil.GetPropertyType(oldShader, i);

                    if (propertyName == ShaderUtil.GetPropertyName(newShader, j))
                    {
                        if (propertyType == ShaderUtil.ShaderPropertyType.Color || propertyType == ShaderUtil.ShaderPropertyType.Vector)
                        {
#if UNITY_2022_1_OR_NEWER
                            if (!oldMaterial.IsPropertyLocked(propertyName))
                            {
                                newMaterial.SetVector(propertyName, oldMaterial.GetVector(propertyName));
                            }
#else
                        newMaterial.SetVector(propertyName, oldMaterial.GetVector(propertyName));
#endif
                        }

                        if (propertyType == ShaderUtil.ShaderPropertyType.Float || propertyType == ShaderUtil.ShaderPropertyType.Range)
                        {
#if UNITY_2022_1_OR_NEWER
                            if (!oldMaterial.IsPropertyLocked(propertyName))
                            {
                                newMaterial.SetFloat(propertyName, oldMaterial.GetFloat(propertyName));
                            }
#else
                            newMaterial.SetFloat(propertyName, oldMaterial.GetFloat(propertyName));
#endif
                        }

                        if (propertyType == ShaderUtil.ShaderPropertyType.TexEnv)
                        {
#if UNITY_2022_1_OR_NEWER
                            if (!oldMaterial.IsPropertyLocked(propertyName))
                            {
                                newMaterial.SetTexture(propertyName, oldMaterial.GetTexture(propertyName));
                            }
#else
                            newMaterial.SetTexture(propertyName, oldMaterial.GetTexture(propertyName));
#endif
                        }
                    }
                }
            }
        }

        public static void DrawCopySettingsFromObject(Material material)
        {
            Object inputObject = null;

            GUILayout.BeginHorizontal();
            inputObject = (Object)EditorGUILayout.ObjectField("Copy Settings From Object", inputObject, typeof(Object), true, GUILayout.Height(17));
            GUILayout.Space(2);
            GUILayout.EndHorizontal();

            if (inputObject != null)
            {
                if (inputObject.GetType() == typeof(GameObject))
                {
                    var gameObject = (GameObject)inputObject;

                    List<Material> allMaterials = new();
                    List<GameObject> allGameObjects = new();

                    allGameObjects.Add(gameObject);
                    GetChildRecursive(gameObject, allGameObjects);

                    for (int i = 0; i < allGameObjects.Count; i++)
                    {
                        var currentGameObject = allGameObjects[i];
                        var currentRenderer = currentGameObject.GetComponent<MeshRenderer>();
                        Material[] sharedMaterials = null;

                        if (currentRenderer != null)
                        {
                            sharedMaterials = currentRenderer.sharedMaterials;
                        }

                        if (sharedMaterials != null)
                        {
                            for (int j = 0; j < sharedMaterials.Length; j++)
                            {
                                var currentMaterial = sharedMaterials[j];

                                if (currentMaterial != null && currentMaterial != material && !allMaterials.Contains(currentMaterial))
                                {
                                    allMaterials.Add(currentMaterial);
                                }
                            }
                        }
                    }

                    if (allMaterials.Count == 0)
                    {
                        Debug.Log("<b>[The Visual Engine]</b> " + "No material to copy from found!");
                    }
                    else if (allMaterials.Count == 1)
                    {
                        var oldMaterial = allMaterials[0];

                        CopyMaterialProperties(oldMaterial, material);
                        SetImpostorFeatures(oldMaterial, material);
                        material.SetFloat("_IsInitialized", 1);

                        Debug.Log("<b>[The Visual Engine]</b> " + "Gameobject material settings copied to the current material!");
                    }
                    else if (allMaterials.Count > 1)
                    {
                        for (int i = 0; i < allMaterials.Count; i++)
                        {
                            var oldMaterial = allMaterials[i];

                            bool copySettings = EditorUtility.DisplayDialog("Copy Material Settings?", "Copy the settings from " + oldMaterial.name.ToUpper() + "?", "Copy Material Settings", "Skip");

                            if (copySettings)
                            {
                                CopyMaterialProperties(oldMaterial, material);
                                SetImpostorFeatures(oldMaterial, material);
                                material.SetFloat("_IsInitialized", 1);
                            }
                        }

                        Debug.Log("<b>[The Visual Engine]</b> " + "Selected material settings copied to the current material!");
                    }
                }

                if (inputObject.GetType() == typeof(Material))
                {
                    var oldMaterial = (Material)inputObject;

                    if (oldMaterial != null)
                    {
                        CopyMaterialProperties(oldMaterial, material);

                        material.SetFloat("_IsInitialized", 1);
                    }
                }

                inputObject = null;
            }
        }

        public static void SetImpostorFeatures(Material oldMaterial, Material newMaterial)
        {
            SetImpostorFeature(oldMaterial, newMaterial, "_Occlusion");
            SetImpostorFeature(oldMaterial, newMaterial, "_Gradient");
            //SetImpostorFeature(oldMaterial, newMaterial, "_Tinting");
            //SetImpostorFeature(oldMaterial, newMaterial, "_Dryness");
            SetImpostorFeature(oldMaterial, newMaterial, "_Overlay");
            //SetImpostorFeature(oldMaterial, newMaterial, "_Wetness");
            //SetImpostorFeature(oldMaterial, newMaterial, "_Cutout");
        }

        public static void SetImpostorFeature(Material oldMaterial, Material newMaterial, string feature)
        {
            if (oldMaterial.HasProperty(feature + "BakeMode"))
            {
                var bake = oldMaterial.GetInt(feature + "BakeMode");

                if (bake == 0)
                {
                    newMaterial.SetFloat(feature + "BakeInfo", 0);
                }
                else
                {
                    newMaterial.SetFloat(feature + "BakeInfo", 1);
                    newMaterial.SetFloat(feature + "IntensityValue", 0);
                }
            }
        }

        public static void DrawRenderQueue(Material material, MaterialEditor materialEditor)
        {
            if (material.HasProperty("_RenderQueue") && material.HasProperty("_RenderPriority"))
            {
                var mode = material.GetInt("_RenderQueue");
                var priority = material.GetInt("_RenderPriority");

                mode = EditorGUILayout.Popup("Render Queue Mode", mode, new string[] { "Auto", "Priority", "User Defined" });

                if (mode == 0)
                {
                    priority = 0;
                }
                else if (mode == 1)
                {
                    priority = EditorGUILayout.IntSlider("Render Priority", priority, -100, 100);
                }
                else
                {
                    priority = 0;
                    materialEditor.RenderQueueField();
                }

                material.SetInt("_RenderQueue", mode);
                material.SetInt("_RenderPriority", priority);
            }
        }

        public static void DrawBakeGIMode(Material material)
        {
            if (material.HasProperty("_RenderBakeGI") && material.HasProperty("_RenderCull"))
            {
                var mode = material.GetInt("_RenderBakeGI");
                var cull = material.GetInt("_RenderCull");

                mode = EditorGUILayout.Popup("Double Sided GI Mode", mode, new string[] { "Auto", "Off", "On" });

                if (mode == 0)
                {
                    if (cull == 0)
                    {
                        material.doubleSidedGI = true;
                    }
                    else
                    {
                        material.doubleSidedGI = false;
                    }
                }
                else if (mode == 1)
                {
                    material.doubleSidedGI = false;
                }
                else
                {
                    material.doubleSidedGI = true;
                }

                material.SetInt("_RenderBakeGI", mode);
            }
        }

        public static string DrawSearchField(string searchText, out string[] searchResult, int space)
        {
            GUILayout.BeginHorizontal();
            //GUI.color = new Color(1, 1, 1, 0.9f);
            GUILayout.Space(space);

            GUIStyle searchStyle = GUI.skin.FindStyle("ToolbarSearchTextField");

            if (searchStyle == null)
            {
                searchStyle = GUI.skin.FindStyle("ToolbarSeachTextField");
            }

            searchText = GUILayout.TextField(searchText, searchStyle);

            //GUI.color = Color.white;
            GUILayout.EndHorizontal();

            var searchInvariant = searchText.ToUpper();
            searchResult = searchInvariant.Split(" ");

            if (searchResult == null)
            {
                searchResult = new string[] { "" };
            }

            return searchText;
        }

        public static void DrawPoweredBy()
        {
            var styleLabelCentered = new GUIStyle(EditorStyles.label)
            {
                richText = true,
                alignment = TextAnchor.MiddleCenter,
            };

            Rect lastRect0 = GUILayoutUtility.GetLastRect();
            EditorGUI.DrawRect(new Rect(0, lastRect0.yMax, 1000, 1), new Color(0, 0, 0, 0.4f));

            GUILayout.Space(10);

            GUILayout.Label("<size=10><color=#808080>Powered by The Visual Engine. Get the full version to enable all features!</color></size>", styleLabelCentered);

            Rect labelRect = GUILayoutUtility.GetLastRect();

            if (GUI.Button(labelRect, "", new GUIStyle()))
            {
                Application.OpenURL("https://u3d.as/3iHy");
            }

            GUILayout.Space(5);
        }

        // GUI Utils
        public static void DrawShaderBanner(Material material)
        {
            var splitLine = material.shader.name.Split(char.Parse("/"));
            var splitCount = splitLine.Length;
            var title = splitLine[splitCount - 1];
            var subtitle = splitLine[splitCount - 2];

            StyledGUI.DrawInspectorBanner(title, "Lite / " + subtitle);
        }

        public static void DrawActiveKeywords(Material material)
        {
            GUILayout.Space(10);

            var styleLabel = new GUIStyle(EditorStyles.label)
            {
                richText = true,
                alignment = TextAnchor.MiddleLeft,
                wordWrap = true,
            };

            var keywords = material.enabledKeywords;

            for (int i = 0; i < keywords.Length; i++)
            {
                DrawTechincalLabel(keywords[i].name, styleLabel);
            }
        }

        public static void DrawTechincalLabel(string label, GUIStyle style)
        {
            GUILayout.Label("<size=10>" + label + "</size>", style);
        }

        // Property Utils
        public static bool GetPropertyVisibility(Material material, string internalName)
        {
            bool valid = true;

            var shaderName = material.shader.name;
            var projectPipeline = TVELiteUtils.GetProjectPipeline();

            if (internalName == "unity_Lightmaps")
                valid = false;

            if (internalName == "unity_LightmapsInd")
                valid = false;

            if (internalName == "unity_ShadowMasks")
                valid = false;

            if (internalName.Contains("_Banner"))
                valid = false;

            if (internalName == "_SpecColor")
                valid = false;

            if (internalName.Contains("_AI_Hemi"))
                valid = false;

            if (internalName.Contains("_AI_Clip"))
                valid = false;

            if (material.HasProperty("_RenderMode"))
            {
                if (material.GetInt("_RenderMode") == 0 && internalName == "_RenderZWrite")
                    valid = false;
            }

            bool hasRenderNormals = false;

            if (material.HasProperty("_render_normal"))
            {
                hasRenderNormals = true;
            }

            if (!hasRenderNormals)
            {
                if (internalName == "_RenderNormal")
                    valid = false;
            }

            //if (!shaderName.Contains("Vertex Lit"))
            //{
            //    if (internalName == "_RenderDirect")
            //        valid = false;
            //    if (internalName == "_RenderShadow")
            //        valid = false;
            //    if (internalName == "_RenderAmbient")
            //        valid = false;
            //}

            if (material.HasProperty("_RenderCull"))
            {
                if (material.GetInt("_RenderCull") == 2 && internalName == "_RenderNormal")
                    valid = false;
            }

            //if (!material.HasProperty("_AlphaFeatherValue"))
            //{
            //    if (internalName == "_RenderCoverage")
            //        valid = false;
            //}

            if (projectPipeline != "HDRenderPipeline")
            {
                if (internalName == "_RenderDecals")
                    valid = false;
                if (internalName == "_RenderSSR")
                    valid = false;
            }

            if (projectPipeline == "Standard")
            {
                if (internalName == "_RenderMotion")
                    valid = false;
            }

            if (material.HasProperty("_ObjectModelMode"))
            {
                if (material.GetInt("_ObjectModelMode") == 0)
                {
                    if (internalName == "_MotionBaseMaskMode")
                        valid = false;
                    if (internalName == "_MotionSmallMaskMode")
                        valid = false;
                    if (internalName == "_MotionTinyMaskMode")
                        valid = false;
                }
            }

            //bool showMainMaskMessage = false;

            //if (material.HasProperty("_MainMaskMinValue"))
            //{
            //    showMainMaskMessage = true;
            //}

            //if (!showMainMaskMessage)
            //{
            //    if (internalName == "_MessageMainMask")
            //        valid = false;
            //}

            if (material.HasProperty("_MainColorMode"))
            {
                if (material.GetInt("_MainColorMode") == 0)
                {
                    if (internalName == "_MainColorTwo")
                        valid = false;
                }
            }

            if (material.HasProperty("_SecondColorMode"))
            {
                if (material.GetInt("_SecondColorMode") == 0)
                {
                    if (internalName == "_SecondColorTwo")
                        valid = false;
                }
            }

            if (material.HasProperty("_ThirdColorMode"))
            {
                if (material.GetInt("_ThirdColorMode") == 0)
                {
                    if (internalName == "_ThirdColorTwo")
                        valid = false;
                }
            }

            if (material.HasProperty("_ImpostorColorMode"))
            {
                if (material.GetInt("_ImpostorColorMode") == 0)
                {
                    if (internalName == "_ImpostorColorTwo")
                        valid = false;
                }
            }

            if (material.HasProperty("_SubsurfaceIntensityValue"))
            {
                if (projectPipeline == "High Definition")
                {
                    if (shaderName.Contains("Standard"))
                    {
                        if (internalName == "_SubsurfaceDiffusion")
                            valid = false;
                        if (internalName == "_SubsurfaceSpace")
                            valid = false;

                        if (internalName == "_SubsurfaceNormalValue")
                            valid = false;
                        if (internalName == "_SubsurfaceDirectValue")
                            valid = false;
                        if (internalName == "_SubsurfaceAmbientValue")
                            valid = false;
                        if (internalName == "_SubsurfaceShadowValue")
                            valid = false;
                        if (internalName == "_SubsurfaceThicknessValue")
                            valid = false;
                    }

                    if (shaderName.Contains("Subsurface"))
                    {
                        if (internalName == "_SubsurfaceColor")
                            valid = false;
                        if (internalName == "_SubsurfaceScatteringValue")
                            valid = false;
                        if (internalName == "_SubsurfaceAngleValue")
                            valid = false;
                        if (internalName == "_SubsurfaceNormalValue")
                            valid = false;
                        if (internalName == "_SubsurfaceDirectValue")
                            valid = false;
                        if (internalName == "_SubsurfaceAmbientValue")
                            valid = false;
                        if (internalName == "_SubsurfaceShadowValue")
                            valid = false;
                    }
                }
                else
                {
                    // Standard Render Pipeline
                    if (internalName == "_Translucency")
                        valid = false;
                    if (internalName == "_TransNormalDistortion")
                        valid = false;
                    if (internalName == "_TransScattering")
                        valid = false;
                    if (internalName == "_TransDirect")
                        valid = false;
                    if (internalName == "_TransAmbient")
                        valid = false;
                    if (internalName == "_TransShadow")
                        valid = false;

                    // Universal Render Pipeline
                    if (internalName == "_TransStrength")
                        valid = false;
                    if (internalName == "_TransNormal")
                        valid = false;

                    if (internalName == "_SubsurfaceDiffusion")
                        valid = false;
                    if (internalName == "_SubsurfaceSpace")
                        valid = false;

                    if (shaderName.Contains("Standard"))
                    {
                        if (internalName == "_SubsurfaceNormalValue")
                            valid = false;
                        if (internalName == "_SubsurfaceDirectValue")
                            valid = false;
                        if (internalName == "_SubsurfaceAmbientValue")
                            valid = false;
                        if (internalName == "_SubsurfaceShadowValue")
                            valid = false;
                    }
                }
            }

            if (internalName == "_OcclusionBakeInfo")
            {
                if (material.HasProperty("_OcclusionBakeInfo") && material.GetInt("_OcclusionBakeInfo") == 0)
                {
                    valid = false;
                }
            }

            if (internalName == "_GradientBakeInfo")
            {
                if (material.HasProperty("_GradientBakeInfo") && material.GetInt("_GradientBakeInfo") == 0)
                {
                    valid = false;
                }
            }

            if (internalName == "_TintingBakeInfo")
            {
                if (material.HasProperty("_TintingBakeInfo") && material.GetInt("_TintingBakeInfo") == 0)
                {
                    valid = false;
                }
            }

            if (internalName == "_DrynessBakeInfo")
            {
                if (material.HasProperty("_DrynessBakeInfo") && material.GetInt("_DrynessBakeInfo") == 0)
                {
                    valid = false;
                }
            }

            if (internalName == "_OverlayBakeInfo")
            {
                if (material.HasProperty("_OverlayBakeInfo") && material.GetInt("_OverlayBakeInfo") == 0)
                {
                    valid = false;
                }
            }

            if (internalName == "_WetnessBakeInfo")
            {
                if (material.HasProperty("_WetnessBakeInfo") && material.GetInt("_WetnessBakeInfo") == 0)
                {
                    valid = false;
                }
            }

            if (internalName == "_CutoutBakeInfo")
            {
                if (material.HasProperty("_CutoutBakeInfo") && material.GetInt("_CutoutBakeInfo") == 0)
                {
                    valid = false;
                }
            }

            if (material.HasProperty("_IsImpostorShader"))
            {
                if (internalName == "_Shader")
                {
                    if (material.HasProperty("_ImpostorMaskMode") && (material.GetInt("_ImpostorMaskMode") == 0 || material.GetInt("_ImpostorMaskMode") == 2))
                    {
                        valid = false;
                    }
                }

                if (internalName == "_Packed")
                {
                    if (material.HasProperty("_ImpostorMaskMode") && (material.GetInt("_ImpostorMaskMode") == 0 || material.GetInt("_ImpostorMaskMode") == 1 || material.GetInt("_ImpostorMaskMode") == 3))
                    {
                        valid = false;
                    }
                }

                if (internalName == "_Vertex")
                {
                    if (material.HasProperty("_ImpostorMaskMode") && (material.GetInt("_ImpostorMaskMode") == 0 || material.GetInt("_ImpostorMaskMode") == 2 || material.GetInt("_ImpostorMaskMode") == 3))
                    {
                        valid = false;
                    }
                }

                if (internalName == "_ImpostorMaskOffInfo")
                {
                    if (material.HasProperty("_ImpostorMaskMode") && material.GetInt("_ImpostorMaskMode") != 0)
                    {
                        valid = false;
                    }
                }

                if (internalName == "_ImpostorMaskDefaultInfo")
                {
                    if (material.HasProperty("_ImpostorMaskMode") && material.GetInt("_ImpostorMaskMode") != 1)
                    {
                        valid = false;
                    }
                }

                if (internalName == "_ImpostorMaskPackedInfo")
                {
                    if (material.HasProperty("_ImpostorMaskMode") && material.GetInt("_ImpostorMaskMode") != 2)
                    {
                        valid = false;
                    }
                }

                if (internalName == "_ImpostorMaskShadingInfo")
                {
                    if (material.HasProperty("_ImpostorMaskMode") && material.GetInt("_ImpostorMaskMode") != 3)
                    {
                        valid = false;
                    }
                }
            }

            return valid;
        }

        public static string GetPropertyDisplay(Material material, string internalName, string displayName)
        {
            //if (internalName == "_AI_Parallax")
            //{
            //    GUILayout.Space(10);
            //}

            //if (internalName == "AI_CLIP_NEIGHBOURS_FRAMES")
            //{
            //    GUILayout.Space(10);
            //}

            //if (internalName == "_AI_Clip")
            //{
            //    displayName = "Impostor Alpha Treshold";
            //}

            if (internalName == "_Albedo")
            {
                displayName = "Impostor Albedo";
            }

            if (internalName == "_Normals")
            {
                displayName = "Impostor Normal";
            }

            if (material.HasProperty("_MainColorMode"))
            {
                if (material.GetInt("_MainColorMode") == 1 && internalName == "_MainColor")
                {
                    displayName = displayName + "A";
                }
            }

            if (material.HasProperty("_SecondColorMode"))
            {
                if (material.GetInt("_SecondColorMode") == 1 && internalName == "_SecondColor")
                {
                    displayName = displayName + "A";
                }
            }

            if (material.HasProperty("_ThirdColorMode"))
            {
                if (material.GetInt("_ThirdColorMode") == 1 && internalName == "_ThirdColor")
                {
                    displayName = displayName + "A";
                }
            }

            if (material.HasProperty("_ImpostorColorMode"))
            {
                if (material.GetInt("_ImpostorColorMode") == 1 && internalName == "_ImpostorColor")
                {
                    displayName = displayName + "A";
                }
            }

            //if (EditorGUIUtility.currentViewWidth > 550)
            //{
            //    if (internalName == "_MainMetallicValue")
            //    {
            //        if (shaderName.Contains("Standard Lit") || shaderName.Contains("Subsurface Lit"))
            //        {
            //            displayName = displayName + " (Mask Red)";
            //        }
            //    }

            //    if (internalName == "_MainOcclusionValue")
            //    {
            //        displayName = displayName + " (Mask Green)";
            //    }

            //    if (internalName == "_MainSmoothnessValue")
            //    {
            //        if (shaderName.Contains("Standard Lit") || shaderName.Contains("Subsurface Lit"))
            //        {
            //            displayName = displayName + " (Mask Alpha)";
            //        }
            //    }

            //    if (internalName == "_MainMaskRemap")
            //    {
            //        displayName = displayName + " (Mask Blue)";
            //    }

            //    if (internalName == "_SecondMetallicValue")
            //    {
            //        if (shaderName.Contains("Standard Lit") || shaderName.Contains("Subsurface Lit"))
            //        {
            //            displayName = displayName + " (Mask Red)";
            //        }
            //    }

            //    if (internalName == "_SecondOcclusionValue")
            //    {
            //        displayName = displayName + " (Mask Green)";
            //    }

            //    if (internalName == "_SecondSmoothnessValue")
            //    {
            //        if (shaderName.Contains("Standard Lit") || shaderName.Contains("Subsurface Lit"))
            //        {
            //            displayName = displayName + " (Mask Alpha)";
            //        }
            //    }

            //    if (internalName == "_SecondMaskRemap")
            //    {
            //        displayName = displayName + " (Mask Blue)";
            //    }

            //    if (internalName == "_DetailMeshMode" || internalName == "_DetailMeshRemap")
            //    {
            //        if (material.HasProperty("_DetailMeshMode"))
            //        {
            //            if (material.GetInt("_DetailMeshMode") == 0)
            //            {
            //                displayName = displayName + " (Vertex Blue)";
            //            }
            //            else if (material.GetInt("_DetailMeshMode") == 1)
            //            {
            //                displayName = displayName + " (World Normals)";
            //            }
            //        }
            //    }

            //    if (internalName == "_DetailMaskMode" || internalName == "_DetailMaskRemap")
            //    {
            //        displayName = displayName + " (Mask Blue)";
            //    }

            //    if (internalName == "_VertexOcclusionRemap")
            //    {
            //        displayName = displayName + " (Vertex Green)";
            //    }

            //    if (internalName == "_GradientMaskRemap")
            //    {
            //        displayName = displayName + " (Vertex Alpha)";
            //    }
            //}

            return displayName;
        }

        public static void GetActiveDisplay(Material material, string internalName, string categoryName, string intensityName, string color, GUIStyle subTitleStyle)
        {
            if (internalName != categoryName)
            {
                return;
            }

            bool active = false;

            if (material.HasProperty(intensityName))
            {
                if (material.GetFloat(intensityName) > 0)
                {
                    active = true;
                }
            }

            if (active)
            {
                var lastRectYOffset = 32;

                if (material.GetInt(categoryName) == 0)
                {
                    lastRectYOffset = 22;
                }

                TVELiteUtils.SetActiveDisplay(lastRectYOffset, color, subTitleStyle);
            }
        }

        public static void GetActiveDisplay(Material material, string internalName, string categoryName, string[] intensityNames, string color, GUIStyle subTitleStyle)
        {
            if (internalName != categoryName)
            {
                return;
            }

            bool active = false;

            for (int i = 0; i < intensityNames.Length; i++)
            {
                var intensityName = intensityNames[i];

                if (material.HasProperty(intensityName))
                {
                    if (material.GetFloat(intensityName) > 0)
                    {
                        active = true;
                        break;
                    }
                }
            }

            if (active)
            {
                var lastRectYOffset = 32;

                if (material.GetInt(categoryName) == 0)
                {
                    lastRectYOffset = 22;
                }

                TVELiteUtils.SetActiveDisplay(lastRectYOffset, color, subTitleStyle);
            }
        }

        public static void SetActiveDisplay(int offset, string color, GUIStyle subTitleStyle)
        {
            var lastRect = EditorGUILayout.GetControlRect(GUILayout.Height(-2));

            var subRect = new Rect(lastRect.xMax - 50, lastRect.y - offset, 50, 20);

            string subtitle;

            if (EditorGUIUtility.isProSkin)
            {
                subtitle = "<size=9><color=#" + color + ">●</color></size>";
            }
            else
            {
                subtitle = "<size=9>●</size>";
            }

            GUI.Label(subRect, "<size=10>" + subtitle + "</size>", subTitleStyle);
        }

#endif

        // Asset Utils
        public static TVEProjectData GetProjectData()
        {
            var projectData = new TVEProjectData();

            string pipeline = "Standard";

            if (GraphicsSettings.defaultRenderPipeline != null)
            {
                if (GraphicsSettings.defaultRenderPipeline.GetType().ToString().Contains("Universal"))
                {
                    pipeline = "Universal";
                }

                if (GraphicsSettings.defaultRenderPipeline.GetType().ToString().Contains("HD"))
                {
                    pipeline = "High Definition";
                }
            }

            if (QualitySettings.renderPipeline != null)
            {
                if (QualitySettings.renderPipeline.GetType().ToString().Contains("Universal"))
                {
                    pipeline = "Universal";
                }

                if (QualitySettings.renderPipeline.GetType().ToString().Contains("HD"))
                {
                    pipeline = "High Definition";
                }
            }

            projectData.pipeline = pipeline;

            if (pipeline != "Standard")
            {
                var version = Application.unityVersion.Replace("f", "x").Replace("a", "x").Replace("b", "x");

                var versionSplit = version.Split(".");

                var version0 = int.Parse(versionSplit[0], CultureInfo.InvariantCulture);
                var version1 = int.Parse(versionSplit[1], CultureInfo.InvariantCulture);
                var version2Split = versionSplit[2].Split("x");
                var version2 = int.Parse(version2Split[0], CultureInfo.InvariantCulture);

                if (version0 == 2021)
                {
                    var minimumSplit = minimumVersionFor2021_3.Split(".");
                    var minimum2 = int.Parse(minimumSplit[2], CultureInfo.InvariantCulture);

                    if (version1 != 3)
                    {
                        projectData.isSupported = false;
                    }
                    else
                    {
                        if (version2 < minimum2)
                        {
                            projectData.isSupported = false;
                        }
                    }

                    projectData.version = "2021.3+";
                }

                if (version0 == 2022)
                {
                    var minimumSplit = minimumVersionFor2022_3.Split(".");
                    var minimum2 = int.Parse(minimumSplit[2], CultureInfo.InvariantCulture);

                    if (version1 != 3)
                    {
                        projectData.isSupported = false;
                    }
                    else
                    {
                        if (version2 < minimum2)
                        {
                            projectData.isSupported = false;
                        }
                    }

                    projectData.version = "2022.3+";
                }

                if (version0 == 6000)
                {
                    if (version1 == 0)
                    {
                        var minimumSplit = minimumVersionFor6000_0.Split(".");
                        var minimum2 = int.Parse(minimumSplit[2], CultureInfo.InvariantCulture);

                        if (version2 < minimum2)
                        {
                            projectData.isSupported = false;
                        }
                    }

                    if (version1 == 1)
                    {
                        var minimumSplit = minimumVersionFor6000_1.Split(".");
                        var minimum2 = int.Parse(minimumSplit[2], CultureInfo.InvariantCulture);

                        if (version2 < minimum2)
                        {
                            projectData.isSupported = false;
                        }
                    }

                    projectData.version = "6000.0+";
                }

                var minimum = minimumVersionFor2021_3;

                if (version0 == 2022)
                {
                    minimum = minimumVersionFor2022_3;
                }

                if (version0 == 6000)
                {
                    minimum = minimumVersionFor6000_0;
                }

                projectData.minimum = minimum;
            }

            return projectData;
        }

        public static string GetProjectPipeline()
        {
            string pipeline = "Standard";

            if (GraphicsSettings.defaultRenderPipeline != null)
            {
                if (GraphicsSettings.defaultRenderPipeline.GetType().ToString().Contains("Universal"))
                {
                    pipeline = "Universal";
                }

                if (GraphicsSettings.defaultRenderPipeline.GetType().ToString().Contains("HD"))
                {
                    pipeline = "High Definition";
                }
            }

            if (QualitySettings.renderPipeline != null)
            {
                if (QualitySettings.renderPipeline.GetType().ToString().Contains("Universal"))
                {
                    pipeline = "Universal";
                }

                if (QualitySettings.renderPipeline.GetType().ToString().Contains("HD"))
                {
                    pipeline = "High Definition";
                }
            }

            return pipeline;
        }

#if UNITY_EDITOR

        public static string FindAsset(string filter)
        {
            var assetPath = "";

            var assetGUIDs = AssetDatabase.FindAssets("glob:\"" + filter + "\"");

            if (assetGUIDs != null && assetGUIDs.Length > 0)
            {
                assetPath = AssetDatabase.GUIDToAssetPath(assetGUIDs[0]);
            }

            return assetPath;
        }

        public static string GetAssetFolder()
        {
            var folder = TVELiteUtils.FindAsset("The Visual Engine Lite.pdf");
            folder = folder.Replace("/The Visual Engine Lite.pdf", "");

            return folder;
        }

        public static string GetUserFolder()
        {
            var folder = TVELiteUtils.FindAsset("Boxophobic+.pdf");
            folder = folder.Replace("/Boxophobic+.pdf", "");

            return folder;
        }


        public static void SetDefineSymbols(string symbol)
        {
#if UNITY_2023_1_OR_NEWER
            BuildTarget buildTarget = EditorUserBuildSettings.activeBuildTarget;
            BuildTargetGroup targetGroup = BuildPipeline.GetBuildTargetGroup(buildTarget);
            var namedBuildTarget = UnityEditor.Build.NamedBuildTarget.FromBuildTargetGroup(targetGroup);
            var defineSymbols = PlayerSettings.GetScriptingDefineSymbols(namedBuildTarget);
#else
            var defineSymbols = PlayerSettings.GetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup);
#endif

            if (!defineSymbols.Contains(symbol))
            {
                defineSymbols += ";" + symbol + ";";

#if UNITY_2023_1_OR_NEWER
                PlayerSettings.SetScriptingDefineSymbols(namedBuildTarget, defineSymbols);
#else
                PlayerSettings.SetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup, defineSymbols);
#endif
            }
        }


#endif
    }

    [System.Serializable]
    public class TVEProjectData
    {
        public string pipeline = "";
        public string version = "";
        public string minimum = "";
        public bool isSupported = true;

        public TVEProjectData()
        {

        }
    }

    [System.Serializable]
    public class TVEGlobalCoatData
    {
        [Tooltip("Controls the global Layer intensity.")]
        [Range(0.0f, 1.0f)]
        public float layerIntensity = 1.0f;
        [Tooltip("Controls the global Detail intensity.")]
        [Range(0.0f, 1.0f)]
        public float detailIntensity = 1.0f;
        public TVEGlobalCoatData()
        {

        }
    }

    [System.Serializable]
    public class TVEGlobalAtmoData
    {
        [Tooltip("Controls the global overlay intensity.")]
        [Range(0.0f, 1.0f)]
        public float overlayIntensity = 0.0f;
        [Tooltip("Controls the global Wetness intensity.")]

        public TVEGlobalAtmoData()
        {

        }
    }

    [System.Serializable]
    public class TVEGlobalGlowData
    {
        [Tooltip("Controls the global emissive color.")]
        [ColorUsage(false, true)]
        public Color emissiveColor = new Color(1f, 1f, 1f, 0);
        [Tooltip("Controls the global subsurface Intensity.")]
        [Range(0.0f, 1.0f)]
        public float subsurfaceIntensity = 1.0f;

        public TVEGlobalGlowData()
        {

        }
    }
}

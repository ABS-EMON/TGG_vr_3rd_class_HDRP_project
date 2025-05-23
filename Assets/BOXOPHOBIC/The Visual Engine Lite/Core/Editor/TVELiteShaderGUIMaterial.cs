﻿//Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using Boxophobic.StyledGUI;

namespace TheVisualEngineLite
{
    public class MaterialGUI : ShaderGUI
    {
        bool multiSelection = false;
        bool showInternalProperties = false;
        bool showHiddenProperties = false;
        bool showActiveKeywords = false;
        //bool showAdditionalInfo = false;

        bool advancedEnabled = true;

        string searchText = "";
        string[] searchResult;

        GUIStyle subTitleStyle;
        GUIStyle styleButton;

        public override void AssignNewShaderToMaterial(Material material, Shader oldShader, Shader newShader)
        {
            base.AssignNewShaderToMaterial(material, oldShader, newShader);

            TVELiteUtils.SetMaterialSettings(material);
        }

        public override void OnClosed(Material material)
        {
            base.OnClosed(material);
        }

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
        {
            var material0 = materialEditor.target as Material;
            var materials = materialEditor.targets;

            if (materials.Length > 1)
                multiSelection = true;

            // Used for impostors only
            if (material0.HasProperty("_IsInitialized"))
            {
                if (material0.GetFloat("_IsInitialized") > 0)
                {
                    DrawDynamicInspector(material0, materialEditor, props);
                }
                else
                {
                    DrawInitInspector(material0);
                }
            }
            else
            {
                DrawDynamicInspector(material0, materialEditor, props);
            }

            foreach (Material material in materials)
            {
                TVELiteUtils.SetMaterialSettings(material);
            }
        }

        void DrawDynamicInspector(Material material, MaterialEditor materialEditor, MaterialProperty[] props)
        {
            subTitleStyle = new GUIStyle("label")
            {
                richText = true,
                alignment = TextAnchor.MiddleRight
            };

            styleButton = new GUIStyle(GUI.skin.GetStyle("Button"))
            {
                alignment = TextAnchor.MiddleLeft,
            };


            bool showCategory = true;

            TVELiteUtils.DrawShaderBanner(material);

            GUILayout.Space(5);

            searchText = TVELiteUtils.DrawSearchField(searchText, out searchResult, 2);

            GUILayout.Space(10);

            TVELiteUtils.DrawCopySettingsFromObject(material);

            GUILayout.Space(15);

            var customPropsList = new List<MaterialProperty>();

            if (multiSelection)
            {
                for (int i = 0; i < props.Length; i++)
                {
                    var prop = props[i];

                    if (prop.flags == MaterialProperty.PropFlags.HideInInspector)
                        continue;

                    if (prop.name == "unity_Lightmaps")
                        continue;

                    if (prop.name == "unity_LightmapsInd")
                        continue;

                    if (prop.name == "unity_ShadowMasks")
                        continue;

                    customPropsList.Add(prop);
                }
            }
            else
            {
                for (int i = 0; i < props.Length; i++)
                {
                    var prop = props[i];
                    var displayName = prop.displayName;
                    var internalName = prop.name;

                    if (prop.flags == MaterialProperty.PropFlags.HideInInspector && !showHiddenProperties)
                    {
                        continue;
                    }

                    //if (MHUtils.GetPropertyVisibility(material, internalName))
                    //{
                    //    customPropsList.Add(prop);
                    //}

                    bool searchValid = false;

                    foreach (var tag in searchResult)
                    {
                        if (displayName.ToUpper().Contains(tag))
                        {
                            searchValid = true;
                            break;
                        }

                        if (internalName.ToUpper().Contains(tag))
                        {
                            searchValid = true;
                            break;
                        }
                    }

                    if (searchValid)
                    {
                        if (internalName.Contains("Category"))
                        {
                            customPropsList.Add(prop);

                            if (material.GetInt(internalName) == 0)
                            {
                                showCategory = false;
                            }
                            else
                            {
                                showCategory = true;
                            }
                        }
                        else
                        {
                            if (showCategory)
                            {
                                if (TVELiteUtils.GetPropertyVisibility(material, internalName))
                                {
                                    customPropsList.Add(prop);
                                }
                            }
                        }
                    }
                }
            }

            for (int i = 0; i < customPropsList.Count; i++)
            {
                var property = customPropsList[i];
                var internalName = property.name;
                var displayName = TVELiteUtils.GetPropertyDisplay(material, property.name, property.displayName);

                if (showInternalProperties)
                {
                    bool isSpecialProp = internalName.Contains("Category") || internalName.Contains("End") || internalName.Contains("Space") || internalName.Contains("Info") || internalName.Contains("Message");

                    if (isSpecialProp)
                    {
                        DrawDefaultProperty(materialEditor, property, internalName, displayName);
                    }
                    else
                    {
                        DrawInternalProperty(materialEditor, property, internalName, displayName);
                    }
                }
                else
                {
                    DrawDefaultProperty(materialEditor, property, internalName, displayName);
                }

                TVELiteUtils.GetActiveDisplay(material, internalName, "_LayerCategory", "_SecondIntensityValue", "79D0FF", subTitleStyle);
                TVELiteUtils.GetActiveDisplay(material, internalName, "_DetailCategory", "_ThirdIntensityValue", "8FFF79", subTitleStyle);
                TVELiteUtils.GetActiveDisplay(material, internalName, "_OcclusionCategory", "_OcclusionIntensityValue", "60E87F", subTitleStyle);
                TVELiteUtils.GetActiveDisplay(material, internalName, "_GradientCategory", "_GradientIntensityValue", "FFBC5B", subTitleStyle);
                TVELiteUtils.GetActiveDisplay(material, internalName, "_OverlayCategory", "_OverlayIntensityValue", "98C8FF", subTitleStyle);
                TVELiteUtils.GetActiveDisplay(material, internalName, "_EmissiveCategory", "_EmissiveIntensityValue", "FFF700", subTitleStyle);
                TVELiteUtils.GetActiveDisplay(material, internalName, "_SubsurfaceCategory", "_SubsurfaceIntensityValue", "CFFF75", subTitleStyle);
                TVELiteUtils.GetActiveDisplay(material, internalName, "_MotionCategory", "_MotionIntensityValue", "7FFF79", subTitleStyle);
                TVELiteUtils.GetActiveDisplay(material, internalName, "_NormalCategory", new string[] { "_NormalFlattenValue", "_NormalSphereValue" }, "9393FF", subTitleStyle);
            }

            //GUILayout.Space(10);

            advancedEnabled = StyledGUI.DrawInspectorCategory("Advanced Settings", advancedEnabled, true, 0, 0);

            if (advancedEnabled)
            {
                GUILayout.Space(10);

                materialEditor.EnableInstancingField();

                GUILayout.Space(10);

                TVELiteUtils.DrawRenderQueue(material, materialEditor);
                TVELiteUtils.DrawBakeGIMode(material);

                GUILayout.Space(10);

                showInternalProperties = EditorGUILayout.Toggle("Show Internal Properties", showInternalProperties);
                showHiddenProperties = EditorGUILayout.Toggle("Show Hidden Properties", showHiddenProperties);
                showActiveKeywords = EditorGUILayout.Toggle("Show Active Keywords", showActiveKeywords);
                //showAdditionalInfo = EditorGUILayout.Toggle("Show Additional Info", showAdditionalInfo);

                if (showActiveKeywords)
                {
                    TVELiteUtils.DrawActiveKeywords(material);
                }

                //if (showAdditionalInfo)
                //{
                //    TVEUtils.DrawTechnicalDetails(material);
                //}
            }

            GUILayout.Space(15);

            TVELiteUtils.DrawPoweredBy();
        }

        void DrawInitInspector(Material material)
        {
            TVELiteUtils.DrawShaderBanner(material);

            GUILayout.Space(5);

            EditorGUILayout.HelpBox("The original material properties are not copied to the Impostor material. Drag the game object the impostor is baked from to the field below to copy the properties!", MessageType.Error, true);

            GUILayout.Space(10);

            TVELiteUtils.DrawCopySettingsFromObject(material);

            GUILayout.Space(10);
        }


        void DrawDefaultProperty(MaterialEditor materialEditor, MaterialProperty property, string internalName, string displayName)
        {
            if (internalName == "_Albedo" || internalName == "_Normals")
            {
                materialEditor.TexturePropertySingleLine(new GUIContent(displayName, ""), property);
            }
            else
            {
                materialEditor.ShaderProperty(property, displayName);
            }
        }

        void DrawInternalProperty(MaterialEditor materialEditor, MaterialProperty property, string internalName, string displayName)
        {
            GUILayout.BeginHorizontal();

            //materialEditor.DefaultShaderProperty(customPropsList[i], displayName + "  ( " + customPropsList[i].name + " )");
            materialEditor.DefaultShaderProperty(property, displayName);

            GUILayout.Space(2);

            if (GUILayout.Button("C", styleButton, GUILayout.Width(20), GUILayout.Height(18)))
            {
                GUIUtility.systemCopyBuffer = internalName;
            }

            GUILayout.EndHorizontal();
        }
    }
}


// Made with Amplify Shader Editor v1.9.8.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Visual Engine/Impostors/Octahedron Subsurface Lit (Lite)"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HideInInspector] _IsVersion( "_IsVersion", Float ) = 2070
		[HideInInspector] _IsTVEShader( "_IsTVEShader", Float ) = 1
		[HideInInspector] _IsShared( "_IsShared", Float ) = 0
		[HideInInspector] _IsIdentifier( "_IsIdentifier", Float ) = 0
		[HideInInspector] _IsCollected( "_IsCollected", Float ) = 0
		[HideInInspector] _IsConverted( "_IsConverted", Float ) = 0
		[HideInInspector] _IsCustomShader( "_IsCustomShader", Float ) = 0
		[HideInInspector] _IsInitialized( "_IsInitialized", Float ) = 0
		[StyledCategory(Render Settings, true, 0, 10)] _CategoryRender( "[ Category Render ]", Float ) = 1
		[Enum(Off,0,On,1)] _RenderSSR( "Render SSR", Float ) = 0
		[Enum(Off,0,On,1)] _RenderDecals( "Render Decals", Float ) = 0
		[Enum(Auto,0,Off,1,On,2)] _RenderMotion( "Render Motion", Float ) = 0
		[Enum(Off,0,On,1)] _RenderShadow( "Render Shadows", Float ) = 1
		[StyledSpace(10)] _EndRender( "[ End Render ]", Float ) = 1
		[HideInInspector] _NoiseTex3D( "Noise Mask 3D", 3D ) = "white" {}
		[HideInInspector] _NoiseTexSS( "Noise Mask SS", 2D ) = "white" {}
		[StyledCategory(Global Settings, true, 0, 10)] _GlobalCategory( "[ Global Category ]", Float ) = 1
		[StyledMessage(Warning, Global Elements and Layers are only available with The Visual Engine Core package., 0, 0)] _GlobalLiteInfo( "# Global Lite Info", Float ) = 0
		[StyledSpace(10)] _GlobalEnd( "[ Global End ]", Float ) = 1
		[StyledCategory(Impostor Settings, true, 0, 10)] _ImpostorCategory( "[ Impostor Category ]", Float ) = 1
		[StyledMessage(Warning, When the Maps option is disabled__ only the Albedo and Normal textures are used. Metallic__ Emissive__ Multi Mask__ Smoothness and Vertex Color masks are not supported., 0, 10)] _ImpostorMaskOffInfo( "_ImpostorMaskOffInfo", Float ) = 0
		[StyledMessage(Info, The Default maps mode uses the Shader texture for Metallic R__ Occlusion or Emissive G__ Multi Mask B__ and Smoothness A and the Vertex texture for Vertex Color used for mesh masks. Confider using the Packed option if Metallic__ Emissive__ Vertex B and Vertex A masks are not used to save performance and texture memory., 0, 10)] _ImpostorMaskDefaultInfo( "_ImpostorMaskDefaultInfo", Float ) = 0
		[StyledMessage(Info, The Packed maps mode uses the Packed texture for Vertex R__ Vertex G__ Multi Mask B__ and Smoothness A. The packed texture stores the most common masks used for vegetation assets., 0, 10)] _ImpostorMaskPackedInfo( "_ImpostorMaskPackedInfo", Float ) = 0
		[StyledMessage(Info, The Shading maps mode uses the Shader texture for Metallic R__ Occlusion or Emissive G__ Multi Mask B__ and Smoothness A. Using the mesh masks for globals will have no effect on the shading., 0, 10)] _ImpostorMaskShadingInfo( "_ImpostorMaskShadingInfo", Float ) = 0
		[NoScaleOffset] _Albedo( "Albedo (RGB) Alpha (A)", 2D ) = "white" {}
		[NoScaleOffset] _Normals( "Normals (RGB) Depth (A)", 2D ) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine] _Shader( "Impostor Shader", 2D ) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine] _Packed( "Impostor Packed", 2D ) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine] _Vertex( "Impostor Vertex", 2D ) = "white" {}
		[StyledSpace(10)] _ImpostorSpace0( "Impostor Space0", Float ) = 1
		_AI_Parallax( "Parallax", Range( -1, 1 ) ) = 1
		_AI_TextureBias( "Texture Bias", Float ) = -1
		_AI_ForwardBias( "Forward Bias", Range( 0, 2 ) ) = 0
		_AI_ShadowBias( "Shadow Bias", Range( 0, 2 ) ) = 0.333
		_AI_ShadowView( "Shadow View", Range( 0, 1 ) ) = 1
		[StyledSpace(10)] _ImpostorSpace1( "Impostor Space1", Float ) = 1
		[Toggle( AI_CLIP_NEIGHBOURS_FRAMES )] AI_CLIP_NEIGHBOURS_FRAMES( "Clip Neighbours Frames", Float ) = 0
		[Toggle( _HEMI_ON )] _AI_Hemi( "Hemi", Float ) = 0
		[HideInInspector] _AI_SizeOffset( "Size & Offset", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _AI_BoundsMin( "Bounds Min", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _AI_BoundsSize( "Bounds Size", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _AI_DepthSize( "DepthSize", Float ) = 1
		[HideInInspector] _AI_Offset( "Offset", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _AI_ImpostorSize( "Impostor Size", Float ) = 1
		[HideInInspector] _AI_Frames( "Frames", Float ) = 16
		_AI_Clip( "Clip", Range( 0, 1 ) ) = 0.5
		[Enum(Off,0,Default,1,Packed,2,Shading,3)][Space(10)] _ImpostorMaskMode( "Impostor Maps", Float ) = 2
		[Enum(Constant,0,Dual Colors,1)] _ImpostorColorMode( "Impostor Color", Float ) = 0
		[HDR] _ImpostorColor( "Impostor Color", Color ) = ( 1, 1, 1, 1 )
		[HDR] _ImpostorColorTwo( "Impostor ColorB", Color ) = ( 1, 1, 1, 1 )
		_ImpostorAlphaClipValue( "Impostor Alpha", Range( 0, 1 ) ) = 0.5
		_ImpostorMetallicValue( "Impostor Metallic", Range( 0, 1 ) ) = 0
		_ImpostorOcclusionValue( "Impostor Occlusion", Range( 0, 1 ) ) = 1
		_ImpostorSmoothnessValue( "Impostor Smoothness", Range( 0, 1 ) ) = 1
		[StyledSpace(10)] _ImpostorEnd( "[ Impostor End ]", Float ) = 1
		[StyledCategory(Variation Settings, true, 0, 10)] _VariationCategory( "[ Variation Category ]", Float ) = 1
		[StyledMessage(Warning, The Variation feature is only available with The Visual Engine Core package., 0, 10)] _VariationLiteInfo( "# Variation Lite Info", Float ) = 0
		[StyledColoring] _VariationColoring( "# Variation Coloring", Color ) = ( 1, 1, 1, 0.6 )
		_VariationIntensityValue( "Variation Intensity", Range( 0, 1 ) ) = 0
		[HDR] _VariationColorOne( "Variation ColorA", Color ) = ( 0.4573758, 0.6226415, 0.2144001, 1 )
		[HDR] _VariationColorTwo( "Variation ColorB", Color ) = ( 0.7450981, 0.5238863, 0.1098039, 1 )
		[Space(10)] _VariationMultiValue( "Variation Multi Mask", Range( 0, 1 ) ) = 1
		[StyledRemapSlider] _VariationNoiseRemap( "Variation Noise Mask", Vector ) = ( 0, 1, 0, 0 )
		_VariationNoiseTillingValue( "Variation Noise Tilling", Range( 0, 100 ) ) = 10
		_VariationNoisePivotsValue1( "Variation Noise Pivots", Range( 0, 1 ) ) = 0
		[StyledSpace(10)] _VariationEnd( "[ Variation End ]", Float ) = 1
		[StyledCategory(Tinting Settings, true, 0, 10)] _TintingCategory( "[ Tinting Category ]", Float ) = 1
		[StyledMessage(Warning, The Tinting feature is only available with The Visual Engine Core package., 0, 10)] _TintingLiteInfo( "# Tinting Lite Info", Float ) = 0
		[StyledColoring] _TintingColoring( "# Tinting Coloring", Color ) = ( 1, 1, 1, 0.6 )
		_TintingIntensityValue( "Tinting Intensity", Range( 0, 1 ) ) = 0
		_TintingGrayValue( "Tinting Gray", Range( 0, 1 ) ) = 1
		[HDR][Gamma] _TintingColor( "Tinting Color", Color ) = ( 1, 1, 1, 1 )
		[StyledSpace(10)] _TintingSpace( "[ Tinting Space ]", Float ) = 1
		_TintingGlobalValue( "Tinting Paint Mask", Range( 0, 1 ) ) = 1
		_TintingMultiValue( "Tinting Multi Mask", Range( 0, 1 ) ) = 1
		_TintingLumaValue( "Tinting Luma Mask", Range( 0, 1 ) ) = 1
		[StyledRemapSlider] _TintingLumaRemap( "Tinting Luma Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledSpace(10)] _TintingEnd( "[ Tinting End]", Float ) = 1
		[StyledCategory(Dryness Settings, true, 0, 10)] _DrynessCategory( "[ Dryness Category ]", Float ) = 1
		[StyledMessage(Warning, The Dryness feature is only available with The Visual Engine Core package., 0, 10)] _DrynessLiteInfo( "# Dryness Lite Info", Float ) = 0
		[StyledColoring] _DrynessColoring( "# Dryness Coloring", Color ) = ( 1, 1, 1, 0.6 )
		_DrynessIntensityValue( "Dryness Intensity", Range( 0, 1 ) ) = 0
		_DrynessGrayValue( "Dryness Gray", Range( 0, 1 ) ) = 1
		_DrynessShiftValue( "Dryness Shift", Range( 0, 1 ) ) = 0
		[HDR][Gamma] _DrynessColor( "Dryness Color", Color ) = ( 1, 0.7083712, 0.495283, 1 )
		_DrynessSubsurfaceValue( "Dryness Subsurface", Range( 0, 1 ) ) = 0.5
		_DrynessSmoothnessValue( "Dryness Smoothness", Range( 0, 1 ) ) = 0.5
		[StyledSpace(10)] _DrynessSpace( "[ Dryness Space ]", Float ) = 1
		_DrynessGlobalValue( "Dryness Atmo Mask", Range( 0, 1 ) ) = 1
		_DrynessMultiValue( "Dryness Multi Mask", Range( 0, 1 ) ) = 1
		_DrynessLumaValue( "Dryness Luma Mask", Range( 0, 1 ) ) = 1
		[StyledRemapSlider] _DrynessLumaRemap( "Dryness Luma Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledSpace(10)] _DrynessEnd( "[ Dryness End ]", Float ) = 1
		[StyledCategory(Overlay Settings, true, 0, 10)] _OverlayCategory( "[ Overlay Category ]", Float ) = 1
		[StyledMessage(Info, The current settings are pre baked to the impostor., 0, 10)] _OverlayBakeInfo( "Overlay Baking Info", Float ) = 0
		_OverlayIntensityValue( "Overlay Intensity", Range( 0, 1 ) ) = 0
		[HDR] _OverlayColor( "Overlay Color", Color ) = ( 0.2815503, 0.4009458, 0.5377358, 1 )
		_OverlayNormalValue( "Overlay Normal", Range( -8, 8 ) ) = 1
		_OverlaySubsurfaceValue( "Overlay Subsurface", Range( 0, 1 ) ) = 0.5
		_OverlaySmoothnessValue( "Overlay Smoothness", Range( 0, 1 ) ) = 0.5
		[Space(10)] _OverlayGlobalValue( "Overlay Atmo Mask", Range( 0, 1 ) ) = 1
		_OverlayLumaValue( "Overlay Luma Mask", Range( 0, 1 ) ) = 1
		[StyledRemapSlider] _OverlayLumaRemap( "Overlay Luma Mask", Vector ) = ( 0, 1, 0, 0 )
		_OverlayProjValue( "Overlay ProjY Mask", Range( 0, 1 ) ) = 0.5
		[StyledRemapSlider] _OverlayProjRemap( "Overlay ProjY Mask", Vector ) = ( 0, 1, 0, 0 )
		_OverlayMeshValue( "Overlay Mesh Mask", Range( 0, 1 ) ) = 0
		[Enum(Vertex R,0,Vertex G,1,Vertex B,2,Vertex A,3)] _OverlayMeshMode( "Overlay Mesh Mask", Float ) = 1
		[StyledRemapSlider] _OverlayMeshRemap( "Overlay Mesh Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledRemapSlider] _OverlayBlendRemap( "Overlay Blend Mask", Vector ) = ( 0.1, 0.2, 0, 0 )
		[HideInInspector] _overlay_vert_mode( "_overlay_vert_mode", Vector ) = ( 0, 0, 0, 0 )
		[StyledSpace(10)] _OverlayEnd( "[ Overlay End ]", Float ) = 1
		[StyledCategory(Wetness Settings, true, 0, 10)] _WetnessCategory( "[ Wetness Category ]", Float ) = 1
		[StyledMessage(Warning, The Wetness feature is only available with The Visual Engine Core package., 0, 10)] _WetnessLiteInfo( "# Wetness Lite Info", Float ) = 0
		[StyledColoring] _WetnessColoring( "# Wetness Coloring", Color ) = ( 1, 1, 1, 0.6 )
		_WetnessIntensityValue( "Wetness Intensity", Range( 0, 1 ) ) = 0
		_WetnessContrastValue( "Wetness Contrast", Range( 0, 1 ) ) = 0.2
		_WetnessSmoothnessValue( "Wetness Smoothness", Range( 0, 1 ) ) = 0.8
		[StyledSpace(10)] _WetnessEnd( "[ Wetness End ]", Float ) = 1
		[StyledCategory(Cutout Settings, true, 0, 10)] _CutoutCategory( "[ Cutout Category ]", Float ) = 1
		[StyledMessage(Warning, The Cutout feature is only available with The Visual Engine Core package., 0, 10)] _CutoutLiteInfo( "# Cutout Lite Info", Float ) = 0
		[StyledColoring] _CutoutColoring( "# Cutout Coloring", Color ) = ( 1, 1, 1, 0.6 )
		_CutoutIntensityValue( "Cutout Intensity", Range( 0, 1 ) ) = 0
		[Enum(Off,0,Affect Shadow Pass,1)] _CutoutShadowMode( "Cutout Shadow", Float ) = 1
		[StyledSpace(10)] _CutoutSpace( "[ Cutout Space ]", Float ) = 1
		_CutoutGlobalValue( "Cutout Fade Mask", Range( 0, 1 ) ) = 1
		_CutoutMultiValue( "Cutout Multi Mask", Range( 0, 1 ) ) = 1
		_CutoutAlphaValue( "Cutout Alpha Mask", Range( 0, 1 ) ) = 0
		_CutoutNoiseValue( "Cutout Noise Mask", Range( 0, 1 ) ) = 1
		_CutoutNoiseTillingValue( "Cutout Noise Tilling", Range( 0, 100 ) ) = 10
		[StyledSpace(10)] _CutoutEnd( "[ Cutout End ]", Float ) = 1
		[StyledCategory(Dither Settings, true, 0, 10)] _DitherCategory( "[ Dither Category ]", Float ) = 1
		[StyledMessage(Warning, The Dither feature is only available with The Visual Engine Core package., 0, 10)] _DitherLiteInfo( "# Dither Lite Info", Float ) = 0
		[StyledColoring] _DitherColoring( "# Dither Coloring", Color ) = ( 1, 1, 1, 0.6 )
		_DitherConstantValue( "Dither Constant", Range( 0, 1 ) ) = 0
		_DitherDistanceValue( "Dither Distance", Range( 0, 1 ) ) = 0
		_DitherDistanceMinValue( "Dither Distance Start", Range( 0, 1000 ) ) = 0
		_DitherDistanceMaxValue( "Dither Distance Limit", Range( 0, 1000 ) ) = 0
		[Enum(Off,0,Affect Shadow Pass,1)] _DitherShadowMode( "Dither Shadow", Float ) = 1
		[Space(10)] _DitherMultiValue( "Dither Multi Mask", Range( 0, 1 ) ) = 0
		_DitherNoiseTillingValue( "Dither Noise Tilling", Range( 0, 100 ) ) = 50
		[StyledSpace(10)] _DitherEnd( "[ Dither End ]", Float ) = 1
		[StyledCategory(Emissive Settings, true, 0, 10)] _EmissiveCategory( "[ Emissive Category ]", Float ) = 1
		_EmissiveIntensityValue( "Emissive Intensity", Range( 0, 1 ) ) = 0
		[Enum(Constant,0,Multiply With Base Albedo,1)] _EmissiveColorMode( "Emissive Color", Float ) = 0
		[HDR] _EmissiveColor( "Emissive Color", Color ) = ( 1, 1, 1, 1 )
		[Enum(Nits,0,EV100,1)] _EmissivePowerMode( "Emissive Value", Float ) = 0
		_EmissivePowerValue( "Emissive Value", Float ) = 1
		_EmissiveExposureValue( "Emissive Weight", Range( 0, 1 ) ) = 0.5
		[Space(10)] _EmissiveGlobalValue( "Emissive Glow Mask", Range( 0, 1 ) ) = 1
		[StyledSpace(10)] _EmissiveEnd( "[ Emissive End ]", Float ) = 1
		[HideInInspector] _emissive_power_value( "_emissive_power_value", Float ) = 1
		[StyledCategory(Subsurface Settings, true, 0, 10)] _SubsurfaceCategory( "[ Subsurface Category ]", Float ) = 1
		[DiffusionProfile] _SubsurfaceDiffusion( "Subsurface Diffusion", Float ) = 0
		[HideInInspector] _SubsurfaceDiffusion_Asset( "Subsurface Diffusion", Vector ) = ( 0, 0, 0, 0 )
		[StyledSpace(10)] _SubsurfaceSpace( "# SubsurfaceSpace", Float ) = 0
		_SubsurfaceIntensityValue( "Subsurface Intensity", Range( 0, 1 ) ) = 0
		[HDR] _SubsurfaceColor( "Subsurface Color", Color ) = ( 1, 1, 1, 1 )
		_SubsurfaceScatteringValue( "Subsurface Value", Range( 0, 16 ) ) = 2
		_SubsurfaceAngleValue( "Subsurface Angle", Range( 1, 16 ) ) = 8
		_SubsurfaceDirectValue( "Subsurface Direct", Range( 0, 1 ) ) = 1
		_SubsurfaceNormalValue( "Subsurface Normal", Range( 0, 1 ) ) = 0
		_SubsurfaceAmbientValue( "Subsurface Ambient", Range( 0, 1 ) ) = 0.2
		_SubsurfaceShadowValue( "Subsurface Shadow", Range( 0, 1 ) ) = 1
		_SubsurfaceThicknessValue( "Subsurface Thickness", Range( 0, 1 ) ) = 0
		[Space(10)] _SubsurfaceGlobalValue( "Subsurface Glow Mask", Range( 0, 1 ) ) = 1
		_SubsurfaceMultiValue( "Subsurface Multi Mask", Range( 0, 1 ) ) = 1
		[StyledSpace(10)] _SubsurfaceEnd( "[ Subsurface End ]", Float ) = 1
		[StyledCategory(Size Fade Settings, true, 0, 10)] _SizeFadeCategory( "[ Size Fade Category ]", Float ) = 1
		[StyledMessage(Warning, The Size Fade feature is only available with The Visual Engine Core package., 0, 10)] _SizeFadeLiteInfo( "# SizeFade Lite Info", Float ) = 0
		[StyledColoring] _SizeFadeColoring( "# SizeFade Coloring", Color ) = ( 1, 1, 1, 0.6 )
		_SizeFadeIntensityValue( "Size Fade Intensity", Range( 0, 1 ) ) = 0
		[Enum(All Axis,0,Y Axis,1)] _SizeFadeScaleMode( "Size Fade Mode", Float ) = 0
		_SizeFadeScaleValue( "Size Fade Value", Range( 0, 1 ) ) = 1
		_SizeFadeDistMinValue( "Size Fade Start", Range( 0, 1000 ) ) = 0
		_SizeFadeDistMaxValue( "Size Fade Limit", Range( 0, 1000 ) ) = 0
		[Space(10)] _SizeFadeScaleValue1( "Size Fade Form Mask", Range( 0, 1 ) ) = 1
		[StyledSpace(10)] _SizeFadeEnd( "[ Size Fade End ]", Float ) = 1
		[StyledCategory(Motion Settings, true, 0, 10)] _MotionCategory( "[ Motion Category ]", Float ) = 1
		[StyledMessage(Warning, Motion Interaction and Elements support are only available with The Visual Engine Core package., 0, 10)] _MotionLiteInfo( "# Motion Lite Info", Float ) = 0
		[NoScaleOffset][StyledTextureSingleLine] _MotionNoiseTex( "Motion Texture", 2D ) = "white" {}
		[Space(10)] _MotionIntensityValue( "Motion Intensity", Range( 0, 1 ) ) = 1
		[Space(10)] _MotionBaseIntensityValue( "Motion Primary Intensity", Range( 0, 10 ) ) = 0
		_MotionBaseDelayValue( "Motion Primary Delay", Range( 0, 1 ) ) = 0
		_MotionBaseNoiseValue( "Motion Primary Noise", Range( 0, 1 ) ) = 0.5
		_MotionBasePivotValue( "Motion Primary Pivots", Range( 0, 1 ) ) = 0.8
		_MotionBaseTillingValue( "Motion Primary Tilling", Range( 0, 100 ) ) = 5
		_MotionBaseSpeedValue( "Motion Primary Speed", Range( 0, 50 ) ) = 40
		[HideInInspector] _AI_Offset( "_AI_Offset", Vector ) = ( 0, 0, 0, 0 )
		[StyledSpace(10)] _MotionEnd( "[ Motion End ]", Float ) = 1
		[HideInInspector] _IsImpostorShader( "_IsImpostorShader", Float ) = 1
		[HideInInspector] _IsSubsurfaceShader( "_IsSubsurfaceShader", Float ) = 1
		[HideInInspector] _IsLiteShader( "_IsLiteShader", Float ) = 1

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector][ToggleUI] _SupportDecals("Support Decals", Float) = 1.0
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0 // StencilUsage.Clear
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 0 // Nothing
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8 // StencilUsage.TraceReflectionRay
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 4 				// DEPRECATED
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 4	// DEPRECATED
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 2 // StencilUsage.RequiresDeferredLighting
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector][ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector][ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector][ToggleUI] _ReceivesSSRTransparent("Receives SSR Transparent", Float) = 0
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector][ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector][ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 0
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Float) = 0
		[HideInInspector][ToggleUI] _EnableFogOnTransparent("Enable Fog", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2 // This mode is dedicated to Forward to correctly handle backface then front face rendering thin transparent
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.TransparentCullMode)] _TransparentCullMode("Transparent Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4 // Less equal
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Int) = 4 // Less equal
		[HideInInspector][ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector][ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector][ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector][ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)

		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleUI] _TransparentWritingMotionVec("Transparent Writing MotionVec", Float) = 0
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.OpaqueCullMode)] _OpaqueCullMode("Opaque Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector][ToggleUI] _EnableBlendModePreserveSpecularLighting("Enable Blend Mode Preserve Specular Lighting", Float) = 1
		[HideInInspector] _EmissionColor("Color", Color) = (1, 1, 1)

		[HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		[HideInInspector][Enum(Auto, 0, On, 1, Off, 2)] _DoubleSidedGIMode("Double sided GI mode", Float) = 0

		[HideInInspector][ToggleUI] _AlphaToMaskInspectorValue("_AlphaToMaskInspectorValue", Float) = 0 // Property used to save the alpha to mask state in the inspector
        [HideInInspector][ToggleUI] _AlphaToMask("__alphaToMask", Float) = 0

		//_Refrac ( "Refraction Model", Float) = 0
        [HideInInspector][ToggleUI]_DepthOffsetEnable("Boolean", Float) = 1
        [HideInInspector][ToggleUI]_ConservativeDepthOffsetEnable("Boolean", Float) = 1
	}

	SubShader
	{
		LOD 0

		

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		AlphaToMask Off

		HLSLINCLUDE
		#pragma target 4.5
		#pragma exclude_renderers glcore gles gles3 

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
		{
			float3 BaseColor;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularOcclusion;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			float DiffusionProfile;
			float TransmissionMask;
			float Thickness;
			float SubsurfaceMask;
			float Anisotropy;
			float3 Tangent;
			float IridescenceMask;
			float IridescenceThickness;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
		    float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float3 Normal;
			float3 Emission;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPostpass;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float3 Emission;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

        struct PickingSurfaceDescription //Picking
		{
            float3 BentNormal;
			float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;

			float3 ObjectSpaceNormal;
			float3 WorldSpaceNormal;
			float3 TangentSpaceNormal;
			float3 ObjectSpaceViewDirection;
			float3 WorldSpaceViewDirection;
			float3 ObjectSpacePosition;
		};

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }

			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
			}


			ColorMask [_LightLayersMaskBuffer4] 4
			ColorMask [_LightLayersMaskBuffer5] 5

			HLSLPROGRAM
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #pragma shader_feature_local_fragment _ _DISABLE_SSR
            #define ASE_FRAGMENT_NORMAL 2
            #define ASE_DEPTH_WRITE_ON
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _MATERIAL_FEATURE_TRANSMISSION 1
            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_VERSION 19802
            #define ASE_SRP_VERSION 140012
            #ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
            #define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
            #else//AI_SRP
            #define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
            #endif//AI_SRP
            #define ASE_USING_SAMPLING_MACROS 1

            #pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile_fragment _ LIGHT_LAYERS
            #pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
            #pragma multi_compile _ DEBUG_DISPLAY
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DitherColoring;
			half4 _OverlayLumaRemap;
			half4 _OverlayProjRemap;
			half4 _OverlayColor;
			half4 _DrynessColoring;
			half4 _TintingLumaRemap;
			half4 _ImpostorColor;
			half4 _overlay_vert_mode;
			half4 _ImpostorColorTwo;
			half4 _TintingColoring;
			half4 _SizeFadeColoring;
			float4 _AI_SizeOffset;
			half4 _VariationNoiseRemap;
			half4 _VariationColorOne;
			half4 _VariationColorTwo;
			float4 _TintingColor;
			half4 _OverlayMeshRemap;
			half4 _VariationColoring;
			float4 _DrynessColor;
			half4 _DrynessLumaRemap;
			half4 _EmissiveColor;
			half4 _OverlayBlendRemap;
			half4 _WetnessColoring;
			half4 _CutoutColoring;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			float3 _AI_Offset;
			float3 _AI_BoundsMin;
			float3 _AI_BoundsSize;
			half _SizeFadeCategory;
			half _CutoutLiteInfo;
			half _SizeFadeEnd;
			half _SizeFadeScaleValue1;
			half _SizeFadeLiteInfo;
			half _DitherNoiseTillingValue;
			half _CutoutCategory;
			half _DitherMultiValue;
			half _DitherShadowMode;
			half _DitherDistanceMaxValue;
			half _CutoutNoiseValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseTillingValue;
			half _CutoutGlobalValue;
			half _CutoutMultiValue;
			half _DitherLiteInfo;
			half _CutoutShadowMode;
			half _DitherDistanceMinValue;
			half _CutoutIntensityValue;
			half _DitherCategory;
			half _CutoutSpace;
			half _DitherEnd;
			half _DitherConstantValue;
			half _DitherDistanceValue;
			half _CutoutEnd;
			half _SizeFadeIntensityValue;
			half _ImpostorMaskOffInfo;
			half _SubsurfaceCategory;
			half _SizeFadeScaleValue;
			half _ImpostorSmoothnessValue;
			half _OverlayIntensityValue;
			half _OverlayProjValue;
			half _OverlayLumaValue;
			half _OverlayMeshValue;
			half _OverlayMeshMode;
			half _OverlayGlobalValue;
			half _OverlayNormalValue;
			half _OverlaySmoothnessValue;
			half _OverlaySubsurfaceValue;
			half _EmissiveIntensityValue;
			half _EmissiveGlobalValue;
			half _EmissiveColorMode;
			float _emissive_power_value;
			half _EmissiveExposureValue;
			half _SubsurfaceIntensityValue;
			half _SubsurfaceGlobalValue;
			half _ImpostorOcclusionValue;
			half _SizeFadeScaleMode;
			half _ImpostorMetallicValue;
			half _OverlayBakeInfo;
			half _SizeFadeDistMinValue;
			half _SizeFadeDistMaxValue;
			half _GlobalLiteInfo;
			half _GlobalCategory;
			half _GlobalEnd;
			half _WetnessSmoothnessValue;
			half _SubsurfaceEnd;
			half _SubsurfaceDirectValue;
			half _SubsurfaceNormalValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _EmissiveCategory;
			half _EmissiveEnd;
			half _EmissivePowerMode;
			half _EmissivePowerValue;
			half _OverlayCategory;
			half _OverlayEnd;
			half _ImpostorColorMode;
			half _WetnessContrastValue;
			half _DrynessMultiValue;
			half _WetnessEnd;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsCollected;
			half _IsLiteShader;
			half _MotionCategory;
			half _MotionEnd;
			half _MotionLiteInfo;
			float _AI_Clip;
			float _AI_TextureBias;
			float _AI_Parallax;
			float _AI_ShadowBias;
			half _ImpostorEnd;
			half _IsShared;
			half _IsCustomShader;
			half _IsTVEShader;
			half _ImpostorMaskDefaultInfo;
			half _ImpostorMaskPackedInfo;
			half _ImpostorMaskShadingInfo;
			half _ImpostorMaskMode;
			half _ImpostorSpace0;
			half _ImpostorSpace1;
			half _ImpostorAlphaClipValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _SubsurfaceScatteringValue;
			half _IsVersion;
			half _RenderDecals;
			half _RenderSSR;
			half _CategoryRender;
			half _EndRender;
			half _IsInitialized;
			float _AI_ShadowView;
			float _AI_ForwardBias;
			float _AI_Frames;
			float _AI_DepthSize;
			half _TintingGlobalValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessIntensityValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _DrynessGlobalValue;
			half _SubsurfaceMultiValue;
			half _DrynessLumaValue;
			half _WetnessLiteInfo;
			half _WetnessCategory;
			half _TintingGrayValue;
			half _WetnessIntensityValue;
			half _TintingIntensityValue;
			half _TintingEnd;
			float _AI_ImpostorSize;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			half _MotionBaseTillingValue;
			half _MotionBaseSpeedValue;
			half _MotionBaseNoiseValue;
			half _MotionIntensityValue;
			half _MotionBaseDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _VariationNoiseTillingValue;
			half _TintingLiteInfo;
			half _TintingCategory;
			half _TintingSpace;
			half _SubsurfaceThicknessValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			TEXTURE2D(_MotionNoiseTex);
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_MotionParamsEditor;
			half _DisableSRPBatcher;
			TEXTURE2D(_Shader);
			TEXTURE2D(_Packed);
			TEXTURE2D(_Vertex);
			SAMPLER(sampler_Shader);
			SAMPLER(sampler_Packed);
			SAMPLER(sampler_Vertex);
			half4 TVE_AtmoParams;
			half TVE_IsEnabled;
			half4 TVE_GlowParams;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define AI_ObjectToWorld GetObjectToWorldMatrix()
			#define AI_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_CHANGES_WORLD_POS
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_CLIP_POS
			#define ASE_NEEDS_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#pragma shader_feature_local _USE_PARALLAX_ON
			#pragma shader_feature_local _HEMI_ON
			#pragma shader_feature_local AI_CLIP_NEIGHBOURS_FRAMES
			#pragma shader_feature_local_vertex TVE_MOTION
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_IMPOSTOR_MASK_OFF TVE_IMPOSTOR_MASK_DEFAULT TVE_IMPOSTOR_MASK_PACKED TVE_IMPOSTOR_MASK_SHADING
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IMPOSTOR_SHADER
			//#define _USE_PARALLAX_ON
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				float4 UVsFrame122_g156549 : TEXCOORD5;
				float4 UVsFrame222_g156549 : TEXCOORD6;
				float4 UVsFrame322_g156549 : TEXCOORD7;
				float4 octaframe22_g156549 : TEXCOORD8;
				float4 viewPos22_g156549 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			struct ImpostorOutput
			{
				half3 Albedo;
				half3 Specular;
				half Metallic;
				half3 WorldNormal;
				half Smoothness;
				half Occlusion;
				half3 Emission;
				half Alpha;
			};
			
			float2 VectorToOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, out float2 uvs, out float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			float2 VectorToHemiOctahedron( float3 N )
			{
				N.xy /= dot( 1.0, abs( N ) );
				return float2( N.x + N.y, N.x - N.y );
			}
			
			float3 HemiOctahedronToVector( float2 Oct )
			{
				Oct = float2( Oct.x + Oct.y, Oct.x - Oct.y ) * 0.5;
				float3 N = float3( Oct, 1 - dot( 1.0, abs( Oct ) ) );
				return normalize( N );
			}
			
			inline void OctaImpostorVertex( inout float3 positionOS, out float3 normalOS, out float4 tangentOS, out float4 uvsFrame1, out float4 uvsFrame2, out float4 uvsFrame3, out float4 octaFrame, out float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = AI_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = AI_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( AI_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				#if defined( _HEMI_ON )
				objectCameraDirection.y = max(0.001, objectCameraDirection.y);
				float2 frameOcta = VectorToHemiOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#else
				float2 frameOcta = VectorToOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#endif
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa1WorldY = HemiOctahedronToVector( octaFrame1 ).xzy;
				#else
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				#endif
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*out*/ uvFrame1, /*out*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa2WorldY = HemiOctahedronToVector( octaFrame2 ).xzy;
				#else
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				#endif
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*out*/ uvFrame2, /*out*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa3WorldY = HemiOctahedronToVector( octaFrame3 ).xzy;
				#else
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				#endif
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*out*/ uvFrame3, /*out*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				octaFrame.zw = fractionOctaFrame;
				#endif
				positionOS = billboard + _AI_Offset.xyz;
				normalOS = objectCameraDirection;
				tangentOS = float4( objectHorizontalVector, 1 );
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout ImpostorOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 viewPos, out float4 output0, out float4 output1, out float4 output2 )
			{
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, -1 );
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, -1 );
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, -1 );
				float2 parallax1_uv = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float2 parallax2_uv = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float2 parallax3_uv = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1_uv, _AI_TextureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2_uv, _AI_TextureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3_uv, _AI_TextureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1_uv - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2_uv, parallax3_uv ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * ( 1 - step_1 );
				step23 = step23 * ( 1 - step23 );
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				#endif
				o.Albedo = blendedAlbedo.rgb;
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1_uv, _AI_TextureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2_uv, _AI_TextureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3_uv, _AI_TextureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				o.WorldNormal = normalize( mul( (float3x3)AI_ObjectToWorld, localNormal ) );
				float depth = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 ) * _AI_DepthSize * length( AI_ObjectToWorld[ 2 ].xyz );
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax1_uv, _AI_TextureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax2_uv, _AI_TextureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax3_uv, _AI_TextureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax1_uv, _AI_TextureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax2_uv, _AI_TextureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax3_uv, _AI_TextureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float4 output2a = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax1_uv, _AI_TextureBias );
				float4 output2b = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax2_uv, _AI_TextureBias );
				float4 output2c = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax3_uv, _AI_TextureBias );
				output2 = output2a * weights.x  + output2b * weights.y + output2c * weights.z; 
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView - _AI_ShadowBias;
				#else 
				viewPos.z += depth + _AI_ForwardBias;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				#if defined(SHADERPASS) && defined(UNITY_PASS_SHADOWCASTER)
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#else
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = surfaceDescription.Normal;

			#if ( UNITY_VERSION <= 202236 )
				#if ( ASE_FRAGMENT_NORMAL == 1 )
					GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#elif ( ASE_FRAGMENT_NORMAL == 2 )
					GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#endif

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#else
				#ifdef DECAL_NORMAL_BLENDING
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif
			#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
                    GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.tangentToWorld);
				#endif

				#if defined(DEBUG_DISPLAY)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						surfaceData.metallic = 0;
					}
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

				float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS output;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				TVEModelData Data16_g158391 = (TVEModelData)0;
				float In_Dummy16_g158391 = 0.0;
				TVEModelData Data16_g158266 = (TVEModelData)0;
				half Dummy181_g158264 = ( ( _MotionCategory + _MotionEnd ) + _MotionLiteInfo );
				float In_Dummy16_g158266 = Dummy181_g158264;
				TVEModelData Data16_g157226 = (TVEModelData)0;
				float In_Dummy16_g157226 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS.xyz, inputMesh.normalOS.xyz, inputMesh.tangentOS, output.UVsFrame122_g156549, output.UVsFrame222_g156549, output.UVsFrame322_g156549, output.octaframe22_g156549, output.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( TransformObjectToWorld( inputMesh.positionOS.xyz ) );
				half3 Input_PositionWS319_g157220 = worldPosOut22_g156549;
				float3 worldToObj315_g157220 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS( Input_PositionWS319_g157220 ), 1 ) ).xyz;
				half3 Model_PositionOS316_g157220 = worldToObj315_g157220;
				float3 In_PositionOS16_g157226 = Model_PositionOS316_g157220;
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157226 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157226 = Model_PositionWO311_g157220;
				float3 In_PositionRawOS16_g157226 = Model_PositionOS316_g157220;
				float3 In_PositionAddOS16_g157226 = float3( 0,0,0 );
				float3 In_PivotOS16_g157226 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157223 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157223 = ( localObjectPosition_UNITY_MATRIX_M14_g157223 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157223 = localObjectPosition_UNITY_MATRIX_M14_g157223;
				#endif
				float3 vertexToFrag305_g157220 = staticSwitch13_g157223;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157226 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157226 = Model_PivotWO312_g157220;
				half3 Model_NormalOS313_g157220 = inputMesh.normalOS;
				float3 In_NormalOS16_g157226 = Model_NormalOS313_g157220;
				float3 ase_normalWS = TransformObjectToWorldNormal( inputMesh.normalOS );
				half3 Model_Normal_WS314_g157220 = ase_normalWS;
				float3 In_NormalWS16_g157226 = Model_Normal_WS314_g157220;
				float3 In_NormalRawOS16_g157226 = Model_NormalOS313_g157220;
				float3 In_NormalRawWS16_g157226 = Model_Normal_WS314_g157220;
				float4 In_TangentOS16_g157226 = float4( 0,1,0,1 );
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157226 = Model_ViewDirWS347_g157220;
				float4 In_VertexData16_g157226 = float4( 1,1,1,1 );
				float4 In_PhaseData16_g157226 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157226 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157226 = float4( 0,0,0,0 );
				{
				Data16_g157226.Dummy = In_Dummy16_g157226;
				Data16_g157226.PositionOS = In_PositionOS16_g157226;
				Data16_g157226.PositionWS = In_PositionWS16_g157226;
				Data16_g157226.PositionWO = In_PositionWO16_g157226;
				Data16_g157226.PositionRawOS = In_PositionRawOS16_g157226;
				Data16_g157226.PositionAddOS = In_PositionAddOS16_g157226;
				Data16_g157226.PivotOS = In_PivotOS16_g157226;
				Data16_g157226.PivotWS = In_PivotWS16_g157226;
				Data16_g157226.PivotWO = In_PivotWO16_g157226;
				Data16_g157226.NormalOS = In_NormalOS16_g157226;
				Data16_g157226.NormalWS = In_NormalWS16_g157226;
				Data16_g157226.NormalRawOS = In_NormalRawOS16_g157226;
				Data16_g157226.NormalRawWS = In_NormalRawWS16_g157226;
				Data16_g157226.TangentOS = In_TangentOS16_g157226;
				Data16_g157226.ViewDirWS = In_ViewDirWS16_g157226;
				Data16_g157226.VertexData = In_VertexData16_g157226;
				Data16_g157226.PhaseData = In_PhaseData16_g157226;
				Data16_g157226.BoundsData = In_BoundsData16_g157226;
				Data16_g157226.RotationData = In_RotationData16_g157226;
				}
				TVEModelData Data15_g158265 = Data16_g157226;
				float Out_Dummy15_g158265 = 0;
				float3 Out_PositionOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158265 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158265 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158265 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158265 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158265 = float3( 0,0,0 );
				float4 Out_VertexData15_g158265 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158265 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158265 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158265 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158265 = Data15_g158265.Dummy;
				Out_PositionOS15_g158265 = Data15_g158265.PositionOS;
				Out_PositionWS15_g158265 = Data15_g158265.PositionWS;
				Out_PositionWO15_g158265 = Data15_g158265.PositionWO;
				Out_PositionRawOS15_g158265 = Data15_g158265.PositionRawOS;
				Out_PositionAddOS15_g158265 = Data15_g158265.PositionAddOS;
				Out_PivotOS15_g158265 = Data15_g158265.PivotOS;
				Out_PivotWS15_g158265 = Data15_g158265.PivotWS;
				Out_PivotWO15_g158265 = Data15_g158265.PivotWO;
				Out_NormalOS15_g158265 = Data15_g158265.NormalOS;
				Out_NormalWS15_g158265 = Data15_g158265.NormalWS;
				Out_NormalRawOS15_g158265 = Data15_g158265.NormalRawOS;
				Out_NormalRawWS15_g158265 = Data15_g158265.NormalRawWS;
				Out_TangentOS15_g158265 = Data15_g158265.TangentOS;
				Out_ViewDirWS15_g158265 = Data15_g158265.ViewDirWS;
				Out_VertexData15_g158265 = Data15_g158265.VertexData;
				Out_PhaseData15_g158265 = Data15_g158265.PhaseData;
				Out_BoundsData15_g158265 = Data15_g158265.BoundsData;
				Out_RotationData15_g158265 = Data15_g158265.RotationData;
				}
				float3 temp_output_1567_0_g158264 = Out_PositionOS15_g158265;
				float3 In_PositionOS16_g158266 = temp_output_1567_0_g158264;
				float3 In_PositionWS16_g158266 = Out_PositionWS15_g158265;
				float3 temp_output_1567_17_g158264 = Out_PositionWO15_g158265;
				float3 In_PositionWO16_g158266 = temp_output_1567_17_g158264;
				float3 In_PositionRawOS16_g158266 = Out_PositionRawOS15_g158265;
				float3 In_PositionAddOS16_g158266 = Out_PositionAddOS15_g158265;
				float3 In_PivotOS16_g158266 = Out_PivotOS15_g158265;
				float3 In_PivotWS16_g158266 = Out_PivotWS15_g158265;
				float3 temp_output_1567_19_g158264 = Out_PivotWO15_g158265;
				float3 In_PivotWO16_g158266 = temp_output_1567_19_g158264;
				float3 In_NormalOS16_g158266 = Out_NormalOS15_g158265;
				float3 In_NormalWS16_g158266 = Out_NormalWS15_g158265;
				float3 In_NormalRawOS16_g158266 = Out_NormalRawOS15_g158265;
				float3 In_NormalRawWS16_g158266 = Out_NormalRawWS15_g158265;
				float4 In_TangentOS16_g158266 = Out_TangentOS15_g158265;
				float3 In_ViewDirWS16_g158266 = Out_ViewDirWS15_g158265;
				float4 In_VertexData16_g158266 = Out_VertexData15_g158265;
				float4 In_PhaseData16_g158266 = Out_PhaseData15_g158265;
				float4 In_BoundsData16_g158266 = Out_BoundsData15_g158265;
				half3 Model_PositionOS147_g158264 = temp_output_1567_0_g158264;
				half Base_Mask217_g158264 = saturate( ( Model_PositionOS147_g158264.y / _AI_Offset.y ) );
				float4 lerpResult836_g158275 = lerp( half4( 0, 1, 1, 0 ) , TVE_MotionParams , TVE_MotionParams.w);
				half2 Global_WindDirWS1663_g158264 = (lerpResult836_g158275).xy;
				half2 Input_WindDirWS803_g158268 = Global_WindDirWS1663_g158264;
				half3 Model_PositionWO162_g158264 = temp_output_1567_17_g158264;
				half3 Model_PivotWO402_g158264 = temp_output_1567_19_g158264;
				float3 lerpResult829_g158264 = lerp( Model_PositionWO162_g158264 , Model_PivotWO402_g158264 , _MotionBasePivotValue);
				half3 Base_Position1394_g158264 = lerpResult829_g158264;
				half3 Input_PositionWO419_g158268 = Base_Position1394_g158264;
				half Input_MotionTilling321_g158268 = ( _MotionBaseTillingValue + 0.2 );
				half2 Noise_Coord515_g158268 = ( -(Input_PositionWO419_g158268).xz * Input_MotionTilling321_g158268 * 0.005 );
				float2 temp_output_3_0_g158272 = Noise_Coord515_g158268;
				float2 temp_output_21_0_g158272 = Input_WindDirWS803_g158268;
				float mulTime113_g158271 = _TimeParameters.x * 0.02;
				float lerpResult128_g158271 = lerp( mulTime113_g158271 , ( ( mulTime113_g158271 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g158268 = _MotionBaseSpeedValue;
				half Noise_Speed516_g158268 = ( lerpResult128_g158271 * Input_MotionSpeed62_g158268 );
				float temp_output_15_0_g158272 = Noise_Speed516_g158268;
				float temp_output_23_0_g158272 = frac( temp_output_15_0_g158272 );
				float4 lerpResult39_g158272 = lerp( SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * temp_output_23_0_g158272 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * frac( ( temp_output_15_0_g158272 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_23_0_g158272 - 0.5 ) ) / 0.5 ));
				float4 temp_output_635_0_g158268 = lerpResult39_g158272;
				half2 Noise_DirWS825_g158268 = ((temp_output_635_0_g158268).rg*2.0 + -1.0);
				half Input_MotionNoise552_g158268 = _MotionBaseNoiseValue;
				half Global_WInd769_g158275 = (lerpResult836_g158275).z;
				float lerpResult853_g158275 = lerp( Global_WInd769_g158275 , saturate( (Global_WInd769_g158275*TVE_MotionParamsEditor.x + TVE_MotionParamsEditor.y) ) , TVE_MotionParamsEditor.w);
				half Input_MotionValue629_g158275 = _MotionIntensityValue;
				half Global_WindValue1664_g158264 = ( lerpResult853_g158275 * Input_MotionValue629_g158275 );
				half Input_WindValue853_g158268 = Global_WindValue1664_g158264;
				float lerpResult701_g158268 = lerp( 1.0 , Input_MotionNoise552_g158268 , Input_WindValue853_g158268);
				float2 lerpResult646_g158268 = lerp( Input_WindDirWS803_g158268 , Noise_DirWS825_g158268 , lerpResult701_g158268);
				half Input_MotionDelay753_g158268 = _MotionBaseDelayValue;
				float lerpResult756_g158268 = lerp( 1.0 , ( Input_WindValue853_g158268 * Input_WindValue853_g158268 ) , Input_MotionDelay753_g158268);
				half Wind_Delay815_g158268 = lerpResult756_g158268;
				float2 temp_output_809_0_g158268 = ( lerpResult646_g158268 * Input_WindValue853_g158268 * Wind_Delay815_g158268 );
				half2 Input_PushDirWS807_g158268 = float2( 1,0 );
				half Input_PushAlpha806_g158268 = ( 1.0 * 1.0 );
				float2 lerpResult811_g158268 = lerp( temp_output_809_0_g158268 , Input_PushDirWS807_g158268 , Input_PushAlpha806_g158268);
				#ifdef TVE_MOTION_ELEMENT
				float2 staticSwitch808_g158268 = lerpResult811_g158268;
				#else
				float2 staticSwitch808_g158268 = temp_output_809_0_g158268;
				#endif
				float2 temp_output_38_0_g158269 = staticSwitch808_g158268;
				float2 break83_g158269 = temp_output_38_0_g158269;
				float3 appendResult79_g158269 = (float3(break83_g158269.x , 0.0 , break83_g158269.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Bending893_g158264 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158269 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Base_Motion1440_g158264 = ( _MotionBaseIntensityValue * Base_Mask217_g158264 * Base_Bending893_g158264 );
				#ifdef TVE_MOTION
				float2 staticSwitch1651_g158264 = Base_Motion1440_g158264;
				#else
				float2 staticSwitch1651_g158264 = float2( 0,0 );
				#endif
				float4 appendResult1658_g158264 = (float4(staticSwitch1651_g158264 , 0.0 , 0.0));
				half4 Final_RoationData1570_g158264 = appendResult1658_g158264;
				float4 In_RotationData16_g158266 = Final_RoationData1570_g158264;
				{
				Data16_g158266.Dummy = In_Dummy16_g158266;
				Data16_g158266.PositionOS = In_PositionOS16_g158266;
				Data16_g158266.PositionWS = In_PositionWS16_g158266;
				Data16_g158266.PositionWO = In_PositionWO16_g158266;
				Data16_g158266.PositionRawOS = In_PositionRawOS16_g158266;
				Data16_g158266.PositionAddOS = In_PositionAddOS16_g158266;
				Data16_g158266.PivotOS = In_PivotOS16_g158266;
				Data16_g158266.PivotWS = In_PivotWS16_g158266;
				Data16_g158266.PivotWO = In_PivotWO16_g158266;
				Data16_g158266.NormalOS = In_NormalOS16_g158266;
				Data16_g158266.NormalWS = In_NormalWS16_g158266;
				Data16_g158266.NormalRawOS = In_NormalRawOS16_g158266;
				Data16_g158266.NormalRawWS = In_NormalRawWS16_g158266;
				Data16_g158266.TangentOS = In_TangentOS16_g158266;
				Data16_g158266.ViewDirWS = In_ViewDirWS16_g158266;
				Data16_g158266.VertexData = In_VertexData16_g158266;
				Data16_g158266.PhaseData = In_PhaseData16_g158266;
				Data16_g158266.BoundsData = In_BoundsData16_g158266;
				Data16_g158266.RotationData = In_RotationData16_g158266;
				}
				TVEModelData Data15_g158390 = Data16_g158266;
				float Out_Dummy15_g158390 = 0;
				float3 Out_PositionOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158390 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158390 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158390 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158390 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158390 = float3( 0,0,0 );
				float4 Out_VertexData15_g158390 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158390 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158390 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158390 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158390 = Data15_g158390.Dummy;
				Out_PositionOS15_g158390 = Data15_g158390.PositionOS;
				Out_PositionWS15_g158390 = Data15_g158390.PositionWS;
				Out_PositionWO15_g158390 = Data15_g158390.PositionWO;
				Out_PositionRawOS15_g158390 = Data15_g158390.PositionRawOS;
				Out_PositionAddOS15_g158390 = Data15_g158390.PositionAddOS;
				Out_PivotOS15_g158390 = Data15_g158390.PivotOS;
				Out_PivotWS15_g158390 = Data15_g158390.PivotWS;
				Out_PivotWO15_g158390 = Data15_g158390.PivotWO;
				Out_NormalOS15_g158390 = Data15_g158390.NormalOS;
				Out_NormalWS15_g158390 = Data15_g158390.NormalWS;
				Out_NormalRawOS15_g158390 = Data15_g158390.NormalRawOS;
				Out_NormalRawWS15_g158390 = Data15_g158390.NormalRawWS;
				Out_TangentOS15_g158390 = Data15_g158390.TangentOS;
				Out_ViewDirWS15_g158390 = Data15_g158390.ViewDirWS;
				Out_VertexData15_g158390 = Data15_g158390.VertexData;
				Out_PhaseData15_g158390 = Data15_g158390.PhaseData;
				Out_BoundsData15_g158390 = Data15_g158390.BoundsData;
				Out_RotationData15_g158390 = Data15_g158390.RotationData;
				}
				half3 Model_PositionOS147_g158389 = Out_PositionOS15_g158390;
				half3 VertexPos40_g158393 = Model_PositionOS147_g158389;
				float3 appendResult74_g158393 = (float3(VertexPos40_g158393.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158393 = appendResult74_g158393;
				float3 break84_g158393 = VertexPos40_g158393;
				float3 appendResult81_g158393 = (float3(0.0 , break84_g158393.y , break84_g158393.z));
				half3 VertexPosOtherAxis82_g158393 = appendResult81_g158393;
				float4 temp_output_1567_33_g158389 = Out_RotationData15_g158390;
				half4 Model_VertexBend1569_g158389 = temp_output_1567_33_g158389;
				float2 break1582_g158389 = (Model_VertexBend1569_g158389).xy;
				half Angle44_g158393 = break1582_g158389.y;
				half3 VertexPos40_g158396 = ( VertexPosRotationAxis50_g158393 + ( VertexPosOtherAxis82_g158393 * cos( Angle44_g158393 ) ) + ( cross( float3( 1, 0, 0 ) , VertexPosOtherAxis82_g158393 ) * sin( Angle44_g158393 ) ) );
				float3 appendResult74_g158396 = (float3(0.0 , 0.0 , VertexPos40_g158396.z));
				half3 VertexPosRotationAxis50_g158396 = appendResult74_g158396;
				float3 break84_g158396 = VertexPos40_g158396;
				float3 appendResult81_g158396 = (float3(break84_g158396.x , break84_g158396.y , 0.0));
				half3 VertexPosOtherAxis82_g158396 = appendResult81_g158396;
				half Angle44_g158396 = -break1582_g158389.x;
				float3 temp_output_1584_19_g158389 = ( VertexPosRotationAxis50_g158396 + ( VertexPosOtherAxis82_g158396 * cos( Angle44_g158396 ) ) + ( cross( float3( 0, 0, 1 ) , VertexPosOtherAxis82_g158396 ) * sin( Angle44_g158396 ) ) );
				float3 temp_output_6_0_g158395 = temp_output_1584_19_g158389;
				#ifdef TVE_MOTION
				float3 staticSwitch65_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch65_g158395 = Model_PositionOS147_g158389;
				#endif
				#ifdef TVE_CONFORM
				float3 staticSwitch69_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch69_g158395 = staticSwitch65_g158395;
				#endif
				float3 temp_output_1585_0_g158389 = staticSwitch69_g158395;
				float3 temp_output_1567_31_g158389 = Out_PositionAddOS15_g158390;
				half3 Model_PositionADD1568_g158389 = temp_output_1567_31_g158389;
				half3 Final_PositionOS178_g158389 = ( temp_output_1585_0_g158389 + Model_PositionADD1568_g158389 );
				float3 In_PositionOS16_g158391 = Final_PositionOS178_g158389;
				float3 In_PositionWS16_g158391 = Out_PositionWS15_g158390;
				float3 In_PositionWO16_g158391 = Out_PositionWO15_g158390;
				float3 In_PositionRawOS16_g158391 = Out_PositionRawOS15_g158390;
				float3 In_PositionAddOS16_g158391 = temp_output_1567_31_g158389;
				float3 In_PivotOS16_g158391 = Out_PivotOS15_g158390;
				float3 In_PivotWS16_g158391 = Out_PivotWS15_g158390;
				float3 In_PivotWO16_g158391 = Out_PivotWO15_g158390;
				float3 In_NormalOS16_g158391 = Out_NormalOS15_g158390;
				float3 In_NormalWS16_g158391 = Out_NormalWS15_g158390;
				float3 In_NormalRawOS16_g158391 = Out_NormalRawOS15_g158390;
				float3 In_NormalRawWS16_g158391 = Out_NormalRawWS15_g158390;
				float4 In_TangentOS16_g158391 = Out_TangentOS15_g158390;
				float3 In_ViewDirWS16_g158391 = Out_ViewDirWS15_g158390;
				float4 In_VertexData16_g158391 = Out_VertexData15_g158390;
				float4 In_PhaseData16_g158391 = Out_PhaseData15_g158390;
				float4 In_BoundsData16_g158391 = Out_BoundsData15_g158390;
				float4 In_RotationData16_g158391 = temp_output_1567_33_g158389;
				{
				Data16_g158391.Dummy = In_Dummy16_g158391;
				Data16_g158391.PositionOS = In_PositionOS16_g158391;
				Data16_g158391.PositionWS = In_PositionWS16_g158391;
				Data16_g158391.PositionWO = In_PositionWO16_g158391;
				Data16_g158391.PositionRawOS = In_PositionRawOS16_g158391;
				Data16_g158391.PositionAddOS = In_PositionAddOS16_g158391;
				Data16_g158391.PivotOS = In_PivotOS16_g158391;
				Data16_g158391.PivotWS = In_PivotWS16_g158391;
				Data16_g158391.PivotWO = In_PivotWO16_g158391;
				Data16_g158391.NormalOS = In_NormalOS16_g158391;
				Data16_g158391.NormalWS = In_NormalWS16_g158391;
				Data16_g158391.NormalRawOS = In_NormalRawOS16_g158391;
				Data16_g158391.NormalRawWS = In_NormalRawWS16_g158391;
				Data16_g158391.TangentOS = In_TangentOS16_g158391;
				Data16_g158391.ViewDirWS = In_ViewDirWS16_g158391;
				Data16_g158391.VertexData = In_VertexData16_g158391;
				Data16_g158391.PhaseData = In_PhaseData16_g158391;
				Data16_g158391.BoundsData = In_BoundsData16_g158391;
				Data16_g158391.RotationData = In_RotationData16_g158391;
				}
				TVEModelData Data15_g158419 = Data16_g158391;
				float Out_Dummy15_g158419 = 0;
				float3 Out_PositionOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158419 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158419 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158419 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158419 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158419 = float3( 0,0,0 );
				float4 Out_VertexData15_g158419 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158419 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158419 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158419 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158419 = Data15_g158419.Dummy;
				Out_PositionOS15_g158419 = Data15_g158419.PositionOS;
				Out_PositionWS15_g158419 = Data15_g158419.PositionWS;
				Out_PositionWO15_g158419 = Data15_g158419.PositionWO;
				Out_PositionRawOS15_g158419 = Data15_g158419.PositionRawOS;
				Out_PositionAddOS15_g158419 = Data15_g158419.PositionAddOS;
				Out_PivotOS15_g158419 = Data15_g158419.PivotOS;
				Out_PivotWS15_g158419 = Data15_g158419.PivotWS;
				Out_PivotWO15_g158419 = Data15_g158419.PivotWO;
				Out_NormalOS15_g158419 = Data15_g158419.NormalOS;
				Out_NormalWS15_g158419 = Data15_g158419.NormalWS;
				Out_NormalRawOS15_g158419 = Data15_g158419.NormalRawOS;
				Out_NormalRawWS15_g158419 = Data15_g158419.NormalRawWS;
				Out_TangentOS15_g158419 = Data15_g158419.TangentOS;
				Out_ViewDirWS15_g158419 = Data15_g158419.ViewDirWS;
				Out_VertexData15_g158419 = Data15_g158419.VertexData;
				Out_PhaseData15_g158419 = Data15_g158419.PhaseData;
				Out_BoundsData15_g158419 = Data15_g158419.BoundsData;
				Out_RotationData15_g158419 = Data15_g158419.RotationData;
				}
				float3 temp_output_31_0_g158407 = Out_PositionOS15_g158419;
				float3 temp_output_6_0_g158420 = ( temp_output_31_0_g158407 + _DisableSRPBatcher );
				float temp_output_371_0_g158324 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingGlobalValue + _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessGlobalValue + _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue + 0.0 ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue + _CutoutGlobalValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeScaleValue1 ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) + temp_output_371_0_g158324 );
				#ifdef TVE_DUMMY
				float3 staticSwitch14_g158420 = ( temp_output_6_0_g158420 + Dummy_Data505.r );
				#else
				float3 staticSwitch14_g158420 = temp_output_6_0_g158420;
				#endif
				
				output.ase_texcoord10.xyz = vertexToFrag305_g157220;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord10.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = staticSwitch14_g158420;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				output.uv1 = inputMesh.uv1;
				output.uv2 = inputMesh.uv2;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#if defined( ASE_DEPTH_WRITE_ON )
							, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half IsFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];
				float4 ClipPos = TransformWorldToHClip( PositionRWS );
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float localBreakData4_g158410 = ( 0.0 );
				float localCompData3_g158401 = ( 0.0 );
				TVEVisualData Data3_g158401 = (TVEVisualData)0;
				half Dummy145_g158399 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) );
				float In_Dummy3_g158401 = Dummy145_g158399;
				float localBreakData4_g158400 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158292 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + 0.0 );
				float In_Dummy3_g158307 = Dummy145_g158292;
				float localBreakData4_g158296 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				half Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlayBakeInfo ) + 0.0 );
				float In_Dummy3_g158220 = Dummy594_g158217;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157228 = ( 0.0 );
				TVEVisualData Data3_g157228 = (TVEVisualData)0;
				float In_Dummy3_g157228 = 0.0;
				float4 output0 = 0;
				float4 output1 = 0;
				float4 output2 = 0;
				ImpostorOutput io = ( ImpostorOutput )0;
				OctaImpostorFragment( io, ClipPos, PositionRWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1, output2 );
				float4 temp_cast_0 = (1.0).xxxx;
				half4 Input_Tex0377_g157220 = output0;
				half4 Input_Tex1379_g157220 = output1;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch403_g157220 = temp_cast_0;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch403_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch403_g157220 = temp_cast_0;
				#endif
				half Local_MultiMask249_g157220 = (staticSwitch403_g157220).b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( io.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157228 = Local_Albedo239_g157220;
				float3 In_AlbedoRaw3_g157228 = Local_Albedo239_g157220;
				float2 temp_cast_3 = (0.0).xx;
				float2 In_NormalTS3_g157228 = temp_cast_3;
				float3 In_NormalWS3_g157228 = io.WorldNormal;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 temp_cast_5 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch385_g157220 = temp_cast_4;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch385_g157220 = temp_cast_5;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch385_g157220 = temp_cast_4;
				#endif
				half Local_Metallic247_g157220 = (staticSwitch385_g157220).r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				float4 temp_cast_6 = (1.0).xxxx;
				float4 temp_cast_7 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch392_g157220 = temp_cast_6;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch392_g157220 = temp_cast_7;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch392_g157220 = temp_cast_6;
				#endif
				half Local_OcclusionOrEmissive248_g157220 = (staticSwitch392_g157220).g;
				float lerpResult431_g157220 = lerp( 1.0 , Local_OcclusionOrEmissive248_g157220 , _ImpostorOcclusionValue);
				#ifdef TVE_EMISSIVE
				float staticSwitch428_g157220 = 1.0;
				#else
				float staticSwitch428_g157220 = lerpResult431_g157220;
				#endif
				half Final_Occlusion424_g157220 = staticSwitch428_g157220;
				float4 temp_cast_8 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch408_g157220 = temp_cast_8;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch408_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch408_g157220 = temp_cast_8;
				#endif
				half Local_Smoothness250_g157220 = (staticSwitch408_g157220).a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , Final_Occlusion424_g157220 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157228 = appendResult257_g157220;
				float4 appendResult286_g157220 = (float4(Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , 1.0));
				float4 In_Emissive3_g157228 = appendResult286_g157220;
				float3 temp_output_3_0_g157221 = Local_Albedo239_g157220;
				float dotResult20_g157221 = dot( temp_output_3_0_g157221 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale268_g157220 = dotResult20_g157221;
				float In_Grayscale3_g157228 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157228 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157228 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157228 = 0.0;
				float In_AlphaFade3_g157228 = 1.0;
				float3 temp_cast_9 = (1.0).xxx;
				float3 In_Translucency3_g157228 = temp_cast_9;
				float In_Transmission3_g157228 = 1.0;
				float In_Thickness3_g157228 = 0.0;
				float In_Diffusion3_g157228 = 0.0;
				float In_Depth3_g157228 = ClipPos.z;
				{
				Data3_g157228.Dummy = In_Dummy3_g157228;
				Data3_g157228.Albedo = In_Albedo3_g157228;
				Data3_g157228.AlbedoRaw = In_AlbedoRaw3_g157228;
				Data3_g157228.NormalTS = In_NormalTS3_g157228;
				Data3_g157228.NormalWS = In_NormalWS3_g157228;
				Data3_g157228.Shader = In_Shader3_g157228;
				Data3_g157228.Emissive= In_Emissive3_g157228;
				Data3_g157228.MultiMask = In_MultiMask3_g157228;
				Data3_g157228.Grayscale = In_Grayscale3_g157228;
				Data3_g157228.Luminosity = In_Luminosity3_g157228;
				Data3_g157228.AlphaClip = In_AlphaClip3_g157228;
				Data3_g157228.AlphaFade = In_AlphaFade3_g157228;
				Data3_g157228.Translucency = In_Translucency3_g157228;
				Data3_g157228.Transmission = In_Transmission3_g157228;
				Data3_g157228.Thickness = In_Thickness3_g157228;
				Data3_g157228.Diffusion = In_Diffusion3_g157228;
				Data3_g157228.Depth = In_Depth3_g157228;
				}
				TVEVisualData Data4_g158218 = Data3_g157228;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				float Out_Depth4_g158218 = 0;
				{
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_AlbedoRaw4_g158218 = Data4_g158218.AlbedoRaw;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				Out_Depth4_g158218= Data4_g158218.Depth;
				}
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158231 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158237 = _OverlayProjRemap.x;
				float temp_output_9_0_g158237 = ( clampResult17_g158231 - temp_output_7_0_g158237 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158237 * _OverlayProjRemap.z ) + 0.0001 ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158232 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayLumaRemap.x;
				float temp_output_9_0_g158236 = ( clampResult17_g158232 - temp_output_7_0_g158236 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158236 * _OverlayLumaRemap.z ) + 0.0001 ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				TVEModelData Data16_g157227 = (TVEModelData)0;
				float In_Dummy16_g157227 = 0.0;
				half3 Input_PositionWS319_g157220 = GetAbsolutePositionWS( PositionRWS );
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157227 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157227 = Model_PositionWO311_g157220;
				float3 vertexToFrag305_g157220 = packedInput.ase_texcoord10.xyz;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157227 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157227 = Model_PivotWO312_g157220;
				half3 Model_Normal_WS314_g157220 = NormalWS;
				float3 In_NormalWS16_g157227 = Model_Normal_WS314_g157220;
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157227 = Model_ViewDirWS347_g157220;
				float4 temp_cast_10 = (1.0).xxxx;
				half4 Input_Tex2380_g157220 = output2;
				float4 appendResult420_g157220 = (float4((Input_Tex1379_g157220).rg , 1.0 , 1.0));
				float4 temp_cast_13 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch414_g157220 = temp_cast_10;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch414_g157220 = Input_Tex2380_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch414_g157220 = appendResult420_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch414_g157220 = temp_cast_13;
				#else
				float4 staticSwitch414_g157220 = temp_cast_10;
				#endif
				half4 Local_VertexColor422_g157220 = staticSwitch414_g157220;
				float4 In_VertexData16_g157227 = Local_VertexColor422_g157220;
				float4 In_BoundsData16_g157227 = float4( 1,1,1,1 );
				{
				Data16_g157227.Dummy = In_Dummy16_g157227;
				Data16_g157227.PositionWS = In_PositionWS16_g157227;
				Data16_g157227.PositionWO = In_PositionWO16_g157227;
				Data16_g157227.PivotWS = In_PivotWS16_g157227;
				Data16_g157227.PivotWO = In_PivotWO16_g157227;
				Data16_g157227.NormalWS = In_NormalWS16_g157227;
				Data16_g157227.ViewDirWS = In_ViewDirWS16_g157227;
				Data16_g157227.VertexData = In_VertexData16_g157227;
				Data16_g157227.BoundsData = In_BoundsData16_g157227;
				}
				TVEModelData Data15_g158228 = Data16_g157227;
				float Out_Dummy15_g158228 = 0;
				float3 Out_PositionWS15_g158228 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158228 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158228 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g158228 = float3( 0,0,0 );
				float4 Out_VertexData15_g158228 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158228 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158228 = Data15_g158228.Dummy;
				Out_PositionWS15_g158228 = Data15_g158228.PositionWS;
				Out_PositionWO15_g158228 = Data15_g158228.PositionWO;
				Out_PivotWS15_g158228 = Data15_g158228.PivotWS;
				Out_PivotWO15_g158228 = Data15_g158228.PivotWO;
				Out_NormalWS15_g158228 = Data15_g158228.NormalWS;
				Out_ViewDirWS15_g158228 = Data15_g158228.ViewDirWS;
				Out_VertexData15_g158228 = Data15_g158228.VertexData;
				Out_BoundsData15_g158228 = Data15_g158228.BoundsData;
				}
				half4 Model_VertexMasks791_g158217 = Out_VertexData15_g158228;
				float4 break792_g158217 = Model_VertexMasks791_g158217;
				float4 break33_g158229 = _overlay_vert_mode;
				float temp_output_30_0_g158229 = ( break792_g158217.x * break33_g158229.x );
				float temp_output_29_0_g158229 = ( break792_g158217.y * break33_g158229.y );
				float temp_output_31_0_g158229 = ( break792_g158217.z * break33_g158229.z );
				float temp_output_28_0_g158229 = ( temp_output_30_0_g158229 + temp_output_29_0_g158229 + temp_output_31_0_g158229 + ( break792_g158217.w * break33_g158229.w ) );
				float clampResult17_g158230 = clamp( temp_output_28_0_g158229 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayMeshRemap.x;
				float temp_output_9_0_g158238 = ( clampResult17_g158230 - temp_output_7_0_g158238 );
				float lerpResult879_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158238 * _OverlayMeshRemap.z ) + 0.0001 ) ) , _OverlayMeshValue);
				float temp_output_6_0_g158233 = lerpResult879_g158217;
				#ifdef TVE_DUMMY
				float staticSwitch14_g158233 = ( temp_output_6_0_g158233 + _OverlayMeshMode );
				#else
				float staticSwitch14_g158233 = temp_output_6_0_g158233;
				#endif
				half Overlay_VertMask801_g158217 = staticSwitch14_g158233;
				float lerpResult920_g158217 = lerp( 1.0 , ( TVE_AtmoParams.z * TVE_IsEnabled ) , _OverlayGlobalValue);
				half Overlay_MaskGlobal429_g158217 = lerpResult920_g158217;
				float temp_output_7_0_g158239 = _OverlayBlendRemap.x;
				float temp_output_9_0_g158239 = ( ( _OverlayIntensityValue * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ) - temp_output_7_0_g158239 );
				half Overlay_Mask494_g158217 = saturate( ( ( temp_output_9_0_g158239 * _OverlayBlendRemap.z ) + 0.0001 ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				float3 In_AlbedoRaw3_g158220 = Out_AlbedoRaw4_g158218;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				float In_Depth3_g158220 = Out_Depth4_g158218;
				{
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.AlbedoRaw = In_AlbedoRaw3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				Data3_g158220.Depth = In_Depth3_g158220;
				}
				TVEVisualData Data4_g158296 = Data3_g158220;
				float Out_Dummy4_g158296 = 0;
				float3 Out_Albedo4_g158296 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158296 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158296 = float2( 0,0 );
				float3 Out_NormalWS4_g158296 = float3( 0,0,0 );
				float4 Out_Shader4_g158296 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158296 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158296 = 0;
				float Out_Grayscale4_g158296 = 0;
				float Out_Luminosity4_g158296 = 0;
				float Out_AlphaClip4_g158296 = 0;
				float Out_AlphaFade4_g158296 = 0;
				float3 Out_Translucency4_g158296 = float3( 0,0,0 );
				float Out_Transmission4_g158296 = 0;
				float Out_Thickness4_g158296 = 0;
				float Out_Diffusion4_g158296 = 0;
				float Out_Depth4_g158296 = 0;
				{
				Out_Dummy4_g158296 = Data4_g158296.Dummy;
				Out_Albedo4_g158296 = Data4_g158296.Albedo;
				Out_AlbedoRaw4_g158296 = Data4_g158296.AlbedoRaw;
				Out_NormalTS4_g158296 = Data4_g158296.NormalTS;
				Out_NormalWS4_g158296 = Data4_g158296.NormalWS;
				Out_Shader4_g158296 = Data4_g158296.Shader;
				Out_Emissive4_g158296= Data4_g158296.Emissive;
				Out_MultiMask4_g158296 = Data4_g158296.MultiMask;
				Out_Grayscale4_g158296 = Data4_g158296.Grayscale;
				Out_Luminosity4_g158296= Data4_g158296.Luminosity;
				Out_AlphaClip4_g158296 = Data4_g158296.AlphaClip;
				Out_AlphaFade4_g158296 = Data4_g158296.AlphaFade;
				Out_Translucency4_g158296 = Data4_g158296.Translucency;
				Out_Transmission4_g158296 = Data4_g158296.Transmission;
				Out_Thickness4_g158296 = Data4_g158296.Thickness;
				Out_Diffusion4_g158296 = Data4_g158296.Diffusion;
				Out_Depth4_g158296= Data4_g158296.Depth;
				}
				float3 temp_output_297_0_g158292 = Out_Albedo4_g158296;
				float3 In_Albedo3_g158307 = temp_output_297_0_g158292;
				float3 temp_output_297_23_g158292 = Out_AlbedoRaw4_g158296;
				float3 In_AlbedoRaw3_g158307 = temp_output_297_23_g158292;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158296;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158296;
				float4 In_Shader3_g158307 = Out_Shader4_g158296;
				float4 temp_cast_15 = (0.0).xxxx;
				half4 Visual_Emissive255_g158292 = Out_Emissive4_g158296;
				half Emissive_MeshMask221_g158292 = 1.0;
				half Emissive_Mask103_g158292 = 1.0;
				float temp_output_279_0_g158292 = ( Emissive_MeshMask221_g158292 * Emissive_Mask103_g158292 );
				float3 appendResult293_g158292 = (float3(temp_output_279_0_g158292 , temp_output_279_0_g158292 , temp_output_279_0_g158292));
				half3 Local_EmissiveColor278_g158292 = appendResult293_g158292;
				float3 temp_output_316_0_g158292 = (TVE_GlowParams).xyz;
				float3 lerpResult299_g158292 = lerp( float3( 1,1,1 ) , temp_output_316_0_g158292 , ( _EmissiveGlobalValue * TVE_IsEnabled ));
				half3 Emissive_GlobalMask248_g158292 = lerpResult299_g158292;
				half3 Visual_AlbedoRaw306_g158292 = temp_output_297_23_g158292;
				float3 lerpResult307_g158292 = lerp( float3( 1,1,1 ) , Visual_AlbedoRaw306_g158292 , _EmissiveColorMode);
				half3 Local_EmissiveValue88_g158292 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158292 * lerpResult307_g158292 );
				half3 Emissive_Blend260_g158292 = ( ( (Visual_Emissive255_g158292).xyz * Local_EmissiveColor278_g158292 ) * Local_EmissiveValue88_g158292 );
				float3 temp_output_3_0_g158298 = Emissive_Blend260_g158292;
				float temp_output_15_0_g158298 = _emissive_power_value;
				float3 hdEmission22_g158298 = ASEGetEmissionHDRColor(temp_output_3_0_g158298,temp_output_15_0_g158298,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Local_EmissiveMask294_g158292 = temp_output_279_0_g158292;
				float4 appendResult295_g158292 = (float4(hdEmission22_g158298 , Local_EmissiveMask294_g158292));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158292 = appendResult295_g158292;
				#else
				float4 staticSwitch129_g158292 = temp_cast_15;
				#endif
				half4 Final_Emissive184_g158292 = staticSwitch129_g158292;
				float4 In_Emissive3_g158307 = Final_Emissive184_g158292;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158296;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158296;
				float temp_output_297_11_g158292 = Out_MultiMask4_g158296;
				float In_MultiMask3_g158307 = temp_output_297_11_g158292;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158296;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158296;
				float3 In_Translucency3_g158307 = Out_Translucency4_g158296;
				float In_Transmission3_g158307 = Out_Transmission4_g158296;
				float In_Thickness3_g158307 = Out_Thickness4_g158296;
				float In_Diffusion3_g158307 = Out_Diffusion4_g158296;
				float In_Depth3_g158307 = Out_Depth4_g158296;
				{
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.AlbedoRaw = In_AlbedoRaw3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				Data3_g158307.Depth = In_Depth3_g158307;
				}
				TVEVisualData Data4_g158400 = Data3_g158307;
				float Out_Dummy4_g158400 = 0;
				float3 Out_Albedo4_g158400 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158400 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158400 = float2( 0,0 );
				float3 Out_NormalWS4_g158400 = float3( 0,0,0 );
				float4 Out_Shader4_g158400 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158400 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158400 = 0;
				float Out_Grayscale4_g158400 = 0;
				float Out_Luminosity4_g158400 = 0;
				float Out_AlphaClip4_g158400 = 0;
				float Out_AlphaFade4_g158400 = 0;
				float3 Out_Translucency4_g158400 = float3( 0,0,0 );
				float Out_Transmission4_g158400 = 0;
				float Out_Thickness4_g158400 = 0;
				float Out_Diffusion4_g158400 = 0;
				float Out_Depth4_g158400 = 0;
				{
				Out_Dummy4_g158400 = Data4_g158400.Dummy;
				Out_Albedo4_g158400 = Data4_g158400.Albedo;
				Out_AlbedoRaw4_g158400 = Data4_g158400.AlbedoRaw;
				Out_NormalTS4_g158400 = Data4_g158400.NormalTS;
				Out_NormalWS4_g158400 = Data4_g158400.NormalWS;
				Out_Shader4_g158400 = Data4_g158400.Shader;
				Out_Emissive4_g158400= Data4_g158400.Emissive;
				Out_MultiMask4_g158400 = Data4_g158400.MultiMask;
				Out_Grayscale4_g158400 = Data4_g158400.Grayscale;
				Out_Luminosity4_g158400= Data4_g158400.Luminosity;
				Out_AlphaClip4_g158400 = Data4_g158400.AlphaClip;
				Out_AlphaFade4_g158400 = Data4_g158400.AlphaFade;
				Out_Translucency4_g158400 = Data4_g158400.Translucency;
				Out_Transmission4_g158400 = Data4_g158400.Transmission;
				Out_Thickness4_g158400 = Data4_g158400.Thickness;
				Out_Diffusion4_g158400 = Data4_g158400.Diffusion;
				Out_Depth4_g158400= Data4_g158400.Depth;
				}
				half3 Visual_Albedo199_g158399 = Out_Albedo4_g158400;
				half3 Final_Albedo312_g158399 = Visual_Albedo199_g158399;
				float3 In_Albedo3_g158401 = Final_Albedo312_g158399;
				float3 In_AlbedoRaw3_g158401 = Out_AlbedoRaw4_g158400;
				float2 In_NormalTS3_g158401 = Out_NormalTS4_g158400;
				float3 In_NormalWS3_g158401 = Out_NormalWS4_g158400;
				float4 In_Shader3_g158401 = Out_Shader4_g158400;
				float4 In_Emissive3_g158401 = Out_Emissive4_g158400;
				float In_Grayscale3_g158401 = Out_Grayscale4_g158400;
				float In_Luminosity3_g158401 = Out_Luminosity4_g158400;
				float temp_output_301_11_g158399 = Out_MultiMask4_g158400;
				float In_MultiMask3_g158401 = temp_output_301_11_g158399;
				float In_AlphaClip3_g158401 = Out_AlphaClip4_g158400;
				float In_AlphaFade3_g158401 = Out_AlphaFade4_g158400;
				float3 temp_cast_16 = (0.0).xxx;
				half3 Subsurface_Color264_g158399 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158399 );
				half Visual_Transmission138_g158399 = Out_Transmission4_g158400;
				half Subsurface_Value268_g158399 = _SubsurfaceIntensityValue;
				float lerpResult403_g158399 = lerp( 1.0 , TVE_GlowParams.w , ( _SubsurfaceGlobalValue * TVE_IsEnabled ));
				half Subsurface_GlobalMask369_g158399 = lerpResult403_g158399;
				half Visual_MultiMask292_g158399 = temp_output_301_11_g158399;
				float lerpResult293_g158399 = lerp( 1.0 , Visual_MultiMask292_g158399 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158399 = lerpResult293_g158399;
				half Custom_Mask363_g158399 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158399 = ( Visual_Transmission138_g158399 * Subsurface_Value268_g158399 * Subsurface_GlobalMask369_g158399 * Subsurface_MultiMask296_g158399 * Custom_Mask363_g158399 );
				#else
				float staticSwitch345_g158399 = 0.0;
				#endif
				half Final_Transmission269_g158399 = staticSwitch345_g158399;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158399 = ( Subsurface_Color264_g158399 * Final_Transmission269_g158399 * 10.0 );
				#else
				float3 staticSwitch348_g158399 = temp_cast_16;
				#endif
				half3 Final_Translucency254_g158399 = staticSwitch348_g158399;
				float3 In_Translucency3_g158401 = Final_Translucency254_g158399;
				float In_Transmission3_g158401 = Final_Transmission269_g158399;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158399 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158399 = 1.0;
				#endif
				half Final_Thickness275_g158399 = staticSwitch351_g158399;
				float In_Thickness3_g158401 = Final_Thickness275_g158399;
				float Final_Diffusion340_g158399 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158401 = Final_Diffusion340_g158399;
				float In_Depth3_g158401 = Out_Depth4_g158400;
				{
				Data3_g158401.Dummy = In_Dummy3_g158401;
				Data3_g158401.Albedo = In_Albedo3_g158401;
				Data3_g158401.AlbedoRaw = In_AlbedoRaw3_g158401;
				Data3_g158401.NormalTS = In_NormalTS3_g158401;
				Data3_g158401.NormalWS = In_NormalWS3_g158401;
				Data3_g158401.Shader = In_Shader3_g158401;
				Data3_g158401.Emissive= In_Emissive3_g158401;
				Data3_g158401.MultiMask = In_MultiMask3_g158401;
				Data3_g158401.Grayscale = In_Grayscale3_g158401;
				Data3_g158401.Luminosity = In_Luminosity3_g158401;
				Data3_g158401.AlphaClip = In_AlphaClip3_g158401;
				Data3_g158401.AlphaFade = In_AlphaFade3_g158401;
				Data3_g158401.Translucency = In_Translucency3_g158401;
				Data3_g158401.Transmission = In_Transmission3_g158401;
				Data3_g158401.Thickness = In_Thickness3_g158401;
				Data3_g158401.Diffusion = In_Diffusion3_g158401;
				Data3_g158401.Depth = In_Depth3_g158401;
				}
				TVEVisualData Data4_g158410 = Data3_g158401;
				float Out_Dummy4_g158410 = 0;
				float3 Out_Albedo4_g158410 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158410 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158410 = float2( 0,0 );
				float3 Out_NormalWS4_g158410 = float3( 0,0,0 );
				float4 Out_Shader4_g158410 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158410 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158410 = 0;
				float Out_Grayscale4_g158410 = 0;
				float Out_Luminosity4_g158410 = 0;
				float Out_AlphaClip4_g158410 = 0;
				float Out_AlphaFade4_g158410 = 0;
				float3 Out_Translucency4_g158410 = float3( 0,0,0 );
				float Out_Transmission4_g158410 = 0;
				float Out_Thickness4_g158410 = 0;
				float Out_Diffusion4_g158410 = 0;
				float Out_Depth4_g158410 = 0;
				{
				Out_Dummy4_g158410 = Data4_g158410.Dummy;
				Out_Albedo4_g158410 = Data4_g158410.Albedo;
				Out_AlbedoRaw4_g158410 = Data4_g158410.AlbedoRaw;
				Out_NormalTS4_g158410 = Data4_g158410.NormalTS;
				Out_NormalWS4_g158410 = Data4_g158410.NormalWS;
				Out_Shader4_g158410 = Data4_g158410.Shader;
				Out_Emissive4_g158410= Data4_g158410.Emissive;
				Out_MultiMask4_g158410 = Data4_g158410.MultiMask;
				Out_Grayscale4_g158410 = Data4_g158410.Grayscale;
				Out_Luminosity4_g158410= Data4_g158410.Luminosity;
				Out_AlphaClip4_g158410 = Data4_g158410.AlphaClip;
				Out_AlphaFade4_g158410 = Data4_g158410.AlphaFade;
				Out_Translucency4_g158410 = Data4_g158410.Translucency;
				Out_Transmission4_g158410 = Data4_g158410.Transmission;
				Out_Thickness4_g158410 = Data4_g158410.Thickness;
				Out_Diffusion4_g158410 = Data4_g158410.Diffusion;
				Out_Depth4_g158410= Data4_g158410.Depth;
				}
				half3 Input_Albedo24_g158408 = Out_Albedo4_g158410;
				#ifdef UNITY_COLORSPACE_GAMMA
				float4 staticSwitch22_g158408 = half4( 0.2209163, 0.2209163, 0.2209163, 0.7790837 );
				#else
				float4 staticSwitch22_g158408 = half4( 0.04, 0.04, 0.04, 0.96 );
				#endif
				half4 ColorSpaceDielectricSpec23_g158408 = staticSwitch22_g158408;
				float4 break24_g158407 = Out_Shader4_g158410;
				half Metallic117_g158407 = break24_g158407.x;
				half Input_Metallic25_g158408 = Metallic117_g158407;
				half OneMinusReflectivity31_g158408 = ( (ColorSpaceDielectricSpec23_g158408).w - ( (ColorSpaceDielectricSpec23_g158408).w * Input_Metallic25_g158408 ) );
				float3 lerpResult87_g158407 = lerp( half3( 1, 0, 0 ) , ( Input_Albedo24_g158408 * OneMinusReflectivity31_g158408 ) , _IsInitialized);
				

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;

				surfaceDescription.BaseColor = lerpResult87_g158407;
				surfaceDescription.Normal = Out_NormalWS4_g158410;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Smoothness = break24_g158407.w;
				surfaceDescription.Occlusion = break24_g158407.y;
				surfaceDescription.Emission = (Out_Emissive4_g158410).xyz;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = Out_Thickness4_g158410;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = Out_Transmission4_g158410;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = Out_Diffusion4_g158410;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = Out_Depth4_g158410;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local_fragment _ _DISABLE_SSR
			#define ASE_FRAGMENT_NORMAL 2
			#define ASE_DEPTH_WRITE_ON
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 140012
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma shader_feature _ EDITOR_VISUALIZATION
			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

            #define SHADERPASS SHADERPASS_LIGHT_TRANSPORT
            #define SCENEPICKINGPASS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

            #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
            #undef  _REFRACTION_PLANE
            #undef  _REFRACTION_SPHERE
            #define _REFRACTION_THIN
            #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DitherColoring;
			half4 _OverlayLumaRemap;
			half4 _OverlayProjRemap;
			half4 _OverlayColor;
			half4 _DrynessColoring;
			half4 _TintingLumaRemap;
			half4 _ImpostorColor;
			half4 _overlay_vert_mode;
			half4 _ImpostorColorTwo;
			half4 _TintingColoring;
			half4 _SizeFadeColoring;
			float4 _AI_SizeOffset;
			half4 _VariationNoiseRemap;
			half4 _VariationColorOne;
			half4 _VariationColorTwo;
			float4 _TintingColor;
			half4 _OverlayMeshRemap;
			half4 _VariationColoring;
			float4 _DrynessColor;
			half4 _DrynessLumaRemap;
			half4 _EmissiveColor;
			half4 _OverlayBlendRemap;
			half4 _WetnessColoring;
			half4 _CutoutColoring;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			float3 _AI_Offset;
			float3 _AI_BoundsMin;
			float3 _AI_BoundsSize;
			half _SizeFadeCategory;
			half _CutoutLiteInfo;
			half _SizeFadeEnd;
			half _SizeFadeScaleValue1;
			half _SizeFadeLiteInfo;
			half _DitherNoiseTillingValue;
			half _CutoutCategory;
			half _DitherMultiValue;
			half _DitherShadowMode;
			half _DitherDistanceMaxValue;
			half _CutoutNoiseValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseTillingValue;
			half _CutoutGlobalValue;
			half _CutoutMultiValue;
			half _DitherLiteInfo;
			half _CutoutShadowMode;
			half _DitherDistanceMinValue;
			half _CutoutIntensityValue;
			half _DitherCategory;
			half _CutoutSpace;
			half _DitherEnd;
			half _DitherConstantValue;
			half _DitherDistanceValue;
			half _CutoutEnd;
			half _SizeFadeIntensityValue;
			half _ImpostorMaskOffInfo;
			half _SubsurfaceCategory;
			half _SizeFadeScaleValue;
			half _ImpostorSmoothnessValue;
			half _OverlayIntensityValue;
			half _OverlayProjValue;
			half _OverlayLumaValue;
			half _OverlayMeshValue;
			half _OverlayMeshMode;
			half _OverlayGlobalValue;
			half _OverlayNormalValue;
			half _OverlaySmoothnessValue;
			half _OverlaySubsurfaceValue;
			half _EmissiveIntensityValue;
			half _EmissiveGlobalValue;
			half _EmissiveColorMode;
			float _emissive_power_value;
			half _EmissiveExposureValue;
			half _SubsurfaceIntensityValue;
			half _SubsurfaceGlobalValue;
			half _ImpostorOcclusionValue;
			half _SizeFadeScaleMode;
			half _ImpostorMetallicValue;
			half _OverlayBakeInfo;
			half _SizeFadeDistMinValue;
			half _SizeFadeDistMaxValue;
			half _GlobalLiteInfo;
			half _GlobalCategory;
			half _GlobalEnd;
			half _WetnessSmoothnessValue;
			half _SubsurfaceEnd;
			half _SubsurfaceDirectValue;
			half _SubsurfaceNormalValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _EmissiveCategory;
			half _EmissiveEnd;
			half _EmissivePowerMode;
			half _EmissivePowerValue;
			half _OverlayCategory;
			half _OverlayEnd;
			half _ImpostorColorMode;
			half _WetnessContrastValue;
			half _DrynessMultiValue;
			half _WetnessEnd;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsCollected;
			half _IsLiteShader;
			half _MotionCategory;
			half _MotionEnd;
			half _MotionLiteInfo;
			float _AI_Clip;
			float _AI_TextureBias;
			float _AI_Parallax;
			float _AI_ShadowBias;
			half _ImpostorEnd;
			half _IsShared;
			half _IsCustomShader;
			half _IsTVEShader;
			half _ImpostorMaskDefaultInfo;
			half _ImpostorMaskPackedInfo;
			half _ImpostorMaskShadingInfo;
			half _ImpostorMaskMode;
			half _ImpostorSpace0;
			half _ImpostorSpace1;
			half _ImpostorAlphaClipValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _SubsurfaceScatteringValue;
			half _IsVersion;
			half _RenderDecals;
			half _RenderSSR;
			half _CategoryRender;
			half _EndRender;
			half _IsInitialized;
			float _AI_ShadowView;
			float _AI_ForwardBias;
			float _AI_Frames;
			float _AI_DepthSize;
			half _TintingGlobalValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessIntensityValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _DrynessGlobalValue;
			half _SubsurfaceMultiValue;
			half _DrynessLumaValue;
			half _WetnessLiteInfo;
			half _WetnessCategory;
			half _TintingGrayValue;
			half _WetnessIntensityValue;
			half _TintingIntensityValue;
			half _TintingEnd;
			float _AI_ImpostorSize;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			half _MotionBaseTillingValue;
			half _MotionBaseSpeedValue;
			half _MotionBaseNoiseValue;
			half _MotionIntensityValue;
			half _MotionBaseDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _VariationNoiseTillingValue;
			half _TintingLiteInfo;
			half _TintingCategory;
			half _TintingSpace;
			half _SubsurfaceThicknessValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			TEXTURE2D(_MotionNoiseTex);
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_MotionParamsEditor;
			half _DisableSRPBatcher;
			TEXTURE2D(_Shader);
			TEXTURE2D(_Packed);
			TEXTURE2D(_Vertex);
			SAMPLER(sampler_Shader);
			SAMPLER(sampler_Packed);
			SAMPLER(sampler_Vertex);
			half4 TVE_AtmoParams;
			half TVE_IsEnabled;
			half4 TVE_GlowParams;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#if SHADERPASS == SHADERPASS_LIGHT_TRANSPORT
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/MetaPass.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define AI_ObjectToWorld GetObjectToWorldMatrix()
			#define AI_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_CHANGES_WORLD_POS
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _USE_PARALLAX_ON
			#pragma shader_feature_local _HEMI_ON
			#pragma shader_feature_local AI_CLIP_NEIGHBOURS_FRAMES
			#pragma shader_feature_local_vertex TVE_MOTION
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_IMPOSTOR_MASK_OFF TVE_IMPOSTOR_MASK_DEFAULT TVE_IMPOSTOR_MASK_PACKED TVE_IMPOSTOR_MASK_SHADING
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IMPOSTOR_SHADER
			//#define _USE_PARALLAX_ON
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				#ifdef EDITOR_VISUALIZATION
				float2 VizUV : TEXCOORD0;
				float4 LightCoord : TEXCOORD1;
				#endif
				float4 UVsFrame122_g156549 : TEXCOORD2;
				float4 UVsFrame222_g156549 : TEXCOORD3;
				float4 UVsFrame322_g156549 : TEXCOORD4;
				float4 octaframe22_g156549 : TEXCOORD5;
				float4 viewPos22_g156549 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			struct ImpostorOutput
			{
				half3 Albedo;
				half3 Specular;
				half Metallic;
				half3 WorldNormal;
				half Smoothness;
				half Occlusion;
				half3 Emission;
				half Alpha;
			};
			
			float2 VectorToOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, out float2 uvs, out float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			float2 VectorToHemiOctahedron( float3 N )
			{
				N.xy /= dot( 1.0, abs( N ) );
				return float2( N.x + N.y, N.x - N.y );
			}
			
			float3 HemiOctahedronToVector( float2 Oct )
			{
				Oct = float2( Oct.x + Oct.y, Oct.x - Oct.y ) * 0.5;
				float3 N = float3( Oct, 1 - dot( 1.0, abs( Oct ) ) );
				return normalize( N );
			}
			
			inline void OctaImpostorVertex( inout float3 positionOS, out float3 normalOS, out float4 tangentOS, out float4 uvsFrame1, out float4 uvsFrame2, out float4 uvsFrame3, out float4 octaFrame, out float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = AI_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = AI_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( AI_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				#if defined( _HEMI_ON )
				objectCameraDirection.y = max(0.001, objectCameraDirection.y);
				float2 frameOcta = VectorToHemiOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#else
				float2 frameOcta = VectorToOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#endif
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa1WorldY = HemiOctahedronToVector( octaFrame1 ).xzy;
				#else
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				#endif
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*out*/ uvFrame1, /*out*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa2WorldY = HemiOctahedronToVector( octaFrame2 ).xzy;
				#else
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				#endif
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*out*/ uvFrame2, /*out*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa3WorldY = HemiOctahedronToVector( octaFrame3 ).xzy;
				#else
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				#endif
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*out*/ uvFrame3, /*out*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				octaFrame.zw = fractionOctaFrame;
				#endif
				positionOS = billboard + _AI_Offset.xyz;
				normalOS = objectCameraDirection;
				tangentOS = float4( objectHorizontalVector, 1 );
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout ImpostorOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 viewPos, out float4 output0, out float4 output1, out float4 output2 )
			{
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, -1 );
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, -1 );
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, -1 );
				float2 parallax1_uv = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float2 parallax2_uv = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float2 parallax3_uv = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1_uv, _AI_TextureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2_uv, _AI_TextureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3_uv, _AI_TextureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1_uv - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2_uv, parallax3_uv ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * ( 1 - step_1 );
				step23 = step23 * ( 1 - step23 );
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				#endif
				o.Albedo = blendedAlbedo.rgb;
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1_uv, _AI_TextureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2_uv, _AI_TextureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3_uv, _AI_TextureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				o.WorldNormal = normalize( mul( (float3x3)AI_ObjectToWorld, localNormal ) );
				float depth = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 ) * _AI_DepthSize * length( AI_ObjectToWorld[ 2 ].xyz );
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax1_uv, _AI_TextureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax2_uv, _AI_TextureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax3_uv, _AI_TextureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax1_uv, _AI_TextureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax2_uv, _AI_TextureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax3_uv, _AI_TextureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float4 output2a = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax1_uv, _AI_TextureBias );
				float4 output2b = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax2_uv, _AI_TextureBias );
				float4 output2c = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax3_uv, _AI_TextureBias );
				output2 = output2a * weights.x  + output2b * weights.y + output2c * weights.z; 
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView - _AI_ShadowBias;
				#else 
				viewPos.z += depth + _AI_ForwardBias;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				#if defined(SHADERPASS) && defined(UNITY_PASS_SHADOWCASTER)
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#else
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

                #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

                #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                #endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = surfaceDescription.Normal;

			#if ( UNITY_VERSION <= 202236 )
				#if ( ASE_FRAGMENT_NORMAL == 1 )
					GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#elif ( ASE_FRAGMENT_NORMAL == 2 )
					GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#endif

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#else
				#ifdef DECAL_NORMAL_BLENDING
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif
			#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
                    GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.tangentToWorld);
				#endif

				#if defined(DEBUG_DISPLAY)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						surfaceData.metallic = 0;
					}
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS output;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);

				TVEModelData Data16_g158391 = (TVEModelData)0;
				float In_Dummy16_g158391 = 0.0;
				TVEModelData Data16_g158266 = (TVEModelData)0;
				half Dummy181_g158264 = ( ( _MotionCategory + _MotionEnd ) + _MotionLiteInfo );
				float In_Dummy16_g158266 = Dummy181_g158264;
				TVEModelData Data16_g157226 = (TVEModelData)0;
				float In_Dummy16_g157226 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS.xyz, inputMesh.normalOS.xyz, inputMesh.tangentOS, output.UVsFrame122_g156549, output.UVsFrame222_g156549, output.UVsFrame322_g156549, output.octaframe22_g156549, output.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( TransformObjectToWorld( inputMesh.positionOS.xyz ) );
				half3 Input_PositionWS319_g157220 = worldPosOut22_g156549;
				float3 worldToObj315_g157220 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS( Input_PositionWS319_g157220 ), 1 ) ).xyz;
				half3 Model_PositionOS316_g157220 = worldToObj315_g157220;
				float3 In_PositionOS16_g157226 = Model_PositionOS316_g157220;
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157226 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157226 = Model_PositionWO311_g157220;
				float3 In_PositionRawOS16_g157226 = Model_PositionOS316_g157220;
				float3 In_PositionAddOS16_g157226 = float3( 0,0,0 );
				float3 In_PivotOS16_g157226 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157223 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157223 = ( localObjectPosition_UNITY_MATRIX_M14_g157223 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157223 = localObjectPosition_UNITY_MATRIX_M14_g157223;
				#endif
				float3 vertexToFrag305_g157220 = staticSwitch13_g157223;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157226 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157226 = Model_PivotWO312_g157220;
				half3 Model_NormalOS313_g157220 = inputMesh.normalOS;
				float3 In_NormalOS16_g157226 = Model_NormalOS313_g157220;
				float3 ase_normalWS = TransformObjectToWorldNormal( inputMesh.normalOS );
				half3 Model_Normal_WS314_g157220 = ase_normalWS;
				float3 In_NormalWS16_g157226 = Model_Normal_WS314_g157220;
				float3 In_NormalRawOS16_g157226 = Model_NormalOS313_g157220;
				float3 In_NormalRawWS16_g157226 = Model_Normal_WS314_g157220;
				float4 In_TangentOS16_g157226 = float4( 0,1,0,1 );
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157226 = Model_ViewDirWS347_g157220;
				float4 In_VertexData16_g157226 = float4( 1,1,1,1 );
				float4 In_PhaseData16_g157226 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157226 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157226 = float4( 0,0,0,0 );
				{
				Data16_g157226.Dummy = In_Dummy16_g157226;
				Data16_g157226.PositionOS = In_PositionOS16_g157226;
				Data16_g157226.PositionWS = In_PositionWS16_g157226;
				Data16_g157226.PositionWO = In_PositionWO16_g157226;
				Data16_g157226.PositionRawOS = In_PositionRawOS16_g157226;
				Data16_g157226.PositionAddOS = In_PositionAddOS16_g157226;
				Data16_g157226.PivotOS = In_PivotOS16_g157226;
				Data16_g157226.PivotWS = In_PivotWS16_g157226;
				Data16_g157226.PivotWO = In_PivotWO16_g157226;
				Data16_g157226.NormalOS = In_NormalOS16_g157226;
				Data16_g157226.NormalWS = In_NormalWS16_g157226;
				Data16_g157226.NormalRawOS = In_NormalRawOS16_g157226;
				Data16_g157226.NormalRawWS = In_NormalRawWS16_g157226;
				Data16_g157226.TangentOS = In_TangentOS16_g157226;
				Data16_g157226.ViewDirWS = In_ViewDirWS16_g157226;
				Data16_g157226.VertexData = In_VertexData16_g157226;
				Data16_g157226.PhaseData = In_PhaseData16_g157226;
				Data16_g157226.BoundsData = In_BoundsData16_g157226;
				Data16_g157226.RotationData = In_RotationData16_g157226;
				}
				TVEModelData Data15_g158265 = Data16_g157226;
				float Out_Dummy15_g158265 = 0;
				float3 Out_PositionOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158265 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158265 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158265 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158265 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158265 = float3( 0,0,0 );
				float4 Out_VertexData15_g158265 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158265 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158265 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158265 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158265 = Data15_g158265.Dummy;
				Out_PositionOS15_g158265 = Data15_g158265.PositionOS;
				Out_PositionWS15_g158265 = Data15_g158265.PositionWS;
				Out_PositionWO15_g158265 = Data15_g158265.PositionWO;
				Out_PositionRawOS15_g158265 = Data15_g158265.PositionRawOS;
				Out_PositionAddOS15_g158265 = Data15_g158265.PositionAddOS;
				Out_PivotOS15_g158265 = Data15_g158265.PivotOS;
				Out_PivotWS15_g158265 = Data15_g158265.PivotWS;
				Out_PivotWO15_g158265 = Data15_g158265.PivotWO;
				Out_NormalOS15_g158265 = Data15_g158265.NormalOS;
				Out_NormalWS15_g158265 = Data15_g158265.NormalWS;
				Out_NormalRawOS15_g158265 = Data15_g158265.NormalRawOS;
				Out_NormalRawWS15_g158265 = Data15_g158265.NormalRawWS;
				Out_TangentOS15_g158265 = Data15_g158265.TangentOS;
				Out_ViewDirWS15_g158265 = Data15_g158265.ViewDirWS;
				Out_VertexData15_g158265 = Data15_g158265.VertexData;
				Out_PhaseData15_g158265 = Data15_g158265.PhaseData;
				Out_BoundsData15_g158265 = Data15_g158265.BoundsData;
				Out_RotationData15_g158265 = Data15_g158265.RotationData;
				}
				float3 temp_output_1567_0_g158264 = Out_PositionOS15_g158265;
				float3 In_PositionOS16_g158266 = temp_output_1567_0_g158264;
				float3 In_PositionWS16_g158266 = Out_PositionWS15_g158265;
				float3 temp_output_1567_17_g158264 = Out_PositionWO15_g158265;
				float3 In_PositionWO16_g158266 = temp_output_1567_17_g158264;
				float3 In_PositionRawOS16_g158266 = Out_PositionRawOS15_g158265;
				float3 In_PositionAddOS16_g158266 = Out_PositionAddOS15_g158265;
				float3 In_PivotOS16_g158266 = Out_PivotOS15_g158265;
				float3 In_PivotWS16_g158266 = Out_PivotWS15_g158265;
				float3 temp_output_1567_19_g158264 = Out_PivotWO15_g158265;
				float3 In_PivotWO16_g158266 = temp_output_1567_19_g158264;
				float3 In_NormalOS16_g158266 = Out_NormalOS15_g158265;
				float3 In_NormalWS16_g158266 = Out_NormalWS15_g158265;
				float3 In_NormalRawOS16_g158266 = Out_NormalRawOS15_g158265;
				float3 In_NormalRawWS16_g158266 = Out_NormalRawWS15_g158265;
				float4 In_TangentOS16_g158266 = Out_TangentOS15_g158265;
				float3 In_ViewDirWS16_g158266 = Out_ViewDirWS15_g158265;
				float4 In_VertexData16_g158266 = Out_VertexData15_g158265;
				float4 In_PhaseData16_g158266 = Out_PhaseData15_g158265;
				float4 In_BoundsData16_g158266 = Out_BoundsData15_g158265;
				half3 Model_PositionOS147_g158264 = temp_output_1567_0_g158264;
				half Base_Mask217_g158264 = saturate( ( Model_PositionOS147_g158264.y / _AI_Offset.y ) );
				float4 lerpResult836_g158275 = lerp( half4( 0, 1, 1, 0 ) , TVE_MotionParams , TVE_MotionParams.w);
				half2 Global_WindDirWS1663_g158264 = (lerpResult836_g158275).xy;
				half2 Input_WindDirWS803_g158268 = Global_WindDirWS1663_g158264;
				half3 Model_PositionWO162_g158264 = temp_output_1567_17_g158264;
				half3 Model_PivotWO402_g158264 = temp_output_1567_19_g158264;
				float3 lerpResult829_g158264 = lerp( Model_PositionWO162_g158264 , Model_PivotWO402_g158264 , _MotionBasePivotValue);
				half3 Base_Position1394_g158264 = lerpResult829_g158264;
				half3 Input_PositionWO419_g158268 = Base_Position1394_g158264;
				half Input_MotionTilling321_g158268 = ( _MotionBaseTillingValue + 0.2 );
				half2 Noise_Coord515_g158268 = ( -(Input_PositionWO419_g158268).xz * Input_MotionTilling321_g158268 * 0.005 );
				float2 temp_output_3_0_g158272 = Noise_Coord515_g158268;
				float2 temp_output_21_0_g158272 = Input_WindDirWS803_g158268;
				float mulTime113_g158271 = _TimeParameters.x * 0.02;
				float lerpResult128_g158271 = lerp( mulTime113_g158271 , ( ( mulTime113_g158271 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g158268 = _MotionBaseSpeedValue;
				half Noise_Speed516_g158268 = ( lerpResult128_g158271 * Input_MotionSpeed62_g158268 );
				float temp_output_15_0_g158272 = Noise_Speed516_g158268;
				float temp_output_23_0_g158272 = frac( temp_output_15_0_g158272 );
				float4 lerpResult39_g158272 = lerp( SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * temp_output_23_0_g158272 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * frac( ( temp_output_15_0_g158272 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_23_0_g158272 - 0.5 ) ) / 0.5 ));
				float4 temp_output_635_0_g158268 = lerpResult39_g158272;
				half2 Noise_DirWS825_g158268 = ((temp_output_635_0_g158268).rg*2.0 + -1.0);
				half Input_MotionNoise552_g158268 = _MotionBaseNoiseValue;
				half Global_WInd769_g158275 = (lerpResult836_g158275).z;
				float lerpResult853_g158275 = lerp( Global_WInd769_g158275 , saturate( (Global_WInd769_g158275*TVE_MotionParamsEditor.x + TVE_MotionParamsEditor.y) ) , TVE_MotionParamsEditor.w);
				half Input_MotionValue629_g158275 = _MotionIntensityValue;
				half Global_WindValue1664_g158264 = ( lerpResult853_g158275 * Input_MotionValue629_g158275 );
				half Input_WindValue853_g158268 = Global_WindValue1664_g158264;
				float lerpResult701_g158268 = lerp( 1.0 , Input_MotionNoise552_g158268 , Input_WindValue853_g158268);
				float2 lerpResult646_g158268 = lerp( Input_WindDirWS803_g158268 , Noise_DirWS825_g158268 , lerpResult701_g158268);
				half Input_MotionDelay753_g158268 = _MotionBaseDelayValue;
				float lerpResult756_g158268 = lerp( 1.0 , ( Input_WindValue853_g158268 * Input_WindValue853_g158268 ) , Input_MotionDelay753_g158268);
				half Wind_Delay815_g158268 = lerpResult756_g158268;
				float2 temp_output_809_0_g158268 = ( lerpResult646_g158268 * Input_WindValue853_g158268 * Wind_Delay815_g158268 );
				half2 Input_PushDirWS807_g158268 = float2( 1,0 );
				half Input_PushAlpha806_g158268 = ( 1.0 * 1.0 );
				float2 lerpResult811_g158268 = lerp( temp_output_809_0_g158268 , Input_PushDirWS807_g158268 , Input_PushAlpha806_g158268);
				#ifdef TVE_MOTION_ELEMENT
				float2 staticSwitch808_g158268 = lerpResult811_g158268;
				#else
				float2 staticSwitch808_g158268 = temp_output_809_0_g158268;
				#endif
				float2 temp_output_38_0_g158269 = staticSwitch808_g158268;
				float2 break83_g158269 = temp_output_38_0_g158269;
				float3 appendResult79_g158269 = (float3(break83_g158269.x , 0.0 , break83_g158269.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Bending893_g158264 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158269 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Base_Motion1440_g158264 = ( _MotionBaseIntensityValue * Base_Mask217_g158264 * Base_Bending893_g158264 );
				#ifdef TVE_MOTION
				float2 staticSwitch1651_g158264 = Base_Motion1440_g158264;
				#else
				float2 staticSwitch1651_g158264 = float2( 0,0 );
				#endif
				float4 appendResult1658_g158264 = (float4(staticSwitch1651_g158264 , 0.0 , 0.0));
				half4 Final_RoationData1570_g158264 = appendResult1658_g158264;
				float4 In_RotationData16_g158266 = Final_RoationData1570_g158264;
				{
				Data16_g158266.Dummy = In_Dummy16_g158266;
				Data16_g158266.PositionOS = In_PositionOS16_g158266;
				Data16_g158266.PositionWS = In_PositionWS16_g158266;
				Data16_g158266.PositionWO = In_PositionWO16_g158266;
				Data16_g158266.PositionRawOS = In_PositionRawOS16_g158266;
				Data16_g158266.PositionAddOS = In_PositionAddOS16_g158266;
				Data16_g158266.PivotOS = In_PivotOS16_g158266;
				Data16_g158266.PivotWS = In_PivotWS16_g158266;
				Data16_g158266.PivotWO = In_PivotWO16_g158266;
				Data16_g158266.NormalOS = In_NormalOS16_g158266;
				Data16_g158266.NormalWS = In_NormalWS16_g158266;
				Data16_g158266.NormalRawOS = In_NormalRawOS16_g158266;
				Data16_g158266.NormalRawWS = In_NormalRawWS16_g158266;
				Data16_g158266.TangentOS = In_TangentOS16_g158266;
				Data16_g158266.ViewDirWS = In_ViewDirWS16_g158266;
				Data16_g158266.VertexData = In_VertexData16_g158266;
				Data16_g158266.PhaseData = In_PhaseData16_g158266;
				Data16_g158266.BoundsData = In_BoundsData16_g158266;
				Data16_g158266.RotationData = In_RotationData16_g158266;
				}
				TVEModelData Data15_g158390 = Data16_g158266;
				float Out_Dummy15_g158390 = 0;
				float3 Out_PositionOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158390 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158390 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158390 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158390 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158390 = float3( 0,0,0 );
				float4 Out_VertexData15_g158390 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158390 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158390 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158390 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158390 = Data15_g158390.Dummy;
				Out_PositionOS15_g158390 = Data15_g158390.PositionOS;
				Out_PositionWS15_g158390 = Data15_g158390.PositionWS;
				Out_PositionWO15_g158390 = Data15_g158390.PositionWO;
				Out_PositionRawOS15_g158390 = Data15_g158390.PositionRawOS;
				Out_PositionAddOS15_g158390 = Data15_g158390.PositionAddOS;
				Out_PivotOS15_g158390 = Data15_g158390.PivotOS;
				Out_PivotWS15_g158390 = Data15_g158390.PivotWS;
				Out_PivotWO15_g158390 = Data15_g158390.PivotWO;
				Out_NormalOS15_g158390 = Data15_g158390.NormalOS;
				Out_NormalWS15_g158390 = Data15_g158390.NormalWS;
				Out_NormalRawOS15_g158390 = Data15_g158390.NormalRawOS;
				Out_NormalRawWS15_g158390 = Data15_g158390.NormalRawWS;
				Out_TangentOS15_g158390 = Data15_g158390.TangentOS;
				Out_ViewDirWS15_g158390 = Data15_g158390.ViewDirWS;
				Out_VertexData15_g158390 = Data15_g158390.VertexData;
				Out_PhaseData15_g158390 = Data15_g158390.PhaseData;
				Out_BoundsData15_g158390 = Data15_g158390.BoundsData;
				Out_RotationData15_g158390 = Data15_g158390.RotationData;
				}
				half3 Model_PositionOS147_g158389 = Out_PositionOS15_g158390;
				half3 VertexPos40_g158393 = Model_PositionOS147_g158389;
				float3 appendResult74_g158393 = (float3(VertexPos40_g158393.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158393 = appendResult74_g158393;
				float3 break84_g158393 = VertexPos40_g158393;
				float3 appendResult81_g158393 = (float3(0.0 , break84_g158393.y , break84_g158393.z));
				half3 VertexPosOtherAxis82_g158393 = appendResult81_g158393;
				float4 temp_output_1567_33_g158389 = Out_RotationData15_g158390;
				half4 Model_VertexBend1569_g158389 = temp_output_1567_33_g158389;
				float2 break1582_g158389 = (Model_VertexBend1569_g158389).xy;
				half Angle44_g158393 = break1582_g158389.y;
				half3 VertexPos40_g158396 = ( VertexPosRotationAxis50_g158393 + ( VertexPosOtherAxis82_g158393 * cos( Angle44_g158393 ) ) + ( cross( float3( 1, 0, 0 ) , VertexPosOtherAxis82_g158393 ) * sin( Angle44_g158393 ) ) );
				float3 appendResult74_g158396 = (float3(0.0 , 0.0 , VertexPos40_g158396.z));
				half3 VertexPosRotationAxis50_g158396 = appendResult74_g158396;
				float3 break84_g158396 = VertexPos40_g158396;
				float3 appendResult81_g158396 = (float3(break84_g158396.x , break84_g158396.y , 0.0));
				half3 VertexPosOtherAxis82_g158396 = appendResult81_g158396;
				half Angle44_g158396 = -break1582_g158389.x;
				float3 temp_output_1584_19_g158389 = ( VertexPosRotationAxis50_g158396 + ( VertexPosOtherAxis82_g158396 * cos( Angle44_g158396 ) ) + ( cross( float3( 0, 0, 1 ) , VertexPosOtherAxis82_g158396 ) * sin( Angle44_g158396 ) ) );
				float3 temp_output_6_0_g158395 = temp_output_1584_19_g158389;
				#ifdef TVE_MOTION
				float3 staticSwitch65_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch65_g158395 = Model_PositionOS147_g158389;
				#endif
				#ifdef TVE_CONFORM
				float3 staticSwitch69_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch69_g158395 = staticSwitch65_g158395;
				#endif
				float3 temp_output_1585_0_g158389 = staticSwitch69_g158395;
				float3 temp_output_1567_31_g158389 = Out_PositionAddOS15_g158390;
				half3 Model_PositionADD1568_g158389 = temp_output_1567_31_g158389;
				half3 Final_PositionOS178_g158389 = ( temp_output_1585_0_g158389 + Model_PositionADD1568_g158389 );
				float3 In_PositionOS16_g158391 = Final_PositionOS178_g158389;
				float3 In_PositionWS16_g158391 = Out_PositionWS15_g158390;
				float3 In_PositionWO16_g158391 = Out_PositionWO15_g158390;
				float3 In_PositionRawOS16_g158391 = Out_PositionRawOS15_g158390;
				float3 In_PositionAddOS16_g158391 = temp_output_1567_31_g158389;
				float3 In_PivotOS16_g158391 = Out_PivotOS15_g158390;
				float3 In_PivotWS16_g158391 = Out_PivotWS15_g158390;
				float3 In_PivotWO16_g158391 = Out_PivotWO15_g158390;
				float3 In_NormalOS16_g158391 = Out_NormalOS15_g158390;
				float3 In_NormalWS16_g158391 = Out_NormalWS15_g158390;
				float3 In_NormalRawOS16_g158391 = Out_NormalRawOS15_g158390;
				float3 In_NormalRawWS16_g158391 = Out_NormalRawWS15_g158390;
				float4 In_TangentOS16_g158391 = Out_TangentOS15_g158390;
				float3 In_ViewDirWS16_g158391 = Out_ViewDirWS15_g158390;
				float4 In_VertexData16_g158391 = Out_VertexData15_g158390;
				float4 In_PhaseData16_g158391 = Out_PhaseData15_g158390;
				float4 In_BoundsData16_g158391 = Out_BoundsData15_g158390;
				float4 In_RotationData16_g158391 = temp_output_1567_33_g158389;
				{
				Data16_g158391.Dummy = In_Dummy16_g158391;
				Data16_g158391.PositionOS = In_PositionOS16_g158391;
				Data16_g158391.PositionWS = In_PositionWS16_g158391;
				Data16_g158391.PositionWO = In_PositionWO16_g158391;
				Data16_g158391.PositionRawOS = In_PositionRawOS16_g158391;
				Data16_g158391.PositionAddOS = In_PositionAddOS16_g158391;
				Data16_g158391.PivotOS = In_PivotOS16_g158391;
				Data16_g158391.PivotWS = In_PivotWS16_g158391;
				Data16_g158391.PivotWO = In_PivotWO16_g158391;
				Data16_g158391.NormalOS = In_NormalOS16_g158391;
				Data16_g158391.NormalWS = In_NormalWS16_g158391;
				Data16_g158391.NormalRawOS = In_NormalRawOS16_g158391;
				Data16_g158391.NormalRawWS = In_NormalRawWS16_g158391;
				Data16_g158391.TangentOS = In_TangentOS16_g158391;
				Data16_g158391.ViewDirWS = In_ViewDirWS16_g158391;
				Data16_g158391.VertexData = In_VertexData16_g158391;
				Data16_g158391.PhaseData = In_PhaseData16_g158391;
				Data16_g158391.BoundsData = In_BoundsData16_g158391;
				Data16_g158391.RotationData = In_RotationData16_g158391;
				}
				TVEModelData Data15_g158419 = Data16_g158391;
				float Out_Dummy15_g158419 = 0;
				float3 Out_PositionOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158419 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158419 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158419 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158419 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158419 = float3( 0,0,0 );
				float4 Out_VertexData15_g158419 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158419 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158419 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158419 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158419 = Data15_g158419.Dummy;
				Out_PositionOS15_g158419 = Data15_g158419.PositionOS;
				Out_PositionWS15_g158419 = Data15_g158419.PositionWS;
				Out_PositionWO15_g158419 = Data15_g158419.PositionWO;
				Out_PositionRawOS15_g158419 = Data15_g158419.PositionRawOS;
				Out_PositionAddOS15_g158419 = Data15_g158419.PositionAddOS;
				Out_PivotOS15_g158419 = Data15_g158419.PivotOS;
				Out_PivotWS15_g158419 = Data15_g158419.PivotWS;
				Out_PivotWO15_g158419 = Data15_g158419.PivotWO;
				Out_NormalOS15_g158419 = Data15_g158419.NormalOS;
				Out_NormalWS15_g158419 = Data15_g158419.NormalWS;
				Out_NormalRawOS15_g158419 = Data15_g158419.NormalRawOS;
				Out_NormalRawWS15_g158419 = Data15_g158419.NormalRawWS;
				Out_TangentOS15_g158419 = Data15_g158419.TangentOS;
				Out_ViewDirWS15_g158419 = Data15_g158419.ViewDirWS;
				Out_VertexData15_g158419 = Data15_g158419.VertexData;
				Out_PhaseData15_g158419 = Data15_g158419.PhaseData;
				Out_BoundsData15_g158419 = Data15_g158419.BoundsData;
				Out_RotationData15_g158419 = Data15_g158419.RotationData;
				}
				float3 temp_output_31_0_g158407 = Out_PositionOS15_g158419;
				float3 temp_output_6_0_g158420 = ( temp_output_31_0_g158407 + _DisableSRPBatcher );
				float temp_output_371_0_g158324 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingGlobalValue + _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessGlobalValue + _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue + 0.0 ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue + _CutoutGlobalValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeScaleValue1 ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) + temp_output_371_0_g158324 );
				#ifdef TVE_DUMMY
				float3 staticSwitch14_g158420 = ( temp_output_6_0_g158420 + Dummy_Data505.r );
				#else
				float3 staticSwitch14_g158420 = temp_output_6_0_g158420;
				#endif
				
				float4 ase_positionCS = TransformWorldToHClip( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				output.ase_texcoord7 = ase_positionCS;
				float4x4 ase_matrixInvP = UNITY_MATRIX_I_P;
				float4 ase_hpositionVS = mul( ase_matrixInvP, ase_positionCS );
				float3 ase_positionRWS = mul( ( float3x3 )UNITY_MATRIX_I_V, ase_hpositionVS.xyz / ase_hpositionVS.w );
				output.ase_texcoord8.xyz = ase_positionRWS;
				output.ase_texcoord9.xyz = vertexToFrag305_g157220;
				output.ase_texcoord10.xyz = ase_normalWS;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord8.w = 0;
				output.ase_texcoord9.w = 0;
				output.ase_texcoord10.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = staticSwitch14_g158420;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				output.positionCS = UnityMetaVertexPosition(inputMesh.positionOS, inputMesh.uv1.xy, inputMesh.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);

				#ifdef EDITOR_VISUALIZATION
					float2 vizUV = 0;
					float4 lightCoord = 0;
					UnityEditorVizData(inputMesh.positionOS.xyz, inputMesh.uv0.xy, inputMesh.uv1.xy, inputMesh.uv2.xy, vizUV, lightCoord);

					output.VizUV.xy = vizUV;
					output.LightCoord = lightCoord;
				#endif

				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.uv3 = v.uv3;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.uv3 = patch[0].uv3 * bary.x + patch[1].uv3 * bary.y + patch[2].uv3 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half isFrontFace = input.isFrontFace;

				float3 V = float3(1.0, 1.0, 1.0);

				float localBreakData4_g158410 = ( 0.0 );
				float localCompData3_g158401 = ( 0.0 );
				TVEVisualData Data3_g158401 = (TVEVisualData)0;
				half Dummy145_g158399 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) );
				float In_Dummy3_g158401 = Dummy145_g158399;
				float localBreakData4_g158400 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158292 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + 0.0 );
				float In_Dummy3_g158307 = Dummy145_g158292;
				float localBreakData4_g158296 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				half Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlayBakeInfo ) + 0.0 );
				float In_Dummy3_g158220 = Dummy594_g158217;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157228 = ( 0.0 );
				TVEVisualData Data3_g157228 = (TVEVisualData)0;
				float In_Dummy3_g157228 = 0.0;
				float4 output0 = 0;
				float4 output1 = 0;
				float4 output2 = 0;
				float4 ase_positionCS = packedInput.ase_texcoord7;
				float3 ase_positionRWS = packedInput.ase_texcoord8.xyz;
				ImpostorOutput io = ( ImpostorOutput )0;
				OctaImpostorFragment( io, ase_positionCS, ase_positionRWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1, output2 );
				float4 temp_cast_0 = (1.0).xxxx;
				half4 Input_Tex0377_g157220 = output0;
				half4 Input_Tex1379_g157220 = output1;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch403_g157220 = temp_cast_0;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch403_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch403_g157220 = temp_cast_0;
				#endif
				half Local_MultiMask249_g157220 = (staticSwitch403_g157220).b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( io.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157228 = Local_Albedo239_g157220;
				float3 In_AlbedoRaw3_g157228 = Local_Albedo239_g157220;
				float2 temp_cast_3 = (0.0).xx;
				float2 In_NormalTS3_g157228 = temp_cast_3;
				float3 In_NormalWS3_g157228 = io.WorldNormal;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 temp_cast_5 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch385_g157220 = temp_cast_4;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch385_g157220 = temp_cast_5;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch385_g157220 = temp_cast_4;
				#endif
				half Local_Metallic247_g157220 = (staticSwitch385_g157220).r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				float4 temp_cast_6 = (1.0).xxxx;
				float4 temp_cast_7 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch392_g157220 = temp_cast_6;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch392_g157220 = temp_cast_7;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch392_g157220 = temp_cast_6;
				#endif
				half Local_OcclusionOrEmissive248_g157220 = (staticSwitch392_g157220).g;
				float lerpResult431_g157220 = lerp( 1.0 , Local_OcclusionOrEmissive248_g157220 , _ImpostorOcclusionValue);
				#ifdef TVE_EMISSIVE
				float staticSwitch428_g157220 = 1.0;
				#else
				float staticSwitch428_g157220 = lerpResult431_g157220;
				#endif
				half Final_Occlusion424_g157220 = staticSwitch428_g157220;
				float4 temp_cast_8 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch408_g157220 = temp_cast_8;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch408_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch408_g157220 = temp_cast_8;
				#endif
				half Local_Smoothness250_g157220 = (staticSwitch408_g157220).a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , Final_Occlusion424_g157220 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157228 = appendResult257_g157220;
				float4 appendResult286_g157220 = (float4(Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , 1.0));
				float4 In_Emissive3_g157228 = appendResult286_g157220;
				float3 temp_output_3_0_g157221 = Local_Albedo239_g157220;
				float dotResult20_g157221 = dot( temp_output_3_0_g157221 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale268_g157220 = dotResult20_g157221;
				float In_Grayscale3_g157228 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157228 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157228 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157228 = 0.0;
				float In_AlphaFade3_g157228 = 1.0;
				float3 temp_cast_9 = (1.0).xxx;
				float3 In_Translucency3_g157228 = temp_cast_9;
				float In_Transmission3_g157228 = 1.0;
				float In_Thickness3_g157228 = 0.0;
				float In_Diffusion3_g157228 = 0.0;
				float In_Depth3_g157228 = ase_positionCS.z;
				{
				Data3_g157228.Dummy = In_Dummy3_g157228;
				Data3_g157228.Albedo = In_Albedo3_g157228;
				Data3_g157228.AlbedoRaw = In_AlbedoRaw3_g157228;
				Data3_g157228.NormalTS = In_NormalTS3_g157228;
				Data3_g157228.NormalWS = In_NormalWS3_g157228;
				Data3_g157228.Shader = In_Shader3_g157228;
				Data3_g157228.Emissive= In_Emissive3_g157228;
				Data3_g157228.MultiMask = In_MultiMask3_g157228;
				Data3_g157228.Grayscale = In_Grayscale3_g157228;
				Data3_g157228.Luminosity = In_Luminosity3_g157228;
				Data3_g157228.AlphaClip = In_AlphaClip3_g157228;
				Data3_g157228.AlphaFade = In_AlphaFade3_g157228;
				Data3_g157228.Translucency = In_Translucency3_g157228;
				Data3_g157228.Transmission = In_Transmission3_g157228;
				Data3_g157228.Thickness = In_Thickness3_g157228;
				Data3_g157228.Diffusion = In_Diffusion3_g157228;
				Data3_g157228.Depth = In_Depth3_g157228;
				}
				TVEVisualData Data4_g158218 = Data3_g157228;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				float Out_Depth4_g158218 = 0;
				{
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_AlbedoRaw4_g158218 = Data4_g158218.AlbedoRaw;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				Out_Depth4_g158218= Data4_g158218.Depth;
				}
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158231 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158237 = _OverlayProjRemap.x;
				float temp_output_9_0_g158237 = ( clampResult17_g158231 - temp_output_7_0_g158237 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158237 * _OverlayProjRemap.z ) + 0.0001 ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158232 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayLumaRemap.x;
				float temp_output_9_0_g158236 = ( clampResult17_g158232 - temp_output_7_0_g158236 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158236 * _OverlayLumaRemap.z ) + 0.0001 ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				TVEModelData Data16_g157227 = (TVEModelData)0;
				float In_Dummy16_g157227 = 0.0;
				half3 Input_PositionWS319_g157220 = GetAbsolutePositionWS( ase_positionRWS );
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157227 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157227 = Model_PositionWO311_g157220;
				float3 vertexToFrag305_g157220 = packedInput.ase_texcoord9.xyz;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157227 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157227 = Model_PivotWO312_g157220;
				float3 ase_normalWS = packedInput.ase_texcoord10.xyz;
				half3 Model_Normal_WS314_g157220 = ase_normalWS;
				float3 In_NormalWS16_g157227 = Model_Normal_WS314_g157220;
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157227 = Model_ViewDirWS347_g157220;
				float4 temp_cast_10 = (1.0).xxxx;
				half4 Input_Tex2380_g157220 = output2;
				float4 appendResult420_g157220 = (float4((Input_Tex1379_g157220).rg , 1.0 , 1.0));
				float4 temp_cast_13 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch414_g157220 = temp_cast_10;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch414_g157220 = Input_Tex2380_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch414_g157220 = appendResult420_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch414_g157220 = temp_cast_13;
				#else
				float4 staticSwitch414_g157220 = temp_cast_10;
				#endif
				half4 Local_VertexColor422_g157220 = staticSwitch414_g157220;
				float4 In_VertexData16_g157227 = Local_VertexColor422_g157220;
				float4 In_BoundsData16_g157227 = float4( 1,1,1,1 );
				{
				Data16_g157227.Dummy = In_Dummy16_g157227;
				Data16_g157227.PositionWS = In_PositionWS16_g157227;
				Data16_g157227.PositionWO = In_PositionWO16_g157227;
				Data16_g157227.PivotWS = In_PivotWS16_g157227;
				Data16_g157227.PivotWO = In_PivotWO16_g157227;
				Data16_g157227.NormalWS = In_NormalWS16_g157227;
				Data16_g157227.ViewDirWS = In_ViewDirWS16_g157227;
				Data16_g157227.VertexData = In_VertexData16_g157227;
				Data16_g157227.BoundsData = In_BoundsData16_g157227;
				}
				TVEModelData Data15_g158228 = Data16_g157227;
				float Out_Dummy15_g158228 = 0;
				float3 Out_PositionWS15_g158228 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158228 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158228 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g158228 = float3( 0,0,0 );
				float4 Out_VertexData15_g158228 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158228 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158228 = Data15_g158228.Dummy;
				Out_PositionWS15_g158228 = Data15_g158228.PositionWS;
				Out_PositionWO15_g158228 = Data15_g158228.PositionWO;
				Out_PivotWS15_g158228 = Data15_g158228.PivotWS;
				Out_PivotWO15_g158228 = Data15_g158228.PivotWO;
				Out_NormalWS15_g158228 = Data15_g158228.NormalWS;
				Out_ViewDirWS15_g158228 = Data15_g158228.ViewDirWS;
				Out_VertexData15_g158228 = Data15_g158228.VertexData;
				Out_BoundsData15_g158228 = Data15_g158228.BoundsData;
				}
				half4 Model_VertexMasks791_g158217 = Out_VertexData15_g158228;
				float4 break792_g158217 = Model_VertexMasks791_g158217;
				float4 break33_g158229 = _overlay_vert_mode;
				float temp_output_30_0_g158229 = ( break792_g158217.x * break33_g158229.x );
				float temp_output_29_0_g158229 = ( break792_g158217.y * break33_g158229.y );
				float temp_output_31_0_g158229 = ( break792_g158217.z * break33_g158229.z );
				float temp_output_28_0_g158229 = ( temp_output_30_0_g158229 + temp_output_29_0_g158229 + temp_output_31_0_g158229 + ( break792_g158217.w * break33_g158229.w ) );
				float clampResult17_g158230 = clamp( temp_output_28_0_g158229 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayMeshRemap.x;
				float temp_output_9_0_g158238 = ( clampResult17_g158230 - temp_output_7_0_g158238 );
				float lerpResult879_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158238 * _OverlayMeshRemap.z ) + 0.0001 ) ) , _OverlayMeshValue);
				float temp_output_6_0_g158233 = lerpResult879_g158217;
				#ifdef TVE_DUMMY
				float staticSwitch14_g158233 = ( temp_output_6_0_g158233 + _OverlayMeshMode );
				#else
				float staticSwitch14_g158233 = temp_output_6_0_g158233;
				#endif
				half Overlay_VertMask801_g158217 = staticSwitch14_g158233;
				float lerpResult920_g158217 = lerp( 1.0 , ( TVE_AtmoParams.z * TVE_IsEnabled ) , _OverlayGlobalValue);
				half Overlay_MaskGlobal429_g158217 = lerpResult920_g158217;
				float temp_output_7_0_g158239 = _OverlayBlendRemap.x;
				float temp_output_9_0_g158239 = ( ( _OverlayIntensityValue * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ) - temp_output_7_0_g158239 );
				half Overlay_Mask494_g158217 = saturate( ( ( temp_output_9_0_g158239 * _OverlayBlendRemap.z ) + 0.0001 ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				float3 In_AlbedoRaw3_g158220 = Out_AlbedoRaw4_g158218;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				float In_Depth3_g158220 = Out_Depth4_g158218;
				{
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.AlbedoRaw = In_AlbedoRaw3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				Data3_g158220.Depth = In_Depth3_g158220;
				}
				TVEVisualData Data4_g158296 = Data3_g158220;
				float Out_Dummy4_g158296 = 0;
				float3 Out_Albedo4_g158296 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158296 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158296 = float2( 0,0 );
				float3 Out_NormalWS4_g158296 = float3( 0,0,0 );
				float4 Out_Shader4_g158296 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158296 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158296 = 0;
				float Out_Grayscale4_g158296 = 0;
				float Out_Luminosity4_g158296 = 0;
				float Out_AlphaClip4_g158296 = 0;
				float Out_AlphaFade4_g158296 = 0;
				float3 Out_Translucency4_g158296 = float3( 0,0,0 );
				float Out_Transmission4_g158296 = 0;
				float Out_Thickness4_g158296 = 0;
				float Out_Diffusion4_g158296 = 0;
				float Out_Depth4_g158296 = 0;
				{
				Out_Dummy4_g158296 = Data4_g158296.Dummy;
				Out_Albedo4_g158296 = Data4_g158296.Albedo;
				Out_AlbedoRaw4_g158296 = Data4_g158296.AlbedoRaw;
				Out_NormalTS4_g158296 = Data4_g158296.NormalTS;
				Out_NormalWS4_g158296 = Data4_g158296.NormalWS;
				Out_Shader4_g158296 = Data4_g158296.Shader;
				Out_Emissive4_g158296= Data4_g158296.Emissive;
				Out_MultiMask4_g158296 = Data4_g158296.MultiMask;
				Out_Grayscale4_g158296 = Data4_g158296.Grayscale;
				Out_Luminosity4_g158296= Data4_g158296.Luminosity;
				Out_AlphaClip4_g158296 = Data4_g158296.AlphaClip;
				Out_AlphaFade4_g158296 = Data4_g158296.AlphaFade;
				Out_Translucency4_g158296 = Data4_g158296.Translucency;
				Out_Transmission4_g158296 = Data4_g158296.Transmission;
				Out_Thickness4_g158296 = Data4_g158296.Thickness;
				Out_Diffusion4_g158296 = Data4_g158296.Diffusion;
				Out_Depth4_g158296= Data4_g158296.Depth;
				}
				float3 temp_output_297_0_g158292 = Out_Albedo4_g158296;
				float3 In_Albedo3_g158307 = temp_output_297_0_g158292;
				float3 temp_output_297_23_g158292 = Out_AlbedoRaw4_g158296;
				float3 In_AlbedoRaw3_g158307 = temp_output_297_23_g158292;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158296;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158296;
				float4 In_Shader3_g158307 = Out_Shader4_g158296;
				float4 temp_cast_15 = (0.0).xxxx;
				half4 Visual_Emissive255_g158292 = Out_Emissive4_g158296;
				half Emissive_MeshMask221_g158292 = 1.0;
				half Emissive_Mask103_g158292 = 1.0;
				float temp_output_279_0_g158292 = ( Emissive_MeshMask221_g158292 * Emissive_Mask103_g158292 );
				float3 appendResult293_g158292 = (float3(temp_output_279_0_g158292 , temp_output_279_0_g158292 , temp_output_279_0_g158292));
				half3 Local_EmissiveColor278_g158292 = appendResult293_g158292;
				float3 temp_output_316_0_g158292 = (TVE_GlowParams).xyz;
				float3 lerpResult299_g158292 = lerp( float3( 1,1,1 ) , temp_output_316_0_g158292 , ( _EmissiveGlobalValue * TVE_IsEnabled ));
				half3 Emissive_GlobalMask248_g158292 = lerpResult299_g158292;
				half3 Visual_AlbedoRaw306_g158292 = temp_output_297_23_g158292;
				float3 lerpResult307_g158292 = lerp( float3( 1,1,1 ) , Visual_AlbedoRaw306_g158292 , _EmissiveColorMode);
				half3 Local_EmissiveValue88_g158292 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158292 * lerpResult307_g158292 );
				half3 Emissive_Blend260_g158292 = ( ( (Visual_Emissive255_g158292).xyz * Local_EmissiveColor278_g158292 ) * Local_EmissiveValue88_g158292 );
				float3 temp_output_3_0_g158298 = Emissive_Blend260_g158292;
				float temp_output_15_0_g158298 = _emissive_power_value;
				float3 hdEmission22_g158298 = ASEGetEmissionHDRColor(temp_output_3_0_g158298,temp_output_15_0_g158298,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Local_EmissiveMask294_g158292 = temp_output_279_0_g158292;
				float4 appendResult295_g158292 = (float4(hdEmission22_g158298 , Local_EmissiveMask294_g158292));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158292 = appendResult295_g158292;
				#else
				float4 staticSwitch129_g158292 = temp_cast_15;
				#endif
				half4 Final_Emissive184_g158292 = staticSwitch129_g158292;
				float4 In_Emissive3_g158307 = Final_Emissive184_g158292;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158296;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158296;
				float temp_output_297_11_g158292 = Out_MultiMask4_g158296;
				float In_MultiMask3_g158307 = temp_output_297_11_g158292;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158296;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158296;
				float3 In_Translucency3_g158307 = Out_Translucency4_g158296;
				float In_Transmission3_g158307 = Out_Transmission4_g158296;
				float In_Thickness3_g158307 = Out_Thickness4_g158296;
				float In_Diffusion3_g158307 = Out_Diffusion4_g158296;
				float In_Depth3_g158307 = Out_Depth4_g158296;
				{
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.AlbedoRaw = In_AlbedoRaw3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				Data3_g158307.Depth = In_Depth3_g158307;
				}
				TVEVisualData Data4_g158400 = Data3_g158307;
				float Out_Dummy4_g158400 = 0;
				float3 Out_Albedo4_g158400 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158400 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158400 = float2( 0,0 );
				float3 Out_NormalWS4_g158400 = float3( 0,0,0 );
				float4 Out_Shader4_g158400 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158400 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158400 = 0;
				float Out_Grayscale4_g158400 = 0;
				float Out_Luminosity4_g158400 = 0;
				float Out_AlphaClip4_g158400 = 0;
				float Out_AlphaFade4_g158400 = 0;
				float3 Out_Translucency4_g158400 = float3( 0,0,0 );
				float Out_Transmission4_g158400 = 0;
				float Out_Thickness4_g158400 = 0;
				float Out_Diffusion4_g158400 = 0;
				float Out_Depth4_g158400 = 0;
				{
				Out_Dummy4_g158400 = Data4_g158400.Dummy;
				Out_Albedo4_g158400 = Data4_g158400.Albedo;
				Out_AlbedoRaw4_g158400 = Data4_g158400.AlbedoRaw;
				Out_NormalTS4_g158400 = Data4_g158400.NormalTS;
				Out_NormalWS4_g158400 = Data4_g158400.NormalWS;
				Out_Shader4_g158400 = Data4_g158400.Shader;
				Out_Emissive4_g158400= Data4_g158400.Emissive;
				Out_MultiMask4_g158400 = Data4_g158400.MultiMask;
				Out_Grayscale4_g158400 = Data4_g158400.Grayscale;
				Out_Luminosity4_g158400= Data4_g158400.Luminosity;
				Out_AlphaClip4_g158400 = Data4_g158400.AlphaClip;
				Out_AlphaFade4_g158400 = Data4_g158400.AlphaFade;
				Out_Translucency4_g158400 = Data4_g158400.Translucency;
				Out_Transmission4_g158400 = Data4_g158400.Transmission;
				Out_Thickness4_g158400 = Data4_g158400.Thickness;
				Out_Diffusion4_g158400 = Data4_g158400.Diffusion;
				Out_Depth4_g158400= Data4_g158400.Depth;
				}
				half3 Visual_Albedo199_g158399 = Out_Albedo4_g158400;
				half3 Final_Albedo312_g158399 = Visual_Albedo199_g158399;
				float3 In_Albedo3_g158401 = Final_Albedo312_g158399;
				float3 In_AlbedoRaw3_g158401 = Out_AlbedoRaw4_g158400;
				float2 In_NormalTS3_g158401 = Out_NormalTS4_g158400;
				float3 In_NormalWS3_g158401 = Out_NormalWS4_g158400;
				float4 In_Shader3_g158401 = Out_Shader4_g158400;
				float4 In_Emissive3_g158401 = Out_Emissive4_g158400;
				float In_Grayscale3_g158401 = Out_Grayscale4_g158400;
				float In_Luminosity3_g158401 = Out_Luminosity4_g158400;
				float temp_output_301_11_g158399 = Out_MultiMask4_g158400;
				float In_MultiMask3_g158401 = temp_output_301_11_g158399;
				float In_AlphaClip3_g158401 = Out_AlphaClip4_g158400;
				float In_AlphaFade3_g158401 = Out_AlphaFade4_g158400;
				float3 temp_cast_16 = (0.0).xxx;
				half3 Subsurface_Color264_g158399 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158399 );
				half Visual_Transmission138_g158399 = Out_Transmission4_g158400;
				half Subsurface_Value268_g158399 = _SubsurfaceIntensityValue;
				float lerpResult403_g158399 = lerp( 1.0 , TVE_GlowParams.w , ( _SubsurfaceGlobalValue * TVE_IsEnabled ));
				half Subsurface_GlobalMask369_g158399 = lerpResult403_g158399;
				half Visual_MultiMask292_g158399 = temp_output_301_11_g158399;
				float lerpResult293_g158399 = lerp( 1.0 , Visual_MultiMask292_g158399 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158399 = lerpResult293_g158399;
				half Custom_Mask363_g158399 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158399 = ( Visual_Transmission138_g158399 * Subsurface_Value268_g158399 * Subsurface_GlobalMask369_g158399 * Subsurface_MultiMask296_g158399 * Custom_Mask363_g158399 );
				#else
				float staticSwitch345_g158399 = 0.0;
				#endif
				half Final_Transmission269_g158399 = staticSwitch345_g158399;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158399 = ( Subsurface_Color264_g158399 * Final_Transmission269_g158399 * 10.0 );
				#else
				float3 staticSwitch348_g158399 = temp_cast_16;
				#endif
				half3 Final_Translucency254_g158399 = staticSwitch348_g158399;
				float3 In_Translucency3_g158401 = Final_Translucency254_g158399;
				float In_Transmission3_g158401 = Final_Transmission269_g158399;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158399 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158399 = 1.0;
				#endif
				half Final_Thickness275_g158399 = staticSwitch351_g158399;
				float In_Thickness3_g158401 = Final_Thickness275_g158399;
				float Final_Diffusion340_g158399 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158401 = Final_Diffusion340_g158399;
				float In_Depth3_g158401 = Out_Depth4_g158400;
				{
				Data3_g158401.Dummy = In_Dummy3_g158401;
				Data3_g158401.Albedo = In_Albedo3_g158401;
				Data3_g158401.AlbedoRaw = In_AlbedoRaw3_g158401;
				Data3_g158401.NormalTS = In_NormalTS3_g158401;
				Data3_g158401.NormalWS = In_NormalWS3_g158401;
				Data3_g158401.Shader = In_Shader3_g158401;
				Data3_g158401.Emissive= In_Emissive3_g158401;
				Data3_g158401.MultiMask = In_MultiMask3_g158401;
				Data3_g158401.Grayscale = In_Grayscale3_g158401;
				Data3_g158401.Luminosity = In_Luminosity3_g158401;
				Data3_g158401.AlphaClip = In_AlphaClip3_g158401;
				Data3_g158401.AlphaFade = In_AlphaFade3_g158401;
				Data3_g158401.Translucency = In_Translucency3_g158401;
				Data3_g158401.Transmission = In_Transmission3_g158401;
				Data3_g158401.Thickness = In_Thickness3_g158401;
				Data3_g158401.Diffusion = In_Diffusion3_g158401;
				Data3_g158401.Depth = In_Depth3_g158401;
				}
				TVEVisualData Data4_g158410 = Data3_g158401;
				float Out_Dummy4_g158410 = 0;
				float3 Out_Albedo4_g158410 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158410 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158410 = float2( 0,0 );
				float3 Out_NormalWS4_g158410 = float3( 0,0,0 );
				float4 Out_Shader4_g158410 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158410 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158410 = 0;
				float Out_Grayscale4_g158410 = 0;
				float Out_Luminosity4_g158410 = 0;
				float Out_AlphaClip4_g158410 = 0;
				float Out_AlphaFade4_g158410 = 0;
				float3 Out_Translucency4_g158410 = float3( 0,0,0 );
				float Out_Transmission4_g158410 = 0;
				float Out_Thickness4_g158410 = 0;
				float Out_Diffusion4_g158410 = 0;
				float Out_Depth4_g158410 = 0;
				{
				Out_Dummy4_g158410 = Data4_g158410.Dummy;
				Out_Albedo4_g158410 = Data4_g158410.Albedo;
				Out_AlbedoRaw4_g158410 = Data4_g158410.AlbedoRaw;
				Out_NormalTS4_g158410 = Data4_g158410.NormalTS;
				Out_NormalWS4_g158410 = Data4_g158410.NormalWS;
				Out_Shader4_g158410 = Data4_g158410.Shader;
				Out_Emissive4_g158410= Data4_g158410.Emissive;
				Out_MultiMask4_g158410 = Data4_g158410.MultiMask;
				Out_Grayscale4_g158410 = Data4_g158410.Grayscale;
				Out_Luminosity4_g158410= Data4_g158410.Luminosity;
				Out_AlphaClip4_g158410 = Data4_g158410.AlphaClip;
				Out_AlphaFade4_g158410 = Data4_g158410.AlphaFade;
				Out_Translucency4_g158410 = Data4_g158410.Translucency;
				Out_Transmission4_g158410 = Data4_g158410.Transmission;
				Out_Thickness4_g158410 = Data4_g158410.Thickness;
				Out_Diffusion4_g158410 = Data4_g158410.Diffusion;
				Out_Depth4_g158410= Data4_g158410.Depth;
				}
				half3 Input_Albedo24_g158408 = Out_Albedo4_g158410;
				#ifdef UNITY_COLORSPACE_GAMMA
				float4 staticSwitch22_g158408 = half4( 0.2209163, 0.2209163, 0.2209163, 0.7790837 );
				#else
				float4 staticSwitch22_g158408 = half4( 0.04, 0.04, 0.04, 0.96 );
				#endif
				half4 ColorSpaceDielectricSpec23_g158408 = staticSwitch22_g158408;
				float4 break24_g158407 = Out_Shader4_g158410;
				half Metallic117_g158407 = break24_g158407.x;
				half Input_Metallic25_g158408 = Metallic117_g158407;
				half OneMinusReflectivity31_g158408 = ( (ColorSpaceDielectricSpec23_g158408).w - ( (ColorSpaceDielectricSpec23_g158408).w * Input_Metallic25_g158408 ) );
				float3 lerpResult87_g158407 = lerp( half3( 1, 0, 0 ) , ( Input_Albedo24_g158408 * OneMinusReflectivity31_g158408 ) , _IsInitialized);
				

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;

				surfaceDescription.BaseColor = lerpResult87_g158407;
				surfaceDescription.Normal = Out_NormalWS4_g158410;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Smoothness = break24_g158407.w;
				surfaceDescription.Occlusion = break24_g158407.y;
				surfaceDescription.Emission = (Out_Emissive4_g158410).xyz;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = Out_Thickness4_g158410;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = Out_Transmission4_g158410;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = Out_Diffusion4_g158410;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);
				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				UnityMetaInput metaInput;
				metaInput.Albedo = lightTransportData.diffuseColor.rgb;
				metaInput.Emission = lightTransportData.emissiveColor;

			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = packedInput.VizUV;
				metaInput.LightCoord = packedInput.LightCoord;
			#endif
				res = UnityMetaFragment(metaInput);

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local_fragment _ _DISABLE_SSR
			#define ASE_FRAGMENT_NORMAL 2
			#define ASE_DEPTH_WRITE_ON
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 140012
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_SHADOWS

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DitherColoring;
			half4 _OverlayLumaRemap;
			half4 _OverlayProjRemap;
			half4 _OverlayColor;
			half4 _DrynessColoring;
			half4 _TintingLumaRemap;
			half4 _ImpostorColor;
			half4 _overlay_vert_mode;
			half4 _ImpostorColorTwo;
			half4 _TintingColoring;
			half4 _SizeFadeColoring;
			float4 _AI_SizeOffset;
			half4 _VariationNoiseRemap;
			half4 _VariationColorOne;
			half4 _VariationColorTwo;
			float4 _TintingColor;
			half4 _OverlayMeshRemap;
			half4 _VariationColoring;
			float4 _DrynessColor;
			half4 _DrynessLumaRemap;
			half4 _EmissiveColor;
			half4 _OverlayBlendRemap;
			half4 _WetnessColoring;
			half4 _CutoutColoring;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			float3 _AI_Offset;
			float3 _AI_BoundsMin;
			float3 _AI_BoundsSize;
			half _SizeFadeCategory;
			half _CutoutLiteInfo;
			half _SizeFadeEnd;
			half _SizeFadeScaleValue1;
			half _SizeFadeLiteInfo;
			half _DitherNoiseTillingValue;
			half _CutoutCategory;
			half _DitherMultiValue;
			half _DitherShadowMode;
			half _DitherDistanceMaxValue;
			half _CutoutNoiseValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseTillingValue;
			half _CutoutGlobalValue;
			half _CutoutMultiValue;
			half _DitherLiteInfo;
			half _CutoutShadowMode;
			half _DitherDistanceMinValue;
			half _CutoutIntensityValue;
			half _DitherCategory;
			half _CutoutSpace;
			half _DitherEnd;
			half _DitherConstantValue;
			half _DitherDistanceValue;
			half _CutoutEnd;
			half _SizeFadeIntensityValue;
			half _ImpostorMaskOffInfo;
			half _SubsurfaceCategory;
			half _SizeFadeScaleValue;
			half _ImpostorSmoothnessValue;
			half _OverlayIntensityValue;
			half _OverlayProjValue;
			half _OverlayLumaValue;
			half _OverlayMeshValue;
			half _OverlayMeshMode;
			half _OverlayGlobalValue;
			half _OverlayNormalValue;
			half _OverlaySmoothnessValue;
			half _OverlaySubsurfaceValue;
			half _EmissiveIntensityValue;
			half _EmissiveGlobalValue;
			half _EmissiveColorMode;
			float _emissive_power_value;
			half _EmissiveExposureValue;
			half _SubsurfaceIntensityValue;
			half _SubsurfaceGlobalValue;
			half _ImpostorOcclusionValue;
			half _SizeFadeScaleMode;
			half _ImpostorMetallicValue;
			half _OverlayBakeInfo;
			half _SizeFadeDistMinValue;
			half _SizeFadeDistMaxValue;
			half _GlobalLiteInfo;
			half _GlobalCategory;
			half _GlobalEnd;
			half _WetnessSmoothnessValue;
			half _SubsurfaceEnd;
			half _SubsurfaceDirectValue;
			half _SubsurfaceNormalValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _EmissiveCategory;
			half _EmissiveEnd;
			half _EmissivePowerMode;
			half _EmissivePowerValue;
			half _OverlayCategory;
			half _OverlayEnd;
			half _ImpostorColorMode;
			half _WetnessContrastValue;
			half _DrynessMultiValue;
			half _WetnessEnd;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsCollected;
			half _IsLiteShader;
			half _MotionCategory;
			half _MotionEnd;
			half _MotionLiteInfo;
			float _AI_Clip;
			float _AI_TextureBias;
			float _AI_Parallax;
			float _AI_ShadowBias;
			half _ImpostorEnd;
			half _IsShared;
			half _IsCustomShader;
			half _IsTVEShader;
			half _ImpostorMaskDefaultInfo;
			half _ImpostorMaskPackedInfo;
			half _ImpostorMaskShadingInfo;
			half _ImpostorMaskMode;
			half _ImpostorSpace0;
			half _ImpostorSpace1;
			half _ImpostorAlphaClipValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _SubsurfaceScatteringValue;
			half _IsVersion;
			half _RenderDecals;
			half _RenderSSR;
			half _CategoryRender;
			half _EndRender;
			half _IsInitialized;
			float _AI_ShadowView;
			float _AI_ForwardBias;
			float _AI_Frames;
			float _AI_DepthSize;
			half _TintingGlobalValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessIntensityValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _DrynessGlobalValue;
			half _SubsurfaceMultiValue;
			half _DrynessLumaValue;
			half _WetnessLiteInfo;
			half _WetnessCategory;
			half _TintingGrayValue;
			half _WetnessIntensityValue;
			half _TintingIntensityValue;
			half _TintingEnd;
			float _AI_ImpostorSize;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			half _MotionBaseTillingValue;
			half _MotionBaseSpeedValue;
			half _MotionBaseNoiseValue;
			half _MotionIntensityValue;
			half _MotionBaseDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _VariationNoiseTillingValue;
			half _TintingLiteInfo;
			half _TintingCategory;
			half _TintingSpace;
			half _SubsurfaceThicknessValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			TEXTURE2D(_MotionNoiseTex);
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_MotionParamsEditor;
			half _DisableSRPBatcher;
			TEXTURE2D(_Shader);
			TEXTURE2D(_Packed);
			TEXTURE2D(_Vertex);
			SAMPLER(sampler_Shader);
			SAMPLER(sampler_Packed);
			SAMPLER(sampler_Vertex);
			half4 TVE_AtmoParams;
			half TVE_IsEnabled;
			half4 TVE_GlowParams;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define AI_ObjectToWorld GetObjectToWorldMatrix()
			#define AI_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_CHANGES_WORLD_POS
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_CLIP_POS
			#define ASE_NEEDS_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#pragma shader_feature_local _USE_PARALLAX_ON
			#pragma shader_feature_local _HEMI_ON
			#pragma shader_feature_local AI_CLIP_NEIGHBOURS_FRAMES
			#pragma shader_feature_local_vertex TVE_MOTION
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_IMPOSTOR_MASK_OFF TVE_IMPOSTOR_MASK_DEFAULT TVE_IMPOSTOR_MASK_PACKED TVE_IMPOSTOR_MASK_SHADING
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IMPOSTOR_SHADER
			//#define _USE_PARALLAX_ON
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 UVsFrame122_g156549 : TEXCOORD3;
				float4 UVsFrame222_g156549 : TEXCOORD4;
				float4 UVsFrame322_g156549 : TEXCOORD5;
				float4 octaframe22_g156549 : TEXCOORD6;
				float4 viewPos22_g156549 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			struct ImpostorOutput
			{
				half3 Albedo;
				half3 Specular;
				half Metallic;
				half3 WorldNormal;
				half Smoothness;
				half Occlusion;
				half3 Emission;
				half Alpha;
			};
			
			float2 VectorToOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, out float2 uvs, out float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			float2 VectorToHemiOctahedron( float3 N )
			{
				N.xy /= dot( 1.0, abs( N ) );
				return float2( N.x + N.y, N.x - N.y );
			}
			
			float3 HemiOctahedronToVector( float2 Oct )
			{
				Oct = float2( Oct.x + Oct.y, Oct.x - Oct.y ) * 0.5;
				float3 N = float3( Oct, 1 - dot( 1.0, abs( Oct ) ) );
				return normalize( N );
			}
			
			inline void OctaImpostorVertex( inout float3 positionOS, out float3 normalOS, out float4 tangentOS, out float4 uvsFrame1, out float4 uvsFrame2, out float4 uvsFrame3, out float4 octaFrame, out float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = AI_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = AI_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( AI_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				#if defined( _HEMI_ON )
				objectCameraDirection.y = max(0.001, objectCameraDirection.y);
				float2 frameOcta = VectorToHemiOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#else
				float2 frameOcta = VectorToOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#endif
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa1WorldY = HemiOctahedronToVector( octaFrame1 ).xzy;
				#else
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				#endif
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*out*/ uvFrame1, /*out*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa2WorldY = HemiOctahedronToVector( octaFrame2 ).xzy;
				#else
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				#endif
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*out*/ uvFrame2, /*out*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa3WorldY = HemiOctahedronToVector( octaFrame3 ).xzy;
				#else
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				#endif
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*out*/ uvFrame3, /*out*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				octaFrame.zw = fractionOctaFrame;
				#endif
				positionOS = billboard + _AI_Offset.xyz;
				normalOS = objectCameraDirection;
				tangentOS = float4( objectHorizontalVector, 1 );
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout ImpostorOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 viewPos, out float4 output0, out float4 output1, out float4 output2 )
			{
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, -1 );
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, -1 );
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, -1 );
				float2 parallax1_uv = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float2 parallax2_uv = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float2 parallax3_uv = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1_uv, _AI_TextureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2_uv, _AI_TextureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3_uv, _AI_TextureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1_uv - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2_uv, parallax3_uv ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * ( 1 - step_1 );
				step23 = step23 * ( 1 - step23 );
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				#endif
				o.Albedo = blendedAlbedo.rgb;
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1_uv, _AI_TextureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2_uv, _AI_TextureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3_uv, _AI_TextureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				o.WorldNormal = normalize( mul( (float3x3)AI_ObjectToWorld, localNormal ) );
				float depth = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 ) * _AI_DepthSize * length( AI_ObjectToWorld[ 2 ].xyz );
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax1_uv, _AI_TextureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax2_uv, _AI_TextureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax3_uv, _AI_TextureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax1_uv, _AI_TextureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax2_uv, _AI_TextureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax3_uv, _AI_TextureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float4 output2a = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax1_uv, _AI_TextureBias );
				float4 output2b = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax2_uv, _AI_TextureBias );
				float4 output2c = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax3_uv, _AI_TextureBias );
				output2 = output2a * weights.x  + output2b * weights.y + output2c * weights.z; 
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView - _AI_ShadowBias;
				#else 
				viewPos.z += depth + _AI_ForwardBias;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				#if defined(SHADERPASS) && defined(UNITY_PASS_SHADOWCASTER)
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#else
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// refraction ShadowCaster
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                    #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = float3(0.0f, 0.0f, 1.0f);

			#if ( UNITY_VERSION <= 202236 )
				#if ( ASE_FRAGMENT_NORMAL == 1 )
					GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#elif ( ASE_FRAGMENT_NORMAL == 2 )
					GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#endif

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#else
				#ifdef DECAL_NORMAL_BLENDING
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif
			#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						surfaceData.metallic = 0;
					}
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS output;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				TVEModelData Data16_g158391 = (TVEModelData)0;
				float In_Dummy16_g158391 = 0.0;
				TVEModelData Data16_g158266 = (TVEModelData)0;
				half Dummy181_g158264 = ( ( _MotionCategory + _MotionEnd ) + _MotionLiteInfo );
				float In_Dummy16_g158266 = Dummy181_g158264;
				TVEModelData Data16_g157226 = (TVEModelData)0;
				float In_Dummy16_g157226 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS.xyz, inputMesh.normalOS.xyz, inputMesh.tangentOS, output.UVsFrame122_g156549, output.UVsFrame222_g156549, output.UVsFrame322_g156549, output.octaframe22_g156549, output.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( TransformObjectToWorld( inputMesh.positionOS.xyz ) );
				half3 Input_PositionWS319_g157220 = worldPosOut22_g156549;
				float3 worldToObj315_g157220 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS( Input_PositionWS319_g157220 ), 1 ) ).xyz;
				half3 Model_PositionOS316_g157220 = worldToObj315_g157220;
				float3 In_PositionOS16_g157226 = Model_PositionOS316_g157220;
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157226 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157226 = Model_PositionWO311_g157220;
				float3 In_PositionRawOS16_g157226 = Model_PositionOS316_g157220;
				float3 In_PositionAddOS16_g157226 = float3( 0,0,0 );
				float3 In_PivotOS16_g157226 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157223 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157223 = ( localObjectPosition_UNITY_MATRIX_M14_g157223 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157223 = localObjectPosition_UNITY_MATRIX_M14_g157223;
				#endif
				float3 vertexToFrag305_g157220 = staticSwitch13_g157223;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157226 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157226 = Model_PivotWO312_g157220;
				half3 Model_NormalOS313_g157220 = inputMesh.normalOS;
				float3 In_NormalOS16_g157226 = Model_NormalOS313_g157220;
				float3 ase_normalWS = TransformObjectToWorldNormal( inputMesh.normalOS );
				half3 Model_Normal_WS314_g157220 = ase_normalWS;
				float3 In_NormalWS16_g157226 = Model_Normal_WS314_g157220;
				float3 In_NormalRawOS16_g157226 = Model_NormalOS313_g157220;
				float3 In_NormalRawWS16_g157226 = Model_Normal_WS314_g157220;
				float4 In_TangentOS16_g157226 = float4( 0,1,0,1 );
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157226 = Model_ViewDirWS347_g157220;
				float4 In_VertexData16_g157226 = float4( 1,1,1,1 );
				float4 In_PhaseData16_g157226 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157226 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157226 = float4( 0,0,0,0 );
				{
				Data16_g157226.Dummy = In_Dummy16_g157226;
				Data16_g157226.PositionOS = In_PositionOS16_g157226;
				Data16_g157226.PositionWS = In_PositionWS16_g157226;
				Data16_g157226.PositionWO = In_PositionWO16_g157226;
				Data16_g157226.PositionRawOS = In_PositionRawOS16_g157226;
				Data16_g157226.PositionAddOS = In_PositionAddOS16_g157226;
				Data16_g157226.PivotOS = In_PivotOS16_g157226;
				Data16_g157226.PivotWS = In_PivotWS16_g157226;
				Data16_g157226.PivotWO = In_PivotWO16_g157226;
				Data16_g157226.NormalOS = In_NormalOS16_g157226;
				Data16_g157226.NormalWS = In_NormalWS16_g157226;
				Data16_g157226.NormalRawOS = In_NormalRawOS16_g157226;
				Data16_g157226.NormalRawWS = In_NormalRawWS16_g157226;
				Data16_g157226.TangentOS = In_TangentOS16_g157226;
				Data16_g157226.ViewDirWS = In_ViewDirWS16_g157226;
				Data16_g157226.VertexData = In_VertexData16_g157226;
				Data16_g157226.PhaseData = In_PhaseData16_g157226;
				Data16_g157226.BoundsData = In_BoundsData16_g157226;
				Data16_g157226.RotationData = In_RotationData16_g157226;
				}
				TVEModelData Data15_g158265 = Data16_g157226;
				float Out_Dummy15_g158265 = 0;
				float3 Out_PositionOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158265 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158265 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158265 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158265 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158265 = float3( 0,0,0 );
				float4 Out_VertexData15_g158265 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158265 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158265 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158265 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158265 = Data15_g158265.Dummy;
				Out_PositionOS15_g158265 = Data15_g158265.PositionOS;
				Out_PositionWS15_g158265 = Data15_g158265.PositionWS;
				Out_PositionWO15_g158265 = Data15_g158265.PositionWO;
				Out_PositionRawOS15_g158265 = Data15_g158265.PositionRawOS;
				Out_PositionAddOS15_g158265 = Data15_g158265.PositionAddOS;
				Out_PivotOS15_g158265 = Data15_g158265.PivotOS;
				Out_PivotWS15_g158265 = Data15_g158265.PivotWS;
				Out_PivotWO15_g158265 = Data15_g158265.PivotWO;
				Out_NormalOS15_g158265 = Data15_g158265.NormalOS;
				Out_NormalWS15_g158265 = Data15_g158265.NormalWS;
				Out_NormalRawOS15_g158265 = Data15_g158265.NormalRawOS;
				Out_NormalRawWS15_g158265 = Data15_g158265.NormalRawWS;
				Out_TangentOS15_g158265 = Data15_g158265.TangentOS;
				Out_ViewDirWS15_g158265 = Data15_g158265.ViewDirWS;
				Out_VertexData15_g158265 = Data15_g158265.VertexData;
				Out_PhaseData15_g158265 = Data15_g158265.PhaseData;
				Out_BoundsData15_g158265 = Data15_g158265.BoundsData;
				Out_RotationData15_g158265 = Data15_g158265.RotationData;
				}
				float3 temp_output_1567_0_g158264 = Out_PositionOS15_g158265;
				float3 In_PositionOS16_g158266 = temp_output_1567_0_g158264;
				float3 In_PositionWS16_g158266 = Out_PositionWS15_g158265;
				float3 temp_output_1567_17_g158264 = Out_PositionWO15_g158265;
				float3 In_PositionWO16_g158266 = temp_output_1567_17_g158264;
				float3 In_PositionRawOS16_g158266 = Out_PositionRawOS15_g158265;
				float3 In_PositionAddOS16_g158266 = Out_PositionAddOS15_g158265;
				float3 In_PivotOS16_g158266 = Out_PivotOS15_g158265;
				float3 In_PivotWS16_g158266 = Out_PivotWS15_g158265;
				float3 temp_output_1567_19_g158264 = Out_PivotWO15_g158265;
				float3 In_PivotWO16_g158266 = temp_output_1567_19_g158264;
				float3 In_NormalOS16_g158266 = Out_NormalOS15_g158265;
				float3 In_NormalWS16_g158266 = Out_NormalWS15_g158265;
				float3 In_NormalRawOS16_g158266 = Out_NormalRawOS15_g158265;
				float3 In_NormalRawWS16_g158266 = Out_NormalRawWS15_g158265;
				float4 In_TangentOS16_g158266 = Out_TangentOS15_g158265;
				float3 In_ViewDirWS16_g158266 = Out_ViewDirWS15_g158265;
				float4 In_VertexData16_g158266 = Out_VertexData15_g158265;
				float4 In_PhaseData16_g158266 = Out_PhaseData15_g158265;
				float4 In_BoundsData16_g158266 = Out_BoundsData15_g158265;
				half3 Model_PositionOS147_g158264 = temp_output_1567_0_g158264;
				half Base_Mask217_g158264 = saturate( ( Model_PositionOS147_g158264.y / _AI_Offset.y ) );
				float4 lerpResult836_g158275 = lerp( half4( 0, 1, 1, 0 ) , TVE_MotionParams , TVE_MotionParams.w);
				half2 Global_WindDirWS1663_g158264 = (lerpResult836_g158275).xy;
				half2 Input_WindDirWS803_g158268 = Global_WindDirWS1663_g158264;
				half3 Model_PositionWO162_g158264 = temp_output_1567_17_g158264;
				half3 Model_PivotWO402_g158264 = temp_output_1567_19_g158264;
				float3 lerpResult829_g158264 = lerp( Model_PositionWO162_g158264 , Model_PivotWO402_g158264 , _MotionBasePivotValue);
				half3 Base_Position1394_g158264 = lerpResult829_g158264;
				half3 Input_PositionWO419_g158268 = Base_Position1394_g158264;
				half Input_MotionTilling321_g158268 = ( _MotionBaseTillingValue + 0.2 );
				half2 Noise_Coord515_g158268 = ( -(Input_PositionWO419_g158268).xz * Input_MotionTilling321_g158268 * 0.005 );
				float2 temp_output_3_0_g158272 = Noise_Coord515_g158268;
				float2 temp_output_21_0_g158272 = Input_WindDirWS803_g158268;
				float mulTime113_g158271 = _TimeParameters.x * 0.02;
				float lerpResult128_g158271 = lerp( mulTime113_g158271 , ( ( mulTime113_g158271 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g158268 = _MotionBaseSpeedValue;
				half Noise_Speed516_g158268 = ( lerpResult128_g158271 * Input_MotionSpeed62_g158268 );
				float temp_output_15_0_g158272 = Noise_Speed516_g158268;
				float temp_output_23_0_g158272 = frac( temp_output_15_0_g158272 );
				float4 lerpResult39_g158272 = lerp( SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * temp_output_23_0_g158272 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * frac( ( temp_output_15_0_g158272 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_23_0_g158272 - 0.5 ) ) / 0.5 ));
				float4 temp_output_635_0_g158268 = lerpResult39_g158272;
				half2 Noise_DirWS825_g158268 = ((temp_output_635_0_g158268).rg*2.0 + -1.0);
				half Input_MotionNoise552_g158268 = _MotionBaseNoiseValue;
				half Global_WInd769_g158275 = (lerpResult836_g158275).z;
				float lerpResult853_g158275 = lerp( Global_WInd769_g158275 , saturate( (Global_WInd769_g158275*TVE_MotionParamsEditor.x + TVE_MotionParamsEditor.y) ) , TVE_MotionParamsEditor.w);
				half Input_MotionValue629_g158275 = _MotionIntensityValue;
				half Global_WindValue1664_g158264 = ( lerpResult853_g158275 * Input_MotionValue629_g158275 );
				half Input_WindValue853_g158268 = Global_WindValue1664_g158264;
				float lerpResult701_g158268 = lerp( 1.0 , Input_MotionNoise552_g158268 , Input_WindValue853_g158268);
				float2 lerpResult646_g158268 = lerp( Input_WindDirWS803_g158268 , Noise_DirWS825_g158268 , lerpResult701_g158268);
				half Input_MotionDelay753_g158268 = _MotionBaseDelayValue;
				float lerpResult756_g158268 = lerp( 1.0 , ( Input_WindValue853_g158268 * Input_WindValue853_g158268 ) , Input_MotionDelay753_g158268);
				half Wind_Delay815_g158268 = lerpResult756_g158268;
				float2 temp_output_809_0_g158268 = ( lerpResult646_g158268 * Input_WindValue853_g158268 * Wind_Delay815_g158268 );
				half2 Input_PushDirWS807_g158268 = float2( 1,0 );
				half Input_PushAlpha806_g158268 = ( 1.0 * 1.0 );
				float2 lerpResult811_g158268 = lerp( temp_output_809_0_g158268 , Input_PushDirWS807_g158268 , Input_PushAlpha806_g158268);
				#ifdef TVE_MOTION_ELEMENT
				float2 staticSwitch808_g158268 = lerpResult811_g158268;
				#else
				float2 staticSwitch808_g158268 = temp_output_809_0_g158268;
				#endif
				float2 temp_output_38_0_g158269 = staticSwitch808_g158268;
				float2 break83_g158269 = temp_output_38_0_g158269;
				float3 appendResult79_g158269 = (float3(break83_g158269.x , 0.0 , break83_g158269.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Bending893_g158264 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158269 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Base_Motion1440_g158264 = ( _MotionBaseIntensityValue * Base_Mask217_g158264 * Base_Bending893_g158264 );
				#ifdef TVE_MOTION
				float2 staticSwitch1651_g158264 = Base_Motion1440_g158264;
				#else
				float2 staticSwitch1651_g158264 = float2( 0,0 );
				#endif
				float4 appendResult1658_g158264 = (float4(staticSwitch1651_g158264 , 0.0 , 0.0));
				half4 Final_RoationData1570_g158264 = appendResult1658_g158264;
				float4 In_RotationData16_g158266 = Final_RoationData1570_g158264;
				{
				Data16_g158266.Dummy = In_Dummy16_g158266;
				Data16_g158266.PositionOS = In_PositionOS16_g158266;
				Data16_g158266.PositionWS = In_PositionWS16_g158266;
				Data16_g158266.PositionWO = In_PositionWO16_g158266;
				Data16_g158266.PositionRawOS = In_PositionRawOS16_g158266;
				Data16_g158266.PositionAddOS = In_PositionAddOS16_g158266;
				Data16_g158266.PivotOS = In_PivotOS16_g158266;
				Data16_g158266.PivotWS = In_PivotWS16_g158266;
				Data16_g158266.PivotWO = In_PivotWO16_g158266;
				Data16_g158266.NormalOS = In_NormalOS16_g158266;
				Data16_g158266.NormalWS = In_NormalWS16_g158266;
				Data16_g158266.NormalRawOS = In_NormalRawOS16_g158266;
				Data16_g158266.NormalRawWS = In_NormalRawWS16_g158266;
				Data16_g158266.TangentOS = In_TangentOS16_g158266;
				Data16_g158266.ViewDirWS = In_ViewDirWS16_g158266;
				Data16_g158266.VertexData = In_VertexData16_g158266;
				Data16_g158266.PhaseData = In_PhaseData16_g158266;
				Data16_g158266.BoundsData = In_BoundsData16_g158266;
				Data16_g158266.RotationData = In_RotationData16_g158266;
				}
				TVEModelData Data15_g158390 = Data16_g158266;
				float Out_Dummy15_g158390 = 0;
				float3 Out_PositionOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158390 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158390 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158390 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158390 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158390 = float3( 0,0,0 );
				float4 Out_VertexData15_g158390 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158390 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158390 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158390 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158390 = Data15_g158390.Dummy;
				Out_PositionOS15_g158390 = Data15_g158390.PositionOS;
				Out_PositionWS15_g158390 = Data15_g158390.PositionWS;
				Out_PositionWO15_g158390 = Data15_g158390.PositionWO;
				Out_PositionRawOS15_g158390 = Data15_g158390.PositionRawOS;
				Out_PositionAddOS15_g158390 = Data15_g158390.PositionAddOS;
				Out_PivotOS15_g158390 = Data15_g158390.PivotOS;
				Out_PivotWS15_g158390 = Data15_g158390.PivotWS;
				Out_PivotWO15_g158390 = Data15_g158390.PivotWO;
				Out_NormalOS15_g158390 = Data15_g158390.NormalOS;
				Out_NormalWS15_g158390 = Data15_g158390.NormalWS;
				Out_NormalRawOS15_g158390 = Data15_g158390.NormalRawOS;
				Out_NormalRawWS15_g158390 = Data15_g158390.NormalRawWS;
				Out_TangentOS15_g158390 = Data15_g158390.TangentOS;
				Out_ViewDirWS15_g158390 = Data15_g158390.ViewDirWS;
				Out_VertexData15_g158390 = Data15_g158390.VertexData;
				Out_PhaseData15_g158390 = Data15_g158390.PhaseData;
				Out_BoundsData15_g158390 = Data15_g158390.BoundsData;
				Out_RotationData15_g158390 = Data15_g158390.RotationData;
				}
				half3 Model_PositionOS147_g158389 = Out_PositionOS15_g158390;
				half3 VertexPos40_g158393 = Model_PositionOS147_g158389;
				float3 appendResult74_g158393 = (float3(VertexPos40_g158393.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158393 = appendResult74_g158393;
				float3 break84_g158393 = VertexPos40_g158393;
				float3 appendResult81_g158393 = (float3(0.0 , break84_g158393.y , break84_g158393.z));
				half3 VertexPosOtherAxis82_g158393 = appendResult81_g158393;
				float4 temp_output_1567_33_g158389 = Out_RotationData15_g158390;
				half4 Model_VertexBend1569_g158389 = temp_output_1567_33_g158389;
				float2 break1582_g158389 = (Model_VertexBend1569_g158389).xy;
				half Angle44_g158393 = break1582_g158389.y;
				half3 VertexPos40_g158396 = ( VertexPosRotationAxis50_g158393 + ( VertexPosOtherAxis82_g158393 * cos( Angle44_g158393 ) ) + ( cross( float3( 1, 0, 0 ) , VertexPosOtherAxis82_g158393 ) * sin( Angle44_g158393 ) ) );
				float3 appendResult74_g158396 = (float3(0.0 , 0.0 , VertexPos40_g158396.z));
				half3 VertexPosRotationAxis50_g158396 = appendResult74_g158396;
				float3 break84_g158396 = VertexPos40_g158396;
				float3 appendResult81_g158396 = (float3(break84_g158396.x , break84_g158396.y , 0.0));
				half3 VertexPosOtherAxis82_g158396 = appendResult81_g158396;
				half Angle44_g158396 = -break1582_g158389.x;
				float3 temp_output_1584_19_g158389 = ( VertexPosRotationAxis50_g158396 + ( VertexPosOtherAxis82_g158396 * cos( Angle44_g158396 ) ) + ( cross( float3( 0, 0, 1 ) , VertexPosOtherAxis82_g158396 ) * sin( Angle44_g158396 ) ) );
				float3 temp_output_6_0_g158395 = temp_output_1584_19_g158389;
				#ifdef TVE_MOTION
				float3 staticSwitch65_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch65_g158395 = Model_PositionOS147_g158389;
				#endif
				#ifdef TVE_CONFORM
				float3 staticSwitch69_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch69_g158395 = staticSwitch65_g158395;
				#endif
				float3 temp_output_1585_0_g158389 = staticSwitch69_g158395;
				float3 temp_output_1567_31_g158389 = Out_PositionAddOS15_g158390;
				half3 Model_PositionADD1568_g158389 = temp_output_1567_31_g158389;
				half3 Final_PositionOS178_g158389 = ( temp_output_1585_0_g158389 + Model_PositionADD1568_g158389 );
				float3 In_PositionOS16_g158391 = Final_PositionOS178_g158389;
				float3 In_PositionWS16_g158391 = Out_PositionWS15_g158390;
				float3 In_PositionWO16_g158391 = Out_PositionWO15_g158390;
				float3 In_PositionRawOS16_g158391 = Out_PositionRawOS15_g158390;
				float3 In_PositionAddOS16_g158391 = temp_output_1567_31_g158389;
				float3 In_PivotOS16_g158391 = Out_PivotOS15_g158390;
				float3 In_PivotWS16_g158391 = Out_PivotWS15_g158390;
				float3 In_PivotWO16_g158391 = Out_PivotWO15_g158390;
				float3 In_NormalOS16_g158391 = Out_NormalOS15_g158390;
				float3 In_NormalWS16_g158391 = Out_NormalWS15_g158390;
				float3 In_NormalRawOS16_g158391 = Out_NormalRawOS15_g158390;
				float3 In_NormalRawWS16_g158391 = Out_NormalRawWS15_g158390;
				float4 In_TangentOS16_g158391 = Out_TangentOS15_g158390;
				float3 In_ViewDirWS16_g158391 = Out_ViewDirWS15_g158390;
				float4 In_VertexData16_g158391 = Out_VertexData15_g158390;
				float4 In_PhaseData16_g158391 = Out_PhaseData15_g158390;
				float4 In_BoundsData16_g158391 = Out_BoundsData15_g158390;
				float4 In_RotationData16_g158391 = temp_output_1567_33_g158389;
				{
				Data16_g158391.Dummy = In_Dummy16_g158391;
				Data16_g158391.PositionOS = In_PositionOS16_g158391;
				Data16_g158391.PositionWS = In_PositionWS16_g158391;
				Data16_g158391.PositionWO = In_PositionWO16_g158391;
				Data16_g158391.PositionRawOS = In_PositionRawOS16_g158391;
				Data16_g158391.PositionAddOS = In_PositionAddOS16_g158391;
				Data16_g158391.PivotOS = In_PivotOS16_g158391;
				Data16_g158391.PivotWS = In_PivotWS16_g158391;
				Data16_g158391.PivotWO = In_PivotWO16_g158391;
				Data16_g158391.NormalOS = In_NormalOS16_g158391;
				Data16_g158391.NormalWS = In_NormalWS16_g158391;
				Data16_g158391.NormalRawOS = In_NormalRawOS16_g158391;
				Data16_g158391.NormalRawWS = In_NormalRawWS16_g158391;
				Data16_g158391.TangentOS = In_TangentOS16_g158391;
				Data16_g158391.ViewDirWS = In_ViewDirWS16_g158391;
				Data16_g158391.VertexData = In_VertexData16_g158391;
				Data16_g158391.PhaseData = In_PhaseData16_g158391;
				Data16_g158391.BoundsData = In_BoundsData16_g158391;
				Data16_g158391.RotationData = In_RotationData16_g158391;
				}
				TVEModelData Data15_g158419 = Data16_g158391;
				float Out_Dummy15_g158419 = 0;
				float3 Out_PositionOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158419 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158419 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158419 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158419 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158419 = float3( 0,0,0 );
				float4 Out_VertexData15_g158419 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158419 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158419 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158419 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158419 = Data15_g158419.Dummy;
				Out_PositionOS15_g158419 = Data15_g158419.PositionOS;
				Out_PositionWS15_g158419 = Data15_g158419.PositionWS;
				Out_PositionWO15_g158419 = Data15_g158419.PositionWO;
				Out_PositionRawOS15_g158419 = Data15_g158419.PositionRawOS;
				Out_PositionAddOS15_g158419 = Data15_g158419.PositionAddOS;
				Out_PivotOS15_g158419 = Data15_g158419.PivotOS;
				Out_PivotWS15_g158419 = Data15_g158419.PivotWS;
				Out_PivotWO15_g158419 = Data15_g158419.PivotWO;
				Out_NormalOS15_g158419 = Data15_g158419.NormalOS;
				Out_NormalWS15_g158419 = Data15_g158419.NormalWS;
				Out_NormalRawOS15_g158419 = Data15_g158419.NormalRawOS;
				Out_NormalRawWS15_g158419 = Data15_g158419.NormalRawWS;
				Out_TangentOS15_g158419 = Data15_g158419.TangentOS;
				Out_ViewDirWS15_g158419 = Data15_g158419.ViewDirWS;
				Out_VertexData15_g158419 = Data15_g158419.VertexData;
				Out_PhaseData15_g158419 = Data15_g158419.PhaseData;
				Out_BoundsData15_g158419 = Data15_g158419.BoundsData;
				Out_RotationData15_g158419 = Data15_g158419.RotationData;
				}
				float3 temp_output_31_0_g158407 = Out_PositionOS15_g158419;
				float3 temp_output_6_0_g158420 = ( temp_output_31_0_g158407 + _DisableSRPBatcher );
				float temp_output_371_0_g158324 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingGlobalValue + _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessGlobalValue + _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue + 0.0 ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue + _CutoutGlobalValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeScaleValue1 ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) + temp_output_371_0_g158324 );
				#ifdef TVE_DUMMY
				float3 staticSwitch14_g158420 = ( temp_output_6_0_g158420 + Dummy_Data505.r );
				#else
				float3 staticSwitch14_g158420 = temp_output_6_0_g158420;
				#endif
				
				output.ase_texcoord8.xyz = vertexToFrag305_g157220;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = staticSwitch14_g158420;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif
						#if defined( ASE_DEPTH_WRITE_ON )
							, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half IsFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];
				float4 ClipPos = TransformWorldToHClip( PositionRWS );
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float localBreakData4_g158410 = ( 0.0 );
				float localCompData3_g158401 = ( 0.0 );
				TVEVisualData Data3_g158401 = (TVEVisualData)0;
				half Dummy145_g158399 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) );
				float In_Dummy3_g158401 = Dummy145_g158399;
				float localBreakData4_g158400 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158292 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + 0.0 );
				float In_Dummy3_g158307 = Dummy145_g158292;
				float localBreakData4_g158296 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				half Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlayBakeInfo ) + 0.0 );
				float In_Dummy3_g158220 = Dummy594_g158217;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157228 = ( 0.0 );
				TVEVisualData Data3_g157228 = (TVEVisualData)0;
				float In_Dummy3_g157228 = 0.0;
				float4 output0 = 0;
				float4 output1 = 0;
				float4 output2 = 0;
				ImpostorOutput io = ( ImpostorOutput )0;
				OctaImpostorFragment( io, ClipPos, PositionRWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1, output2 );
				float4 temp_cast_0 = (1.0).xxxx;
				half4 Input_Tex0377_g157220 = output0;
				half4 Input_Tex1379_g157220 = output1;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch403_g157220 = temp_cast_0;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch403_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch403_g157220 = temp_cast_0;
				#endif
				half Local_MultiMask249_g157220 = (staticSwitch403_g157220).b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( io.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157228 = Local_Albedo239_g157220;
				float3 In_AlbedoRaw3_g157228 = Local_Albedo239_g157220;
				float2 temp_cast_3 = (0.0).xx;
				float2 In_NormalTS3_g157228 = temp_cast_3;
				float3 In_NormalWS3_g157228 = io.WorldNormal;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 temp_cast_5 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch385_g157220 = temp_cast_4;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch385_g157220 = temp_cast_5;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch385_g157220 = temp_cast_4;
				#endif
				half Local_Metallic247_g157220 = (staticSwitch385_g157220).r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				float4 temp_cast_6 = (1.0).xxxx;
				float4 temp_cast_7 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch392_g157220 = temp_cast_6;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch392_g157220 = temp_cast_7;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch392_g157220 = temp_cast_6;
				#endif
				half Local_OcclusionOrEmissive248_g157220 = (staticSwitch392_g157220).g;
				float lerpResult431_g157220 = lerp( 1.0 , Local_OcclusionOrEmissive248_g157220 , _ImpostorOcclusionValue);
				#ifdef TVE_EMISSIVE
				float staticSwitch428_g157220 = 1.0;
				#else
				float staticSwitch428_g157220 = lerpResult431_g157220;
				#endif
				half Final_Occlusion424_g157220 = staticSwitch428_g157220;
				float4 temp_cast_8 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch408_g157220 = temp_cast_8;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch408_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch408_g157220 = temp_cast_8;
				#endif
				half Local_Smoothness250_g157220 = (staticSwitch408_g157220).a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , Final_Occlusion424_g157220 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157228 = appendResult257_g157220;
				float4 appendResult286_g157220 = (float4(Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , 1.0));
				float4 In_Emissive3_g157228 = appendResult286_g157220;
				float3 temp_output_3_0_g157221 = Local_Albedo239_g157220;
				float dotResult20_g157221 = dot( temp_output_3_0_g157221 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale268_g157220 = dotResult20_g157221;
				float In_Grayscale3_g157228 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157228 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157228 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157228 = 0.0;
				float In_AlphaFade3_g157228 = 1.0;
				float3 temp_cast_9 = (1.0).xxx;
				float3 In_Translucency3_g157228 = temp_cast_9;
				float In_Transmission3_g157228 = 1.0;
				float In_Thickness3_g157228 = 0.0;
				float In_Diffusion3_g157228 = 0.0;
				float In_Depth3_g157228 = ClipPos.z;
				{
				Data3_g157228.Dummy = In_Dummy3_g157228;
				Data3_g157228.Albedo = In_Albedo3_g157228;
				Data3_g157228.AlbedoRaw = In_AlbedoRaw3_g157228;
				Data3_g157228.NormalTS = In_NormalTS3_g157228;
				Data3_g157228.NormalWS = In_NormalWS3_g157228;
				Data3_g157228.Shader = In_Shader3_g157228;
				Data3_g157228.Emissive= In_Emissive3_g157228;
				Data3_g157228.MultiMask = In_MultiMask3_g157228;
				Data3_g157228.Grayscale = In_Grayscale3_g157228;
				Data3_g157228.Luminosity = In_Luminosity3_g157228;
				Data3_g157228.AlphaClip = In_AlphaClip3_g157228;
				Data3_g157228.AlphaFade = In_AlphaFade3_g157228;
				Data3_g157228.Translucency = In_Translucency3_g157228;
				Data3_g157228.Transmission = In_Transmission3_g157228;
				Data3_g157228.Thickness = In_Thickness3_g157228;
				Data3_g157228.Diffusion = In_Diffusion3_g157228;
				Data3_g157228.Depth = In_Depth3_g157228;
				}
				TVEVisualData Data4_g158218 = Data3_g157228;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				float Out_Depth4_g158218 = 0;
				{
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_AlbedoRaw4_g158218 = Data4_g158218.AlbedoRaw;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				Out_Depth4_g158218= Data4_g158218.Depth;
				}
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158231 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158237 = _OverlayProjRemap.x;
				float temp_output_9_0_g158237 = ( clampResult17_g158231 - temp_output_7_0_g158237 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158237 * _OverlayProjRemap.z ) + 0.0001 ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158232 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayLumaRemap.x;
				float temp_output_9_0_g158236 = ( clampResult17_g158232 - temp_output_7_0_g158236 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158236 * _OverlayLumaRemap.z ) + 0.0001 ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				TVEModelData Data16_g157227 = (TVEModelData)0;
				float In_Dummy16_g157227 = 0.0;
				half3 Input_PositionWS319_g157220 = GetAbsolutePositionWS( PositionRWS );
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157227 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157227 = Model_PositionWO311_g157220;
				float3 vertexToFrag305_g157220 = packedInput.ase_texcoord8.xyz;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157227 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157227 = Model_PivotWO312_g157220;
				half3 Model_Normal_WS314_g157220 = NormalWS;
				float3 In_NormalWS16_g157227 = Model_Normal_WS314_g157220;
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157227 = Model_ViewDirWS347_g157220;
				float4 temp_cast_10 = (1.0).xxxx;
				half4 Input_Tex2380_g157220 = output2;
				float4 appendResult420_g157220 = (float4((Input_Tex1379_g157220).rg , 1.0 , 1.0));
				float4 temp_cast_13 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch414_g157220 = temp_cast_10;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch414_g157220 = Input_Tex2380_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch414_g157220 = appendResult420_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch414_g157220 = temp_cast_13;
				#else
				float4 staticSwitch414_g157220 = temp_cast_10;
				#endif
				half4 Local_VertexColor422_g157220 = staticSwitch414_g157220;
				float4 In_VertexData16_g157227 = Local_VertexColor422_g157220;
				float4 In_BoundsData16_g157227 = float4( 1,1,1,1 );
				{
				Data16_g157227.Dummy = In_Dummy16_g157227;
				Data16_g157227.PositionWS = In_PositionWS16_g157227;
				Data16_g157227.PositionWO = In_PositionWO16_g157227;
				Data16_g157227.PivotWS = In_PivotWS16_g157227;
				Data16_g157227.PivotWO = In_PivotWO16_g157227;
				Data16_g157227.NormalWS = In_NormalWS16_g157227;
				Data16_g157227.ViewDirWS = In_ViewDirWS16_g157227;
				Data16_g157227.VertexData = In_VertexData16_g157227;
				Data16_g157227.BoundsData = In_BoundsData16_g157227;
				}
				TVEModelData Data15_g158228 = Data16_g157227;
				float Out_Dummy15_g158228 = 0;
				float3 Out_PositionWS15_g158228 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158228 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158228 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g158228 = float3( 0,0,0 );
				float4 Out_VertexData15_g158228 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158228 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158228 = Data15_g158228.Dummy;
				Out_PositionWS15_g158228 = Data15_g158228.PositionWS;
				Out_PositionWO15_g158228 = Data15_g158228.PositionWO;
				Out_PivotWS15_g158228 = Data15_g158228.PivotWS;
				Out_PivotWO15_g158228 = Data15_g158228.PivotWO;
				Out_NormalWS15_g158228 = Data15_g158228.NormalWS;
				Out_ViewDirWS15_g158228 = Data15_g158228.ViewDirWS;
				Out_VertexData15_g158228 = Data15_g158228.VertexData;
				Out_BoundsData15_g158228 = Data15_g158228.BoundsData;
				}
				half4 Model_VertexMasks791_g158217 = Out_VertexData15_g158228;
				float4 break792_g158217 = Model_VertexMasks791_g158217;
				float4 break33_g158229 = _overlay_vert_mode;
				float temp_output_30_0_g158229 = ( break792_g158217.x * break33_g158229.x );
				float temp_output_29_0_g158229 = ( break792_g158217.y * break33_g158229.y );
				float temp_output_31_0_g158229 = ( break792_g158217.z * break33_g158229.z );
				float temp_output_28_0_g158229 = ( temp_output_30_0_g158229 + temp_output_29_0_g158229 + temp_output_31_0_g158229 + ( break792_g158217.w * break33_g158229.w ) );
				float clampResult17_g158230 = clamp( temp_output_28_0_g158229 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayMeshRemap.x;
				float temp_output_9_0_g158238 = ( clampResult17_g158230 - temp_output_7_0_g158238 );
				float lerpResult879_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158238 * _OverlayMeshRemap.z ) + 0.0001 ) ) , _OverlayMeshValue);
				float temp_output_6_0_g158233 = lerpResult879_g158217;
				#ifdef TVE_DUMMY
				float staticSwitch14_g158233 = ( temp_output_6_0_g158233 + _OverlayMeshMode );
				#else
				float staticSwitch14_g158233 = temp_output_6_0_g158233;
				#endif
				half Overlay_VertMask801_g158217 = staticSwitch14_g158233;
				float lerpResult920_g158217 = lerp( 1.0 , ( TVE_AtmoParams.z * TVE_IsEnabled ) , _OverlayGlobalValue);
				half Overlay_MaskGlobal429_g158217 = lerpResult920_g158217;
				float temp_output_7_0_g158239 = _OverlayBlendRemap.x;
				float temp_output_9_0_g158239 = ( ( _OverlayIntensityValue * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ) - temp_output_7_0_g158239 );
				half Overlay_Mask494_g158217 = saturate( ( ( temp_output_9_0_g158239 * _OverlayBlendRemap.z ) + 0.0001 ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				float3 In_AlbedoRaw3_g158220 = Out_AlbedoRaw4_g158218;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				float In_Depth3_g158220 = Out_Depth4_g158218;
				{
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.AlbedoRaw = In_AlbedoRaw3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				Data3_g158220.Depth = In_Depth3_g158220;
				}
				TVEVisualData Data4_g158296 = Data3_g158220;
				float Out_Dummy4_g158296 = 0;
				float3 Out_Albedo4_g158296 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158296 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158296 = float2( 0,0 );
				float3 Out_NormalWS4_g158296 = float3( 0,0,0 );
				float4 Out_Shader4_g158296 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158296 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158296 = 0;
				float Out_Grayscale4_g158296 = 0;
				float Out_Luminosity4_g158296 = 0;
				float Out_AlphaClip4_g158296 = 0;
				float Out_AlphaFade4_g158296 = 0;
				float3 Out_Translucency4_g158296 = float3( 0,0,0 );
				float Out_Transmission4_g158296 = 0;
				float Out_Thickness4_g158296 = 0;
				float Out_Diffusion4_g158296 = 0;
				float Out_Depth4_g158296 = 0;
				{
				Out_Dummy4_g158296 = Data4_g158296.Dummy;
				Out_Albedo4_g158296 = Data4_g158296.Albedo;
				Out_AlbedoRaw4_g158296 = Data4_g158296.AlbedoRaw;
				Out_NormalTS4_g158296 = Data4_g158296.NormalTS;
				Out_NormalWS4_g158296 = Data4_g158296.NormalWS;
				Out_Shader4_g158296 = Data4_g158296.Shader;
				Out_Emissive4_g158296= Data4_g158296.Emissive;
				Out_MultiMask4_g158296 = Data4_g158296.MultiMask;
				Out_Grayscale4_g158296 = Data4_g158296.Grayscale;
				Out_Luminosity4_g158296= Data4_g158296.Luminosity;
				Out_AlphaClip4_g158296 = Data4_g158296.AlphaClip;
				Out_AlphaFade4_g158296 = Data4_g158296.AlphaFade;
				Out_Translucency4_g158296 = Data4_g158296.Translucency;
				Out_Transmission4_g158296 = Data4_g158296.Transmission;
				Out_Thickness4_g158296 = Data4_g158296.Thickness;
				Out_Diffusion4_g158296 = Data4_g158296.Diffusion;
				Out_Depth4_g158296= Data4_g158296.Depth;
				}
				float3 temp_output_297_0_g158292 = Out_Albedo4_g158296;
				float3 In_Albedo3_g158307 = temp_output_297_0_g158292;
				float3 temp_output_297_23_g158292 = Out_AlbedoRaw4_g158296;
				float3 In_AlbedoRaw3_g158307 = temp_output_297_23_g158292;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158296;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158296;
				float4 In_Shader3_g158307 = Out_Shader4_g158296;
				float4 temp_cast_15 = (0.0).xxxx;
				half4 Visual_Emissive255_g158292 = Out_Emissive4_g158296;
				half Emissive_MeshMask221_g158292 = 1.0;
				half Emissive_Mask103_g158292 = 1.0;
				float temp_output_279_0_g158292 = ( Emissive_MeshMask221_g158292 * Emissive_Mask103_g158292 );
				float3 appendResult293_g158292 = (float3(temp_output_279_0_g158292 , temp_output_279_0_g158292 , temp_output_279_0_g158292));
				half3 Local_EmissiveColor278_g158292 = appendResult293_g158292;
				float3 temp_output_316_0_g158292 = (TVE_GlowParams).xyz;
				float3 lerpResult299_g158292 = lerp( float3( 1,1,1 ) , temp_output_316_0_g158292 , ( _EmissiveGlobalValue * TVE_IsEnabled ));
				half3 Emissive_GlobalMask248_g158292 = lerpResult299_g158292;
				half3 Visual_AlbedoRaw306_g158292 = temp_output_297_23_g158292;
				float3 lerpResult307_g158292 = lerp( float3( 1,1,1 ) , Visual_AlbedoRaw306_g158292 , _EmissiveColorMode);
				half3 Local_EmissiveValue88_g158292 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158292 * lerpResult307_g158292 );
				half3 Emissive_Blend260_g158292 = ( ( (Visual_Emissive255_g158292).xyz * Local_EmissiveColor278_g158292 ) * Local_EmissiveValue88_g158292 );
				float3 temp_output_3_0_g158298 = Emissive_Blend260_g158292;
				float temp_output_15_0_g158298 = _emissive_power_value;
				float3 hdEmission22_g158298 = ASEGetEmissionHDRColor(temp_output_3_0_g158298,temp_output_15_0_g158298,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Local_EmissiveMask294_g158292 = temp_output_279_0_g158292;
				float4 appendResult295_g158292 = (float4(hdEmission22_g158298 , Local_EmissiveMask294_g158292));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158292 = appendResult295_g158292;
				#else
				float4 staticSwitch129_g158292 = temp_cast_15;
				#endif
				half4 Final_Emissive184_g158292 = staticSwitch129_g158292;
				float4 In_Emissive3_g158307 = Final_Emissive184_g158292;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158296;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158296;
				float temp_output_297_11_g158292 = Out_MultiMask4_g158296;
				float In_MultiMask3_g158307 = temp_output_297_11_g158292;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158296;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158296;
				float3 In_Translucency3_g158307 = Out_Translucency4_g158296;
				float In_Transmission3_g158307 = Out_Transmission4_g158296;
				float In_Thickness3_g158307 = Out_Thickness4_g158296;
				float In_Diffusion3_g158307 = Out_Diffusion4_g158296;
				float In_Depth3_g158307 = Out_Depth4_g158296;
				{
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.AlbedoRaw = In_AlbedoRaw3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				Data3_g158307.Depth = In_Depth3_g158307;
				}
				TVEVisualData Data4_g158400 = Data3_g158307;
				float Out_Dummy4_g158400 = 0;
				float3 Out_Albedo4_g158400 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158400 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158400 = float2( 0,0 );
				float3 Out_NormalWS4_g158400 = float3( 0,0,0 );
				float4 Out_Shader4_g158400 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158400 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158400 = 0;
				float Out_Grayscale4_g158400 = 0;
				float Out_Luminosity4_g158400 = 0;
				float Out_AlphaClip4_g158400 = 0;
				float Out_AlphaFade4_g158400 = 0;
				float3 Out_Translucency4_g158400 = float3( 0,0,0 );
				float Out_Transmission4_g158400 = 0;
				float Out_Thickness4_g158400 = 0;
				float Out_Diffusion4_g158400 = 0;
				float Out_Depth4_g158400 = 0;
				{
				Out_Dummy4_g158400 = Data4_g158400.Dummy;
				Out_Albedo4_g158400 = Data4_g158400.Albedo;
				Out_AlbedoRaw4_g158400 = Data4_g158400.AlbedoRaw;
				Out_NormalTS4_g158400 = Data4_g158400.NormalTS;
				Out_NormalWS4_g158400 = Data4_g158400.NormalWS;
				Out_Shader4_g158400 = Data4_g158400.Shader;
				Out_Emissive4_g158400= Data4_g158400.Emissive;
				Out_MultiMask4_g158400 = Data4_g158400.MultiMask;
				Out_Grayscale4_g158400 = Data4_g158400.Grayscale;
				Out_Luminosity4_g158400= Data4_g158400.Luminosity;
				Out_AlphaClip4_g158400 = Data4_g158400.AlphaClip;
				Out_AlphaFade4_g158400 = Data4_g158400.AlphaFade;
				Out_Translucency4_g158400 = Data4_g158400.Translucency;
				Out_Transmission4_g158400 = Data4_g158400.Transmission;
				Out_Thickness4_g158400 = Data4_g158400.Thickness;
				Out_Diffusion4_g158400 = Data4_g158400.Diffusion;
				Out_Depth4_g158400= Data4_g158400.Depth;
				}
				half3 Visual_Albedo199_g158399 = Out_Albedo4_g158400;
				half3 Final_Albedo312_g158399 = Visual_Albedo199_g158399;
				float3 In_Albedo3_g158401 = Final_Albedo312_g158399;
				float3 In_AlbedoRaw3_g158401 = Out_AlbedoRaw4_g158400;
				float2 In_NormalTS3_g158401 = Out_NormalTS4_g158400;
				float3 In_NormalWS3_g158401 = Out_NormalWS4_g158400;
				float4 In_Shader3_g158401 = Out_Shader4_g158400;
				float4 In_Emissive3_g158401 = Out_Emissive4_g158400;
				float In_Grayscale3_g158401 = Out_Grayscale4_g158400;
				float In_Luminosity3_g158401 = Out_Luminosity4_g158400;
				float temp_output_301_11_g158399 = Out_MultiMask4_g158400;
				float In_MultiMask3_g158401 = temp_output_301_11_g158399;
				float In_AlphaClip3_g158401 = Out_AlphaClip4_g158400;
				float In_AlphaFade3_g158401 = Out_AlphaFade4_g158400;
				float3 temp_cast_16 = (0.0).xxx;
				half3 Subsurface_Color264_g158399 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158399 );
				half Visual_Transmission138_g158399 = Out_Transmission4_g158400;
				half Subsurface_Value268_g158399 = _SubsurfaceIntensityValue;
				float lerpResult403_g158399 = lerp( 1.0 , TVE_GlowParams.w , ( _SubsurfaceGlobalValue * TVE_IsEnabled ));
				half Subsurface_GlobalMask369_g158399 = lerpResult403_g158399;
				half Visual_MultiMask292_g158399 = temp_output_301_11_g158399;
				float lerpResult293_g158399 = lerp( 1.0 , Visual_MultiMask292_g158399 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158399 = lerpResult293_g158399;
				half Custom_Mask363_g158399 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158399 = ( Visual_Transmission138_g158399 * Subsurface_Value268_g158399 * Subsurface_GlobalMask369_g158399 * Subsurface_MultiMask296_g158399 * Custom_Mask363_g158399 );
				#else
				float staticSwitch345_g158399 = 0.0;
				#endif
				half Final_Transmission269_g158399 = staticSwitch345_g158399;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158399 = ( Subsurface_Color264_g158399 * Final_Transmission269_g158399 * 10.0 );
				#else
				float3 staticSwitch348_g158399 = temp_cast_16;
				#endif
				half3 Final_Translucency254_g158399 = staticSwitch348_g158399;
				float3 In_Translucency3_g158401 = Final_Translucency254_g158399;
				float In_Transmission3_g158401 = Final_Transmission269_g158399;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158399 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158399 = 1.0;
				#endif
				half Final_Thickness275_g158399 = staticSwitch351_g158399;
				float In_Thickness3_g158401 = Final_Thickness275_g158399;
				float Final_Diffusion340_g158399 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158401 = Final_Diffusion340_g158399;
				float In_Depth3_g158401 = Out_Depth4_g158400;
				{
				Data3_g158401.Dummy = In_Dummy3_g158401;
				Data3_g158401.Albedo = In_Albedo3_g158401;
				Data3_g158401.AlbedoRaw = In_AlbedoRaw3_g158401;
				Data3_g158401.NormalTS = In_NormalTS3_g158401;
				Data3_g158401.NormalWS = In_NormalWS3_g158401;
				Data3_g158401.Shader = In_Shader3_g158401;
				Data3_g158401.Emissive= In_Emissive3_g158401;
				Data3_g158401.MultiMask = In_MultiMask3_g158401;
				Data3_g158401.Grayscale = In_Grayscale3_g158401;
				Data3_g158401.Luminosity = In_Luminosity3_g158401;
				Data3_g158401.AlphaClip = In_AlphaClip3_g158401;
				Data3_g158401.AlphaFade = In_AlphaFade3_g158401;
				Data3_g158401.Translucency = In_Translucency3_g158401;
				Data3_g158401.Transmission = In_Transmission3_g158401;
				Data3_g158401.Thickness = In_Thickness3_g158401;
				Data3_g158401.Diffusion = In_Diffusion3_g158401;
				Data3_g158401.Depth = In_Depth3_g158401;
				}
				TVEVisualData Data4_g158410 = Data3_g158401;
				float Out_Dummy4_g158410 = 0;
				float3 Out_Albedo4_g158410 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158410 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158410 = float2( 0,0 );
				float3 Out_NormalWS4_g158410 = float3( 0,0,0 );
				float4 Out_Shader4_g158410 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158410 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158410 = 0;
				float Out_Grayscale4_g158410 = 0;
				float Out_Luminosity4_g158410 = 0;
				float Out_AlphaClip4_g158410 = 0;
				float Out_AlphaFade4_g158410 = 0;
				float3 Out_Translucency4_g158410 = float3( 0,0,0 );
				float Out_Transmission4_g158410 = 0;
				float Out_Thickness4_g158410 = 0;
				float Out_Diffusion4_g158410 = 0;
				float Out_Depth4_g158410 = 0;
				{
				Out_Dummy4_g158410 = Data4_g158410.Dummy;
				Out_Albedo4_g158410 = Data4_g158410.Albedo;
				Out_AlbedoRaw4_g158410 = Data4_g158410.AlbedoRaw;
				Out_NormalTS4_g158410 = Data4_g158410.NormalTS;
				Out_NormalWS4_g158410 = Data4_g158410.NormalWS;
				Out_Shader4_g158410 = Data4_g158410.Shader;
				Out_Emissive4_g158410= Data4_g158410.Emissive;
				Out_MultiMask4_g158410 = Data4_g158410.MultiMask;
				Out_Grayscale4_g158410 = Data4_g158410.Grayscale;
				Out_Luminosity4_g158410= Data4_g158410.Luminosity;
				Out_AlphaClip4_g158410 = Data4_g158410.AlphaClip;
				Out_AlphaFade4_g158410 = Data4_g158410.AlphaFade;
				Out_Translucency4_g158410 = Data4_g158410.Translucency;
				Out_Transmission4_g158410 = Data4_g158410.Transmission;
				Out_Thickness4_g158410 = Data4_g158410.Thickness;
				Out_Diffusion4_g158410 = Data4_g158410.Diffusion;
				Out_Depth4_g158410= Data4_g158410.Depth;
				}
				

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;

				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = Out_Depth4_g158410;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
					float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
					outputDepth += bias;
				#endif

				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.vmesh.positionCS.z;
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
					DecalPrepassData decalPrepassData;
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local_fragment _ _DISABLE_SSR
			#define ASE_FRAGMENT_NORMAL 2
			#define ASE_DEPTH_WRITE_ON
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 140012
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma editor_sync_compilation
            #pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
		    #define SCENESELECTIONPASS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DitherColoring;
			half4 _OverlayLumaRemap;
			half4 _OverlayProjRemap;
			half4 _OverlayColor;
			half4 _DrynessColoring;
			half4 _TintingLumaRemap;
			half4 _ImpostorColor;
			half4 _overlay_vert_mode;
			half4 _ImpostorColorTwo;
			half4 _TintingColoring;
			half4 _SizeFadeColoring;
			float4 _AI_SizeOffset;
			half4 _VariationNoiseRemap;
			half4 _VariationColorOne;
			half4 _VariationColorTwo;
			float4 _TintingColor;
			half4 _OverlayMeshRemap;
			half4 _VariationColoring;
			float4 _DrynessColor;
			half4 _DrynessLumaRemap;
			half4 _EmissiveColor;
			half4 _OverlayBlendRemap;
			half4 _WetnessColoring;
			half4 _CutoutColoring;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			float3 _AI_Offset;
			float3 _AI_BoundsMin;
			float3 _AI_BoundsSize;
			half _SizeFadeCategory;
			half _CutoutLiteInfo;
			half _SizeFadeEnd;
			half _SizeFadeScaleValue1;
			half _SizeFadeLiteInfo;
			half _DitherNoiseTillingValue;
			half _CutoutCategory;
			half _DitherMultiValue;
			half _DitherShadowMode;
			half _DitherDistanceMaxValue;
			half _CutoutNoiseValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseTillingValue;
			half _CutoutGlobalValue;
			half _CutoutMultiValue;
			half _DitherLiteInfo;
			half _CutoutShadowMode;
			half _DitherDistanceMinValue;
			half _CutoutIntensityValue;
			half _DitherCategory;
			half _CutoutSpace;
			half _DitherEnd;
			half _DitherConstantValue;
			half _DitherDistanceValue;
			half _CutoutEnd;
			half _SizeFadeIntensityValue;
			half _ImpostorMaskOffInfo;
			half _SubsurfaceCategory;
			half _SizeFadeScaleValue;
			half _ImpostorSmoothnessValue;
			half _OverlayIntensityValue;
			half _OverlayProjValue;
			half _OverlayLumaValue;
			half _OverlayMeshValue;
			half _OverlayMeshMode;
			half _OverlayGlobalValue;
			half _OverlayNormalValue;
			half _OverlaySmoothnessValue;
			half _OverlaySubsurfaceValue;
			half _EmissiveIntensityValue;
			half _EmissiveGlobalValue;
			half _EmissiveColorMode;
			float _emissive_power_value;
			half _EmissiveExposureValue;
			half _SubsurfaceIntensityValue;
			half _SubsurfaceGlobalValue;
			half _ImpostorOcclusionValue;
			half _SizeFadeScaleMode;
			half _ImpostorMetallicValue;
			half _OverlayBakeInfo;
			half _SizeFadeDistMinValue;
			half _SizeFadeDistMaxValue;
			half _GlobalLiteInfo;
			half _GlobalCategory;
			half _GlobalEnd;
			half _WetnessSmoothnessValue;
			half _SubsurfaceEnd;
			half _SubsurfaceDirectValue;
			half _SubsurfaceNormalValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _EmissiveCategory;
			half _EmissiveEnd;
			half _EmissivePowerMode;
			half _EmissivePowerValue;
			half _OverlayCategory;
			half _OverlayEnd;
			half _ImpostorColorMode;
			half _WetnessContrastValue;
			half _DrynessMultiValue;
			half _WetnessEnd;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsCollected;
			half _IsLiteShader;
			half _MotionCategory;
			half _MotionEnd;
			half _MotionLiteInfo;
			float _AI_Clip;
			float _AI_TextureBias;
			float _AI_Parallax;
			float _AI_ShadowBias;
			half _ImpostorEnd;
			half _IsShared;
			half _IsCustomShader;
			half _IsTVEShader;
			half _ImpostorMaskDefaultInfo;
			half _ImpostorMaskPackedInfo;
			half _ImpostorMaskShadingInfo;
			half _ImpostorMaskMode;
			half _ImpostorSpace0;
			half _ImpostorSpace1;
			half _ImpostorAlphaClipValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _SubsurfaceScatteringValue;
			half _IsVersion;
			half _RenderDecals;
			half _RenderSSR;
			half _CategoryRender;
			half _EndRender;
			half _IsInitialized;
			float _AI_ShadowView;
			float _AI_ForwardBias;
			float _AI_Frames;
			float _AI_DepthSize;
			half _TintingGlobalValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessIntensityValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _DrynessGlobalValue;
			half _SubsurfaceMultiValue;
			half _DrynessLumaValue;
			half _WetnessLiteInfo;
			half _WetnessCategory;
			half _TintingGrayValue;
			half _WetnessIntensityValue;
			half _TintingIntensityValue;
			half _TintingEnd;
			float _AI_ImpostorSize;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			half _MotionBaseTillingValue;
			half _MotionBaseSpeedValue;
			half _MotionBaseNoiseValue;
			half _MotionIntensityValue;
			half _MotionBaseDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _VariationNoiseTillingValue;
			half _TintingLiteInfo;
			half _TintingCategory;
			half _TintingSpace;
			half _SubsurfaceThicknessValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			TEXTURE2D(_MotionNoiseTex);
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_MotionParamsEditor;
			half _DisableSRPBatcher;
			TEXTURE2D(_Shader);
			TEXTURE2D(_Packed);
			TEXTURE2D(_Vertex);
			SAMPLER(sampler_Shader);
			SAMPLER(sampler_Packed);
			SAMPLER(sampler_Vertex);
			half4 TVE_AtmoParams;
			half TVE_IsEnabled;
			half4 TVE_GlowParams;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define AI_ObjectToWorld GetObjectToWorldMatrix()
			#define AI_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_CHANGES_WORLD_POS
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#pragma shader_feature_local _USE_PARALLAX_ON
			#pragma shader_feature_local _HEMI_ON
			#pragma shader_feature_local AI_CLIP_NEIGHBOURS_FRAMES
			#pragma shader_feature_local_vertex TVE_MOTION
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_IMPOSTOR_MASK_OFF TVE_IMPOSTOR_MASK_DEFAULT TVE_IMPOSTOR_MASK_PACKED TVE_IMPOSTOR_MASK_SHADING
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IMPOSTOR_SHADER
			//#define _USE_PARALLAX_ON
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 UVsFrame122_g156549 : TEXCOORD3;
				float4 UVsFrame222_g156549 : TEXCOORD4;
				float4 UVsFrame322_g156549 : TEXCOORD5;
				float4 octaframe22_g156549 : TEXCOORD6;
				float4 viewPos22_g156549 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			struct ImpostorOutput
			{
				half3 Albedo;
				half3 Specular;
				half Metallic;
				half3 WorldNormal;
				half Smoothness;
				half Occlusion;
				half3 Emission;
				half Alpha;
			};
			
			float2 VectorToOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, out float2 uvs, out float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			float2 VectorToHemiOctahedron( float3 N )
			{
				N.xy /= dot( 1.0, abs( N ) );
				return float2( N.x + N.y, N.x - N.y );
			}
			
			float3 HemiOctahedronToVector( float2 Oct )
			{
				Oct = float2( Oct.x + Oct.y, Oct.x - Oct.y ) * 0.5;
				float3 N = float3( Oct, 1 - dot( 1.0, abs( Oct ) ) );
				return normalize( N );
			}
			
			inline void OctaImpostorVertex( inout float3 positionOS, out float3 normalOS, out float4 tangentOS, out float4 uvsFrame1, out float4 uvsFrame2, out float4 uvsFrame3, out float4 octaFrame, out float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = AI_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = AI_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( AI_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				#if defined( _HEMI_ON )
				objectCameraDirection.y = max(0.001, objectCameraDirection.y);
				float2 frameOcta = VectorToHemiOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#else
				float2 frameOcta = VectorToOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#endif
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa1WorldY = HemiOctahedronToVector( octaFrame1 ).xzy;
				#else
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				#endif
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*out*/ uvFrame1, /*out*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa2WorldY = HemiOctahedronToVector( octaFrame2 ).xzy;
				#else
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				#endif
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*out*/ uvFrame2, /*out*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa3WorldY = HemiOctahedronToVector( octaFrame3 ).xzy;
				#else
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				#endif
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*out*/ uvFrame3, /*out*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				octaFrame.zw = fractionOctaFrame;
				#endif
				positionOS = billboard + _AI_Offset.xyz;
				normalOS = objectCameraDirection;
				tangentOS = float4( objectHorizontalVector, 1 );
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout ImpostorOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 viewPos, out float4 output0, out float4 output1, out float4 output2 )
			{
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, -1 );
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, -1 );
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, -1 );
				float2 parallax1_uv = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float2 parallax2_uv = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float2 parallax3_uv = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1_uv, _AI_TextureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2_uv, _AI_TextureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3_uv, _AI_TextureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1_uv - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2_uv, parallax3_uv ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * ( 1 - step_1 );
				step23 = step23 * ( 1 - step23 );
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				#endif
				o.Albedo = blendedAlbedo.rgb;
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1_uv, _AI_TextureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2_uv, _AI_TextureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3_uv, _AI_TextureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				o.WorldNormal = normalize( mul( (float3x3)AI_ObjectToWorld, localNormal ) );
				float depth = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 ) * _AI_DepthSize * length( AI_ObjectToWorld[ 2 ].xyz );
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax1_uv, _AI_TextureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax2_uv, _AI_TextureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax3_uv, _AI_TextureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax1_uv, _AI_TextureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax2_uv, _AI_TextureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax3_uv, _AI_TextureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float4 output2a = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax1_uv, _AI_TextureBias );
				float4 output2b = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax2_uv, _AI_TextureBias );
				float4 output2c = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax3_uv, _AI_TextureBias );
				output2 = output2a * weights.x  + output2b * weights.y + output2c * weights.z; 
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView - _AI_ShadowBias;
				#else 
				viewPos.z += depth + _AI_ForwardBias;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				#if defined(SHADERPASS) && defined(UNITY_PASS_SHADOWCASTER)
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#else
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				//refraction SceneSelectionPass
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = float3(0.0f, 0.0f, 1.0f);

			#if ( UNITY_VERSION <= 202236 )
				#if ( ASE_FRAGMENT_NORMAL == 1 )
					GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#elif ( ASE_FRAGMENT_NORMAL == 2 )
					GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#endif

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#else
				#ifdef DECAL_NORMAL_BLENDING
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif
			#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						surfaceData.metallic = 0;
					}
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS output;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				TVEModelData Data16_g158391 = (TVEModelData)0;
				float In_Dummy16_g158391 = 0.0;
				TVEModelData Data16_g158266 = (TVEModelData)0;
				half Dummy181_g158264 = ( ( _MotionCategory + _MotionEnd ) + _MotionLiteInfo );
				float In_Dummy16_g158266 = Dummy181_g158264;
				TVEModelData Data16_g157226 = (TVEModelData)0;
				float In_Dummy16_g157226 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS.xyz, inputMesh.normalOS.xyz, inputMesh.tangentOS, output.UVsFrame122_g156549, output.UVsFrame222_g156549, output.UVsFrame322_g156549, output.octaframe22_g156549, output.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( TransformObjectToWorld( inputMesh.positionOS.xyz ) );
				half3 Input_PositionWS319_g157220 = worldPosOut22_g156549;
				float3 worldToObj315_g157220 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS( Input_PositionWS319_g157220 ), 1 ) ).xyz;
				half3 Model_PositionOS316_g157220 = worldToObj315_g157220;
				float3 In_PositionOS16_g157226 = Model_PositionOS316_g157220;
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157226 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157226 = Model_PositionWO311_g157220;
				float3 In_PositionRawOS16_g157226 = Model_PositionOS316_g157220;
				float3 In_PositionAddOS16_g157226 = float3( 0,0,0 );
				float3 In_PivotOS16_g157226 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157223 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157223 = ( localObjectPosition_UNITY_MATRIX_M14_g157223 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157223 = localObjectPosition_UNITY_MATRIX_M14_g157223;
				#endif
				float3 vertexToFrag305_g157220 = staticSwitch13_g157223;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157226 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157226 = Model_PivotWO312_g157220;
				half3 Model_NormalOS313_g157220 = inputMesh.normalOS;
				float3 In_NormalOS16_g157226 = Model_NormalOS313_g157220;
				float3 ase_normalWS = TransformObjectToWorldNormal( inputMesh.normalOS );
				half3 Model_Normal_WS314_g157220 = ase_normalWS;
				float3 In_NormalWS16_g157226 = Model_Normal_WS314_g157220;
				float3 In_NormalRawOS16_g157226 = Model_NormalOS313_g157220;
				float3 In_NormalRawWS16_g157226 = Model_Normal_WS314_g157220;
				float4 In_TangentOS16_g157226 = float4( 0,1,0,1 );
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157226 = Model_ViewDirWS347_g157220;
				float4 In_VertexData16_g157226 = float4( 1,1,1,1 );
				float4 In_PhaseData16_g157226 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157226 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157226 = float4( 0,0,0,0 );
				{
				Data16_g157226.Dummy = In_Dummy16_g157226;
				Data16_g157226.PositionOS = In_PositionOS16_g157226;
				Data16_g157226.PositionWS = In_PositionWS16_g157226;
				Data16_g157226.PositionWO = In_PositionWO16_g157226;
				Data16_g157226.PositionRawOS = In_PositionRawOS16_g157226;
				Data16_g157226.PositionAddOS = In_PositionAddOS16_g157226;
				Data16_g157226.PivotOS = In_PivotOS16_g157226;
				Data16_g157226.PivotWS = In_PivotWS16_g157226;
				Data16_g157226.PivotWO = In_PivotWO16_g157226;
				Data16_g157226.NormalOS = In_NormalOS16_g157226;
				Data16_g157226.NormalWS = In_NormalWS16_g157226;
				Data16_g157226.NormalRawOS = In_NormalRawOS16_g157226;
				Data16_g157226.NormalRawWS = In_NormalRawWS16_g157226;
				Data16_g157226.TangentOS = In_TangentOS16_g157226;
				Data16_g157226.ViewDirWS = In_ViewDirWS16_g157226;
				Data16_g157226.VertexData = In_VertexData16_g157226;
				Data16_g157226.PhaseData = In_PhaseData16_g157226;
				Data16_g157226.BoundsData = In_BoundsData16_g157226;
				Data16_g157226.RotationData = In_RotationData16_g157226;
				}
				TVEModelData Data15_g158265 = Data16_g157226;
				float Out_Dummy15_g158265 = 0;
				float3 Out_PositionOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158265 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158265 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158265 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158265 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158265 = float3( 0,0,0 );
				float4 Out_VertexData15_g158265 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158265 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158265 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158265 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158265 = Data15_g158265.Dummy;
				Out_PositionOS15_g158265 = Data15_g158265.PositionOS;
				Out_PositionWS15_g158265 = Data15_g158265.PositionWS;
				Out_PositionWO15_g158265 = Data15_g158265.PositionWO;
				Out_PositionRawOS15_g158265 = Data15_g158265.PositionRawOS;
				Out_PositionAddOS15_g158265 = Data15_g158265.PositionAddOS;
				Out_PivotOS15_g158265 = Data15_g158265.PivotOS;
				Out_PivotWS15_g158265 = Data15_g158265.PivotWS;
				Out_PivotWO15_g158265 = Data15_g158265.PivotWO;
				Out_NormalOS15_g158265 = Data15_g158265.NormalOS;
				Out_NormalWS15_g158265 = Data15_g158265.NormalWS;
				Out_NormalRawOS15_g158265 = Data15_g158265.NormalRawOS;
				Out_NormalRawWS15_g158265 = Data15_g158265.NormalRawWS;
				Out_TangentOS15_g158265 = Data15_g158265.TangentOS;
				Out_ViewDirWS15_g158265 = Data15_g158265.ViewDirWS;
				Out_VertexData15_g158265 = Data15_g158265.VertexData;
				Out_PhaseData15_g158265 = Data15_g158265.PhaseData;
				Out_BoundsData15_g158265 = Data15_g158265.BoundsData;
				Out_RotationData15_g158265 = Data15_g158265.RotationData;
				}
				float3 temp_output_1567_0_g158264 = Out_PositionOS15_g158265;
				float3 In_PositionOS16_g158266 = temp_output_1567_0_g158264;
				float3 In_PositionWS16_g158266 = Out_PositionWS15_g158265;
				float3 temp_output_1567_17_g158264 = Out_PositionWO15_g158265;
				float3 In_PositionWO16_g158266 = temp_output_1567_17_g158264;
				float3 In_PositionRawOS16_g158266 = Out_PositionRawOS15_g158265;
				float3 In_PositionAddOS16_g158266 = Out_PositionAddOS15_g158265;
				float3 In_PivotOS16_g158266 = Out_PivotOS15_g158265;
				float3 In_PivotWS16_g158266 = Out_PivotWS15_g158265;
				float3 temp_output_1567_19_g158264 = Out_PivotWO15_g158265;
				float3 In_PivotWO16_g158266 = temp_output_1567_19_g158264;
				float3 In_NormalOS16_g158266 = Out_NormalOS15_g158265;
				float3 In_NormalWS16_g158266 = Out_NormalWS15_g158265;
				float3 In_NormalRawOS16_g158266 = Out_NormalRawOS15_g158265;
				float3 In_NormalRawWS16_g158266 = Out_NormalRawWS15_g158265;
				float4 In_TangentOS16_g158266 = Out_TangentOS15_g158265;
				float3 In_ViewDirWS16_g158266 = Out_ViewDirWS15_g158265;
				float4 In_VertexData16_g158266 = Out_VertexData15_g158265;
				float4 In_PhaseData16_g158266 = Out_PhaseData15_g158265;
				float4 In_BoundsData16_g158266 = Out_BoundsData15_g158265;
				half3 Model_PositionOS147_g158264 = temp_output_1567_0_g158264;
				half Base_Mask217_g158264 = saturate( ( Model_PositionOS147_g158264.y / _AI_Offset.y ) );
				float4 lerpResult836_g158275 = lerp( half4( 0, 1, 1, 0 ) , TVE_MotionParams , TVE_MotionParams.w);
				half2 Global_WindDirWS1663_g158264 = (lerpResult836_g158275).xy;
				half2 Input_WindDirWS803_g158268 = Global_WindDirWS1663_g158264;
				half3 Model_PositionWO162_g158264 = temp_output_1567_17_g158264;
				half3 Model_PivotWO402_g158264 = temp_output_1567_19_g158264;
				float3 lerpResult829_g158264 = lerp( Model_PositionWO162_g158264 , Model_PivotWO402_g158264 , _MotionBasePivotValue);
				half3 Base_Position1394_g158264 = lerpResult829_g158264;
				half3 Input_PositionWO419_g158268 = Base_Position1394_g158264;
				half Input_MotionTilling321_g158268 = ( _MotionBaseTillingValue + 0.2 );
				half2 Noise_Coord515_g158268 = ( -(Input_PositionWO419_g158268).xz * Input_MotionTilling321_g158268 * 0.005 );
				float2 temp_output_3_0_g158272 = Noise_Coord515_g158268;
				float2 temp_output_21_0_g158272 = Input_WindDirWS803_g158268;
				float mulTime113_g158271 = _TimeParameters.x * 0.02;
				float lerpResult128_g158271 = lerp( mulTime113_g158271 , ( ( mulTime113_g158271 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g158268 = _MotionBaseSpeedValue;
				half Noise_Speed516_g158268 = ( lerpResult128_g158271 * Input_MotionSpeed62_g158268 );
				float temp_output_15_0_g158272 = Noise_Speed516_g158268;
				float temp_output_23_0_g158272 = frac( temp_output_15_0_g158272 );
				float4 lerpResult39_g158272 = lerp( SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * temp_output_23_0_g158272 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * frac( ( temp_output_15_0_g158272 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_23_0_g158272 - 0.5 ) ) / 0.5 ));
				float4 temp_output_635_0_g158268 = lerpResult39_g158272;
				half2 Noise_DirWS825_g158268 = ((temp_output_635_0_g158268).rg*2.0 + -1.0);
				half Input_MotionNoise552_g158268 = _MotionBaseNoiseValue;
				half Global_WInd769_g158275 = (lerpResult836_g158275).z;
				float lerpResult853_g158275 = lerp( Global_WInd769_g158275 , saturate( (Global_WInd769_g158275*TVE_MotionParamsEditor.x + TVE_MotionParamsEditor.y) ) , TVE_MotionParamsEditor.w);
				half Input_MotionValue629_g158275 = _MotionIntensityValue;
				half Global_WindValue1664_g158264 = ( lerpResult853_g158275 * Input_MotionValue629_g158275 );
				half Input_WindValue853_g158268 = Global_WindValue1664_g158264;
				float lerpResult701_g158268 = lerp( 1.0 , Input_MotionNoise552_g158268 , Input_WindValue853_g158268);
				float2 lerpResult646_g158268 = lerp( Input_WindDirWS803_g158268 , Noise_DirWS825_g158268 , lerpResult701_g158268);
				half Input_MotionDelay753_g158268 = _MotionBaseDelayValue;
				float lerpResult756_g158268 = lerp( 1.0 , ( Input_WindValue853_g158268 * Input_WindValue853_g158268 ) , Input_MotionDelay753_g158268);
				half Wind_Delay815_g158268 = lerpResult756_g158268;
				float2 temp_output_809_0_g158268 = ( lerpResult646_g158268 * Input_WindValue853_g158268 * Wind_Delay815_g158268 );
				half2 Input_PushDirWS807_g158268 = float2( 1,0 );
				half Input_PushAlpha806_g158268 = ( 1.0 * 1.0 );
				float2 lerpResult811_g158268 = lerp( temp_output_809_0_g158268 , Input_PushDirWS807_g158268 , Input_PushAlpha806_g158268);
				#ifdef TVE_MOTION_ELEMENT
				float2 staticSwitch808_g158268 = lerpResult811_g158268;
				#else
				float2 staticSwitch808_g158268 = temp_output_809_0_g158268;
				#endif
				float2 temp_output_38_0_g158269 = staticSwitch808_g158268;
				float2 break83_g158269 = temp_output_38_0_g158269;
				float3 appendResult79_g158269 = (float3(break83_g158269.x , 0.0 , break83_g158269.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Bending893_g158264 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158269 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Base_Motion1440_g158264 = ( _MotionBaseIntensityValue * Base_Mask217_g158264 * Base_Bending893_g158264 );
				#ifdef TVE_MOTION
				float2 staticSwitch1651_g158264 = Base_Motion1440_g158264;
				#else
				float2 staticSwitch1651_g158264 = float2( 0,0 );
				#endif
				float4 appendResult1658_g158264 = (float4(staticSwitch1651_g158264 , 0.0 , 0.0));
				half4 Final_RoationData1570_g158264 = appendResult1658_g158264;
				float4 In_RotationData16_g158266 = Final_RoationData1570_g158264;
				{
				Data16_g158266.Dummy = In_Dummy16_g158266;
				Data16_g158266.PositionOS = In_PositionOS16_g158266;
				Data16_g158266.PositionWS = In_PositionWS16_g158266;
				Data16_g158266.PositionWO = In_PositionWO16_g158266;
				Data16_g158266.PositionRawOS = In_PositionRawOS16_g158266;
				Data16_g158266.PositionAddOS = In_PositionAddOS16_g158266;
				Data16_g158266.PivotOS = In_PivotOS16_g158266;
				Data16_g158266.PivotWS = In_PivotWS16_g158266;
				Data16_g158266.PivotWO = In_PivotWO16_g158266;
				Data16_g158266.NormalOS = In_NormalOS16_g158266;
				Data16_g158266.NormalWS = In_NormalWS16_g158266;
				Data16_g158266.NormalRawOS = In_NormalRawOS16_g158266;
				Data16_g158266.NormalRawWS = In_NormalRawWS16_g158266;
				Data16_g158266.TangentOS = In_TangentOS16_g158266;
				Data16_g158266.ViewDirWS = In_ViewDirWS16_g158266;
				Data16_g158266.VertexData = In_VertexData16_g158266;
				Data16_g158266.PhaseData = In_PhaseData16_g158266;
				Data16_g158266.BoundsData = In_BoundsData16_g158266;
				Data16_g158266.RotationData = In_RotationData16_g158266;
				}
				TVEModelData Data15_g158390 = Data16_g158266;
				float Out_Dummy15_g158390 = 0;
				float3 Out_PositionOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158390 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158390 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158390 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158390 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158390 = float3( 0,0,0 );
				float4 Out_VertexData15_g158390 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158390 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158390 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158390 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158390 = Data15_g158390.Dummy;
				Out_PositionOS15_g158390 = Data15_g158390.PositionOS;
				Out_PositionWS15_g158390 = Data15_g158390.PositionWS;
				Out_PositionWO15_g158390 = Data15_g158390.PositionWO;
				Out_PositionRawOS15_g158390 = Data15_g158390.PositionRawOS;
				Out_PositionAddOS15_g158390 = Data15_g158390.PositionAddOS;
				Out_PivotOS15_g158390 = Data15_g158390.PivotOS;
				Out_PivotWS15_g158390 = Data15_g158390.PivotWS;
				Out_PivotWO15_g158390 = Data15_g158390.PivotWO;
				Out_NormalOS15_g158390 = Data15_g158390.NormalOS;
				Out_NormalWS15_g158390 = Data15_g158390.NormalWS;
				Out_NormalRawOS15_g158390 = Data15_g158390.NormalRawOS;
				Out_NormalRawWS15_g158390 = Data15_g158390.NormalRawWS;
				Out_TangentOS15_g158390 = Data15_g158390.TangentOS;
				Out_ViewDirWS15_g158390 = Data15_g158390.ViewDirWS;
				Out_VertexData15_g158390 = Data15_g158390.VertexData;
				Out_PhaseData15_g158390 = Data15_g158390.PhaseData;
				Out_BoundsData15_g158390 = Data15_g158390.BoundsData;
				Out_RotationData15_g158390 = Data15_g158390.RotationData;
				}
				half3 Model_PositionOS147_g158389 = Out_PositionOS15_g158390;
				half3 VertexPos40_g158393 = Model_PositionOS147_g158389;
				float3 appendResult74_g158393 = (float3(VertexPos40_g158393.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158393 = appendResult74_g158393;
				float3 break84_g158393 = VertexPos40_g158393;
				float3 appendResult81_g158393 = (float3(0.0 , break84_g158393.y , break84_g158393.z));
				half3 VertexPosOtherAxis82_g158393 = appendResult81_g158393;
				float4 temp_output_1567_33_g158389 = Out_RotationData15_g158390;
				half4 Model_VertexBend1569_g158389 = temp_output_1567_33_g158389;
				float2 break1582_g158389 = (Model_VertexBend1569_g158389).xy;
				half Angle44_g158393 = break1582_g158389.y;
				half3 VertexPos40_g158396 = ( VertexPosRotationAxis50_g158393 + ( VertexPosOtherAxis82_g158393 * cos( Angle44_g158393 ) ) + ( cross( float3( 1, 0, 0 ) , VertexPosOtherAxis82_g158393 ) * sin( Angle44_g158393 ) ) );
				float3 appendResult74_g158396 = (float3(0.0 , 0.0 , VertexPos40_g158396.z));
				half3 VertexPosRotationAxis50_g158396 = appendResult74_g158396;
				float3 break84_g158396 = VertexPos40_g158396;
				float3 appendResult81_g158396 = (float3(break84_g158396.x , break84_g158396.y , 0.0));
				half3 VertexPosOtherAxis82_g158396 = appendResult81_g158396;
				half Angle44_g158396 = -break1582_g158389.x;
				float3 temp_output_1584_19_g158389 = ( VertexPosRotationAxis50_g158396 + ( VertexPosOtherAxis82_g158396 * cos( Angle44_g158396 ) ) + ( cross( float3( 0, 0, 1 ) , VertexPosOtherAxis82_g158396 ) * sin( Angle44_g158396 ) ) );
				float3 temp_output_6_0_g158395 = temp_output_1584_19_g158389;
				#ifdef TVE_MOTION
				float3 staticSwitch65_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch65_g158395 = Model_PositionOS147_g158389;
				#endif
				#ifdef TVE_CONFORM
				float3 staticSwitch69_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch69_g158395 = staticSwitch65_g158395;
				#endif
				float3 temp_output_1585_0_g158389 = staticSwitch69_g158395;
				float3 temp_output_1567_31_g158389 = Out_PositionAddOS15_g158390;
				half3 Model_PositionADD1568_g158389 = temp_output_1567_31_g158389;
				half3 Final_PositionOS178_g158389 = ( temp_output_1585_0_g158389 + Model_PositionADD1568_g158389 );
				float3 In_PositionOS16_g158391 = Final_PositionOS178_g158389;
				float3 In_PositionWS16_g158391 = Out_PositionWS15_g158390;
				float3 In_PositionWO16_g158391 = Out_PositionWO15_g158390;
				float3 In_PositionRawOS16_g158391 = Out_PositionRawOS15_g158390;
				float3 In_PositionAddOS16_g158391 = temp_output_1567_31_g158389;
				float3 In_PivotOS16_g158391 = Out_PivotOS15_g158390;
				float3 In_PivotWS16_g158391 = Out_PivotWS15_g158390;
				float3 In_PivotWO16_g158391 = Out_PivotWO15_g158390;
				float3 In_NormalOS16_g158391 = Out_NormalOS15_g158390;
				float3 In_NormalWS16_g158391 = Out_NormalWS15_g158390;
				float3 In_NormalRawOS16_g158391 = Out_NormalRawOS15_g158390;
				float3 In_NormalRawWS16_g158391 = Out_NormalRawWS15_g158390;
				float4 In_TangentOS16_g158391 = Out_TangentOS15_g158390;
				float3 In_ViewDirWS16_g158391 = Out_ViewDirWS15_g158390;
				float4 In_VertexData16_g158391 = Out_VertexData15_g158390;
				float4 In_PhaseData16_g158391 = Out_PhaseData15_g158390;
				float4 In_BoundsData16_g158391 = Out_BoundsData15_g158390;
				float4 In_RotationData16_g158391 = temp_output_1567_33_g158389;
				{
				Data16_g158391.Dummy = In_Dummy16_g158391;
				Data16_g158391.PositionOS = In_PositionOS16_g158391;
				Data16_g158391.PositionWS = In_PositionWS16_g158391;
				Data16_g158391.PositionWO = In_PositionWO16_g158391;
				Data16_g158391.PositionRawOS = In_PositionRawOS16_g158391;
				Data16_g158391.PositionAddOS = In_PositionAddOS16_g158391;
				Data16_g158391.PivotOS = In_PivotOS16_g158391;
				Data16_g158391.PivotWS = In_PivotWS16_g158391;
				Data16_g158391.PivotWO = In_PivotWO16_g158391;
				Data16_g158391.NormalOS = In_NormalOS16_g158391;
				Data16_g158391.NormalWS = In_NormalWS16_g158391;
				Data16_g158391.NormalRawOS = In_NormalRawOS16_g158391;
				Data16_g158391.NormalRawWS = In_NormalRawWS16_g158391;
				Data16_g158391.TangentOS = In_TangentOS16_g158391;
				Data16_g158391.ViewDirWS = In_ViewDirWS16_g158391;
				Data16_g158391.VertexData = In_VertexData16_g158391;
				Data16_g158391.PhaseData = In_PhaseData16_g158391;
				Data16_g158391.BoundsData = In_BoundsData16_g158391;
				Data16_g158391.RotationData = In_RotationData16_g158391;
				}
				TVEModelData Data15_g158419 = Data16_g158391;
				float Out_Dummy15_g158419 = 0;
				float3 Out_PositionOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158419 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158419 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158419 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158419 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158419 = float3( 0,0,0 );
				float4 Out_VertexData15_g158419 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158419 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158419 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158419 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158419 = Data15_g158419.Dummy;
				Out_PositionOS15_g158419 = Data15_g158419.PositionOS;
				Out_PositionWS15_g158419 = Data15_g158419.PositionWS;
				Out_PositionWO15_g158419 = Data15_g158419.PositionWO;
				Out_PositionRawOS15_g158419 = Data15_g158419.PositionRawOS;
				Out_PositionAddOS15_g158419 = Data15_g158419.PositionAddOS;
				Out_PivotOS15_g158419 = Data15_g158419.PivotOS;
				Out_PivotWS15_g158419 = Data15_g158419.PivotWS;
				Out_PivotWO15_g158419 = Data15_g158419.PivotWO;
				Out_NormalOS15_g158419 = Data15_g158419.NormalOS;
				Out_NormalWS15_g158419 = Data15_g158419.NormalWS;
				Out_NormalRawOS15_g158419 = Data15_g158419.NormalRawOS;
				Out_NormalRawWS15_g158419 = Data15_g158419.NormalRawWS;
				Out_TangentOS15_g158419 = Data15_g158419.TangentOS;
				Out_ViewDirWS15_g158419 = Data15_g158419.ViewDirWS;
				Out_VertexData15_g158419 = Data15_g158419.VertexData;
				Out_PhaseData15_g158419 = Data15_g158419.PhaseData;
				Out_BoundsData15_g158419 = Data15_g158419.BoundsData;
				Out_RotationData15_g158419 = Data15_g158419.RotationData;
				}
				float3 temp_output_31_0_g158407 = Out_PositionOS15_g158419;
				float3 temp_output_6_0_g158420 = ( temp_output_31_0_g158407 + _DisableSRPBatcher );
				float temp_output_371_0_g158324 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingGlobalValue + _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessGlobalValue + _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue + 0.0 ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue + _CutoutGlobalValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeScaleValue1 ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) + temp_output_371_0_g158324 );
				#ifdef TVE_DUMMY
				float3 staticSwitch14_g158420 = ( temp_output_6_0_g158420 + Dummy_Data505.r );
				#else
				float3 staticSwitch14_g158420 = temp_output_6_0_g158420;
				#endif
				
				float4 ase_positionCS = TransformWorldToHClip( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				output.ase_texcoord8 = ase_positionCS;
				output.ase_texcoord9.xyz = vertexToFrag305_g157220;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = staticSwitch14_g158420;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						, out float4 outColor : SV_Target0
						#if defined( ASE_DEPTH_WRITE_ON )
							, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half IsFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];

				float localBreakData4_g158410 = ( 0.0 );
				float localCompData3_g158401 = ( 0.0 );
				TVEVisualData Data3_g158401 = (TVEVisualData)0;
				half Dummy145_g158399 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) );
				float In_Dummy3_g158401 = Dummy145_g158399;
				float localBreakData4_g158400 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158292 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + 0.0 );
				float In_Dummy3_g158307 = Dummy145_g158292;
				float localBreakData4_g158296 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				half Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlayBakeInfo ) + 0.0 );
				float In_Dummy3_g158220 = Dummy594_g158217;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157228 = ( 0.0 );
				TVEVisualData Data3_g157228 = (TVEVisualData)0;
				float In_Dummy3_g157228 = 0.0;
				float4 output0 = 0;
				float4 output1 = 0;
				float4 output2 = 0;
				float4 ase_positionCS = packedInput.ase_texcoord8;
				ImpostorOutput io = ( ImpostorOutput )0;
				OctaImpostorFragment( io, ase_positionCS, PositionRWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1, output2 );
				float4 temp_cast_0 = (1.0).xxxx;
				half4 Input_Tex0377_g157220 = output0;
				half4 Input_Tex1379_g157220 = output1;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch403_g157220 = temp_cast_0;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch403_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch403_g157220 = temp_cast_0;
				#endif
				half Local_MultiMask249_g157220 = (staticSwitch403_g157220).b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( io.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157228 = Local_Albedo239_g157220;
				float3 In_AlbedoRaw3_g157228 = Local_Albedo239_g157220;
				float2 temp_cast_3 = (0.0).xx;
				float2 In_NormalTS3_g157228 = temp_cast_3;
				float3 In_NormalWS3_g157228 = io.WorldNormal;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 temp_cast_5 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch385_g157220 = temp_cast_4;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch385_g157220 = temp_cast_5;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch385_g157220 = temp_cast_4;
				#endif
				half Local_Metallic247_g157220 = (staticSwitch385_g157220).r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				float4 temp_cast_6 = (1.0).xxxx;
				float4 temp_cast_7 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch392_g157220 = temp_cast_6;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch392_g157220 = temp_cast_7;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch392_g157220 = temp_cast_6;
				#endif
				half Local_OcclusionOrEmissive248_g157220 = (staticSwitch392_g157220).g;
				float lerpResult431_g157220 = lerp( 1.0 , Local_OcclusionOrEmissive248_g157220 , _ImpostorOcclusionValue);
				#ifdef TVE_EMISSIVE
				float staticSwitch428_g157220 = 1.0;
				#else
				float staticSwitch428_g157220 = lerpResult431_g157220;
				#endif
				half Final_Occlusion424_g157220 = staticSwitch428_g157220;
				float4 temp_cast_8 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch408_g157220 = temp_cast_8;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch408_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch408_g157220 = temp_cast_8;
				#endif
				half Local_Smoothness250_g157220 = (staticSwitch408_g157220).a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , Final_Occlusion424_g157220 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157228 = appendResult257_g157220;
				float4 appendResult286_g157220 = (float4(Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , 1.0));
				float4 In_Emissive3_g157228 = appendResult286_g157220;
				float3 temp_output_3_0_g157221 = Local_Albedo239_g157220;
				float dotResult20_g157221 = dot( temp_output_3_0_g157221 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale268_g157220 = dotResult20_g157221;
				float In_Grayscale3_g157228 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157228 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157228 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157228 = 0.0;
				float In_AlphaFade3_g157228 = 1.0;
				float3 temp_cast_9 = (1.0).xxx;
				float3 In_Translucency3_g157228 = temp_cast_9;
				float In_Transmission3_g157228 = 1.0;
				float In_Thickness3_g157228 = 0.0;
				float In_Diffusion3_g157228 = 0.0;
				float In_Depth3_g157228 = ase_positionCS.z;
				{
				Data3_g157228.Dummy = In_Dummy3_g157228;
				Data3_g157228.Albedo = In_Albedo3_g157228;
				Data3_g157228.AlbedoRaw = In_AlbedoRaw3_g157228;
				Data3_g157228.NormalTS = In_NormalTS3_g157228;
				Data3_g157228.NormalWS = In_NormalWS3_g157228;
				Data3_g157228.Shader = In_Shader3_g157228;
				Data3_g157228.Emissive= In_Emissive3_g157228;
				Data3_g157228.MultiMask = In_MultiMask3_g157228;
				Data3_g157228.Grayscale = In_Grayscale3_g157228;
				Data3_g157228.Luminosity = In_Luminosity3_g157228;
				Data3_g157228.AlphaClip = In_AlphaClip3_g157228;
				Data3_g157228.AlphaFade = In_AlphaFade3_g157228;
				Data3_g157228.Translucency = In_Translucency3_g157228;
				Data3_g157228.Transmission = In_Transmission3_g157228;
				Data3_g157228.Thickness = In_Thickness3_g157228;
				Data3_g157228.Diffusion = In_Diffusion3_g157228;
				Data3_g157228.Depth = In_Depth3_g157228;
				}
				TVEVisualData Data4_g158218 = Data3_g157228;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				float Out_Depth4_g158218 = 0;
				{
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_AlbedoRaw4_g158218 = Data4_g158218.AlbedoRaw;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				Out_Depth4_g158218= Data4_g158218.Depth;
				}
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158231 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158237 = _OverlayProjRemap.x;
				float temp_output_9_0_g158237 = ( clampResult17_g158231 - temp_output_7_0_g158237 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158237 * _OverlayProjRemap.z ) + 0.0001 ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158232 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayLumaRemap.x;
				float temp_output_9_0_g158236 = ( clampResult17_g158232 - temp_output_7_0_g158236 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158236 * _OverlayLumaRemap.z ) + 0.0001 ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				TVEModelData Data16_g157227 = (TVEModelData)0;
				float In_Dummy16_g157227 = 0.0;
				half3 Input_PositionWS319_g157220 = GetAbsolutePositionWS( PositionRWS );
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157227 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157227 = Model_PositionWO311_g157220;
				float3 vertexToFrag305_g157220 = packedInput.ase_texcoord9.xyz;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157227 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157227 = Model_PivotWO312_g157220;
				half3 Model_Normal_WS314_g157220 = NormalWS;
				float3 In_NormalWS16_g157227 = Model_Normal_WS314_g157220;
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157227 = Model_ViewDirWS347_g157220;
				float4 temp_cast_10 = (1.0).xxxx;
				half4 Input_Tex2380_g157220 = output2;
				float4 appendResult420_g157220 = (float4((Input_Tex1379_g157220).rg , 1.0 , 1.0));
				float4 temp_cast_13 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch414_g157220 = temp_cast_10;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch414_g157220 = Input_Tex2380_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch414_g157220 = appendResult420_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch414_g157220 = temp_cast_13;
				#else
				float4 staticSwitch414_g157220 = temp_cast_10;
				#endif
				half4 Local_VertexColor422_g157220 = staticSwitch414_g157220;
				float4 In_VertexData16_g157227 = Local_VertexColor422_g157220;
				float4 In_BoundsData16_g157227 = float4( 1,1,1,1 );
				{
				Data16_g157227.Dummy = In_Dummy16_g157227;
				Data16_g157227.PositionWS = In_PositionWS16_g157227;
				Data16_g157227.PositionWO = In_PositionWO16_g157227;
				Data16_g157227.PivotWS = In_PivotWS16_g157227;
				Data16_g157227.PivotWO = In_PivotWO16_g157227;
				Data16_g157227.NormalWS = In_NormalWS16_g157227;
				Data16_g157227.ViewDirWS = In_ViewDirWS16_g157227;
				Data16_g157227.VertexData = In_VertexData16_g157227;
				Data16_g157227.BoundsData = In_BoundsData16_g157227;
				}
				TVEModelData Data15_g158228 = Data16_g157227;
				float Out_Dummy15_g158228 = 0;
				float3 Out_PositionWS15_g158228 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158228 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158228 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g158228 = float3( 0,0,0 );
				float4 Out_VertexData15_g158228 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158228 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158228 = Data15_g158228.Dummy;
				Out_PositionWS15_g158228 = Data15_g158228.PositionWS;
				Out_PositionWO15_g158228 = Data15_g158228.PositionWO;
				Out_PivotWS15_g158228 = Data15_g158228.PivotWS;
				Out_PivotWO15_g158228 = Data15_g158228.PivotWO;
				Out_NormalWS15_g158228 = Data15_g158228.NormalWS;
				Out_ViewDirWS15_g158228 = Data15_g158228.ViewDirWS;
				Out_VertexData15_g158228 = Data15_g158228.VertexData;
				Out_BoundsData15_g158228 = Data15_g158228.BoundsData;
				}
				half4 Model_VertexMasks791_g158217 = Out_VertexData15_g158228;
				float4 break792_g158217 = Model_VertexMasks791_g158217;
				float4 break33_g158229 = _overlay_vert_mode;
				float temp_output_30_0_g158229 = ( break792_g158217.x * break33_g158229.x );
				float temp_output_29_0_g158229 = ( break792_g158217.y * break33_g158229.y );
				float temp_output_31_0_g158229 = ( break792_g158217.z * break33_g158229.z );
				float temp_output_28_0_g158229 = ( temp_output_30_0_g158229 + temp_output_29_0_g158229 + temp_output_31_0_g158229 + ( break792_g158217.w * break33_g158229.w ) );
				float clampResult17_g158230 = clamp( temp_output_28_0_g158229 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayMeshRemap.x;
				float temp_output_9_0_g158238 = ( clampResult17_g158230 - temp_output_7_0_g158238 );
				float lerpResult879_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158238 * _OverlayMeshRemap.z ) + 0.0001 ) ) , _OverlayMeshValue);
				float temp_output_6_0_g158233 = lerpResult879_g158217;
				#ifdef TVE_DUMMY
				float staticSwitch14_g158233 = ( temp_output_6_0_g158233 + _OverlayMeshMode );
				#else
				float staticSwitch14_g158233 = temp_output_6_0_g158233;
				#endif
				half Overlay_VertMask801_g158217 = staticSwitch14_g158233;
				float lerpResult920_g158217 = lerp( 1.0 , ( TVE_AtmoParams.z * TVE_IsEnabled ) , _OverlayGlobalValue);
				half Overlay_MaskGlobal429_g158217 = lerpResult920_g158217;
				float temp_output_7_0_g158239 = _OverlayBlendRemap.x;
				float temp_output_9_0_g158239 = ( ( _OverlayIntensityValue * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ) - temp_output_7_0_g158239 );
				half Overlay_Mask494_g158217 = saturate( ( ( temp_output_9_0_g158239 * _OverlayBlendRemap.z ) + 0.0001 ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				float3 In_AlbedoRaw3_g158220 = Out_AlbedoRaw4_g158218;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				float In_Depth3_g158220 = Out_Depth4_g158218;
				{
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.AlbedoRaw = In_AlbedoRaw3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				Data3_g158220.Depth = In_Depth3_g158220;
				}
				TVEVisualData Data4_g158296 = Data3_g158220;
				float Out_Dummy4_g158296 = 0;
				float3 Out_Albedo4_g158296 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158296 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158296 = float2( 0,0 );
				float3 Out_NormalWS4_g158296 = float3( 0,0,0 );
				float4 Out_Shader4_g158296 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158296 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158296 = 0;
				float Out_Grayscale4_g158296 = 0;
				float Out_Luminosity4_g158296 = 0;
				float Out_AlphaClip4_g158296 = 0;
				float Out_AlphaFade4_g158296 = 0;
				float3 Out_Translucency4_g158296 = float3( 0,0,0 );
				float Out_Transmission4_g158296 = 0;
				float Out_Thickness4_g158296 = 0;
				float Out_Diffusion4_g158296 = 0;
				float Out_Depth4_g158296 = 0;
				{
				Out_Dummy4_g158296 = Data4_g158296.Dummy;
				Out_Albedo4_g158296 = Data4_g158296.Albedo;
				Out_AlbedoRaw4_g158296 = Data4_g158296.AlbedoRaw;
				Out_NormalTS4_g158296 = Data4_g158296.NormalTS;
				Out_NormalWS4_g158296 = Data4_g158296.NormalWS;
				Out_Shader4_g158296 = Data4_g158296.Shader;
				Out_Emissive4_g158296= Data4_g158296.Emissive;
				Out_MultiMask4_g158296 = Data4_g158296.MultiMask;
				Out_Grayscale4_g158296 = Data4_g158296.Grayscale;
				Out_Luminosity4_g158296= Data4_g158296.Luminosity;
				Out_AlphaClip4_g158296 = Data4_g158296.AlphaClip;
				Out_AlphaFade4_g158296 = Data4_g158296.AlphaFade;
				Out_Translucency4_g158296 = Data4_g158296.Translucency;
				Out_Transmission4_g158296 = Data4_g158296.Transmission;
				Out_Thickness4_g158296 = Data4_g158296.Thickness;
				Out_Diffusion4_g158296 = Data4_g158296.Diffusion;
				Out_Depth4_g158296= Data4_g158296.Depth;
				}
				float3 temp_output_297_0_g158292 = Out_Albedo4_g158296;
				float3 In_Albedo3_g158307 = temp_output_297_0_g158292;
				float3 temp_output_297_23_g158292 = Out_AlbedoRaw4_g158296;
				float3 In_AlbedoRaw3_g158307 = temp_output_297_23_g158292;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158296;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158296;
				float4 In_Shader3_g158307 = Out_Shader4_g158296;
				float4 temp_cast_15 = (0.0).xxxx;
				half4 Visual_Emissive255_g158292 = Out_Emissive4_g158296;
				half Emissive_MeshMask221_g158292 = 1.0;
				half Emissive_Mask103_g158292 = 1.0;
				float temp_output_279_0_g158292 = ( Emissive_MeshMask221_g158292 * Emissive_Mask103_g158292 );
				float3 appendResult293_g158292 = (float3(temp_output_279_0_g158292 , temp_output_279_0_g158292 , temp_output_279_0_g158292));
				half3 Local_EmissiveColor278_g158292 = appendResult293_g158292;
				float3 temp_output_316_0_g158292 = (TVE_GlowParams).xyz;
				float3 lerpResult299_g158292 = lerp( float3( 1,1,1 ) , temp_output_316_0_g158292 , ( _EmissiveGlobalValue * TVE_IsEnabled ));
				half3 Emissive_GlobalMask248_g158292 = lerpResult299_g158292;
				half3 Visual_AlbedoRaw306_g158292 = temp_output_297_23_g158292;
				float3 lerpResult307_g158292 = lerp( float3( 1,1,1 ) , Visual_AlbedoRaw306_g158292 , _EmissiveColorMode);
				half3 Local_EmissiveValue88_g158292 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158292 * lerpResult307_g158292 );
				half3 Emissive_Blend260_g158292 = ( ( (Visual_Emissive255_g158292).xyz * Local_EmissiveColor278_g158292 ) * Local_EmissiveValue88_g158292 );
				float3 temp_output_3_0_g158298 = Emissive_Blend260_g158292;
				float temp_output_15_0_g158298 = _emissive_power_value;
				float3 hdEmission22_g158298 = ASEGetEmissionHDRColor(temp_output_3_0_g158298,temp_output_15_0_g158298,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Local_EmissiveMask294_g158292 = temp_output_279_0_g158292;
				float4 appendResult295_g158292 = (float4(hdEmission22_g158298 , Local_EmissiveMask294_g158292));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158292 = appendResult295_g158292;
				#else
				float4 staticSwitch129_g158292 = temp_cast_15;
				#endif
				half4 Final_Emissive184_g158292 = staticSwitch129_g158292;
				float4 In_Emissive3_g158307 = Final_Emissive184_g158292;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158296;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158296;
				float temp_output_297_11_g158292 = Out_MultiMask4_g158296;
				float In_MultiMask3_g158307 = temp_output_297_11_g158292;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158296;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158296;
				float3 In_Translucency3_g158307 = Out_Translucency4_g158296;
				float In_Transmission3_g158307 = Out_Transmission4_g158296;
				float In_Thickness3_g158307 = Out_Thickness4_g158296;
				float In_Diffusion3_g158307 = Out_Diffusion4_g158296;
				float In_Depth3_g158307 = Out_Depth4_g158296;
				{
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.AlbedoRaw = In_AlbedoRaw3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				Data3_g158307.Depth = In_Depth3_g158307;
				}
				TVEVisualData Data4_g158400 = Data3_g158307;
				float Out_Dummy4_g158400 = 0;
				float3 Out_Albedo4_g158400 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158400 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158400 = float2( 0,0 );
				float3 Out_NormalWS4_g158400 = float3( 0,0,0 );
				float4 Out_Shader4_g158400 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158400 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158400 = 0;
				float Out_Grayscale4_g158400 = 0;
				float Out_Luminosity4_g158400 = 0;
				float Out_AlphaClip4_g158400 = 0;
				float Out_AlphaFade4_g158400 = 0;
				float3 Out_Translucency4_g158400 = float3( 0,0,0 );
				float Out_Transmission4_g158400 = 0;
				float Out_Thickness4_g158400 = 0;
				float Out_Diffusion4_g158400 = 0;
				float Out_Depth4_g158400 = 0;
				{
				Out_Dummy4_g158400 = Data4_g158400.Dummy;
				Out_Albedo4_g158400 = Data4_g158400.Albedo;
				Out_AlbedoRaw4_g158400 = Data4_g158400.AlbedoRaw;
				Out_NormalTS4_g158400 = Data4_g158400.NormalTS;
				Out_NormalWS4_g158400 = Data4_g158400.NormalWS;
				Out_Shader4_g158400 = Data4_g158400.Shader;
				Out_Emissive4_g158400= Data4_g158400.Emissive;
				Out_MultiMask4_g158400 = Data4_g158400.MultiMask;
				Out_Grayscale4_g158400 = Data4_g158400.Grayscale;
				Out_Luminosity4_g158400= Data4_g158400.Luminosity;
				Out_AlphaClip4_g158400 = Data4_g158400.AlphaClip;
				Out_AlphaFade4_g158400 = Data4_g158400.AlphaFade;
				Out_Translucency4_g158400 = Data4_g158400.Translucency;
				Out_Transmission4_g158400 = Data4_g158400.Transmission;
				Out_Thickness4_g158400 = Data4_g158400.Thickness;
				Out_Diffusion4_g158400 = Data4_g158400.Diffusion;
				Out_Depth4_g158400= Data4_g158400.Depth;
				}
				half3 Visual_Albedo199_g158399 = Out_Albedo4_g158400;
				half3 Final_Albedo312_g158399 = Visual_Albedo199_g158399;
				float3 In_Albedo3_g158401 = Final_Albedo312_g158399;
				float3 In_AlbedoRaw3_g158401 = Out_AlbedoRaw4_g158400;
				float2 In_NormalTS3_g158401 = Out_NormalTS4_g158400;
				float3 In_NormalWS3_g158401 = Out_NormalWS4_g158400;
				float4 In_Shader3_g158401 = Out_Shader4_g158400;
				float4 In_Emissive3_g158401 = Out_Emissive4_g158400;
				float In_Grayscale3_g158401 = Out_Grayscale4_g158400;
				float In_Luminosity3_g158401 = Out_Luminosity4_g158400;
				float temp_output_301_11_g158399 = Out_MultiMask4_g158400;
				float In_MultiMask3_g158401 = temp_output_301_11_g158399;
				float In_AlphaClip3_g158401 = Out_AlphaClip4_g158400;
				float In_AlphaFade3_g158401 = Out_AlphaFade4_g158400;
				float3 temp_cast_16 = (0.0).xxx;
				half3 Subsurface_Color264_g158399 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158399 );
				half Visual_Transmission138_g158399 = Out_Transmission4_g158400;
				half Subsurface_Value268_g158399 = _SubsurfaceIntensityValue;
				float lerpResult403_g158399 = lerp( 1.0 , TVE_GlowParams.w , ( _SubsurfaceGlobalValue * TVE_IsEnabled ));
				half Subsurface_GlobalMask369_g158399 = lerpResult403_g158399;
				half Visual_MultiMask292_g158399 = temp_output_301_11_g158399;
				float lerpResult293_g158399 = lerp( 1.0 , Visual_MultiMask292_g158399 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158399 = lerpResult293_g158399;
				half Custom_Mask363_g158399 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158399 = ( Visual_Transmission138_g158399 * Subsurface_Value268_g158399 * Subsurface_GlobalMask369_g158399 * Subsurface_MultiMask296_g158399 * Custom_Mask363_g158399 );
				#else
				float staticSwitch345_g158399 = 0.0;
				#endif
				half Final_Transmission269_g158399 = staticSwitch345_g158399;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158399 = ( Subsurface_Color264_g158399 * Final_Transmission269_g158399 * 10.0 );
				#else
				float3 staticSwitch348_g158399 = temp_cast_16;
				#endif
				half3 Final_Translucency254_g158399 = staticSwitch348_g158399;
				float3 In_Translucency3_g158401 = Final_Translucency254_g158399;
				float In_Transmission3_g158401 = Final_Transmission269_g158399;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158399 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158399 = 1.0;
				#endif
				half Final_Thickness275_g158399 = staticSwitch351_g158399;
				float In_Thickness3_g158401 = Final_Thickness275_g158399;
				float Final_Diffusion340_g158399 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158401 = Final_Diffusion340_g158399;
				float In_Depth3_g158401 = Out_Depth4_g158400;
				{
				Data3_g158401.Dummy = In_Dummy3_g158401;
				Data3_g158401.Albedo = In_Albedo3_g158401;
				Data3_g158401.AlbedoRaw = In_AlbedoRaw3_g158401;
				Data3_g158401.NormalTS = In_NormalTS3_g158401;
				Data3_g158401.NormalWS = In_NormalWS3_g158401;
				Data3_g158401.Shader = In_Shader3_g158401;
				Data3_g158401.Emissive= In_Emissive3_g158401;
				Data3_g158401.MultiMask = In_MultiMask3_g158401;
				Data3_g158401.Grayscale = In_Grayscale3_g158401;
				Data3_g158401.Luminosity = In_Luminosity3_g158401;
				Data3_g158401.AlphaClip = In_AlphaClip3_g158401;
				Data3_g158401.AlphaFade = In_AlphaFade3_g158401;
				Data3_g158401.Translucency = In_Translucency3_g158401;
				Data3_g158401.Transmission = In_Transmission3_g158401;
				Data3_g158401.Thickness = In_Thickness3_g158401;
				Data3_g158401.Diffusion = In_Diffusion3_g158401;
				Data3_g158401.Depth = In_Depth3_g158401;
				}
				TVEVisualData Data4_g158410 = Data3_g158401;
				float Out_Dummy4_g158410 = 0;
				float3 Out_Albedo4_g158410 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158410 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158410 = float2( 0,0 );
				float3 Out_NormalWS4_g158410 = float3( 0,0,0 );
				float4 Out_Shader4_g158410 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158410 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158410 = 0;
				float Out_Grayscale4_g158410 = 0;
				float Out_Luminosity4_g158410 = 0;
				float Out_AlphaClip4_g158410 = 0;
				float Out_AlphaFade4_g158410 = 0;
				float3 Out_Translucency4_g158410 = float3( 0,0,0 );
				float Out_Transmission4_g158410 = 0;
				float Out_Thickness4_g158410 = 0;
				float Out_Diffusion4_g158410 = 0;
				float Out_Depth4_g158410 = 0;
				{
				Out_Dummy4_g158410 = Data4_g158410.Dummy;
				Out_Albedo4_g158410 = Data4_g158410.Albedo;
				Out_AlbedoRaw4_g158410 = Data4_g158410.AlbedoRaw;
				Out_NormalTS4_g158410 = Data4_g158410.NormalTS;
				Out_NormalWS4_g158410 = Data4_g158410.NormalWS;
				Out_Shader4_g158410 = Data4_g158410.Shader;
				Out_Emissive4_g158410= Data4_g158410.Emissive;
				Out_MultiMask4_g158410 = Data4_g158410.MultiMask;
				Out_Grayscale4_g158410 = Data4_g158410.Grayscale;
				Out_Luminosity4_g158410= Data4_g158410.Luminosity;
				Out_AlphaClip4_g158410 = Data4_g158410.AlphaClip;
				Out_AlphaFade4_g158410 = Data4_g158410.AlphaFade;
				Out_Translucency4_g158410 = Data4_g158410.Translucency;
				Out_Transmission4_g158410 = Data4_g158410.Transmission;
				Out_Thickness4_g158410 = Data4_g158410.Thickness;
				Out_Diffusion4_g158410 = Data4_g158410.Diffusion;
				Out_Depth4_g158410= Data4_g158410.Depth;
				}
				

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;

				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = Out_Depth4_g158410;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			Cull [_CullMode]
			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local_fragment _ _DISABLE_SSR
			#define ASE_FRAGMENT_NORMAL 2
			#define ASE_DEPTH_WRITE_ON
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 140012
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

            #pragma multi_compile _ WRITE_NORMAL_BUFFER
            #pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
            #pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

            #define SHADERPASS SHADERPASS_DEPTH_ONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DitherColoring;
			half4 _OverlayLumaRemap;
			half4 _OverlayProjRemap;
			half4 _OverlayColor;
			half4 _DrynessColoring;
			half4 _TintingLumaRemap;
			half4 _ImpostorColor;
			half4 _overlay_vert_mode;
			half4 _ImpostorColorTwo;
			half4 _TintingColoring;
			half4 _SizeFadeColoring;
			float4 _AI_SizeOffset;
			half4 _VariationNoiseRemap;
			half4 _VariationColorOne;
			half4 _VariationColorTwo;
			float4 _TintingColor;
			half4 _OverlayMeshRemap;
			half4 _VariationColoring;
			float4 _DrynessColor;
			half4 _DrynessLumaRemap;
			half4 _EmissiveColor;
			half4 _OverlayBlendRemap;
			half4 _WetnessColoring;
			half4 _CutoutColoring;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			float3 _AI_Offset;
			float3 _AI_BoundsMin;
			float3 _AI_BoundsSize;
			half _SizeFadeCategory;
			half _CutoutLiteInfo;
			half _SizeFadeEnd;
			half _SizeFadeScaleValue1;
			half _SizeFadeLiteInfo;
			half _DitherNoiseTillingValue;
			half _CutoutCategory;
			half _DitherMultiValue;
			half _DitherShadowMode;
			half _DitherDistanceMaxValue;
			half _CutoutNoiseValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseTillingValue;
			half _CutoutGlobalValue;
			half _CutoutMultiValue;
			half _DitherLiteInfo;
			half _CutoutShadowMode;
			half _DitherDistanceMinValue;
			half _CutoutIntensityValue;
			half _DitherCategory;
			half _CutoutSpace;
			half _DitherEnd;
			half _DitherConstantValue;
			half _DitherDistanceValue;
			half _CutoutEnd;
			half _SizeFadeIntensityValue;
			half _ImpostorMaskOffInfo;
			half _SubsurfaceCategory;
			half _SizeFadeScaleValue;
			half _ImpostorSmoothnessValue;
			half _OverlayIntensityValue;
			half _OverlayProjValue;
			half _OverlayLumaValue;
			half _OverlayMeshValue;
			half _OverlayMeshMode;
			half _OverlayGlobalValue;
			half _OverlayNormalValue;
			half _OverlaySmoothnessValue;
			half _OverlaySubsurfaceValue;
			half _EmissiveIntensityValue;
			half _EmissiveGlobalValue;
			half _EmissiveColorMode;
			float _emissive_power_value;
			half _EmissiveExposureValue;
			half _SubsurfaceIntensityValue;
			half _SubsurfaceGlobalValue;
			half _ImpostorOcclusionValue;
			half _SizeFadeScaleMode;
			half _ImpostorMetallicValue;
			half _OverlayBakeInfo;
			half _SizeFadeDistMinValue;
			half _SizeFadeDistMaxValue;
			half _GlobalLiteInfo;
			half _GlobalCategory;
			half _GlobalEnd;
			half _WetnessSmoothnessValue;
			half _SubsurfaceEnd;
			half _SubsurfaceDirectValue;
			half _SubsurfaceNormalValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _EmissiveCategory;
			half _EmissiveEnd;
			half _EmissivePowerMode;
			half _EmissivePowerValue;
			half _OverlayCategory;
			half _OverlayEnd;
			half _ImpostorColorMode;
			half _WetnessContrastValue;
			half _DrynessMultiValue;
			half _WetnessEnd;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsCollected;
			half _IsLiteShader;
			half _MotionCategory;
			half _MotionEnd;
			half _MotionLiteInfo;
			float _AI_Clip;
			float _AI_TextureBias;
			float _AI_Parallax;
			float _AI_ShadowBias;
			half _ImpostorEnd;
			half _IsShared;
			half _IsCustomShader;
			half _IsTVEShader;
			half _ImpostorMaskDefaultInfo;
			half _ImpostorMaskPackedInfo;
			half _ImpostorMaskShadingInfo;
			half _ImpostorMaskMode;
			half _ImpostorSpace0;
			half _ImpostorSpace1;
			half _ImpostorAlphaClipValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _SubsurfaceScatteringValue;
			half _IsVersion;
			half _RenderDecals;
			half _RenderSSR;
			half _CategoryRender;
			half _EndRender;
			half _IsInitialized;
			float _AI_ShadowView;
			float _AI_ForwardBias;
			float _AI_Frames;
			float _AI_DepthSize;
			half _TintingGlobalValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessIntensityValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _DrynessGlobalValue;
			half _SubsurfaceMultiValue;
			half _DrynessLumaValue;
			half _WetnessLiteInfo;
			half _WetnessCategory;
			half _TintingGrayValue;
			half _WetnessIntensityValue;
			half _TintingIntensityValue;
			half _TintingEnd;
			float _AI_ImpostorSize;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			half _MotionBaseTillingValue;
			half _MotionBaseSpeedValue;
			half _MotionBaseNoiseValue;
			half _MotionIntensityValue;
			half _MotionBaseDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _VariationNoiseTillingValue;
			half _TintingLiteInfo;
			half _TintingCategory;
			half _TintingSpace;
			half _SubsurfaceThicknessValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			TEXTURE2D(_MotionNoiseTex);
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_MotionParamsEditor;
			half _DisableSRPBatcher;
			TEXTURE2D(_Shader);
			TEXTURE2D(_Packed);
			TEXTURE2D(_Vertex);
			SAMPLER(sampler_Shader);
			SAMPLER(sampler_Packed);
			SAMPLER(sampler_Vertex);
			half4 TVE_AtmoParams;
			half TVE_IsEnabled;
			half4 TVE_GlowParams;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define AI_ObjectToWorld GetObjectToWorldMatrix()
			#define AI_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_CHANGES_WORLD_POS
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_CLIP_POS
			#define ASE_NEEDS_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#pragma shader_feature_local _USE_PARALLAX_ON
			#pragma shader_feature_local _HEMI_ON
			#pragma shader_feature_local AI_CLIP_NEIGHBOURS_FRAMES
			#pragma shader_feature_local_vertex TVE_MOTION
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_IMPOSTOR_MASK_OFF TVE_IMPOSTOR_MASK_DEFAULT TVE_IMPOSTOR_MASK_PACKED TVE_IMPOSTOR_MASK_SHADING
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IMPOSTOR_SHADER
			//#define _USE_PARALLAX_ON
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 UVsFrame122_g156549 : TEXCOORD3;
				float4 UVsFrame222_g156549 : TEXCOORD4;
				float4 UVsFrame322_g156549 : TEXCOORD5;
				float4 octaframe22_g156549 : TEXCOORD6;
				float4 viewPos22_g156549 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			struct ImpostorOutput
			{
				half3 Albedo;
				half3 Specular;
				half Metallic;
				half3 WorldNormal;
				half Smoothness;
				half Occlusion;
				half3 Emission;
				half Alpha;
			};
			
			float2 VectorToOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, out float2 uvs, out float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			float2 VectorToHemiOctahedron( float3 N )
			{
				N.xy /= dot( 1.0, abs( N ) );
				return float2( N.x + N.y, N.x - N.y );
			}
			
			float3 HemiOctahedronToVector( float2 Oct )
			{
				Oct = float2( Oct.x + Oct.y, Oct.x - Oct.y ) * 0.5;
				float3 N = float3( Oct, 1 - dot( 1.0, abs( Oct ) ) );
				return normalize( N );
			}
			
			inline void OctaImpostorVertex( inout float3 positionOS, out float3 normalOS, out float4 tangentOS, out float4 uvsFrame1, out float4 uvsFrame2, out float4 uvsFrame3, out float4 octaFrame, out float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = AI_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = AI_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( AI_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				#if defined( _HEMI_ON )
				objectCameraDirection.y = max(0.001, objectCameraDirection.y);
				float2 frameOcta = VectorToHemiOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#else
				float2 frameOcta = VectorToOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#endif
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa1WorldY = HemiOctahedronToVector( octaFrame1 ).xzy;
				#else
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				#endif
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*out*/ uvFrame1, /*out*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa2WorldY = HemiOctahedronToVector( octaFrame2 ).xzy;
				#else
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				#endif
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*out*/ uvFrame2, /*out*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa3WorldY = HemiOctahedronToVector( octaFrame3 ).xzy;
				#else
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				#endif
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*out*/ uvFrame3, /*out*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				octaFrame.zw = fractionOctaFrame;
				#endif
				positionOS = billboard + _AI_Offset.xyz;
				normalOS = objectCameraDirection;
				tangentOS = float4( objectHorizontalVector, 1 );
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout ImpostorOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 viewPos, out float4 output0, out float4 output1, out float4 output2 )
			{
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, -1 );
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, -1 );
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, -1 );
				float2 parallax1_uv = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float2 parallax2_uv = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float2 parallax3_uv = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1_uv, _AI_TextureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2_uv, _AI_TextureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3_uv, _AI_TextureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1_uv - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2_uv, parallax3_uv ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * ( 1 - step_1 );
				step23 = step23 * ( 1 - step23 );
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				#endif
				o.Albedo = blendedAlbedo.rgb;
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1_uv, _AI_TextureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2_uv, _AI_TextureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3_uv, _AI_TextureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				o.WorldNormal = normalize( mul( (float3x3)AI_ObjectToWorld, localNormal ) );
				float depth = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 ) * _AI_DepthSize * length( AI_ObjectToWorld[ 2 ].xyz );
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax1_uv, _AI_TextureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax2_uv, _AI_TextureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax3_uv, _AI_TextureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax1_uv, _AI_TextureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax2_uv, _AI_TextureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax3_uv, _AI_TextureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float4 output2a = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax1_uv, _AI_TextureBias );
				float4 output2b = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax2_uv, _AI_TextureBias );
				float4 output2c = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax3_uv, _AI_TextureBias );
				output2 = output2a * weights.x  + output2b * weights.y + output2c * weights.z; 
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView - _AI_ShadowBias;
				#else 
				viewPos.z += depth + _AI_ForwardBias;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				#if defined(SHADERPASS) && defined(UNITY_PASS_SHADOWCASTER)
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#else
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = surfaceDescription.Normal;

			#if ( UNITY_VERSION <= 202236 )
				#if ( ASE_FRAGMENT_NORMAL == 1 )
					GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#elif ( ASE_FRAGMENT_NORMAL == 2 )
					GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#endif

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#else
				#ifdef DECAL_NORMAL_BLENDING
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif
			#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						surfaceData.metallic = 0;
					}
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS output;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				TVEModelData Data16_g158391 = (TVEModelData)0;
				float In_Dummy16_g158391 = 0.0;
				TVEModelData Data16_g158266 = (TVEModelData)0;
				half Dummy181_g158264 = ( ( _MotionCategory + _MotionEnd ) + _MotionLiteInfo );
				float In_Dummy16_g158266 = Dummy181_g158264;
				TVEModelData Data16_g157226 = (TVEModelData)0;
				float In_Dummy16_g157226 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS.xyz, inputMesh.normalOS.xyz, inputMesh.tangentOS, output.UVsFrame122_g156549, output.UVsFrame222_g156549, output.UVsFrame322_g156549, output.octaframe22_g156549, output.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( TransformObjectToWorld( inputMesh.positionOS.xyz ) );
				half3 Input_PositionWS319_g157220 = worldPosOut22_g156549;
				float3 worldToObj315_g157220 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS( Input_PositionWS319_g157220 ), 1 ) ).xyz;
				half3 Model_PositionOS316_g157220 = worldToObj315_g157220;
				float3 In_PositionOS16_g157226 = Model_PositionOS316_g157220;
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157226 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157226 = Model_PositionWO311_g157220;
				float3 In_PositionRawOS16_g157226 = Model_PositionOS316_g157220;
				float3 In_PositionAddOS16_g157226 = float3( 0,0,0 );
				float3 In_PivotOS16_g157226 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157223 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157223 = ( localObjectPosition_UNITY_MATRIX_M14_g157223 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157223 = localObjectPosition_UNITY_MATRIX_M14_g157223;
				#endif
				float3 vertexToFrag305_g157220 = staticSwitch13_g157223;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157226 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157226 = Model_PivotWO312_g157220;
				half3 Model_NormalOS313_g157220 = inputMesh.normalOS;
				float3 In_NormalOS16_g157226 = Model_NormalOS313_g157220;
				float3 ase_normalWS = TransformObjectToWorldNormal( inputMesh.normalOS );
				half3 Model_Normal_WS314_g157220 = ase_normalWS;
				float3 In_NormalWS16_g157226 = Model_Normal_WS314_g157220;
				float3 In_NormalRawOS16_g157226 = Model_NormalOS313_g157220;
				float3 In_NormalRawWS16_g157226 = Model_Normal_WS314_g157220;
				float4 In_TangentOS16_g157226 = float4( 0,1,0,1 );
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157226 = Model_ViewDirWS347_g157220;
				float4 In_VertexData16_g157226 = float4( 1,1,1,1 );
				float4 In_PhaseData16_g157226 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157226 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157226 = float4( 0,0,0,0 );
				{
				Data16_g157226.Dummy = In_Dummy16_g157226;
				Data16_g157226.PositionOS = In_PositionOS16_g157226;
				Data16_g157226.PositionWS = In_PositionWS16_g157226;
				Data16_g157226.PositionWO = In_PositionWO16_g157226;
				Data16_g157226.PositionRawOS = In_PositionRawOS16_g157226;
				Data16_g157226.PositionAddOS = In_PositionAddOS16_g157226;
				Data16_g157226.PivotOS = In_PivotOS16_g157226;
				Data16_g157226.PivotWS = In_PivotWS16_g157226;
				Data16_g157226.PivotWO = In_PivotWO16_g157226;
				Data16_g157226.NormalOS = In_NormalOS16_g157226;
				Data16_g157226.NormalWS = In_NormalWS16_g157226;
				Data16_g157226.NormalRawOS = In_NormalRawOS16_g157226;
				Data16_g157226.NormalRawWS = In_NormalRawWS16_g157226;
				Data16_g157226.TangentOS = In_TangentOS16_g157226;
				Data16_g157226.ViewDirWS = In_ViewDirWS16_g157226;
				Data16_g157226.VertexData = In_VertexData16_g157226;
				Data16_g157226.PhaseData = In_PhaseData16_g157226;
				Data16_g157226.BoundsData = In_BoundsData16_g157226;
				Data16_g157226.RotationData = In_RotationData16_g157226;
				}
				TVEModelData Data15_g158265 = Data16_g157226;
				float Out_Dummy15_g158265 = 0;
				float3 Out_PositionOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158265 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158265 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158265 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158265 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158265 = float3( 0,0,0 );
				float4 Out_VertexData15_g158265 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158265 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158265 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158265 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158265 = Data15_g158265.Dummy;
				Out_PositionOS15_g158265 = Data15_g158265.PositionOS;
				Out_PositionWS15_g158265 = Data15_g158265.PositionWS;
				Out_PositionWO15_g158265 = Data15_g158265.PositionWO;
				Out_PositionRawOS15_g158265 = Data15_g158265.PositionRawOS;
				Out_PositionAddOS15_g158265 = Data15_g158265.PositionAddOS;
				Out_PivotOS15_g158265 = Data15_g158265.PivotOS;
				Out_PivotWS15_g158265 = Data15_g158265.PivotWS;
				Out_PivotWO15_g158265 = Data15_g158265.PivotWO;
				Out_NormalOS15_g158265 = Data15_g158265.NormalOS;
				Out_NormalWS15_g158265 = Data15_g158265.NormalWS;
				Out_NormalRawOS15_g158265 = Data15_g158265.NormalRawOS;
				Out_NormalRawWS15_g158265 = Data15_g158265.NormalRawWS;
				Out_TangentOS15_g158265 = Data15_g158265.TangentOS;
				Out_ViewDirWS15_g158265 = Data15_g158265.ViewDirWS;
				Out_VertexData15_g158265 = Data15_g158265.VertexData;
				Out_PhaseData15_g158265 = Data15_g158265.PhaseData;
				Out_BoundsData15_g158265 = Data15_g158265.BoundsData;
				Out_RotationData15_g158265 = Data15_g158265.RotationData;
				}
				float3 temp_output_1567_0_g158264 = Out_PositionOS15_g158265;
				float3 In_PositionOS16_g158266 = temp_output_1567_0_g158264;
				float3 In_PositionWS16_g158266 = Out_PositionWS15_g158265;
				float3 temp_output_1567_17_g158264 = Out_PositionWO15_g158265;
				float3 In_PositionWO16_g158266 = temp_output_1567_17_g158264;
				float3 In_PositionRawOS16_g158266 = Out_PositionRawOS15_g158265;
				float3 In_PositionAddOS16_g158266 = Out_PositionAddOS15_g158265;
				float3 In_PivotOS16_g158266 = Out_PivotOS15_g158265;
				float3 In_PivotWS16_g158266 = Out_PivotWS15_g158265;
				float3 temp_output_1567_19_g158264 = Out_PivotWO15_g158265;
				float3 In_PivotWO16_g158266 = temp_output_1567_19_g158264;
				float3 In_NormalOS16_g158266 = Out_NormalOS15_g158265;
				float3 In_NormalWS16_g158266 = Out_NormalWS15_g158265;
				float3 In_NormalRawOS16_g158266 = Out_NormalRawOS15_g158265;
				float3 In_NormalRawWS16_g158266 = Out_NormalRawWS15_g158265;
				float4 In_TangentOS16_g158266 = Out_TangentOS15_g158265;
				float3 In_ViewDirWS16_g158266 = Out_ViewDirWS15_g158265;
				float4 In_VertexData16_g158266 = Out_VertexData15_g158265;
				float4 In_PhaseData16_g158266 = Out_PhaseData15_g158265;
				float4 In_BoundsData16_g158266 = Out_BoundsData15_g158265;
				half3 Model_PositionOS147_g158264 = temp_output_1567_0_g158264;
				half Base_Mask217_g158264 = saturate( ( Model_PositionOS147_g158264.y / _AI_Offset.y ) );
				float4 lerpResult836_g158275 = lerp( half4( 0, 1, 1, 0 ) , TVE_MotionParams , TVE_MotionParams.w);
				half2 Global_WindDirWS1663_g158264 = (lerpResult836_g158275).xy;
				half2 Input_WindDirWS803_g158268 = Global_WindDirWS1663_g158264;
				half3 Model_PositionWO162_g158264 = temp_output_1567_17_g158264;
				half3 Model_PivotWO402_g158264 = temp_output_1567_19_g158264;
				float3 lerpResult829_g158264 = lerp( Model_PositionWO162_g158264 , Model_PivotWO402_g158264 , _MotionBasePivotValue);
				half3 Base_Position1394_g158264 = lerpResult829_g158264;
				half3 Input_PositionWO419_g158268 = Base_Position1394_g158264;
				half Input_MotionTilling321_g158268 = ( _MotionBaseTillingValue + 0.2 );
				half2 Noise_Coord515_g158268 = ( -(Input_PositionWO419_g158268).xz * Input_MotionTilling321_g158268 * 0.005 );
				float2 temp_output_3_0_g158272 = Noise_Coord515_g158268;
				float2 temp_output_21_0_g158272 = Input_WindDirWS803_g158268;
				float mulTime113_g158271 = _TimeParameters.x * 0.02;
				float lerpResult128_g158271 = lerp( mulTime113_g158271 , ( ( mulTime113_g158271 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g158268 = _MotionBaseSpeedValue;
				half Noise_Speed516_g158268 = ( lerpResult128_g158271 * Input_MotionSpeed62_g158268 );
				float temp_output_15_0_g158272 = Noise_Speed516_g158268;
				float temp_output_23_0_g158272 = frac( temp_output_15_0_g158272 );
				float4 lerpResult39_g158272 = lerp( SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * temp_output_23_0_g158272 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * frac( ( temp_output_15_0_g158272 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_23_0_g158272 - 0.5 ) ) / 0.5 ));
				float4 temp_output_635_0_g158268 = lerpResult39_g158272;
				half2 Noise_DirWS825_g158268 = ((temp_output_635_0_g158268).rg*2.0 + -1.0);
				half Input_MotionNoise552_g158268 = _MotionBaseNoiseValue;
				half Global_WInd769_g158275 = (lerpResult836_g158275).z;
				float lerpResult853_g158275 = lerp( Global_WInd769_g158275 , saturate( (Global_WInd769_g158275*TVE_MotionParamsEditor.x + TVE_MotionParamsEditor.y) ) , TVE_MotionParamsEditor.w);
				half Input_MotionValue629_g158275 = _MotionIntensityValue;
				half Global_WindValue1664_g158264 = ( lerpResult853_g158275 * Input_MotionValue629_g158275 );
				half Input_WindValue853_g158268 = Global_WindValue1664_g158264;
				float lerpResult701_g158268 = lerp( 1.0 , Input_MotionNoise552_g158268 , Input_WindValue853_g158268);
				float2 lerpResult646_g158268 = lerp( Input_WindDirWS803_g158268 , Noise_DirWS825_g158268 , lerpResult701_g158268);
				half Input_MotionDelay753_g158268 = _MotionBaseDelayValue;
				float lerpResult756_g158268 = lerp( 1.0 , ( Input_WindValue853_g158268 * Input_WindValue853_g158268 ) , Input_MotionDelay753_g158268);
				half Wind_Delay815_g158268 = lerpResult756_g158268;
				float2 temp_output_809_0_g158268 = ( lerpResult646_g158268 * Input_WindValue853_g158268 * Wind_Delay815_g158268 );
				half2 Input_PushDirWS807_g158268 = float2( 1,0 );
				half Input_PushAlpha806_g158268 = ( 1.0 * 1.0 );
				float2 lerpResult811_g158268 = lerp( temp_output_809_0_g158268 , Input_PushDirWS807_g158268 , Input_PushAlpha806_g158268);
				#ifdef TVE_MOTION_ELEMENT
				float2 staticSwitch808_g158268 = lerpResult811_g158268;
				#else
				float2 staticSwitch808_g158268 = temp_output_809_0_g158268;
				#endif
				float2 temp_output_38_0_g158269 = staticSwitch808_g158268;
				float2 break83_g158269 = temp_output_38_0_g158269;
				float3 appendResult79_g158269 = (float3(break83_g158269.x , 0.0 , break83_g158269.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Bending893_g158264 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158269 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Base_Motion1440_g158264 = ( _MotionBaseIntensityValue * Base_Mask217_g158264 * Base_Bending893_g158264 );
				#ifdef TVE_MOTION
				float2 staticSwitch1651_g158264 = Base_Motion1440_g158264;
				#else
				float2 staticSwitch1651_g158264 = float2( 0,0 );
				#endif
				float4 appendResult1658_g158264 = (float4(staticSwitch1651_g158264 , 0.0 , 0.0));
				half4 Final_RoationData1570_g158264 = appendResult1658_g158264;
				float4 In_RotationData16_g158266 = Final_RoationData1570_g158264;
				{
				Data16_g158266.Dummy = In_Dummy16_g158266;
				Data16_g158266.PositionOS = In_PositionOS16_g158266;
				Data16_g158266.PositionWS = In_PositionWS16_g158266;
				Data16_g158266.PositionWO = In_PositionWO16_g158266;
				Data16_g158266.PositionRawOS = In_PositionRawOS16_g158266;
				Data16_g158266.PositionAddOS = In_PositionAddOS16_g158266;
				Data16_g158266.PivotOS = In_PivotOS16_g158266;
				Data16_g158266.PivotWS = In_PivotWS16_g158266;
				Data16_g158266.PivotWO = In_PivotWO16_g158266;
				Data16_g158266.NormalOS = In_NormalOS16_g158266;
				Data16_g158266.NormalWS = In_NormalWS16_g158266;
				Data16_g158266.NormalRawOS = In_NormalRawOS16_g158266;
				Data16_g158266.NormalRawWS = In_NormalRawWS16_g158266;
				Data16_g158266.TangentOS = In_TangentOS16_g158266;
				Data16_g158266.ViewDirWS = In_ViewDirWS16_g158266;
				Data16_g158266.VertexData = In_VertexData16_g158266;
				Data16_g158266.PhaseData = In_PhaseData16_g158266;
				Data16_g158266.BoundsData = In_BoundsData16_g158266;
				Data16_g158266.RotationData = In_RotationData16_g158266;
				}
				TVEModelData Data15_g158390 = Data16_g158266;
				float Out_Dummy15_g158390 = 0;
				float3 Out_PositionOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158390 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158390 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158390 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158390 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158390 = float3( 0,0,0 );
				float4 Out_VertexData15_g158390 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158390 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158390 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158390 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158390 = Data15_g158390.Dummy;
				Out_PositionOS15_g158390 = Data15_g158390.PositionOS;
				Out_PositionWS15_g158390 = Data15_g158390.PositionWS;
				Out_PositionWO15_g158390 = Data15_g158390.PositionWO;
				Out_PositionRawOS15_g158390 = Data15_g158390.PositionRawOS;
				Out_PositionAddOS15_g158390 = Data15_g158390.PositionAddOS;
				Out_PivotOS15_g158390 = Data15_g158390.PivotOS;
				Out_PivotWS15_g158390 = Data15_g158390.PivotWS;
				Out_PivotWO15_g158390 = Data15_g158390.PivotWO;
				Out_NormalOS15_g158390 = Data15_g158390.NormalOS;
				Out_NormalWS15_g158390 = Data15_g158390.NormalWS;
				Out_NormalRawOS15_g158390 = Data15_g158390.NormalRawOS;
				Out_NormalRawWS15_g158390 = Data15_g158390.NormalRawWS;
				Out_TangentOS15_g158390 = Data15_g158390.TangentOS;
				Out_ViewDirWS15_g158390 = Data15_g158390.ViewDirWS;
				Out_VertexData15_g158390 = Data15_g158390.VertexData;
				Out_PhaseData15_g158390 = Data15_g158390.PhaseData;
				Out_BoundsData15_g158390 = Data15_g158390.BoundsData;
				Out_RotationData15_g158390 = Data15_g158390.RotationData;
				}
				half3 Model_PositionOS147_g158389 = Out_PositionOS15_g158390;
				half3 VertexPos40_g158393 = Model_PositionOS147_g158389;
				float3 appendResult74_g158393 = (float3(VertexPos40_g158393.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158393 = appendResult74_g158393;
				float3 break84_g158393 = VertexPos40_g158393;
				float3 appendResult81_g158393 = (float3(0.0 , break84_g158393.y , break84_g158393.z));
				half3 VertexPosOtherAxis82_g158393 = appendResult81_g158393;
				float4 temp_output_1567_33_g158389 = Out_RotationData15_g158390;
				half4 Model_VertexBend1569_g158389 = temp_output_1567_33_g158389;
				float2 break1582_g158389 = (Model_VertexBend1569_g158389).xy;
				half Angle44_g158393 = break1582_g158389.y;
				half3 VertexPos40_g158396 = ( VertexPosRotationAxis50_g158393 + ( VertexPosOtherAxis82_g158393 * cos( Angle44_g158393 ) ) + ( cross( float3( 1, 0, 0 ) , VertexPosOtherAxis82_g158393 ) * sin( Angle44_g158393 ) ) );
				float3 appendResult74_g158396 = (float3(0.0 , 0.0 , VertexPos40_g158396.z));
				half3 VertexPosRotationAxis50_g158396 = appendResult74_g158396;
				float3 break84_g158396 = VertexPos40_g158396;
				float3 appendResult81_g158396 = (float3(break84_g158396.x , break84_g158396.y , 0.0));
				half3 VertexPosOtherAxis82_g158396 = appendResult81_g158396;
				half Angle44_g158396 = -break1582_g158389.x;
				float3 temp_output_1584_19_g158389 = ( VertexPosRotationAxis50_g158396 + ( VertexPosOtherAxis82_g158396 * cos( Angle44_g158396 ) ) + ( cross( float3( 0, 0, 1 ) , VertexPosOtherAxis82_g158396 ) * sin( Angle44_g158396 ) ) );
				float3 temp_output_6_0_g158395 = temp_output_1584_19_g158389;
				#ifdef TVE_MOTION
				float3 staticSwitch65_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch65_g158395 = Model_PositionOS147_g158389;
				#endif
				#ifdef TVE_CONFORM
				float3 staticSwitch69_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch69_g158395 = staticSwitch65_g158395;
				#endif
				float3 temp_output_1585_0_g158389 = staticSwitch69_g158395;
				float3 temp_output_1567_31_g158389 = Out_PositionAddOS15_g158390;
				half3 Model_PositionADD1568_g158389 = temp_output_1567_31_g158389;
				half3 Final_PositionOS178_g158389 = ( temp_output_1585_0_g158389 + Model_PositionADD1568_g158389 );
				float3 In_PositionOS16_g158391 = Final_PositionOS178_g158389;
				float3 In_PositionWS16_g158391 = Out_PositionWS15_g158390;
				float3 In_PositionWO16_g158391 = Out_PositionWO15_g158390;
				float3 In_PositionRawOS16_g158391 = Out_PositionRawOS15_g158390;
				float3 In_PositionAddOS16_g158391 = temp_output_1567_31_g158389;
				float3 In_PivotOS16_g158391 = Out_PivotOS15_g158390;
				float3 In_PivotWS16_g158391 = Out_PivotWS15_g158390;
				float3 In_PivotWO16_g158391 = Out_PivotWO15_g158390;
				float3 In_NormalOS16_g158391 = Out_NormalOS15_g158390;
				float3 In_NormalWS16_g158391 = Out_NormalWS15_g158390;
				float3 In_NormalRawOS16_g158391 = Out_NormalRawOS15_g158390;
				float3 In_NormalRawWS16_g158391 = Out_NormalRawWS15_g158390;
				float4 In_TangentOS16_g158391 = Out_TangentOS15_g158390;
				float3 In_ViewDirWS16_g158391 = Out_ViewDirWS15_g158390;
				float4 In_VertexData16_g158391 = Out_VertexData15_g158390;
				float4 In_PhaseData16_g158391 = Out_PhaseData15_g158390;
				float4 In_BoundsData16_g158391 = Out_BoundsData15_g158390;
				float4 In_RotationData16_g158391 = temp_output_1567_33_g158389;
				{
				Data16_g158391.Dummy = In_Dummy16_g158391;
				Data16_g158391.PositionOS = In_PositionOS16_g158391;
				Data16_g158391.PositionWS = In_PositionWS16_g158391;
				Data16_g158391.PositionWO = In_PositionWO16_g158391;
				Data16_g158391.PositionRawOS = In_PositionRawOS16_g158391;
				Data16_g158391.PositionAddOS = In_PositionAddOS16_g158391;
				Data16_g158391.PivotOS = In_PivotOS16_g158391;
				Data16_g158391.PivotWS = In_PivotWS16_g158391;
				Data16_g158391.PivotWO = In_PivotWO16_g158391;
				Data16_g158391.NormalOS = In_NormalOS16_g158391;
				Data16_g158391.NormalWS = In_NormalWS16_g158391;
				Data16_g158391.NormalRawOS = In_NormalRawOS16_g158391;
				Data16_g158391.NormalRawWS = In_NormalRawWS16_g158391;
				Data16_g158391.TangentOS = In_TangentOS16_g158391;
				Data16_g158391.ViewDirWS = In_ViewDirWS16_g158391;
				Data16_g158391.VertexData = In_VertexData16_g158391;
				Data16_g158391.PhaseData = In_PhaseData16_g158391;
				Data16_g158391.BoundsData = In_BoundsData16_g158391;
				Data16_g158391.RotationData = In_RotationData16_g158391;
				}
				TVEModelData Data15_g158419 = Data16_g158391;
				float Out_Dummy15_g158419 = 0;
				float3 Out_PositionOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158419 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158419 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158419 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158419 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158419 = float3( 0,0,0 );
				float4 Out_VertexData15_g158419 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158419 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158419 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158419 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158419 = Data15_g158419.Dummy;
				Out_PositionOS15_g158419 = Data15_g158419.PositionOS;
				Out_PositionWS15_g158419 = Data15_g158419.PositionWS;
				Out_PositionWO15_g158419 = Data15_g158419.PositionWO;
				Out_PositionRawOS15_g158419 = Data15_g158419.PositionRawOS;
				Out_PositionAddOS15_g158419 = Data15_g158419.PositionAddOS;
				Out_PivotOS15_g158419 = Data15_g158419.PivotOS;
				Out_PivotWS15_g158419 = Data15_g158419.PivotWS;
				Out_PivotWO15_g158419 = Data15_g158419.PivotWO;
				Out_NormalOS15_g158419 = Data15_g158419.NormalOS;
				Out_NormalWS15_g158419 = Data15_g158419.NormalWS;
				Out_NormalRawOS15_g158419 = Data15_g158419.NormalRawOS;
				Out_NormalRawWS15_g158419 = Data15_g158419.NormalRawWS;
				Out_TangentOS15_g158419 = Data15_g158419.TangentOS;
				Out_ViewDirWS15_g158419 = Data15_g158419.ViewDirWS;
				Out_VertexData15_g158419 = Data15_g158419.VertexData;
				Out_PhaseData15_g158419 = Data15_g158419.PhaseData;
				Out_BoundsData15_g158419 = Data15_g158419.BoundsData;
				Out_RotationData15_g158419 = Data15_g158419.RotationData;
				}
				float3 temp_output_31_0_g158407 = Out_PositionOS15_g158419;
				float3 temp_output_6_0_g158420 = ( temp_output_31_0_g158407 + _DisableSRPBatcher );
				float temp_output_371_0_g158324 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingGlobalValue + _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessGlobalValue + _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue + 0.0 ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue + _CutoutGlobalValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeScaleValue1 ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) + temp_output_371_0_g158324 );
				#ifdef TVE_DUMMY
				float3 staticSwitch14_g158420 = ( temp_output_6_0_g158420 + Dummy_Data505.r );
				#else
				float3 staticSwitch14_g158420 = temp_output_6_0_g158420;
				#endif
				
				output.ase_texcoord8.xyz = vertexToFrag305_g157220;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = staticSwitch14_g158420;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif
						#if defined( ASE_DEPTH_WRITE_ON )
							, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half IsFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];
				float4 ClipPos = TransformWorldToHClip( PositionRWS );
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float localBreakData4_g158410 = ( 0.0 );
				float localCompData3_g158401 = ( 0.0 );
				TVEVisualData Data3_g158401 = (TVEVisualData)0;
				half Dummy145_g158399 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) );
				float In_Dummy3_g158401 = Dummy145_g158399;
				float localBreakData4_g158400 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158292 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + 0.0 );
				float In_Dummy3_g158307 = Dummy145_g158292;
				float localBreakData4_g158296 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				half Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlayBakeInfo ) + 0.0 );
				float In_Dummy3_g158220 = Dummy594_g158217;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157228 = ( 0.0 );
				TVEVisualData Data3_g157228 = (TVEVisualData)0;
				float In_Dummy3_g157228 = 0.0;
				float4 output0 = 0;
				float4 output1 = 0;
				float4 output2 = 0;
				ImpostorOutput io = ( ImpostorOutput )0;
				OctaImpostorFragment( io, ClipPos, PositionRWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1, output2 );
				float4 temp_cast_0 = (1.0).xxxx;
				half4 Input_Tex0377_g157220 = output0;
				half4 Input_Tex1379_g157220 = output1;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch403_g157220 = temp_cast_0;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch403_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch403_g157220 = temp_cast_0;
				#endif
				half Local_MultiMask249_g157220 = (staticSwitch403_g157220).b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( io.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157228 = Local_Albedo239_g157220;
				float3 In_AlbedoRaw3_g157228 = Local_Albedo239_g157220;
				float2 temp_cast_3 = (0.0).xx;
				float2 In_NormalTS3_g157228 = temp_cast_3;
				float3 In_NormalWS3_g157228 = io.WorldNormal;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 temp_cast_5 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch385_g157220 = temp_cast_4;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch385_g157220 = temp_cast_5;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch385_g157220 = temp_cast_4;
				#endif
				half Local_Metallic247_g157220 = (staticSwitch385_g157220).r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				float4 temp_cast_6 = (1.0).xxxx;
				float4 temp_cast_7 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch392_g157220 = temp_cast_6;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch392_g157220 = temp_cast_7;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch392_g157220 = temp_cast_6;
				#endif
				half Local_OcclusionOrEmissive248_g157220 = (staticSwitch392_g157220).g;
				float lerpResult431_g157220 = lerp( 1.0 , Local_OcclusionOrEmissive248_g157220 , _ImpostorOcclusionValue);
				#ifdef TVE_EMISSIVE
				float staticSwitch428_g157220 = 1.0;
				#else
				float staticSwitch428_g157220 = lerpResult431_g157220;
				#endif
				half Final_Occlusion424_g157220 = staticSwitch428_g157220;
				float4 temp_cast_8 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch408_g157220 = temp_cast_8;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch408_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch408_g157220 = temp_cast_8;
				#endif
				half Local_Smoothness250_g157220 = (staticSwitch408_g157220).a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , Final_Occlusion424_g157220 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157228 = appendResult257_g157220;
				float4 appendResult286_g157220 = (float4(Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , 1.0));
				float4 In_Emissive3_g157228 = appendResult286_g157220;
				float3 temp_output_3_0_g157221 = Local_Albedo239_g157220;
				float dotResult20_g157221 = dot( temp_output_3_0_g157221 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale268_g157220 = dotResult20_g157221;
				float In_Grayscale3_g157228 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157228 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157228 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157228 = 0.0;
				float In_AlphaFade3_g157228 = 1.0;
				float3 temp_cast_9 = (1.0).xxx;
				float3 In_Translucency3_g157228 = temp_cast_9;
				float In_Transmission3_g157228 = 1.0;
				float In_Thickness3_g157228 = 0.0;
				float In_Diffusion3_g157228 = 0.0;
				float In_Depth3_g157228 = ClipPos.z;
				{
				Data3_g157228.Dummy = In_Dummy3_g157228;
				Data3_g157228.Albedo = In_Albedo3_g157228;
				Data3_g157228.AlbedoRaw = In_AlbedoRaw3_g157228;
				Data3_g157228.NormalTS = In_NormalTS3_g157228;
				Data3_g157228.NormalWS = In_NormalWS3_g157228;
				Data3_g157228.Shader = In_Shader3_g157228;
				Data3_g157228.Emissive= In_Emissive3_g157228;
				Data3_g157228.MultiMask = In_MultiMask3_g157228;
				Data3_g157228.Grayscale = In_Grayscale3_g157228;
				Data3_g157228.Luminosity = In_Luminosity3_g157228;
				Data3_g157228.AlphaClip = In_AlphaClip3_g157228;
				Data3_g157228.AlphaFade = In_AlphaFade3_g157228;
				Data3_g157228.Translucency = In_Translucency3_g157228;
				Data3_g157228.Transmission = In_Transmission3_g157228;
				Data3_g157228.Thickness = In_Thickness3_g157228;
				Data3_g157228.Diffusion = In_Diffusion3_g157228;
				Data3_g157228.Depth = In_Depth3_g157228;
				}
				TVEVisualData Data4_g158218 = Data3_g157228;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				float Out_Depth4_g158218 = 0;
				{
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_AlbedoRaw4_g158218 = Data4_g158218.AlbedoRaw;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				Out_Depth4_g158218= Data4_g158218.Depth;
				}
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158231 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158237 = _OverlayProjRemap.x;
				float temp_output_9_0_g158237 = ( clampResult17_g158231 - temp_output_7_0_g158237 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158237 * _OverlayProjRemap.z ) + 0.0001 ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158232 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayLumaRemap.x;
				float temp_output_9_0_g158236 = ( clampResult17_g158232 - temp_output_7_0_g158236 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158236 * _OverlayLumaRemap.z ) + 0.0001 ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				TVEModelData Data16_g157227 = (TVEModelData)0;
				float In_Dummy16_g157227 = 0.0;
				half3 Input_PositionWS319_g157220 = GetAbsolutePositionWS( PositionRWS );
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157227 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157227 = Model_PositionWO311_g157220;
				float3 vertexToFrag305_g157220 = packedInput.ase_texcoord8.xyz;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157227 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157227 = Model_PivotWO312_g157220;
				half3 Model_Normal_WS314_g157220 = NormalWS;
				float3 In_NormalWS16_g157227 = Model_Normal_WS314_g157220;
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157227 = Model_ViewDirWS347_g157220;
				float4 temp_cast_10 = (1.0).xxxx;
				half4 Input_Tex2380_g157220 = output2;
				float4 appendResult420_g157220 = (float4((Input_Tex1379_g157220).rg , 1.0 , 1.0));
				float4 temp_cast_13 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch414_g157220 = temp_cast_10;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch414_g157220 = Input_Tex2380_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch414_g157220 = appendResult420_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch414_g157220 = temp_cast_13;
				#else
				float4 staticSwitch414_g157220 = temp_cast_10;
				#endif
				half4 Local_VertexColor422_g157220 = staticSwitch414_g157220;
				float4 In_VertexData16_g157227 = Local_VertexColor422_g157220;
				float4 In_BoundsData16_g157227 = float4( 1,1,1,1 );
				{
				Data16_g157227.Dummy = In_Dummy16_g157227;
				Data16_g157227.PositionWS = In_PositionWS16_g157227;
				Data16_g157227.PositionWO = In_PositionWO16_g157227;
				Data16_g157227.PivotWS = In_PivotWS16_g157227;
				Data16_g157227.PivotWO = In_PivotWO16_g157227;
				Data16_g157227.NormalWS = In_NormalWS16_g157227;
				Data16_g157227.ViewDirWS = In_ViewDirWS16_g157227;
				Data16_g157227.VertexData = In_VertexData16_g157227;
				Data16_g157227.BoundsData = In_BoundsData16_g157227;
				}
				TVEModelData Data15_g158228 = Data16_g157227;
				float Out_Dummy15_g158228 = 0;
				float3 Out_PositionWS15_g158228 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158228 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158228 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g158228 = float3( 0,0,0 );
				float4 Out_VertexData15_g158228 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158228 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158228 = Data15_g158228.Dummy;
				Out_PositionWS15_g158228 = Data15_g158228.PositionWS;
				Out_PositionWO15_g158228 = Data15_g158228.PositionWO;
				Out_PivotWS15_g158228 = Data15_g158228.PivotWS;
				Out_PivotWO15_g158228 = Data15_g158228.PivotWO;
				Out_NormalWS15_g158228 = Data15_g158228.NormalWS;
				Out_ViewDirWS15_g158228 = Data15_g158228.ViewDirWS;
				Out_VertexData15_g158228 = Data15_g158228.VertexData;
				Out_BoundsData15_g158228 = Data15_g158228.BoundsData;
				}
				half4 Model_VertexMasks791_g158217 = Out_VertexData15_g158228;
				float4 break792_g158217 = Model_VertexMasks791_g158217;
				float4 break33_g158229 = _overlay_vert_mode;
				float temp_output_30_0_g158229 = ( break792_g158217.x * break33_g158229.x );
				float temp_output_29_0_g158229 = ( break792_g158217.y * break33_g158229.y );
				float temp_output_31_0_g158229 = ( break792_g158217.z * break33_g158229.z );
				float temp_output_28_0_g158229 = ( temp_output_30_0_g158229 + temp_output_29_0_g158229 + temp_output_31_0_g158229 + ( break792_g158217.w * break33_g158229.w ) );
				float clampResult17_g158230 = clamp( temp_output_28_0_g158229 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayMeshRemap.x;
				float temp_output_9_0_g158238 = ( clampResult17_g158230 - temp_output_7_0_g158238 );
				float lerpResult879_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158238 * _OverlayMeshRemap.z ) + 0.0001 ) ) , _OverlayMeshValue);
				float temp_output_6_0_g158233 = lerpResult879_g158217;
				#ifdef TVE_DUMMY
				float staticSwitch14_g158233 = ( temp_output_6_0_g158233 + _OverlayMeshMode );
				#else
				float staticSwitch14_g158233 = temp_output_6_0_g158233;
				#endif
				half Overlay_VertMask801_g158217 = staticSwitch14_g158233;
				float lerpResult920_g158217 = lerp( 1.0 , ( TVE_AtmoParams.z * TVE_IsEnabled ) , _OverlayGlobalValue);
				half Overlay_MaskGlobal429_g158217 = lerpResult920_g158217;
				float temp_output_7_0_g158239 = _OverlayBlendRemap.x;
				float temp_output_9_0_g158239 = ( ( _OverlayIntensityValue * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ) - temp_output_7_0_g158239 );
				half Overlay_Mask494_g158217 = saturate( ( ( temp_output_9_0_g158239 * _OverlayBlendRemap.z ) + 0.0001 ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				float3 In_AlbedoRaw3_g158220 = Out_AlbedoRaw4_g158218;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				float In_Depth3_g158220 = Out_Depth4_g158218;
				{
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.AlbedoRaw = In_AlbedoRaw3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				Data3_g158220.Depth = In_Depth3_g158220;
				}
				TVEVisualData Data4_g158296 = Data3_g158220;
				float Out_Dummy4_g158296 = 0;
				float3 Out_Albedo4_g158296 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158296 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158296 = float2( 0,0 );
				float3 Out_NormalWS4_g158296 = float3( 0,0,0 );
				float4 Out_Shader4_g158296 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158296 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158296 = 0;
				float Out_Grayscale4_g158296 = 0;
				float Out_Luminosity4_g158296 = 0;
				float Out_AlphaClip4_g158296 = 0;
				float Out_AlphaFade4_g158296 = 0;
				float3 Out_Translucency4_g158296 = float3( 0,0,0 );
				float Out_Transmission4_g158296 = 0;
				float Out_Thickness4_g158296 = 0;
				float Out_Diffusion4_g158296 = 0;
				float Out_Depth4_g158296 = 0;
				{
				Out_Dummy4_g158296 = Data4_g158296.Dummy;
				Out_Albedo4_g158296 = Data4_g158296.Albedo;
				Out_AlbedoRaw4_g158296 = Data4_g158296.AlbedoRaw;
				Out_NormalTS4_g158296 = Data4_g158296.NormalTS;
				Out_NormalWS4_g158296 = Data4_g158296.NormalWS;
				Out_Shader4_g158296 = Data4_g158296.Shader;
				Out_Emissive4_g158296= Data4_g158296.Emissive;
				Out_MultiMask4_g158296 = Data4_g158296.MultiMask;
				Out_Grayscale4_g158296 = Data4_g158296.Grayscale;
				Out_Luminosity4_g158296= Data4_g158296.Luminosity;
				Out_AlphaClip4_g158296 = Data4_g158296.AlphaClip;
				Out_AlphaFade4_g158296 = Data4_g158296.AlphaFade;
				Out_Translucency4_g158296 = Data4_g158296.Translucency;
				Out_Transmission4_g158296 = Data4_g158296.Transmission;
				Out_Thickness4_g158296 = Data4_g158296.Thickness;
				Out_Diffusion4_g158296 = Data4_g158296.Diffusion;
				Out_Depth4_g158296= Data4_g158296.Depth;
				}
				float3 temp_output_297_0_g158292 = Out_Albedo4_g158296;
				float3 In_Albedo3_g158307 = temp_output_297_0_g158292;
				float3 temp_output_297_23_g158292 = Out_AlbedoRaw4_g158296;
				float3 In_AlbedoRaw3_g158307 = temp_output_297_23_g158292;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158296;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158296;
				float4 In_Shader3_g158307 = Out_Shader4_g158296;
				float4 temp_cast_15 = (0.0).xxxx;
				half4 Visual_Emissive255_g158292 = Out_Emissive4_g158296;
				half Emissive_MeshMask221_g158292 = 1.0;
				half Emissive_Mask103_g158292 = 1.0;
				float temp_output_279_0_g158292 = ( Emissive_MeshMask221_g158292 * Emissive_Mask103_g158292 );
				float3 appendResult293_g158292 = (float3(temp_output_279_0_g158292 , temp_output_279_0_g158292 , temp_output_279_0_g158292));
				half3 Local_EmissiveColor278_g158292 = appendResult293_g158292;
				float3 temp_output_316_0_g158292 = (TVE_GlowParams).xyz;
				float3 lerpResult299_g158292 = lerp( float3( 1,1,1 ) , temp_output_316_0_g158292 , ( _EmissiveGlobalValue * TVE_IsEnabled ));
				half3 Emissive_GlobalMask248_g158292 = lerpResult299_g158292;
				half3 Visual_AlbedoRaw306_g158292 = temp_output_297_23_g158292;
				float3 lerpResult307_g158292 = lerp( float3( 1,1,1 ) , Visual_AlbedoRaw306_g158292 , _EmissiveColorMode);
				half3 Local_EmissiveValue88_g158292 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158292 * lerpResult307_g158292 );
				half3 Emissive_Blend260_g158292 = ( ( (Visual_Emissive255_g158292).xyz * Local_EmissiveColor278_g158292 ) * Local_EmissiveValue88_g158292 );
				float3 temp_output_3_0_g158298 = Emissive_Blend260_g158292;
				float temp_output_15_0_g158298 = _emissive_power_value;
				float3 hdEmission22_g158298 = ASEGetEmissionHDRColor(temp_output_3_0_g158298,temp_output_15_0_g158298,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Local_EmissiveMask294_g158292 = temp_output_279_0_g158292;
				float4 appendResult295_g158292 = (float4(hdEmission22_g158298 , Local_EmissiveMask294_g158292));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158292 = appendResult295_g158292;
				#else
				float4 staticSwitch129_g158292 = temp_cast_15;
				#endif
				half4 Final_Emissive184_g158292 = staticSwitch129_g158292;
				float4 In_Emissive3_g158307 = Final_Emissive184_g158292;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158296;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158296;
				float temp_output_297_11_g158292 = Out_MultiMask4_g158296;
				float In_MultiMask3_g158307 = temp_output_297_11_g158292;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158296;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158296;
				float3 In_Translucency3_g158307 = Out_Translucency4_g158296;
				float In_Transmission3_g158307 = Out_Transmission4_g158296;
				float In_Thickness3_g158307 = Out_Thickness4_g158296;
				float In_Diffusion3_g158307 = Out_Diffusion4_g158296;
				float In_Depth3_g158307 = Out_Depth4_g158296;
				{
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.AlbedoRaw = In_AlbedoRaw3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				Data3_g158307.Depth = In_Depth3_g158307;
				}
				TVEVisualData Data4_g158400 = Data3_g158307;
				float Out_Dummy4_g158400 = 0;
				float3 Out_Albedo4_g158400 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158400 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158400 = float2( 0,0 );
				float3 Out_NormalWS4_g158400 = float3( 0,0,0 );
				float4 Out_Shader4_g158400 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158400 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158400 = 0;
				float Out_Grayscale4_g158400 = 0;
				float Out_Luminosity4_g158400 = 0;
				float Out_AlphaClip4_g158400 = 0;
				float Out_AlphaFade4_g158400 = 0;
				float3 Out_Translucency4_g158400 = float3( 0,0,0 );
				float Out_Transmission4_g158400 = 0;
				float Out_Thickness4_g158400 = 0;
				float Out_Diffusion4_g158400 = 0;
				float Out_Depth4_g158400 = 0;
				{
				Out_Dummy4_g158400 = Data4_g158400.Dummy;
				Out_Albedo4_g158400 = Data4_g158400.Albedo;
				Out_AlbedoRaw4_g158400 = Data4_g158400.AlbedoRaw;
				Out_NormalTS4_g158400 = Data4_g158400.NormalTS;
				Out_NormalWS4_g158400 = Data4_g158400.NormalWS;
				Out_Shader4_g158400 = Data4_g158400.Shader;
				Out_Emissive4_g158400= Data4_g158400.Emissive;
				Out_MultiMask4_g158400 = Data4_g158400.MultiMask;
				Out_Grayscale4_g158400 = Data4_g158400.Grayscale;
				Out_Luminosity4_g158400= Data4_g158400.Luminosity;
				Out_AlphaClip4_g158400 = Data4_g158400.AlphaClip;
				Out_AlphaFade4_g158400 = Data4_g158400.AlphaFade;
				Out_Translucency4_g158400 = Data4_g158400.Translucency;
				Out_Transmission4_g158400 = Data4_g158400.Transmission;
				Out_Thickness4_g158400 = Data4_g158400.Thickness;
				Out_Diffusion4_g158400 = Data4_g158400.Diffusion;
				Out_Depth4_g158400= Data4_g158400.Depth;
				}
				half3 Visual_Albedo199_g158399 = Out_Albedo4_g158400;
				half3 Final_Albedo312_g158399 = Visual_Albedo199_g158399;
				float3 In_Albedo3_g158401 = Final_Albedo312_g158399;
				float3 In_AlbedoRaw3_g158401 = Out_AlbedoRaw4_g158400;
				float2 In_NormalTS3_g158401 = Out_NormalTS4_g158400;
				float3 In_NormalWS3_g158401 = Out_NormalWS4_g158400;
				float4 In_Shader3_g158401 = Out_Shader4_g158400;
				float4 In_Emissive3_g158401 = Out_Emissive4_g158400;
				float In_Grayscale3_g158401 = Out_Grayscale4_g158400;
				float In_Luminosity3_g158401 = Out_Luminosity4_g158400;
				float temp_output_301_11_g158399 = Out_MultiMask4_g158400;
				float In_MultiMask3_g158401 = temp_output_301_11_g158399;
				float In_AlphaClip3_g158401 = Out_AlphaClip4_g158400;
				float In_AlphaFade3_g158401 = Out_AlphaFade4_g158400;
				float3 temp_cast_16 = (0.0).xxx;
				half3 Subsurface_Color264_g158399 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158399 );
				half Visual_Transmission138_g158399 = Out_Transmission4_g158400;
				half Subsurface_Value268_g158399 = _SubsurfaceIntensityValue;
				float lerpResult403_g158399 = lerp( 1.0 , TVE_GlowParams.w , ( _SubsurfaceGlobalValue * TVE_IsEnabled ));
				half Subsurface_GlobalMask369_g158399 = lerpResult403_g158399;
				half Visual_MultiMask292_g158399 = temp_output_301_11_g158399;
				float lerpResult293_g158399 = lerp( 1.0 , Visual_MultiMask292_g158399 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158399 = lerpResult293_g158399;
				half Custom_Mask363_g158399 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158399 = ( Visual_Transmission138_g158399 * Subsurface_Value268_g158399 * Subsurface_GlobalMask369_g158399 * Subsurface_MultiMask296_g158399 * Custom_Mask363_g158399 );
				#else
				float staticSwitch345_g158399 = 0.0;
				#endif
				half Final_Transmission269_g158399 = staticSwitch345_g158399;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158399 = ( Subsurface_Color264_g158399 * Final_Transmission269_g158399 * 10.0 );
				#else
				float3 staticSwitch348_g158399 = temp_cast_16;
				#endif
				half3 Final_Translucency254_g158399 = staticSwitch348_g158399;
				float3 In_Translucency3_g158401 = Final_Translucency254_g158399;
				float In_Transmission3_g158401 = Final_Transmission269_g158399;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158399 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158399 = 1.0;
				#endif
				half Final_Thickness275_g158399 = staticSwitch351_g158399;
				float In_Thickness3_g158401 = Final_Thickness275_g158399;
				float Final_Diffusion340_g158399 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158401 = Final_Diffusion340_g158399;
				float In_Depth3_g158401 = Out_Depth4_g158400;
				{
				Data3_g158401.Dummy = In_Dummy3_g158401;
				Data3_g158401.Albedo = In_Albedo3_g158401;
				Data3_g158401.AlbedoRaw = In_AlbedoRaw3_g158401;
				Data3_g158401.NormalTS = In_NormalTS3_g158401;
				Data3_g158401.NormalWS = In_NormalWS3_g158401;
				Data3_g158401.Shader = In_Shader3_g158401;
				Data3_g158401.Emissive= In_Emissive3_g158401;
				Data3_g158401.MultiMask = In_MultiMask3_g158401;
				Data3_g158401.Grayscale = In_Grayscale3_g158401;
				Data3_g158401.Luminosity = In_Luminosity3_g158401;
				Data3_g158401.AlphaClip = In_AlphaClip3_g158401;
				Data3_g158401.AlphaFade = In_AlphaFade3_g158401;
				Data3_g158401.Translucency = In_Translucency3_g158401;
				Data3_g158401.Transmission = In_Transmission3_g158401;
				Data3_g158401.Thickness = In_Thickness3_g158401;
				Data3_g158401.Diffusion = In_Diffusion3_g158401;
				Data3_g158401.Depth = In_Depth3_g158401;
				}
				TVEVisualData Data4_g158410 = Data3_g158401;
				float Out_Dummy4_g158410 = 0;
				float3 Out_Albedo4_g158410 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158410 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158410 = float2( 0,0 );
				float3 Out_NormalWS4_g158410 = float3( 0,0,0 );
				float4 Out_Shader4_g158410 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158410 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158410 = 0;
				float Out_Grayscale4_g158410 = 0;
				float Out_Luminosity4_g158410 = 0;
				float Out_AlphaClip4_g158410 = 0;
				float Out_AlphaFade4_g158410 = 0;
				float3 Out_Translucency4_g158410 = float3( 0,0,0 );
				float Out_Transmission4_g158410 = 0;
				float Out_Thickness4_g158410 = 0;
				float Out_Diffusion4_g158410 = 0;
				float Out_Depth4_g158410 = 0;
				{
				Out_Dummy4_g158410 = Data4_g158410.Dummy;
				Out_Albedo4_g158410 = Data4_g158410.Albedo;
				Out_AlbedoRaw4_g158410 = Data4_g158410.AlbedoRaw;
				Out_NormalTS4_g158410 = Data4_g158410.NormalTS;
				Out_NormalWS4_g158410 = Data4_g158410.NormalWS;
				Out_Shader4_g158410 = Data4_g158410.Shader;
				Out_Emissive4_g158410= Data4_g158410.Emissive;
				Out_MultiMask4_g158410 = Data4_g158410.MultiMask;
				Out_Grayscale4_g158410 = Data4_g158410.Grayscale;
				Out_Luminosity4_g158410= Data4_g158410.Luminosity;
				Out_AlphaClip4_g158410 = Data4_g158410.AlphaClip;
				Out_AlphaFade4_g158410 = Data4_g158410.AlphaFade;
				Out_Translucency4_g158410 = Data4_g158410.Translucency;
				Out_Transmission4_g158410 = Data4_g158410.Transmission;
				Out_Thickness4_g158410 = Data4_g158410.Thickness;
				Out_Diffusion4_g158410 = Data4_g158410.Diffusion;
				Out_Depth4_g158410= Data4_g158410.Depth;
				}
				
				float4 break24_g158407 = Out_Shader4_g158410;
				

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;

				surfaceDescription.Normal = Out_NormalWS4_g158410;
				surfaceDescription.Smoothness = break24_g158407.w;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = Out_Depth4_g158410;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

                #if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif

                #if SHADERPASS == SHADERPASS_SHADOWS
                float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
                outputDepth += bias;
                #endif

				#ifdef SCENESELECTIONPASS
    				outColor = float4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
    				outColor = unity_SelectionID;
				#else
    				#ifdef WRITE_MSAA_DEPTH
    					depthColor = packedInput.positionCS.z;
    					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
    				#endif

    				#if defined(WRITE_NORMAL_BUFFER)
    				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
    				#endif

    				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
    				DecalPrepassData decalPrepassData;
    				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
    				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
    				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
    				#endif
				#endif // SCENESELECTIONPASS
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local_fragment _ _DISABLE_SSR
			#define ASE_FRAGMENT_NORMAL 2
			#define ASE_DEPTH_WRITE_ON
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 140012
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

            #pragma multi_compile _ WRITE_NORMAL_BUFFER
            #pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
            #pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

            #define SHADERPASS SHADERPASS_MOTION_VECTORS

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
               #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			     #define ASE_NEED_CULLFACE 1
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DitherColoring;
			half4 _OverlayLumaRemap;
			half4 _OverlayProjRemap;
			half4 _OverlayColor;
			half4 _DrynessColoring;
			half4 _TintingLumaRemap;
			half4 _ImpostorColor;
			half4 _overlay_vert_mode;
			half4 _ImpostorColorTwo;
			half4 _TintingColoring;
			half4 _SizeFadeColoring;
			float4 _AI_SizeOffset;
			half4 _VariationNoiseRemap;
			half4 _VariationColorOne;
			half4 _VariationColorTwo;
			float4 _TintingColor;
			half4 _OverlayMeshRemap;
			half4 _VariationColoring;
			float4 _DrynessColor;
			half4 _DrynessLumaRemap;
			half4 _EmissiveColor;
			half4 _OverlayBlendRemap;
			half4 _WetnessColoring;
			half4 _CutoutColoring;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			float3 _AI_Offset;
			float3 _AI_BoundsMin;
			float3 _AI_BoundsSize;
			half _SizeFadeCategory;
			half _CutoutLiteInfo;
			half _SizeFadeEnd;
			half _SizeFadeScaleValue1;
			half _SizeFadeLiteInfo;
			half _DitherNoiseTillingValue;
			half _CutoutCategory;
			half _DitherMultiValue;
			half _DitherShadowMode;
			half _DitherDistanceMaxValue;
			half _CutoutNoiseValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseTillingValue;
			half _CutoutGlobalValue;
			half _CutoutMultiValue;
			half _DitherLiteInfo;
			half _CutoutShadowMode;
			half _DitherDistanceMinValue;
			half _CutoutIntensityValue;
			half _DitherCategory;
			half _CutoutSpace;
			half _DitherEnd;
			half _DitherConstantValue;
			half _DitherDistanceValue;
			half _CutoutEnd;
			half _SizeFadeIntensityValue;
			half _ImpostorMaskOffInfo;
			half _SubsurfaceCategory;
			half _SizeFadeScaleValue;
			half _ImpostorSmoothnessValue;
			half _OverlayIntensityValue;
			half _OverlayProjValue;
			half _OverlayLumaValue;
			half _OverlayMeshValue;
			half _OverlayMeshMode;
			half _OverlayGlobalValue;
			half _OverlayNormalValue;
			half _OverlaySmoothnessValue;
			half _OverlaySubsurfaceValue;
			half _EmissiveIntensityValue;
			half _EmissiveGlobalValue;
			half _EmissiveColorMode;
			float _emissive_power_value;
			half _EmissiveExposureValue;
			half _SubsurfaceIntensityValue;
			half _SubsurfaceGlobalValue;
			half _ImpostorOcclusionValue;
			half _SizeFadeScaleMode;
			half _ImpostorMetallicValue;
			half _OverlayBakeInfo;
			half _SizeFadeDistMinValue;
			half _SizeFadeDistMaxValue;
			half _GlobalLiteInfo;
			half _GlobalCategory;
			half _GlobalEnd;
			half _WetnessSmoothnessValue;
			half _SubsurfaceEnd;
			half _SubsurfaceDirectValue;
			half _SubsurfaceNormalValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _EmissiveCategory;
			half _EmissiveEnd;
			half _EmissivePowerMode;
			half _EmissivePowerValue;
			half _OverlayCategory;
			half _OverlayEnd;
			half _ImpostorColorMode;
			half _WetnessContrastValue;
			half _DrynessMultiValue;
			half _WetnessEnd;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsCollected;
			half _IsLiteShader;
			half _MotionCategory;
			half _MotionEnd;
			half _MotionLiteInfo;
			float _AI_Clip;
			float _AI_TextureBias;
			float _AI_Parallax;
			float _AI_ShadowBias;
			half _ImpostorEnd;
			half _IsShared;
			half _IsCustomShader;
			half _IsTVEShader;
			half _ImpostorMaskDefaultInfo;
			half _ImpostorMaskPackedInfo;
			half _ImpostorMaskShadingInfo;
			half _ImpostorMaskMode;
			half _ImpostorSpace0;
			half _ImpostorSpace1;
			half _ImpostorAlphaClipValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _SubsurfaceScatteringValue;
			half _IsVersion;
			half _RenderDecals;
			half _RenderSSR;
			half _CategoryRender;
			half _EndRender;
			half _IsInitialized;
			float _AI_ShadowView;
			float _AI_ForwardBias;
			float _AI_Frames;
			float _AI_DepthSize;
			half _TintingGlobalValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessIntensityValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _DrynessGlobalValue;
			half _SubsurfaceMultiValue;
			half _DrynessLumaValue;
			half _WetnessLiteInfo;
			half _WetnessCategory;
			half _TintingGrayValue;
			half _WetnessIntensityValue;
			half _TintingIntensityValue;
			half _TintingEnd;
			float _AI_ImpostorSize;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			half _MotionBaseTillingValue;
			half _MotionBaseSpeedValue;
			half _MotionBaseNoiseValue;
			half _MotionIntensityValue;
			half _MotionBaseDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _VariationNoiseTillingValue;
			half _TintingLiteInfo;
			half _TintingCategory;
			half _TintingSpace;
			half _SubsurfaceThicknessValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			TEXTURE2D(_MotionNoiseTex);
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_MotionParamsEditor;
			half _DisableSRPBatcher;
			TEXTURE2D(_Shader);
			TEXTURE2D(_Packed);
			TEXTURE2D(_Vertex);
			SAMPLER(sampler_Shader);
			SAMPLER(sampler_Packed);
			SAMPLER(sampler_Vertex);
			half4 TVE_AtmoParams;
			half TVE_IsEnabled;
			half4 TVE_GlowParams;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define AI_ObjectToWorld GetObjectToWorldMatrix()
			#define AI_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_CHANGES_WORLD_POS
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local _USE_PARALLAX_ON
			#pragma shader_feature_local _HEMI_ON
			#pragma shader_feature_local AI_CLIP_NEIGHBOURS_FRAMES
			#pragma shader_feature_local_vertex TVE_MOTION
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_IMPOSTOR_MASK_OFF TVE_IMPOSTOR_MASK_DEFAULT TVE_IMPOSTOR_MASK_PACKED TVE_IMPOSTOR_MASK_SHADING
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IMPOSTOR_SHADER
			//#define _USE_PARALLAX_ON
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 vmeshPositionCS : SV_Position;
				float3 vmeshPositionRWS : TEXCOORD0;
				float3 vpassPositionCS : TEXCOORD1;
				float3 vpassPreviousPositionCS : TEXCOORD2;
				float4 UVsFrame122_g156549 : TEXCOORD3;
				float4 UVsFrame222_g156549 : TEXCOORD4;
				float4 UVsFrame322_g156549 : TEXCOORD5;
				float4 octaframe22_g156549 : TEXCOORD6;
				float4 viewPos22_g156549 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			struct ImpostorOutput
			{
				half3 Albedo;
				half3 Specular;
				half Metallic;
				half3 WorldNormal;
				half Smoothness;
				half Occlusion;
				half3 Emission;
				half Alpha;
			};
			
			float2 VectorToOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, out float2 uvs, out float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			float2 VectorToHemiOctahedron( float3 N )
			{
				N.xy /= dot( 1.0, abs( N ) );
				return float2( N.x + N.y, N.x - N.y );
			}
			
			float3 HemiOctahedronToVector( float2 Oct )
			{
				Oct = float2( Oct.x + Oct.y, Oct.x - Oct.y ) * 0.5;
				float3 N = float3( Oct, 1 - dot( 1.0, abs( Oct ) ) );
				return normalize( N );
			}
			
			inline void OctaImpostorVertex( inout float3 positionOS, out float3 normalOS, out float4 tangentOS, out float4 uvsFrame1, out float4 uvsFrame2, out float4 uvsFrame3, out float4 octaFrame, out float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = AI_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = AI_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( AI_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				#if defined( _HEMI_ON )
				objectCameraDirection.y = max(0.001, objectCameraDirection.y);
				float2 frameOcta = VectorToHemiOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#else
				float2 frameOcta = VectorToOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#endif
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa1WorldY = HemiOctahedronToVector( octaFrame1 ).xzy;
				#else
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				#endif
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*out*/ uvFrame1, /*out*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa2WorldY = HemiOctahedronToVector( octaFrame2 ).xzy;
				#else
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				#endif
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*out*/ uvFrame2, /*out*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa3WorldY = HemiOctahedronToVector( octaFrame3 ).xzy;
				#else
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				#endif
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*out*/ uvFrame3, /*out*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				octaFrame.zw = fractionOctaFrame;
				#endif
				positionOS = billboard + _AI_Offset.xyz;
				normalOS = objectCameraDirection;
				tangentOS = float4( objectHorizontalVector, 1 );
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout ImpostorOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 viewPos, out float4 output0, out float4 output1, out float4 output2 )
			{
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, -1 );
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, -1 );
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, -1 );
				float2 parallax1_uv = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float2 parallax2_uv = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float2 parallax3_uv = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1_uv, _AI_TextureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2_uv, _AI_TextureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3_uv, _AI_TextureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1_uv - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2_uv, parallax3_uv ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * ( 1 - step_1 );
				step23 = step23 * ( 1 - step23 );
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				#endif
				o.Albedo = blendedAlbedo.rgb;
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1_uv, _AI_TextureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2_uv, _AI_TextureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3_uv, _AI_TextureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				o.WorldNormal = normalize( mul( (float3x3)AI_ObjectToWorld, localNormal ) );
				float depth = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 ) * _AI_DepthSize * length( AI_ObjectToWorld[ 2 ].xyz );
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax1_uv, _AI_TextureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax2_uv, _AI_TextureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax3_uv, _AI_TextureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax1_uv, _AI_TextureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax2_uv, _AI_TextureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax3_uv, _AI_TextureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float4 output2a = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax1_uv, _AI_TextureBias );
				float4 output2b = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax2_uv, _AI_TextureBias );
				float4 output2c = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax3_uv, _AI_TextureBias );
				output2 = output2a * weights.x  + output2b * weights.y + output2c * weights.z; 
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView - _AI_ShadowBias;
				#else 
				viewPos.z += depth + _AI_ForwardBias;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				#if defined(SHADERPASS) && defined(UNITY_PASS_SHADOWCASTER)
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#else
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = surfaceDescription.Normal;

			#if ( UNITY_VERSION <= 202236 )
				#if ( ASE_FRAGMENT_NORMAL == 1 )
					GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#elif ( ASE_FRAGMENT_NORMAL == 2 )
					GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#endif

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#else
				#ifdef DECAL_NORMAL_BLENDING
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif
			#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						surfaceData.metallic = 0;
					}
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS output )
			{
				_TimeParameters.xyz = timeParameters;
				TVEModelData Data16_g158391 = (TVEModelData)0;
				float In_Dummy16_g158391 = 0.0;
				TVEModelData Data16_g158266 = (TVEModelData)0;
				half Dummy181_g158264 = ( ( _MotionCategory + _MotionEnd ) + _MotionLiteInfo );
				float In_Dummy16_g158266 = Dummy181_g158264;
				TVEModelData Data16_g157226 = (TVEModelData)0;
				float In_Dummy16_g157226 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS.xyz, inputMesh.normalOS.xyz, inputMesh.tangentOS, output.UVsFrame122_g156549, output.UVsFrame222_g156549, output.UVsFrame322_g156549, output.octaframe22_g156549, output.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( TransformObjectToWorld( inputMesh.positionOS.xyz ) );
				half3 Input_PositionWS319_g157220 = worldPosOut22_g156549;
				float3 worldToObj315_g157220 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS( Input_PositionWS319_g157220 ), 1 ) ).xyz;
				half3 Model_PositionOS316_g157220 = worldToObj315_g157220;
				float3 In_PositionOS16_g157226 = Model_PositionOS316_g157220;
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157226 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157226 = Model_PositionWO311_g157220;
				float3 In_PositionRawOS16_g157226 = Model_PositionOS316_g157220;
				float3 In_PositionAddOS16_g157226 = float3( 0,0,0 );
				float3 In_PivotOS16_g157226 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157223 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157223 = ( localObjectPosition_UNITY_MATRIX_M14_g157223 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157223 = localObjectPosition_UNITY_MATRIX_M14_g157223;
				#endif
				float3 vertexToFrag305_g157220 = staticSwitch13_g157223;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157226 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157226 = Model_PivotWO312_g157220;
				half3 Model_NormalOS313_g157220 = inputMesh.normalOS;
				float3 In_NormalOS16_g157226 = Model_NormalOS313_g157220;
				float3 ase_normalWS = TransformObjectToWorldNormal( inputMesh.normalOS );
				half3 Model_Normal_WS314_g157220 = ase_normalWS;
				float3 In_NormalWS16_g157226 = Model_Normal_WS314_g157220;
				float3 In_NormalRawOS16_g157226 = Model_NormalOS313_g157220;
				float3 In_NormalRawWS16_g157226 = Model_Normal_WS314_g157220;
				float4 In_TangentOS16_g157226 = float4( 0,1,0,1 );
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157226 = Model_ViewDirWS347_g157220;
				float4 In_VertexData16_g157226 = float4( 1,1,1,1 );
				float4 In_PhaseData16_g157226 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157226 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157226 = float4( 0,0,0,0 );
				{
				Data16_g157226.Dummy = In_Dummy16_g157226;
				Data16_g157226.PositionOS = In_PositionOS16_g157226;
				Data16_g157226.PositionWS = In_PositionWS16_g157226;
				Data16_g157226.PositionWO = In_PositionWO16_g157226;
				Data16_g157226.PositionRawOS = In_PositionRawOS16_g157226;
				Data16_g157226.PositionAddOS = In_PositionAddOS16_g157226;
				Data16_g157226.PivotOS = In_PivotOS16_g157226;
				Data16_g157226.PivotWS = In_PivotWS16_g157226;
				Data16_g157226.PivotWO = In_PivotWO16_g157226;
				Data16_g157226.NormalOS = In_NormalOS16_g157226;
				Data16_g157226.NormalWS = In_NormalWS16_g157226;
				Data16_g157226.NormalRawOS = In_NormalRawOS16_g157226;
				Data16_g157226.NormalRawWS = In_NormalRawWS16_g157226;
				Data16_g157226.TangentOS = In_TangentOS16_g157226;
				Data16_g157226.ViewDirWS = In_ViewDirWS16_g157226;
				Data16_g157226.VertexData = In_VertexData16_g157226;
				Data16_g157226.PhaseData = In_PhaseData16_g157226;
				Data16_g157226.BoundsData = In_BoundsData16_g157226;
				Data16_g157226.RotationData = In_RotationData16_g157226;
				}
				TVEModelData Data15_g158265 = Data16_g157226;
				float Out_Dummy15_g158265 = 0;
				float3 Out_PositionOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158265 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158265 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158265 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158265 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158265 = float3( 0,0,0 );
				float4 Out_VertexData15_g158265 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158265 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158265 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158265 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158265 = Data15_g158265.Dummy;
				Out_PositionOS15_g158265 = Data15_g158265.PositionOS;
				Out_PositionWS15_g158265 = Data15_g158265.PositionWS;
				Out_PositionWO15_g158265 = Data15_g158265.PositionWO;
				Out_PositionRawOS15_g158265 = Data15_g158265.PositionRawOS;
				Out_PositionAddOS15_g158265 = Data15_g158265.PositionAddOS;
				Out_PivotOS15_g158265 = Data15_g158265.PivotOS;
				Out_PivotWS15_g158265 = Data15_g158265.PivotWS;
				Out_PivotWO15_g158265 = Data15_g158265.PivotWO;
				Out_NormalOS15_g158265 = Data15_g158265.NormalOS;
				Out_NormalWS15_g158265 = Data15_g158265.NormalWS;
				Out_NormalRawOS15_g158265 = Data15_g158265.NormalRawOS;
				Out_NormalRawWS15_g158265 = Data15_g158265.NormalRawWS;
				Out_TangentOS15_g158265 = Data15_g158265.TangentOS;
				Out_ViewDirWS15_g158265 = Data15_g158265.ViewDirWS;
				Out_VertexData15_g158265 = Data15_g158265.VertexData;
				Out_PhaseData15_g158265 = Data15_g158265.PhaseData;
				Out_BoundsData15_g158265 = Data15_g158265.BoundsData;
				Out_RotationData15_g158265 = Data15_g158265.RotationData;
				}
				float3 temp_output_1567_0_g158264 = Out_PositionOS15_g158265;
				float3 In_PositionOS16_g158266 = temp_output_1567_0_g158264;
				float3 In_PositionWS16_g158266 = Out_PositionWS15_g158265;
				float3 temp_output_1567_17_g158264 = Out_PositionWO15_g158265;
				float3 In_PositionWO16_g158266 = temp_output_1567_17_g158264;
				float3 In_PositionRawOS16_g158266 = Out_PositionRawOS15_g158265;
				float3 In_PositionAddOS16_g158266 = Out_PositionAddOS15_g158265;
				float3 In_PivotOS16_g158266 = Out_PivotOS15_g158265;
				float3 In_PivotWS16_g158266 = Out_PivotWS15_g158265;
				float3 temp_output_1567_19_g158264 = Out_PivotWO15_g158265;
				float3 In_PivotWO16_g158266 = temp_output_1567_19_g158264;
				float3 In_NormalOS16_g158266 = Out_NormalOS15_g158265;
				float3 In_NormalWS16_g158266 = Out_NormalWS15_g158265;
				float3 In_NormalRawOS16_g158266 = Out_NormalRawOS15_g158265;
				float3 In_NormalRawWS16_g158266 = Out_NormalRawWS15_g158265;
				float4 In_TangentOS16_g158266 = Out_TangentOS15_g158265;
				float3 In_ViewDirWS16_g158266 = Out_ViewDirWS15_g158265;
				float4 In_VertexData16_g158266 = Out_VertexData15_g158265;
				float4 In_PhaseData16_g158266 = Out_PhaseData15_g158265;
				float4 In_BoundsData16_g158266 = Out_BoundsData15_g158265;
				half3 Model_PositionOS147_g158264 = temp_output_1567_0_g158264;
				half Base_Mask217_g158264 = saturate( ( Model_PositionOS147_g158264.y / _AI_Offset.y ) );
				float4 lerpResult836_g158275 = lerp( half4( 0, 1, 1, 0 ) , TVE_MotionParams , TVE_MotionParams.w);
				half2 Global_WindDirWS1663_g158264 = (lerpResult836_g158275).xy;
				half2 Input_WindDirWS803_g158268 = Global_WindDirWS1663_g158264;
				half3 Model_PositionWO162_g158264 = temp_output_1567_17_g158264;
				half3 Model_PivotWO402_g158264 = temp_output_1567_19_g158264;
				float3 lerpResult829_g158264 = lerp( Model_PositionWO162_g158264 , Model_PivotWO402_g158264 , _MotionBasePivotValue);
				half3 Base_Position1394_g158264 = lerpResult829_g158264;
				half3 Input_PositionWO419_g158268 = Base_Position1394_g158264;
				half Input_MotionTilling321_g158268 = ( _MotionBaseTillingValue + 0.2 );
				half2 Noise_Coord515_g158268 = ( -(Input_PositionWO419_g158268).xz * Input_MotionTilling321_g158268 * 0.005 );
				float2 temp_output_3_0_g158272 = Noise_Coord515_g158268;
				float2 temp_output_21_0_g158272 = Input_WindDirWS803_g158268;
				float mulTime113_g158271 = _TimeParameters.x * 0.02;
				float lerpResult128_g158271 = lerp( mulTime113_g158271 , ( ( mulTime113_g158271 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g158268 = _MotionBaseSpeedValue;
				half Noise_Speed516_g158268 = ( lerpResult128_g158271 * Input_MotionSpeed62_g158268 );
				float temp_output_15_0_g158272 = Noise_Speed516_g158268;
				float temp_output_23_0_g158272 = frac( temp_output_15_0_g158272 );
				float4 lerpResult39_g158272 = lerp( SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * temp_output_23_0_g158272 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * frac( ( temp_output_15_0_g158272 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_23_0_g158272 - 0.5 ) ) / 0.5 ));
				float4 temp_output_635_0_g158268 = lerpResult39_g158272;
				half2 Noise_DirWS825_g158268 = ((temp_output_635_0_g158268).rg*2.0 + -1.0);
				half Input_MotionNoise552_g158268 = _MotionBaseNoiseValue;
				half Global_WInd769_g158275 = (lerpResult836_g158275).z;
				float lerpResult853_g158275 = lerp( Global_WInd769_g158275 , saturate( (Global_WInd769_g158275*TVE_MotionParamsEditor.x + TVE_MotionParamsEditor.y) ) , TVE_MotionParamsEditor.w);
				half Input_MotionValue629_g158275 = _MotionIntensityValue;
				half Global_WindValue1664_g158264 = ( lerpResult853_g158275 * Input_MotionValue629_g158275 );
				half Input_WindValue853_g158268 = Global_WindValue1664_g158264;
				float lerpResult701_g158268 = lerp( 1.0 , Input_MotionNoise552_g158268 , Input_WindValue853_g158268);
				float2 lerpResult646_g158268 = lerp( Input_WindDirWS803_g158268 , Noise_DirWS825_g158268 , lerpResult701_g158268);
				half Input_MotionDelay753_g158268 = _MotionBaseDelayValue;
				float lerpResult756_g158268 = lerp( 1.0 , ( Input_WindValue853_g158268 * Input_WindValue853_g158268 ) , Input_MotionDelay753_g158268);
				half Wind_Delay815_g158268 = lerpResult756_g158268;
				float2 temp_output_809_0_g158268 = ( lerpResult646_g158268 * Input_WindValue853_g158268 * Wind_Delay815_g158268 );
				half2 Input_PushDirWS807_g158268 = float2( 1,0 );
				half Input_PushAlpha806_g158268 = ( 1.0 * 1.0 );
				float2 lerpResult811_g158268 = lerp( temp_output_809_0_g158268 , Input_PushDirWS807_g158268 , Input_PushAlpha806_g158268);
				#ifdef TVE_MOTION_ELEMENT
				float2 staticSwitch808_g158268 = lerpResult811_g158268;
				#else
				float2 staticSwitch808_g158268 = temp_output_809_0_g158268;
				#endif
				float2 temp_output_38_0_g158269 = staticSwitch808_g158268;
				float2 break83_g158269 = temp_output_38_0_g158269;
				float3 appendResult79_g158269 = (float3(break83_g158269.x , 0.0 , break83_g158269.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Bending893_g158264 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158269 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Base_Motion1440_g158264 = ( _MotionBaseIntensityValue * Base_Mask217_g158264 * Base_Bending893_g158264 );
				#ifdef TVE_MOTION
				float2 staticSwitch1651_g158264 = Base_Motion1440_g158264;
				#else
				float2 staticSwitch1651_g158264 = float2( 0,0 );
				#endif
				float4 appendResult1658_g158264 = (float4(staticSwitch1651_g158264 , 0.0 , 0.0));
				half4 Final_RoationData1570_g158264 = appendResult1658_g158264;
				float4 In_RotationData16_g158266 = Final_RoationData1570_g158264;
				{
				Data16_g158266.Dummy = In_Dummy16_g158266;
				Data16_g158266.PositionOS = In_PositionOS16_g158266;
				Data16_g158266.PositionWS = In_PositionWS16_g158266;
				Data16_g158266.PositionWO = In_PositionWO16_g158266;
				Data16_g158266.PositionRawOS = In_PositionRawOS16_g158266;
				Data16_g158266.PositionAddOS = In_PositionAddOS16_g158266;
				Data16_g158266.PivotOS = In_PivotOS16_g158266;
				Data16_g158266.PivotWS = In_PivotWS16_g158266;
				Data16_g158266.PivotWO = In_PivotWO16_g158266;
				Data16_g158266.NormalOS = In_NormalOS16_g158266;
				Data16_g158266.NormalWS = In_NormalWS16_g158266;
				Data16_g158266.NormalRawOS = In_NormalRawOS16_g158266;
				Data16_g158266.NormalRawWS = In_NormalRawWS16_g158266;
				Data16_g158266.TangentOS = In_TangentOS16_g158266;
				Data16_g158266.ViewDirWS = In_ViewDirWS16_g158266;
				Data16_g158266.VertexData = In_VertexData16_g158266;
				Data16_g158266.PhaseData = In_PhaseData16_g158266;
				Data16_g158266.BoundsData = In_BoundsData16_g158266;
				Data16_g158266.RotationData = In_RotationData16_g158266;
				}
				TVEModelData Data15_g158390 = Data16_g158266;
				float Out_Dummy15_g158390 = 0;
				float3 Out_PositionOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158390 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158390 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158390 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158390 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158390 = float3( 0,0,0 );
				float4 Out_VertexData15_g158390 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158390 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158390 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158390 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158390 = Data15_g158390.Dummy;
				Out_PositionOS15_g158390 = Data15_g158390.PositionOS;
				Out_PositionWS15_g158390 = Data15_g158390.PositionWS;
				Out_PositionWO15_g158390 = Data15_g158390.PositionWO;
				Out_PositionRawOS15_g158390 = Data15_g158390.PositionRawOS;
				Out_PositionAddOS15_g158390 = Data15_g158390.PositionAddOS;
				Out_PivotOS15_g158390 = Data15_g158390.PivotOS;
				Out_PivotWS15_g158390 = Data15_g158390.PivotWS;
				Out_PivotWO15_g158390 = Data15_g158390.PivotWO;
				Out_NormalOS15_g158390 = Data15_g158390.NormalOS;
				Out_NormalWS15_g158390 = Data15_g158390.NormalWS;
				Out_NormalRawOS15_g158390 = Data15_g158390.NormalRawOS;
				Out_NormalRawWS15_g158390 = Data15_g158390.NormalRawWS;
				Out_TangentOS15_g158390 = Data15_g158390.TangentOS;
				Out_ViewDirWS15_g158390 = Data15_g158390.ViewDirWS;
				Out_VertexData15_g158390 = Data15_g158390.VertexData;
				Out_PhaseData15_g158390 = Data15_g158390.PhaseData;
				Out_BoundsData15_g158390 = Data15_g158390.BoundsData;
				Out_RotationData15_g158390 = Data15_g158390.RotationData;
				}
				half3 Model_PositionOS147_g158389 = Out_PositionOS15_g158390;
				half3 VertexPos40_g158393 = Model_PositionOS147_g158389;
				float3 appendResult74_g158393 = (float3(VertexPos40_g158393.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158393 = appendResult74_g158393;
				float3 break84_g158393 = VertexPos40_g158393;
				float3 appendResult81_g158393 = (float3(0.0 , break84_g158393.y , break84_g158393.z));
				half3 VertexPosOtherAxis82_g158393 = appendResult81_g158393;
				float4 temp_output_1567_33_g158389 = Out_RotationData15_g158390;
				half4 Model_VertexBend1569_g158389 = temp_output_1567_33_g158389;
				float2 break1582_g158389 = (Model_VertexBend1569_g158389).xy;
				half Angle44_g158393 = break1582_g158389.y;
				half3 VertexPos40_g158396 = ( VertexPosRotationAxis50_g158393 + ( VertexPosOtherAxis82_g158393 * cos( Angle44_g158393 ) ) + ( cross( float3( 1, 0, 0 ) , VertexPosOtherAxis82_g158393 ) * sin( Angle44_g158393 ) ) );
				float3 appendResult74_g158396 = (float3(0.0 , 0.0 , VertexPos40_g158396.z));
				half3 VertexPosRotationAxis50_g158396 = appendResult74_g158396;
				float3 break84_g158396 = VertexPos40_g158396;
				float3 appendResult81_g158396 = (float3(break84_g158396.x , break84_g158396.y , 0.0));
				half3 VertexPosOtherAxis82_g158396 = appendResult81_g158396;
				half Angle44_g158396 = -break1582_g158389.x;
				float3 temp_output_1584_19_g158389 = ( VertexPosRotationAxis50_g158396 + ( VertexPosOtherAxis82_g158396 * cos( Angle44_g158396 ) ) + ( cross( float3( 0, 0, 1 ) , VertexPosOtherAxis82_g158396 ) * sin( Angle44_g158396 ) ) );
				float3 temp_output_6_0_g158395 = temp_output_1584_19_g158389;
				#ifdef TVE_MOTION
				float3 staticSwitch65_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch65_g158395 = Model_PositionOS147_g158389;
				#endif
				#ifdef TVE_CONFORM
				float3 staticSwitch69_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch69_g158395 = staticSwitch65_g158395;
				#endif
				float3 temp_output_1585_0_g158389 = staticSwitch69_g158395;
				float3 temp_output_1567_31_g158389 = Out_PositionAddOS15_g158390;
				half3 Model_PositionADD1568_g158389 = temp_output_1567_31_g158389;
				half3 Final_PositionOS178_g158389 = ( temp_output_1585_0_g158389 + Model_PositionADD1568_g158389 );
				float3 In_PositionOS16_g158391 = Final_PositionOS178_g158389;
				float3 In_PositionWS16_g158391 = Out_PositionWS15_g158390;
				float3 In_PositionWO16_g158391 = Out_PositionWO15_g158390;
				float3 In_PositionRawOS16_g158391 = Out_PositionRawOS15_g158390;
				float3 In_PositionAddOS16_g158391 = temp_output_1567_31_g158389;
				float3 In_PivotOS16_g158391 = Out_PivotOS15_g158390;
				float3 In_PivotWS16_g158391 = Out_PivotWS15_g158390;
				float3 In_PivotWO16_g158391 = Out_PivotWO15_g158390;
				float3 In_NormalOS16_g158391 = Out_NormalOS15_g158390;
				float3 In_NormalWS16_g158391 = Out_NormalWS15_g158390;
				float3 In_NormalRawOS16_g158391 = Out_NormalRawOS15_g158390;
				float3 In_NormalRawWS16_g158391 = Out_NormalRawWS15_g158390;
				float4 In_TangentOS16_g158391 = Out_TangentOS15_g158390;
				float3 In_ViewDirWS16_g158391 = Out_ViewDirWS15_g158390;
				float4 In_VertexData16_g158391 = Out_VertexData15_g158390;
				float4 In_PhaseData16_g158391 = Out_PhaseData15_g158390;
				float4 In_BoundsData16_g158391 = Out_BoundsData15_g158390;
				float4 In_RotationData16_g158391 = temp_output_1567_33_g158389;
				{
				Data16_g158391.Dummy = In_Dummy16_g158391;
				Data16_g158391.PositionOS = In_PositionOS16_g158391;
				Data16_g158391.PositionWS = In_PositionWS16_g158391;
				Data16_g158391.PositionWO = In_PositionWO16_g158391;
				Data16_g158391.PositionRawOS = In_PositionRawOS16_g158391;
				Data16_g158391.PositionAddOS = In_PositionAddOS16_g158391;
				Data16_g158391.PivotOS = In_PivotOS16_g158391;
				Data16_g158391.PivotWS = In_PivotWS16_g158391;
				Data16_g158391.PivotWO = In_PivotWO16_g158391;
				Data16_g158391.NormalOS = In_NormalOS16_g158391;
				Data16_g158391.NormalWS = In_NormalWS16_g158391;
				Data16_g158391.NormalRawOS = In_NormalRawOS16_g158391;
				Data16_g158391.NormalRawWS = In_NormalRawWS16_g158391;
				Data16_g158391.TangentOS = In_TangentOS16_g158391;
				Data16_g158391.ViewDirWS = In_ViewDirWS16_g158391;
				Data16_g158391.VertexData = In_VertexData16_g158391;
				Data16_g158391.PhaseData = In_PhaseData16_g158391;
				Data16_g158391.BoundsData = In_BoundsData16_g158391;
				Data16_g158391.RotationData = In_RotationData16_g158391;
				}
				TVEModelData Data15_g158419 = Data16_g158391;
				float Out_Dummy15_g158419 = 0;
				float3 Out_PositionOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158419 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158419 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158419 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158419 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158419 = float3( 0,0,0 );
				float4 Out_VertexData15_g158419 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158419 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158419 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158419 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158419 = Data15_g158419.Dummy;
				Out_PositionOS15_g158419 = Data15_g158419.PositionOS;
				Out_PositionWS15_g158419 = Data15_g158419.PositionWS;
				Out_PositionWO15_g158419 = Data15_g158419.PositionWO;
				Out_PositionRawOS15_g158419 = Data15_g158419.PositionRawOS;
				Out_PositionAddOS15_g158419 = Data15_g158419.PositionAddOS;
				Out_PivotOS15_g158419 = Data15_g158419.PivotOS;
				Out_PivotWS15_g158419 = Data15_g158419.PivotWS;
				Out_PivotWO15_g158419 = Data15_g158419.PivotWO;
				Out_NormalOS15_g158419 = Data15_g158419.NormalOS;
				Out_NormalWS15_g158419 = Data15_g158419.NormalWS;
				Out_NormalRawOS15_g158419 = Data15_g158419.NormalRawOS;
				Out_NormalRawWS15_g158419 = Data15_g158419.NormalRawWS;
				Out_TangentOS15_g158419 = Data15_g158419.TangentOS;
				Out_ViewDirWS15_g158419 = Data15_g158419.ViewDirWS;
				Out_VertexData15_g158419 = Data15_g158419.VertexData;
				Out_PhaseData15_g158419 = Data15_g158419.PhaseData;
				Out_BoundsData15_g158419 = Data15_g158419.BoundsData;
				Out_RotationData15_g158419 = Data15_g158419.RotationData;
				}
				float3 temp_output_31_0_g158407 = Out_PositionOS15_g158419;
				float3 temp_output_6_0_g158420 = ( temp_output_31_0_g158407 + _DisableSRPBatcher );
				float temp_output_371_0_g158324 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingGlobalValue + _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessGlobalValue + _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue + 0.0 ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue + _CutoutGlobalValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeScaleValue1 ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) + temp_output_371_0_g158324 );
				#ifdef TVE_DUMMY
				float3 staticSwitch14_g158420 = ( temp_output_6_0_g158420 + Dummy_Data505.r );
				#else
				float3 staticSwitch14_g158420 = temp_output_6_0_g158420;
				#endif
				
				float4 ase_positionCS = TransformWorldToHClip( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				output.ase_texcoord8 = ase_positionCS;
				output.ase_texcoord9.xyz = vertexToFrag305_g157220;
				output.ase_texcoord10.xyz = ase_normalWS;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord9.w = 0;
				output.ase_texcoord10.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = staticSwitch14_g158420;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS output = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, output);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						if (_TransparentCameraOnlyMotionVectors > 0)
						{
							previousPositionRWS = VMESHpositionRWS.xyz;
						}
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				output.vmeshPositionCS = VMESHpositionCS;
				output.vmeshPositionRWS = VMESHpositionRWS;

				output.vpassPositionCS = float3(VPASSpositionCS.xyw);
				output.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				return output;
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif

			#if ( 0 ) // TEMPORARY: defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
				o.precomputedVelocity = v.precomputedVelocity;
				#endif
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target3
			#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target2
			#else
			#define SV_TARGET_NORMAL SV_Target1
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_MSAA_DEPTH
					, out float4 depthColor : SV_Target0
					, out float4 outMotionVector : SV_Target1
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target2
						#endif
					#else
					, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target1
						#endif
					#endif

					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_TARGET_NORMAL
					#endif
					#if defined( ASE_DEPTH_WRITE_ON )
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
					#endif
					 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshPositionRWS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;

				float localBreakData4_g158410 = ( 0.0 );
				float localCompData3_g158401 = ( 0.0 );
				TVEVisualData Data3_g158401 = (TVEVisualData)0;
				half Dummy145_g158399 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) );
				float In_Dummy3_g158401 = Dummy145_g158399;
				float localBreakData4_g158400 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158292 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + 0.0 );
				float In_Dummy3_g158307 = Dummy145_g158292;
				float localBreakData4_g158296 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				half Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlayBakeInfo ) + 0.0 );
				float In_Dummy3_g158220 = Dummy594_g158217;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157228 = ( 0.0 );
				TVEVisualData Data3_g157228 = (TVEVisualData)0;
				float In_Dummy3_g157228 = 0.0;
				float4 output0 = 0;
				float4 output1 = 0;
				float4 output2 = 0;
				float4 ase_positionCS = packedInput.ase_texcoord8;
				ImpostorOutput io = ( ImpostorOutput )0;
				OctaImpostorFragment( io, ase_positionCS, PositionRWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1, output2 );
				float4 temp_cast_0 = (1.0).xxxx;
				half4 Input_Tex0377_g157220 = output0;
				half4 Input_Tex1379_g157220 = output1;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch403_g157220 = temp_cast_0;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch403_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch403_g157220 = temp_cast_0;
				#endif
				half Local_MultiMask249_g157220 = (staticSwitch403_g157220).b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( io.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157228 = Local_Albedo239_g157220;
				float3 In_AlbedoRaw3_g157228 = Local_Albedo239_g157220;
				float2 temp_cast_3 = (0.0).xx;
				float2 In_NormalTS3_g157228 = temp_cast_3;
				float3 In_NormalWS3_g157228 = io.WorldNormal;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 temp_cast_5 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch385_g157220 = temp_cast_4;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch385_g157220 = temp_cast_5;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch385_g157220 = temp_cast_4;
				#endif
				half Local_Metallic247_g157220 = (staticSwitch385_g157220).r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				float4 temp_cast_6 = (1.0).xxxx;
				float4 temp_cast_7 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch392_g157220 = temp_cast_6;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch392_g157220 = temp_cast_7;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch392_g157220 = temp_cast_6;
				#endif
				half Local_OcclusionOrEmissive248_g157220 = (staticSwitch392_g157220).g;
				float lerpResult431_g157220 = lerp( 1.0 , Local_OcclusionOrEmissive248_g157220 , _ImpostorOcclusionValue);
				#ifdef TVE_EMISSIVE
				float staticSwitch428_g157220 = 1.0;
				#else
				float staticSwitch428_g157220 = lerpResult431_g157220;
				#endif
				half Final_Occlusion424_g157220 = staticSwitch428_g157220;
				float4 temp_cast_8 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch408_g157220 = temp_cast_8;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch408_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch408_g157220 = temp_cast_8;
				#endif
				half Local_Smoothness250_g157220 = (staticSwitch408_g157220).a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , Final_Occlusion424_g157220 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157228 = appendResult257_g157220;
				float4 appendResult286_g157220 = (float4(Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , 1.0));
				float4 In_Emissive3_g157228 = appendResult286_g157220;
				float3 temp_output_3_0_g157221 = Local_Albedo239_g157220;
				float dotResult20_g157221 = dot( temp_output_3_0_g157221 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale268_g157220 = dotResult20_g157221;
				float In_Grayscale3_g157228 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157228 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157228 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157228 = 0.0;
				float In_AlphaFade3_g157228 = 1.0;
				float3 temp_cast_9 = (1.0).xxx;
				float3 In_Translucency3_g157228 = temp_cast_9;
				float In_Transmission3_g157228 = 1.0;
				float In_Thickness3_g157228 = 0.0;
				float In_Diffusion3_g157228 = 0.0;
				float In_Depth3_g157228 = ase_positionCS.z;
				{
				Data3_g157228.Dummy = In_Dummy3_g157228;
				Data3_g157228.Albedo = In_Albedo3_g157228;
				Data3_g157228.AlbedoRaw = In_AlbedoRaw3_g157228;
				Data3_g157228.NormalTS = In_NormalTS3_g157228;
				Data3_g157228.NormalWS = In_NormalWS3_g157228;
				Data3_g157228.Shader = In_Shader3_g157228;
				Data3_g157228.Emissive= In_Emissive3_g157228;
				Data3_g157228.MultiMask = In_MultiMask3_g157228;
				Data3_g157228.Grayscale = In_Grayscale3_g157228;
				Data3_g157228.Luminosity = In_Luminosity3_g157228;
				Data3_g157228.AlphaClip = In_AlphaClip3_g157228;
				Data3_g157228.AlphaFade = In_AlphaFade3_g157228;
				Data3_g157228.Translucency = In_Translucency3_g157228;
				Data3_g157228.Transmission = In_Transmission3_g157228;
				Data3_g157228.Thickness = In_Thickness3_g157228;
				Data3_g157228.Diffusion = In_Diffusion3_g157228;
				Data3_g157228.Depth = In_Depth3_g157228;
				}
				TVEVisualData Data4_g158218 = Data3_g157228;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				float Out_Depth4_g158218 = 0;
				{
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_AlbedoRaw4_g158218 = Data4_g158218.AlbedoRaw;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				Out_Depth4_g158218= Data4_g158218.Depth;
				}
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158231 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158237 = _OverlayProjRemap.x;
				float temp_output_9_0_g158237 = ( clampResult17_g158231 - temp_output_7_0_g158237 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158237 * _OverlayProjRemap.z ) + 0.0001 ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158232 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayLumaRemap.x;
				float temp_output_9_0_g158236 = ( clampResult17_g158232 - temp_output_7_0_g158236 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158236 * _OverlayLumaRemap.z ) + 0.0001 ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				TVEModelData Data16_g157227 = (TVEModelData)0;
				float In_Dummy16_g157227 = 0.0;
				half3 Input_PositionWS319_g157220 = GetAbsolutePositionWS( PositionRWS );
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157227 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157227 = Model_PositionWO311_g157220;
				float3 vertexToFrag305_g157220 = packedInput.ase_texcoord9.xyz;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157227 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157227 = Model_PivotWO312_g157220;
				float3 ase_normalWS = packedInput.ase_texcoord10.xyz;
				half3 Model_Normal_WS314_g157220 = ase_normalWS;
				float3 In_NormalWS16_g157227 = Model_Normal_WS314_g157220;
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157227 = Model_ViewDirWS347_g157220;
				float4 temp_cast_10 = (1.0).xxxx;
				half4 Input_Tex2380_g157220 = output2;
				float4 appendResult420_g157220 = (float4((Input_Tex1379_g157220).rg , 1.0 , 1.0));
				float4 temp_cast_13 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch414_g157220 = temp_cast_10;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch414_g157220 = Input_Tex2380_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch414_g157220 = appendResult420_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch414_g157220 = temp_cast_13;
				#else
				float4 staticSwitch414_g157220 = temp_cast_10;
				#endif
				half4 Local_VertexColor422_g157220 = staticSwitch414_g157220;
				float4 In_VertexData16_g157227 = Local_VertexColor422_g157220;
				float4 In_BoundsData16_g157227 = float4( 1,1,1,1 );
				{
				Data16_g157227.Dummy = In_Dummy16_g157227;
				Data16_g157227.PositionWS = In_PositionWS16_g157227;
				Data16_g157227.PositionWO = In_PositionWO16_g157227;
				Data16_g157227.PivotWS = In_PivotWS16_g157227;
				Data16_g157227.PivotWO = In_PivotWO16_g157227;
				Data16_g157227.NormalWS = In_NormalWS16_g157227;
				Data16_g157227.ViewDirWS = In_ViewDirWS16_g157227;
				Data16_g157227.VertexData = In_VertexData16_g157227;
				Data16_g157227.BoundsData = In_BoundsData16_g157227;
				}
				TVEModelData Data15_g158228 = Data16_g157227;
				float Out_Dummy15_g158228 = 0;
				float3 Out_PositionWS15_g158228 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158228 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158228 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g158228 = float3( 0,0,0 );
				float4 Out_VertexData15_g158228 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158228 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158228 = Data15_g158228.Dummy;
				Out_PositionWS15_g158228 = Data15_g158228.PositionWS;
				Out_PositionWO15_g158228 = Data15_g158228.PositionWO;
				Out_PivotWS15_g158228 = Data15_g158228.PivotWS;
				Out_PivotWO15_g158228 = Data15_g158228.PivotWO;
				Out_NormalWS15_g158228 = Data15_g158228.NormalWS;
				Out_ViewDirWS15_g158228 = Data15_g158228.ViewDirWS;
				Out_VertexData15_g158228 = Data15_g158228.VertexData;
				Out_BoundsData15_g158228 = Data15_g158228.BoundsData;
				}
				half4 Model_VertexMasks791_g158217 = Out_VertexData15_g158228;
				float4 break792_g158217 = Model_VertexMasks791_g158217;
				float4 break33_g158229 = _overlay_vert_mode;
				float temp_output_30_0_g158229 = ( break792_g158217.x * break33_g158229.x );
				float temp_output_29_0_g158229 = ( break792_g158217.y * break33_g158229.y );
				float temp_output_31_0_g158229 = ( break792_g158217.z * break33_g158229.z );
				float temp_output_28_0_g158229 = ( temp_output_30_0_g158229 + temp_output_29_0_g158229 + temp_output_31_0_g158229 + ( break792_g158217.w * break33_g158229.w ) );
				float clampResult17_g158230 = clamp( temp_output_28_0_g158229 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayMeshRemap.x;
				float temp_output_9_0_g158238 = ( clampResult17_g158230 - temp_output_7_0_g158238 );
				float lerpResult879_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158238 * _OverlayMeshRemap.z ) + 0.0001 ) ) , _OverlayMeshValue);
				float temp_output_6_0_g158233 = lerpResult879_g158217;
				#ifdef TVE_DUMMY
				float staticSwitch14_g158233 = ( temp_output_6_0_g158233 + _OverlayMeshMode );
				#else
				float staticSwitch14_g158233 = temp_output_6_0_g158233;
				#endif
				half Overlay_VertMask801_g158217 = staticSwitch14_g158233;
				float lerpResult920_g158217 = lerp( 1.0 , ( TVE_AtmoParams.z * TVE_IsEnabled ) , _OverlayGlobalValue);
				half Overlay_MaskGlobal429_g158217 = lerpResult920_g158217;
				float temp_output_7_0_g158239 = _OverlayBlendRemap.x;
				float temp_output_9_0_g158239 = ( ( _OverlayIntensityValue * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ) - temp_output_7_0_g158239 );
				half Overlay_Mask494_g158217 = saturate( ( ( temp_output_9_0_g158239 * _OverlayBlendRemap.z ) + 0.0001 ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				float3 In_AlbedoRaw3_g158220 = Out_AlbedoRaw4_g158218;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				float In_Depth3_g158220 = Out_Depth4_g158218;
				{
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.AlbedoRaw = In_AlbedoRaw3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				Data3_g158220.Depth = In_Depth3_g158220;
				}
				TVEVisualData Data4_g158296 = Data3_g158220;
				float Out_Dummy4_g158296 = 0;
				float3 Out_Albedo4_g158296 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158296 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158296 = float2( 0,0 );
				float3 Out_NormalWS4_g158296 = float3( 0,0,0 );
				float4 Out_Shader4_g158296 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158296 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158296 = 0;
				float Out_Grayscale4_g158296 = 0;
				float Out_Luminosity4_g158296 = 0;
				float Out_AlphaClip4_g158296 = 0;
				float Out_AlphaFade4_g158296 = 0;
				float3 Out_Translucency4_g158296 = float3( 0,0,0 );
				float Out_Transmission4_g158296 = 0;
				float Out_Thickness4_g158296 = 0;
				float Out_Diffusion4_g158296 = 0;
				float Out_Depth4_g158296 = 0;
				{
				Out_Dummy4_g158296 = Data4_g158296.Dummy;
				Out_Albedo4_g158296 = Data4_g158296.Albedo;
				Out_AlbedoRaw4_g158296 = Data4_g158296.AlbedoRaw;
				Out_NormalTS4_g158296 = Data4_g158296.NormalTS;
				Out_NormalWS4_g158296 = Data4_g158296.NormalWS;
				Out_Shader4_g158296 = Data4_g158296.Shader;
				Out_Emissive4_g158296= Data4_g158296.Emissive;
				Out_MultiMask4_g158296 = Data4_g158296.MultiMask;
				Out_Grayscale4_g158296 = Data4_g158296.Grayscale;
				Out_Luminosity4_g158296= Data4_g158296.Luminosity;
				Out_AlphaClip4_g158296 = Data4_g158296.AlphaClip;
				Out_AlphaFade4_g158296 = Data4_g158296.AlphaFade;
				Out_Translucency4_g158296 = Data4_g158296.Translucency;
				Out_Transmission4_g158296 = Data4_g158296.Transmission;
				Out_Thickness4_g158296 = Data4_g158296.Thickness;
				Out_Diffusion4_g158296 = Data4_g158296.Diffusion;
				Out_Depth4_g158296= Data4_g158296.Depth;
				}
				float3 temp_output_297_0_g158292 = Out_Albedo4_g158296;
				float3 In_Albedo3_g158307 = temp_output_297_0_g158292;
				float3 temp_output_297_23_g158292 = Out_AlbedoRaw4_g158296;
				float3 In_AlbedoRaw3_g158307 = temp_output_297_23_g158292;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158296;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158296;
				float4 In_Shader3_g158307 = Out_Shader4_g158296;
				float4 temp_cast_15 = (0.0).xxxx;
				half4 Visual_Emissive255_g158292 = Out_Emissive4_g158296;
				half Emissive_MeshMask221_g158292 = 1.0;
				half Emissive_Mask103_g158292 = 1.0;
				float temp_output_279_0_g158292 = ( Emissive_MeshMask221_g158292 * Emissive_Mask103_g158292 );
				float3 appendResult293_g158292 = (float3(temp_output_279_0_g158292 , temp_output_279_0_g158292 , temp_output_279_0_g158292));
				half3 Local_EmissiveColor278_g158292 = appendResult293_g158292;
				float3 temp_output_316_0_g158292 = (TVE_GlowParams).xyz;
				float3 lerpResult299_g158292 = lerp( float3( 1,1,1 ) , temp_output_316_0_g158292 , ( _EmissiveGlobalValue * TVE_IsEnabled ));
				half3 Emissive_GlobalMask248_g158292 = lerpResult299_g158292;
				half3 Visual_AlbedoRaw306_g158292 = temp_output_297_23_g158292;
				float3 lerpResult307_g158292 = lerp( float3( 1,1,1 ) , Visual_AlbedoRaw306_g158292 , _EmissiveColorMode);
				half3 Local_EmissiveValue88_g158292 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158292 * lerpResult307_g158292 );
				half3 Emissive_Blend260_g158292 = ( ( (Visual_Emissive255_g158292).xyz * Local_EmissiveColor278_g158292 ) * Local_EmissiveValue88_g158292 );
				float3 temp_output_3_0_g158298 = Emissive_Blend260_g158292;
				float temp_output_15_0_g158298 = _emissive_power_value;
				float3 hdEmission22_g158298 = ASEGetEmissionHDRColor(temp_output_3_0_g158298,temp_output_15_0_g158298,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Local_EmissiveMask294_g158292 = temp_output_279_0_g158292;
				float4 appendResult295_g158292 = (float4(hdEmission22_g158298 , Local_EmissiveMask294_g158292));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158292 = appendResult295_g158292;
				#else
				float4 staticSwitch129_g158292 = temp_cast_15;
				#endif
				half4 Final_Emissive184_g158292 = staticSwitch129_g158292;
				float4 In_Emissive3_g158307 = Final_Emissive184_g158292;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158296;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158296;
				float temp_output_297_11_g158292 = Out_MultiMask4_g158296;
				float In_MultiMask3_g158307 = temp_output_297_11_g158292;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158296;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158296;
				float3 In_Translucency3_g158307 = Out_Translucency4_g158296;
				float In_Transmission3_g158307 = Out_Transmission4_g158296;
				float In_Thickness3_g158307 = Out_Thickness4_g158296;
				float In_Diffusion3_g158307 = Out_Diffusion4_g158296;
				float In_Depth3_g158307 = Out_Depth4_g158296;
				{
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.AlbedoRaw = In_AlbedoRaw3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				Data3_g158307.Depth = In_Depth3_g158307;
				}
				TVEVisualData Data4_g158400 = Data3_g158307;
				float Out_Dummy4_g158400 = 0;
				float3 Out_Albedo4_g158400 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158400 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158400 = float2( 0,0 );
				float3 Out_NormalWS4_g158400 = float3( 0,0,0 );
				float4 Out_Shader4_g158400 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158400 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158400 = 0;
				float Out_Grayscale4_g158400 = 0;
				float Out_Luminosity4_g158400 = 0;
				float Out_AlphaClip4_g158400 = 0;
				float Out_AlphaFade4_g158400 = 0;
				float3 Out_Translucency4_g158400 = float3( 0,0,0 );
				float Out_Transmission4_g158400 = 0;
				float Out_Thickness4_g158400 = 0;
				float Out_Diffusion4_g158400 = 0;
				float Out_Depth4_g158400 = 0;
				{
				Out_Dummy4_g158400 = Data4_g158400.Dummy;
				Out_Albedo4_g158400 = Data4_g158400.Albedo;
				Out_AlbedoRaw4_g158400 = Data4_g158400.AlbedoRaw;
				Out_NormalTS4_g158400 = Data4_g158400.NormalTS;
				Out_NormalWS4_g158400 = Data4_g158400.NormalWS;
				Out_Shader4_g158400 = Data4_g158400.Shader;
				Out_Emissive4_g158400= Data4_g158400.Emissive;
				Out_MultiMask4_g158400 = Data4_g158400.MultiMask;
				Out_Grayscale4_g158400 = Data4_g158400.Grayscale;
				Out_Luminosity4_g158400= Data4_g158400.Luminosity;
				Out_AlphaClip4_g158400 = Data4_g158400.AlphaClip;
				Out_AlphaFade4_g158400 = Data4_g158400.AlphaFade;
				Out_Translucency4_g158400 = Data4_g158400.Translucency;
				Out_Transmission4_g158400 = Data4_g158400.Transmission;
				Out_Thickness4_g158400 = Data4_g158400.Thickness;
				Out_Diffusion4_g158400 = Data4_g158400.Diffusion;
				Out_Depth4_g158400= Data4_g158400.Depth;
				}
				half3 Visual_Albedo199_g158399 = Out_Albedo4_g158400;
				half3 Final_Albedo312_g158399 = Visual_Albedo199_g158399;
				float3 In_Albedo3_g158401 = Final_Albedo312_g158399;
				float3 In_AlbedoRaw3_g158401 = Out_AlbedoRaw4_g158400;
				float2 In_NormalTS3_g158401 = Out_NormalTS4_g158400;
				float3 In_NormalWS3_g158401 = Out_NormalWS4_g158400;
				float4 In_Shader3_g158401 = Out_Shader4_g158400;
				float4 In_Emissive3_g158401 = Out_Emissive4_g158400;
				float In_Grayscale3_g158401 = Out_Grayscale4_g158400;
				float In_Luminosity3_g158401 = Out_Luminosity4_g158400;
				float temp_output_301_11_g158399 = Out_MultiMask4_g158400;
				float In_MultiMask3_g158401 = temp_output_301_11_g158399;
				float In_AlphaClip3_g158401 = Out_AlphaClip4_g158400;
				float In_AlphaFade3_g158401 = Out_AlphaFade4_g158400;
				float3 temp_cast_16 = (0.0).xxx;
				half3 Subsurface_Color264_g158399 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158399 );
				half Visual_Transmission138_g158399 = Out_Transmission4_g158400;
				half Subsurface_Value268_g158399 = _SubsurfaceIntensityValue;
				float lerpResult403_g158399 = lerp( 1.0 , TVE_GlowParams.w , ( _SubsurfaceGlobalValue * TVE_IsEnabled ));
				half Subsurface_GlobalMask369_g158399 = lerpResult403_g158399;
				half Visual_MultiMask292_g158399 = temp_output_301_11_g158399;
				float lerpResult293_g158399 = lerp( 1.0 , Visual_MultiMask292_g158399 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158399 = lerpResult293_g158399;
				half Custom_Mask363_g158399 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158399 = ( Visual_Transmission138_g158399 * Subsurface_Value268_g158399 * Subsurface_GlobalMask369_g158399 * Subsurface_MultiMask296_g158399 * Custom_Mask363_g158399 );
				#else
				float staticSwitch345_g158399 = 0.0;
				#endif
				half Final_Transmission269_g158399 = staticSwitch345_g158399;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158399 = ( Subsurface_Color264_g158399 * Final_Transmission269_g158399 * 10.0 );
				#else
				float3 staticSwitch348_g158399 = temp_cast_16;
				#endif
				half3 Final_Translucency254_g158399 = staticSwitch348_g158399;
				float3 In_Translucency3_g158401 = Final_Translucency254_g158399;
				float In_Transmission3_g158401 = Final_Transmission269_g158399;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158399 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158399 = 1.0;
				#endif
				half Final_Thickness275_g158399 = staticSwitch351_g158399;
				float In_Thickness3_g158401 = Final_Thickness275_g158399;
				float Final_Diffusion340_g158399 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158401 = Final_Diffusion340_g158399;
				float In_Depth3_g158401 = Out_Depth4_g158400;
				{
				Data3_g158401.Dummy = In_Dummy3_g158401;
				Data3_g158401.Albedo = In_Albedo3_g158401;
				Data3_g158401.AlbedoRaw = In_AlbedoRaw3_g158401;
				Data3_g158401.NormalTS = In_NormalTS3_g158401;
				Data3_g158401.NormalWS = In_NormalWS3_g158401;
				Data3_g158401.Shader = In_Shader3_g158401;
				Data3_g158401.Emissive= In_Emissive3_g158401;
				Data3_g158401.MultiMask = In_MultiMask3_g158401;
				Data3_g158401.Grayscale = In_Grayscale3_g158401;
				Data3_g158401.Luminosity = In_Luminosity3_g158401;
				Data3_g158401.AlphaClip = In_AlphaClip3_g158401;
				Data3_g158401.AlphaFade = In_AlphaFade3_g158401;
				Data3_g158401.Translucency = In_Translucency3_g158401;
				Data3_g158401.Transmission = In_Transmission3_g158401;
				Data3_g158401.Thickness = In_Thickness3_g158401;
				Data3_g158401.Diffusion = In_Diffusion3_g158401;
				Data3_g158401.Depth = In_Depth3_g158401;
				}
				TVEVisualData Data4_g158410 = Data3_g158401;
				float Out_Dummy4_g158410 = 0;
				float3 Out_Albedo4_g158410 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158410 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158410 = float2( 0,0 );
				float3 Out_NormalWS4_g158410 = float3( 0,0,0 );
				float4 Out_Shader4_g158410 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158410 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158410 = 0;
				float Out_Grayscale4_g158410 = 0;
				float Out_Luminosity4_g158410 = 0;
				float Out_AlphaClip4_g158410 = 0;
				float Out_AlphaFade4_g158410 = 0;
				float3 Out_Translucency4_g158410 = float3( 0,0,0 );
				float Out_Transmission4_g158410 = 0;
				float Out_Thickness4_g158410 = 0;
				float Out_Diffusion4_g158410 = 0;
				float Out_Depth4_g158410 = 0;
				{
				Out_Dummy4_g158410 = Data4_g158410.Dummy;
				Out_Albedo4_g158410 = Data4_g158410.Albedo;
				Out_AlbedoRaw4_g158410 = Data4_g158410.AlbedoRaw;
				Out_NormalTS4_g158410 = Data4_g158410.NormalTS;
				Out_NormalWS4_g158410 = Data4_g158410.NormalWS;
				Out_Shader4_g158410 = Data4_g158410.Shader;
				Out_Emissive4_g158410= Data4_g158410.Emissive;
				Out_MultiMask4_g158410 = Data4_g158410.MultiMask;
				Out_Grayscale4_g158410 = Data4_g158410.Grayscale;
				Out_Luminosity4_g158410= Data4_g158410.Luminosity;
				Out_AlphaClip4_g158410 = Data4_g158410.AlphaClip;
				Out_AlphaFade4_g158410 = Data4_g158410.AlphaFade;
				Out_Translucency4_g158410 = Data4_g158410.Translucency;
				Out_Transmission4_g158410 = Data4_g158410.Transmission;
				Out_Thickness4_g158410 = Data4_g158410.Thickness;
				Out_Diffusion4_g158410 = Data4_g158410.Diffusion;
				Out_Depth4_g158410= Data4_g158410.Depth;
				}
				
				float4 break24_g158407 = Out_Shader4_g158410;
				

				surfaceDescription.Normal = Out_NormalWS4_g158410;
				surfaceDescription.Smoothness = break24_g158407.w;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
					float3 positionOS = mul( GetWorldToObjectMatrix(),  float4( PositionRWS, 1.0 ) ).xyz;
					float3 previousPositionRWS = mul( GetPrevObjectToWorldMatrix(),  float4( positionOS, 1.0 ) ).xyz;
					packedInput.vpassPositionCS = mul( UNITY_MATRIX_UNJITTERED_VP, float4( PositionRWS, 1.0 ) ).xyw;
					packedInput.vpassPreviousPositionCS = mul( UNITY_MATRIX_PREV_VP, float4( previousPositionRWS, 1.0 ) ).xyw;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = Out_Depth4_g158410;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.vmeshPositionCS.z;
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER)
					DecalPrepassData decalPrepassData;
					#ifdef _DISABLE_DECALS
					ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
					#else
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
					#endif
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
					outDecalBuffer.w = (GetMeshRenderingLightLayer() & 0x000000FF) / 255.0;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Blend 1 One OneMinusSrcAlpha

			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
			}


            ColorMask [_ColorMaskTransparentVelOne] 1
            ColorMask [_ColorMaskTransparentVelTwo] 2

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local_fragment _ _DISABLE_SSR
			#define ASE_FRAGMENT_NORMAL 2
			#define ASE_DEPTH_WRITE_ON
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 140012
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

            #pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH
            #pragma multi_compile_fragment AREA_SHADOW_MEDIUM AREA_SHADOW_HIGH
            #pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON
            #pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST

            #pragma multi_compile _ DEBUG_DISPLAY
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT

			#ifndef SHADER_STAGE_FRAGMENT
			#define SHADOW_LOW
			#define USE_FPTL_LIGHTLIST
			#endif

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_FORWARD
		    #define HAS_LIGHTLOOP 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DitherColoring;
			half4 _OverlayLumaRemap;
			half4 _OverlayProjRemap;
			half4 _OverlayColor;
			half4 _DrynessColoring;
			half4 _TintingLumaRemap;
			half4 _ImpostorColor;
			half4 _overlay_vert_mode;
			half4 _ImpostorColorTwo;
			half4 _TintingColoring;
			half4 _SizeFadeColoring;
			float4 _AI_SizeOffset;
			half4 _VariationNoiseRemap;
			half4 _VariationColorOne;
			half4 _VariationColorTwo;
			float4 _TintingColor;
			half4 _OverlayMeshRemap;
			half4 _VariationColoring;
			float4 _DrynessColor;
			half4 _DrynessLumaRemap;
			half4 _EmissiveColor;
			half4 _OverlayBlendRemap;
			half4 _WetnessColoring;
			half4 _CutoutColoring;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			float3 _AI_Offset;
			float3 _AI_BoundsMin;
			float3 _AI_BoundsSize;
			half _SizeFadeCategory;
			half _CutoutLiteInfo;
			half _SizeFadeEnd;
			half _SizeFadeScaleValue1;
			half _SizeFadeLiteInfo;
			half _DitherNoiseTillingValue;
			half _CutoutCategory;
			half _DitherMultiValue;
			half _DitherShadowMode;
			half _DitherDistanceMaxValue;
			half _CutoutNoiseValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseTillingValue;
			half _CutoutGlobalValue;
			half _CutoutMultiValue;
			half _DitherLiteInfo;
			half _CutoutShadowMode;
			half _DitherDistanceMinValue;
			half _CutoutIntensityValue;
			half _DitherCategory;
			half _CutoutSpace;
			half _DitherEnd;
			half _DitherConstantValue;
			half _DitherDistanceValue;
			half _CutoutEnd;
			half _SizeFadeIntensityValue;
			half _ImpostorMaskOffInfo;
			half _SubsurfaceCategory;
			half _SizeFadeScaleValue;
			half _ImpostorSmoothnessValue;
			half _OverlayIntensityValue;
			half _OverlayProjValue;
			half _OverlayLumaValue;
			half _OverlayMeshValue;
			half _OverlayMeshMode;
			half _OverlayGlobalValue;
			half _OverlayNormalValue;
			half _OverlaySmoothnessValue;
			half _OverlaySubsurfaceValue;
			half _EmissiveIntensityValue;
			half _EmissiveGlobalValue;
			half _EmissiveColorMode;
			float _emissive_power_value;
			half _EmissiveExposureValue;
			half _SubsurfaceIntensityValue;
			half _SubsurfaceGlobalValue;
			half _ImpostorOcclusionValue;
			half _SizeFadeScaleMode;
			half _ImpostorMetallicValue;
			half _OverlayBakeInfo;
			half _SizeFadeDistMinValue;
			half _SizeFadeDistMaxValue;
			half _GlobalLiteInfo;
			half _GlobalCategory;
			half _GlobalEnd;
			half _WetnessSmoothnessValue;
			half _SubsurfaceEnd;
			half _SubsurfaceDirectValue;
			half _SubsurfaceNormalValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _EmissiveCategory;
			half _EmissiveEnd;
			half _EmissivePowerMode;
			half _EmissivePowerValue;
			half _OverlayCategory;
			half _OverlayEnd;
			half _ImpostorColorMode;
			half _WetnessContrastValue;
			half _DrynessMultiValue;
			half _WetnessEnd;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsCollected;
			half _IsLiteShader;
			half _MotionCategory;
			half _MotionEnd;
			half _MotionLiteInfo;
			float _AI_Clip;
			float _AI_TextureBias;
			float _AI_Parallax;
			float _AI_ShadowBias;
			half _ImpostorEnd;
			half _IsShared;
			half _IsCustomShader;
			half _IsTVEShader;
			half _ImpostorMaskDefaultInfo;
			half _ImpostorMaskPackedInfo;
			half _ImpostorMaskShadingInfo;
			half _ImpostorMaskMode;
			half _ImpostorSpace0;
			half _ImpostorSpace1;
			half _ImpostorAlphaClipValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _SubsurfaceScatteringValue;
			half _IsVersion;
			half _RenderDecals;
			half _RenderSSR;
			half _CategoryRender;
			half _EndRender;
			half _IsInitialized;
			float _AI_ShadowView;
			float _AI_ForwardBias;
			float _AI_Frames;
			float _AI_DepthSize;
			half _TintingGlobalValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessIntensityValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _DrynessGlobalValue;
			half _SubsurfaceMultiValue;
			half _DrynessLumaValue;
			half _WetnessLiteInfo;
			half _WetnessCategory;
			half _TintingGrayValue;
			half _WetnessIntensityValue;
			half _TintingIntensityValue;
			half _TintingEnd;
			float _AI_ImpostorSize;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			half _MotionBaseTillingValue;
			half _MotionBaseSpeedValue;
			half _MotionBaseNoiseValue;
			half _MotionIntensityValue;
			half _MotionBaseDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _VariationNoiseTillingValue;
			half _TintingLiteInfo;
			half _TintingCategory;
			half _TintingSpace;
			half _SubsurfaceThicknessValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			TEXTURE2D(_MotionNoiseTex);
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_MotionParamsEditor;
			half _DisableSRPBatcher;
			TEXTURE2D(_Shader);
			TEXTURE2D(_Packed);
			TEXTURE2D(_Vertex);
			SAMPLER(sampler_Shader);
			SAMPLER(sampler_Packed);
			SAMPLER(sampler_Vertex);
			half4 TVE_AtmoParams;
			half TVE_IsEnabled;
			half4 TVE_GlowParams;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define AI_ObjectToWorld GetObjectToWorldMatrix()
			#define AI_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_CHANGES_WORLD_POS
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_CLIP_POS
			#define ASE_NEEDS_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#pragma shader_feature_local _USE_PARALLAX_ON
			#pragma shader_feature_local _HEMI_ON
			#pragma shader_feature_local AI_CLIP_NEIGHBOURS_FRAMES
			#pragma shader_feature_local_vertex TVE_MOTION
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_IMPOSTOR_MASK_OFF TVE_IMPOSTOR_MASK_DEFAULT TVE_IMPOSTOR_MASK_PACKED TVE_IMPOSTOR_MASK_SHADING
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IMPOSTOR_SHADER
			//#define _USE_PARALLAX_ON
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 UVsFrame122_g156549 : TEXCOORD7;
				float4 UVsFrame222_g156549 : TEXCOORD8;
				float4 UVsFrame322_g156549 : TEXCOORD9;
				float4 octaframe22_g156549 : TEXCOORD10;
				float4 viewPos22_g156549 : TEXCOORD11;
				float4 ase_texcoord12 : TEXCOORD12;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			struct ImpostorOutput
			{
				half3 Albedo;
				half3 Specular;
				half Metallic;
				half3 WorldNormal;
				half Smoothness;
				half Occlusion;
				half3 Emission;
				half Alpha;
			};
			
			float2 VectorToOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, out float2 uvs, out float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			float2 VectorToHemiOctahedron( float3 N )
			{
				N.xy /= dot( 1.0, abs( N ) );
				return float2( N.x + N.y, N.x - N.y );
			}
			
			float3 HemiOctahedronToVector( float2 Oct )
			{
				Oct = float2( Oct.x + Oct.y, Oct.x - Oct.y ) * 0.5;
				float3 N = float3( Oct, 1 - dot( 1.0, abs( Oct ) ) );
				return normalize( N );
			}
			
			inline void OctaImpostorVertex( inout float3 positionOS, out float3 normalOS, out float4 tangentOS, out float4 uvsFrame1, out float4 uvsFrame2, out float4 uvsFrame3, out float4 octaFrame, out float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = AI_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = AI_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( AI_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				#if defined( _HEMI_ON )
				objectCameraDirection.y = max(0.001, objectCameraDirection.y);
				float2 frameOcta = VectorToHemiOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#else
				float2 frameOcta = VectorToOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#endif
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa1WorldY = HemiOctahedronToVector( octaFrame1 ).xzy;
				#else
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				#endif
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*out*/ uvFrame1, /*out*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa2WorldY = HemiOctahedronToVector( octaFrame2 ).xzy;
				#else
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				#endif
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*out*/ uvFrame2, /*out*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa3WorldY = HemiOctahedronToVector( octaFrame3 ).xzy;
				#else
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				#endif
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*out*/ uvFrame3, /*out*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				octaFrame.zw = fractionOctaFrame;
				#endif
				positionOS = billboard + _AI_Offset.xyz;
				normalOS = objectCameraDirection;
				tangentOS = float4( objectHorizontalVector, 1 );
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout ImpostorOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 viewPos, out float4 output0, out float4 output1, out float4 output2 )
			{
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, -1 );
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, -1 );
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, -1 );
				float2 parallax1_uv = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float2 parallax2_uv = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float2 parallax3_uv = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1_uv, _AI_TextureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2_uv, _AI_TextureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3_uv, _AI_TextureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1_uv - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2_uv, parallax3_uv ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * ( 1 - step_1 );
				step23 = step23 * ( 1 - step23 );
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				#endif
				o.Albedo = blendedAlbedo.rgb;
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1_uv, _AI_TextureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2_uv, _AI_TextureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3_uv, _AI_TextureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				o.WorldNormal = normalize( mul( (float3x3)AI_ObjectToWorld, localNormal ) );
				float depth = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 ) * _AI_DepthSize * length( AI_ObjectToWorld[ 2 ].xyz );
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax1_uv, _AI_TextureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax2_uv, _AI_TextureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax3_uv, _AI_TextureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax1_uv, _AI_TextureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax2_uv, _AI_TextureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax3_uv, _AI_TextureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float4 output2a = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax1_uv, _AI_TextureBias );
				float4 output2b = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax2_uv, _AI_TextureBias );
				float4 output2c = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax3_uv, _AI_TextureBias );
				output2 = output2a * weights.x  + output2b * weights.y + output2c * weights.z; 
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView - _AI_ShadowBias;
				#else 
				viewPos.z += depth + _AI_ForwardBias;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				#if defined(SHADERPASS) && defined(UNITY_PASS_SHADOWCASTER)
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#else
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.specularOcclusion = 1.0;

				surfaceData.baseColor =                 surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normal = surfaceDescription.Normal;

			#if ( UNITY_VERSION <= 202236 )
				#if ( ASE_FRAGMENT_NORMAL == 1 )
					GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#elif ( ASE_FRAGMENT_NORMAL == 2 )
					GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#endif

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#else
				#ifdef DECAL_NORMAL_BLENDING
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						normal = SurfaceGradientFromPerturbedNormal(TransformWorldToObjectNormal(fragInputs.tangentToWorld[2]), normal);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						normal = SurfaceGradientFromPerturbedNormal(fragInputs.tangentToWorld[2], normal);
					#else
						normal = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normal, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normal);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif

					GetNormalWS_SG(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
				#else
					#if ( ASE_FRAGMENT_NORMAL == 1 )
						GetNormalWS_SrcOS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#elif ( ASE_FRAGMENT_NORMAL == 2 )
						GetNormalWS_SrcWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#else
						GetNormalWS(fragInputs, normal, surfaceData.normalWS, doubleSidedConstants);
					#endif

					#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
						ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
					}
					#endif
				#endif
			#endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
                    GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.tangentToWorld);
				#endif

				#if defined(DEBUG_DISPLAY)
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
						surfaceData.metallic = 0;
					}
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

				float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS output )
			{
				_TimeParameters.xyz = timeParameters;
				TVEModelData Data16_g158391 = (TVEModelData)0;
				float In_Dummy16_g158391 = 0.0;
				TVEModelData Data16_g158266 = (TVEModelData)0;
				half Dummy181_g158264 = ( ( _MotionCategory + _MotionEnd ) + _MotionLiteInfo );
				float In_Dummy16_g158266 = Dummy181_g158264;
				TVEModelData Data16_g157226 = (TVEModelData)0;
				float In_Dummy16_g157226 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS.xyz, inputMesh.normalOS.xyz, inputMesh.tangentOS, output.UVsFrame122_g156549, output.UVsFrame222_g156549, output.UVsFrame322_g156549, output.octaframe22_g156549, output.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( TransformObjectToWorld( inputMesh.positionOS.xyz ) );
				half3 Input_PositionWS319_g157220 = worldPosOut22_g156549;
				float3 worldToObj315_g157220 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS( Input_PositionWS319_g157220 ), 1 ) ).xyz;
				half3 Model_PositionOS316_g157220 = worldToObj315_g157220;
				float3 In_PositionOS16_g157226 = Model_PositionOS316_g157220;
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157226 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157226 = Model_PositionWO311_g157220;
				float3 In_PositionRawOS16_g157226 = Model_PositionOS316_g157220;
				float3 In_PositionAddOS16_g157226 = float3( 0,0,0 );
				float3 In_PivotOS16_g157226 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157223 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157223 = ( localObjectPosition_UNITY_MATRIX_M14_g157223 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157223 = localObjectPosition_UNITY_MATRIX_M14_g157223;
				#endif
				float3 vertexToFrag305_g157220 = staticSwitch13_g157223;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157226 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157226 = Model_PivotWO312_g157220;
				half3 Model_NormalOS313_g157220 = inputMesh.normalOS;
				float3 In_NormalOS16_g157226 = Model_NormalOS313_g157220;
				float3 ase_normalWS = TransformObjectToWorldNormal( inputMesh.normalOS );
				half3 Model_Normal_WS314_g157220 = ase_normalWS;
				float3 In_NormalWS16_g157226 = Model_Normal_WS314_g157220;
				float3 In_NormalRawOS16_g157226 = Model_NormalOS313_g157220;
				float3 In_NormalRawWS16_g157226 = Model_Normal_WS314_g157220;
				float4 In_TangentOS16_g157226 = float4( 0,1,0,1 );
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157226 = Model_ViewDirWS347_g157220;
				float4 In_VertexData16_g157226 = float4( 1,1,1,1 );
				float4 In_PhaseData16_g157226 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157226 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157226 = float4( 0,0,0,0 );
				{
				Data16_g157226.Dummy = In_Dummy16_g157226;
				Data16_g157226.PositionOS = In_PositionOS16_g157226;
				Data16_g157226.PositionWS = In_PositionWS16_g157226;
				Data16_g157226.PositionWO = In_PositionWO16_g157226;
				Data16_g157226.PositionRawOS = In_PositionRawOS16_g157226;
				Data16_g157226.PositionAddOS = In_PositionAddOS16_g157226;
				Data16_g157226.PivotOS = In_PivotOS16_g157226;
				Data16_g157226.PivotWS = In_PivotWS16_g157226;
				Data16_g157226.PivotWO = In_PivotWO16_g157226;
				Data16_g157226.NormalOS = In_NormalOS16_g157226;
				Data16_g157226.NormalWS = In_NormalWS16_g157226;
				Data16_g157226.NormalRawOS = In_NormalRawOS16_g157226;
				Data16_g157226.NormalRawWS = In_NormalRawWS16_g157226;
				Data16_g157226.TangentOS = In_TangentOS16_g157226;
				Data16_g157226.ViewDirWS = In_ViewDirWS16_g157226;
				Data16_g157226.VertexData = In_VertexData16_g157226;
				Data16_g157226.PhaseData = In_PhaseData16_g157226;
				Data16_g157226.BoundsData = In_BoundsData16_g157226;
				Data16_g157226.RotationData = In_RotationData16_g157226;
				}
				TVEModelData Data15_g158265 = Data16_g157226;
				float Out_Dummy15_g158265 = 0;
				float3 Out_PositionOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158265 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158265 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158265 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158265 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158265 = float3( 0,0,0 );
				float4 Out_VertexData15_g158265 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158265 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158265 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158265 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158265 = Data15_g158265.Dummy;
				Out_PositionOS15_g158265 = Data15_g158265.PositionOS;
				Out_PositionWS15_g158265 = Data15_g158265.PositionWS;
				Out_PositionWO15_g158265 = Data15_g158265.PositionWO;
				Out_PositionRawOS15_g158265 = Data15_g158265.PositionRawOS;
				Out_PositionAddOS15_g158265 = Data15_g158265.PositionAddOS;
				Out_PivotOS15_g158265 = Data15_g158265.PivotOS;
				Out_PivotWS15_g158265 = Data15_g158265.PivotWS;
				Out_PivotWO15_g158265 = Data15_g158265.PivotWO;
				Out_NormalOS15_g158265 = Data15_g158265.NormalOS;
				Out_NormalWS15_g158265 = Data15_g158265.NormalWS;
				Out_NormalRawOS15_g158265 = Data15_g158265.NormalRawOS;
				Out_NormalRawWS15_g158265 = Data15_g158265.NormalRawWS;
				Out_TangentOS15_g158265 = Data15_g158265.TangentOS;
				Out_ViewDirWS15_g158265 = Data15_g158265.ViewDirWS;
				Out_VertexData15_g158265 = Data15_g158265.VertexData;
				Out_PhaseData15_g158265 = Data15_g158265.PhaseData;
				Out_BoundsData15_g158265 = Data15_g158265.BoundsData;
				Out_RotationData15_g158265 = Data15_g158265.RotationData;
				}
				float3 temp_output_1567_0_g158264 = Out_PositionOS15_g158265;
				float3 In_PositionOS16_g158266 = temp_output_1567_0_g158264;
				float3 In_PositionWS16_g158266 = Out_PositionWS15_g158265;
				float3 temp_output_1567_17_g158264 = Out_PositionWO15_g158265;
				float3 In_PositionWO16_g158266 = temp_output_1567_17_g158264;
				float3 In_PositionRawOS16_g158266 = Out_PositionRawOS15_g158265;
				float3 In_PositionAddOS16_g158266 = Out_PositionAddOS15_g158265;
				float3 In_PivotOS16_g158266 = Out_PivotOS15_g158265;
				float3 In_PivotWS16_g158266 = Out_PivotWS15_g158265;
				float3 temp_output_1567_19_g158264 = Out_PivotWO15_g158265;
				float3 In_PivotWO16_g158266 = temp_output_1567_19_g158264;
				float3 In_NormalOS16_g158266 = Out_NormalOS15_g158265;
				float3 In_NormalWS16_g158266 = Out_NormalWS15_g158265;
				float3 In_NormalRawOS16_g158266 = Out_NormalRawOS15_g158265;
				float3 In_NormalRawWS16_g158266 = Out_NormalRawWS15_g158265;
				float4 In_TangentOS16_g158266 = Out_TangentOS15_g158265;
				float3 In_ViewDirWS16_g158266 = Out_ViewDirWS15_g158265;
				float4 In_VertexData16_g158266 = Out_VertexData15_g158265;
				float4 In_PhaseData16_g158266 = Out_PhaseData15_g158265;
				float4 In_BoundsData16_g158266 = Out_BoundsData15_g158265;
				half3 Model_PositionOS147_g158264 = temp_output_1567_0_g158264;
				half Base_Mask217_g158264 = saturate( ( Model_PositionOS147_g158264.y / _AI_Offset.y ) );
				float4 lerpResult836_g158275 = lerp( half4( 0, 1, 1, 0 ) , TVE_MotionParams , TVE_MotionParams.w);
				half2 Global_WindDirWS1663_g158264 = (lerpResult836_g158275).xy;
				half2 Input_WindDirWS803_g158268 = Global_WindDirWS1663_g158264;
				half3 Model_PositionWO162_g158264 = temp_output_1567_17_g158264;
				half3 Model_PivotWO402_g158264 = temp_output_1567_19_g158264;
				float3 lerpResult829_g158264 = lerp( Model_PositionWO162_g158264 , Model_PivotWO402_g158264 , _MotionBasePivotValue);
				half3 Base_Position1394_g158264 = lerpResult829_g158264;
				half3 Input_PositionWO419_g158268 = Base_Position1394_g158264;
				half Input_MotionTilling321_g158268 = ( _MotionBaseTillingValue + 0.2 );
				half2 Noise_Coord515_g158268 = ( -(Input_PositionWO419_g158268).xz * Input_MotionTilling321_g158268 * 0.005 );
				float2 temp_output_3_0_g158272 = Noise_Coord515_g158268;
				float2 temp_output_21_0_g158272 = Input_WindDirWS803_g158268;
				float mulTime113_g158271 = _TimeParameters.x * 0.02;
				float lerpResult128_g158271 = lerp( mulTime113_g158271 , ( ( mulTime113_g158271 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g158268 = _MotionBaseSpeedValue;
				half Noise_Speed516_g158268 = ( lerpResult128_g158271 * Input_MotionSpeed62_g158268 );
				float temp_output_15_0_g158272 = Noise_Speed516_g158268;
				float temp_output_23_0_g158272 = frac( temp_output_15_0_g158272 );
				float4 lerpResult39_g158272 = lerp( SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * temp_output_23_0_g158272 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * frac( ( temp_output_15_0_g158272 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_23_0_g158272 - 0.5 ) ) / 0.5 ));
				float4 temp_output_635_0_g158268 = lerpResult39_g158272;
				half2 Noise_DirWS825_g158268 = ((temp_output_635_0_g158268).rg*2.0 + -1.0);
				half Input_MotionNoise552_g158268 = _MotionBaseNoiseValue;
				half Global_WInd769_g158275 = (lerpResult836_g158275).z;
				float lerpResult853_g158275 = lerp( Global_WInd769_g158275 , saturate( (Global_WInd769_g158275*TVE_MotionParamsEditor.x + TVE_MotionParamsEditor.y) ) , TVE_MotionParamsEditor.w);
				half Input_MotionValue629_g158275 = _MotionIntensityValue;
				half Global_WindValue1664_g158264 = ( lerpResult853_g158275 * Input_MotionValue629_g158275 );
				half Input_WindValue853_g158268 = Global_WindValue1664_g158264;
				float lerpResult701_g158268 = lerp( 1.0 , Input_MotionNoise552_g158268 , Input_WindValue853_g158268);
				float2 lerpResult646_g158268 = lerp( Input_WindDirWS803_g158268 , Noise_DirWS825_g158268 , lerpResult701_g158268);
				half Input_MotionDelay753_g158268 = _MotionBaseDelayValue;
				float lerpResult756_g158268 = lerp( 1.0 , ( Input_WindValue853_g158268 * Input_WindValue853_g158268 ) , Input_MotionDelay753_g158268);
				half Wind_Delay815_g158268 = lerpResult756_g158268;
				float2 temp_output_809_0_g158268 = ( lerpResult646_g158268 * Input_WindValue853_g158268 * Wind_Delay815_g158268 );
				half2 Input_PushDirWS807_g158268 = float2( 1,0 );
				half Input_PushAlpha806_g158268 = ( 1.0 * 1.0 );
				float2 lerpResult811_g158268 = lerp( temp_output_809_0_g158268 , Input_PushDirWS807_g158268 , Input_PushAlpha806_g158268);
				#ifdef TVE_MOTION_ELEMENT
				float2 staticSwitch808_g158268 = lerpResult811_g158268;
				#else
				float2 staticSwitch808_g158268 = temp_output_809_0_g158268;
				#endif
				float2 temp_output_38_0_g158269 = staticSwitch808_g158268;
				float2 break83_g158269 = temp_output_38_0_g158269;
				float3 appendResult79_g158269 = (float3(break83_g158269.x , 0.0 , break83_g158269.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Bending893_g158264 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158269 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Base_Motion1440_g158264 = ( _MotionBaseIntensityValue * Base_Mask217_g158264 * Base_Bending893_g158264 );
				#ifdef TVE_MOTION
				float2 staticSwitch1651_g158264 = Base_Motion1440_g158264;
				#else
				float2 staticSwitch1651_g158264 = float2( 0,0 );
				#endif
				float4 appendResult1658_g158264 = (float4(staticSwitch1651_g158264 , 0.0 , 0.0));
				half4 Final_RoationData1570_g158264 = appendResult1658_g158264;
				float4 In_RotationData16_g158266 = Final_RoationData1570_g158264;
				{
				Data16_g158266.Dummy = In_Dummy16_g158266;
				Data16_g158266.PositionOS = In_PositionOS16_g158266;
				Data16_g158266.PositionWS = In_PositionWS16_g158266;
				Data16_g158266.PositionWO = In_PositionWO16_g158266;
				Data16_g158266.PositionRawOS = In_PositionRawOS16_g158266;
				Data16_g158266.PositionAddOS = In_PositionAddOS16_g158266;
				Data16_g158266.PivotOS = In_PivotOS16_g158266;
				Data16_g158266.PivotWS = In_PivotWS16_g158266;
				Data16_g158266.PivotWO = In_PivotWO16_g158266;
				Data16_g158266.NormalOS = In_NormalOS16_g158266;
				Data16_g158266.NormalWS = In_NormalWS16_g158266;
				Data16_g158266.NormalRawOS = In_NormalRawOS16_g158266;
				Data16_g158266.NormalRawWS = In_NormalRawWS16_g158266;
				Data16_g158266.TangentOS = In_TangentOS16_g158266;
				Data16_g158266.ViewDirWS = In_ViewDirWS16_g158266;
				Data16_g158266.VertexData = In_VertexData16_g158266;
				Data16_g158266.PhaseData = In_PhaseData16_g158266;
				Data16_g158266.BoundsData = In_BoundsData16_g158266;
				Data16_g158266.RotationData = In_RotationData16_g158266;
				}
				TVEModelData Data15_g158390 = Data16_g158266;
				float Out_Dummy15_g158390 = 0;
				float3 Out_PositionOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158390 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158390 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158390 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158390 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158390 = float3( 0,0,0 );
				float4 Out_VertexData15_g158390 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158390 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158390 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158390 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158390 = Data15_g158390.Dummy;
				Out_PositionOS15_g158390 = Data15_g158390.PositionOS;
				Out_PositionWS15_g158390 = Data15_g158390.PositionWS;
				Out_PositionWO15_g158390 = Data15_g158390.PositionWO;
				Out_PositionRawOS15_g158390 = Data15_g158390.PositionRawOS;
				Out_PositionAddOS15_g158390 = Data15_g158390.PositionAddOS;
				Out_PivotOS15_g158390 = Data15_g158390.PivotOS;
				Out_PivotWS15_g158390 = Data15_g158390.PivotWS;
				Out_PivotWO15_g158390 = Data15_g158390.PivotWO;
				Out_NormalOS15_g158390 = Data15_g158390.NormalOS;
				Out_NormalWS15_g158390 = Data15_g158390.NormalWS;
				Out_NormalRawOS15_g158390 = Data15_g158390.NormalRawOS;
				Out_NormalRawWS15_g158390 = Data15_g158390.NormalRawWS;
				Out_TangentOS15_g158390 = Data15_g158390.TangentOS;
				Out_ViewDirWS15_g158390 = Data15_g158390.ViewDirWS;
				Out_VertexData15_g158390 = Data15_g158390.VertexData;
				Out_PhaseData15_g158390 = Data15_g158390.PhaseData;
				Out_BoundsData15_g158390 = Data15_g158390.BoundsData;
				Out_RotationData15_g158390 = Data15_g158390.RotationData;
				}
				half3 Model_PositionOS147_g158389 = Out_PositionOS15_g158390;
				half3 VertexPos40_g158393 = Model_PositionOS147_g158389;
				float3 appendResult74_g158393 = (float3(VertexPos40_g158393.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158393 = appendResult74_g158393;
				float3 break84_g158393 = VertexPos40_g158393;
				float3 appendResult81_g158393 = (float3(0.0 , break84_g158393.y , break84_g158393.z));
				half3 VertexPosOtherAxis82_g158393 = appendResult81_g158393;
				float4 temp_output_1567_33_g158389 = Out_RotationData15_g158390;
				half4 Model_VertexBend1569_g158389 = temp_output_1567_33_g158389;
				float2 break1582_g158389 = (Model_VertexBend1569_g158389).xy;
				half Angle44_g158393 = break1582_g158389.y;
				half3 VertexPos40_g158396 = ( VertexPosRotationAxis50_g158393 + ( VertexPosOtherAxis82_g158393 * cos( Angle44_g158393 ) ) + ( cross( float3( 1, 0, 0 ) , VertexPosOtherAxis82_g158393 ) * sin( Angle44_g158393 ) ) );
				float3 appendResult74_g158396 = (float3(0.0 , 0.0 , VertexPos40_g158396.z));
				half3 VertexPosRotationAxis50_g158396 = appendResult74_g158396;
				float3 break84_g158396 = VertexPos40_g158396;
				float3 appendResult81_g158396 = (float3(break84_g158396.x , break84_g158396.y , 0.0));
				half3 VertexPosOtherAxis82_g158396 = appendResult81_g158396;
				half Angle44_g158396 = -break1582_g158389.x;
				float3 temp_output_1584_19_g158389 = ( VertexPosRotationAxis50_g158396 + ( VertexPosOtherAxis82_g158396 * cos( Angle44_g158396 ) ) + ( cross( float3( 0, 0, 1 ) , VertexPosOtherAxis82_g158396 ) * sin( Angle44_g158396 ) ) );
				float3 temp_output_6_0_g158395 = temp_output_1584_19_g158389;
				#ifdef TVE_MOTION
				float3 staticSwitch65_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch65_g158395 = Model_PositionOS147_g158389;
				#endif
				#ifdef TVE_CONFORM
				float3 staticSwitch69_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch69_g158395 = staticSwitch65_g158395;
				#endif
				float3 temp_output_1585_0_g158389 = staticSwitch69_g158395;
				float3 temp_output_1567_31_g158389 = Out_PositionAddOS15_g158390;
				half3 Model_PositionADD1568_g158389 = temp_output_1567_31_g158389;
				half3 Final_PositionOS178_g158389 = ( temp_output_1585_0_g158389 + Model_PositionADD1568_g158389 );
				float3 In_PositionOS16_g158391 = Final_PositionOS178_g158389;
				float3 In_PositionWS16_g158391 = Out_PositionWS15_g158390;
				float3 In_PositionWO16_g158391 = Out_PositionWO15_g158390;
				float3 In_PositionRawOS16_g158391 = Out_PositionRawOS15_g158390;
				float3 In_PositionAddOS16_g158391 = temp_output_1567_31_g158389;
				float3 In_PivotOS16_g158391 = Out_PivotOS15_g158390;
				float3 In_PivotWS16_g158391 = Out_PivotWS15_g158390;
				float3 In_PivotWO16_g158391 = Out_PivotWO15_g158390;
				float3 In_NormalOS16_g158391 = Out_NormalOS15_g158390;
				float3 In_NormalWS16_g158391 = Out_NormalWS15_g158390;
				float3 In_NormalRawOS16_g158391 = Out_NormalRawOS15_g158390;
				float3 In_NormalRawWS16_g158391 = Out_NormalRawWS15_g158390;
				float4 In_TangentOS16_g158391 = Out_TangentOS15_g158390;
				float3 In_ViewDirWS16_g158391 = Out_ViewDirWS15_g158390;
				float4 In_VertexData16_g158391 = Out_VertexData15_g158390;
				float4 In_PhaseData16_g158391 = Out_PhaseData15_g158390;
				float4 In_BoundsData16_g158391 = Out_BoundsData15_g158390;
				float4 In_RotationData16_g158391 = temp_output_1567_33_g158389;
				{
				Data16_g158391.Dummy = In_Dummy16_g158391;
				Data16_g158391.PositionOS = In_PositionOS16_g158391;
				Data16_g158391.PositionWS = In_PositionWS16_g158391;
				Data16_g158391.PositionWO = In_PositionWO16_g158391;
				Data16_g158391.PositionRawOS = In_PositionRawOS16_g158391;
				Data16_g158391.PositionAddOS = In_PositionAddOS16_g158391;
				Data16_g158391.PivotOS = In_PivotOS16_g158391;
				Data16_g158391.PivotWS = In_PivotWS16_g158391;
				Data16_g158391.PivotWO = In_PivotWO16_g158391;
				Data16_g158391.NormalOS = In_NormalOS16_g158391;
				Data16_g158391.NormalWS = In_NormalWS16_g158391;
				Data16_g158391.NormalRawOS = In_NormalRawOS16_g158391;
				Data16_g158391.NormalRawWS = In_NormalRawWS16_g158391;
				Data16_g158391.TangentOS = In_TangentOS16_g158391;
				Data16_g158391.ViewDirWS = In_ViewDirWS16_g158391;
				Data16_g158391.VertexData = In_VertexData16_g158391;
				Data16_g158391.PhaseData = In_PhaseData16_g158391;
				Data16_g158391.BoundsData = In_BoundsData16_g158391;
				Data16_g158391.RotationData = In_RotationData16_g158391;
				}
				TVEModelData Data15_g158419 = Data16_g158391;
				float Out_Dummy15_g158419 = 0;
				float3 Out_PositionOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158419 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158419 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158419 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158419 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158419 = float3( 0,0,0 );
				float4 Out_VertexData15_g158419 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158419 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158419 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158419 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158419 = Data15_g158419.Dummy;
				Out_PositionOS15_g158419 = Data15_g158419.PositionOS;
				Out_PositionWS15_g158419 = Data15_g158419.PositionWS;
				Out_PositionWO15_g158419 = Data15_g158419.PositionWO;
				Out_PositionRawOS15_g158419 = Data15_g158419.PositionRawOS;
				Out_PositionAddOS15_g158419 = Data15_g158419.PositionAddOS;
				Out_PivotOS15_g158419 = Data15_g158419.PivotOS;
				Out_PivotWS15_g158419 = Data15_g158419.PivotWS;
				Out_PivotWO15_g158419 = Data15_g158419.PivotWO;
				Out_NormalOS15_g158419 = Data15_g158419.NormalOS;
				Out_NormalWS15_g158419 = Data15_g158419.NormalWS;
				Out_NormalRawOS15_g158419 = Data15_g158419.NormalRawOS;
				Out_NormalRawWS15_g158419 = Data15_g158419.NormalRawWS;
				Out_TangentOS15_g158419 = Data15_g158419.TangentOS;
				Out_ViewDirWS15_g158419 = Data15_g158419.ViewDirWS;
				Out_VertexData15_g158419 = Data15_g158419.VertexData;
				Out_PhaseData15_g158419 = Data15_g158419.PhaseData;
				Out_BoundsData15_g158419 = Data15_g158419.BoundsData;
				Out_RotationData15_g158419 = Data15_g158419.RotationData;
				}
				float3 temp_output_31_0_g158407 = Out_PositionOS15_g158419;
				float3 temp_output_6_0_g158420 = ( temp_output_31_0_g158407 + _DisableSRPBatcher );
				float temp_output_371_0_g158324 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingGlobalValue + _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessGlobalValue + _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue + 0.0 ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue + _CutoutGlobalValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeScaleValue1 ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) + temp_output_371_0_g158324 );
				#ifdef TVE_DUMMY
				float3 staticSwitch14_g158420 = ( temp_output_6_0_g158420 + Dummy_Data505.r );
				#else
				float3 staticSwitch14_g158420 = temp_output_6_0_g158420;
				#endif
				
				output.ase_texcoord12.xyz = vertexToFrag305_g157220;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord12.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = staticSwitch14_g158420;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS output = (PackedVaryingsMeshToPS)0;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, output);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : inputMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = inputMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(inputMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				output.uv1 = inputMesh.uv1;
				output.uv2 = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					output.vpassPositionCS = float3(VPASSpositionCS.xyw);
					output.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplayMaterial.hlsl"

            #ifdef UNITY_VIRTUAL_TEXTURING
                #ifdef OUTPUT_SPLIT_LIGHTING
                   #define DIFFUSE_LIGHTING_TARGET SV_Target2
                   #define SSS_BUFFER_TARGET SV_Target3
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                   #define MOTION_VECTOR_TARGET SV_Target2
            	#endif
            #if defined(SHADER_API_PSSL)
            	#pragma PSSL_target_output_format(target 1 FMT_32_ABGR)
            #endif
            #else
                #ifdef OUTPUT_SPLIT_LIGHTING
                #define DIFFUSE_LIGHTING_TARGET SV_Target1
                #define SSS_BUFFER_TARGET SV_Target2
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                #define MOTION_VECTOR_TARGET SV_Target1
                #endif
            #endif

			void Frag(PackedVaryingsMeshToPS packedInput
						, out float4 outColor:SV_Target0
					#ifdef UNITY_VIRTUAL_TEXTURING
						, out float4 outVTFeedback : SV_Target1
					#endif
					#ifdef OUTPUT_SPLIT_LIGHTING
						, out float4 outDiffuseLighting : DIFFUSE_LIGHTING_TARGET
						, OUTPUT_SSSBUFFER(outSSSBuffer) : SSS_BUFFER_TARGET
					#elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
						, out float4 outMotionVec : MOTION_VECTOR_TARGET
					#endif
					#if defined( ASE_DEPTH_WRITE_ON )
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
					#endif
					 )
			{
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outMotionVec = float4(2.0, 0.0, 0.0, 1.0);
				#endif

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				

				
				#if ( ASE_SRP_VERSION >= 100000 ) && ( ASE_SRP_VERSION >= 140007 )
				AdjustFragInputsToOffScreenRendering(input, _OffScreenRendering > 0, _OffScreenDownsampleFactor);
				#endif
			

				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half IsFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];
				float4 ClipPos = TransformWorldToHClip( PositionRWS );
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float localBreakData4_g158410 = ( 0.0 );
				float localCompData3_g158401 = ( 0.0 );
				TVEVisualData Data3_g158401 = (TVEVisualData)0;
				half Dummy145_g158399 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) );
				float In_Dummy3_g158401 = Dummy145_g158399;
				float localBreakData4_g158400 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158292 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + 0.0 );
				float In_Dummy3_g158307 = Dummy145_g158292;
				float localBreakData4_g158296 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				half Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlayBakeInfo ) + 0.0 );
				float In_Dummy3_g158220 = Dummy594_g158217;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157228 = ( 0.0 );
				TVEVisualData Data3_g157228 = (TVEVisualData)0;
				float In_Dummy3_g157228 = 0.0;
				float4 output0 = 0;
				float4 output1 = 0;
				float4 output2 = 0;
				ImpostorOutput io = ( ImpostorOutput )0;
				OctaImpostorFragment( io, ClipPos, PositionRWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1, output2 );
				float4 temp_cast_0 = (1.0).xxxx;
				half4 Input_Tex0377_g157220 = output0;
				half4 Input_Tex1379_g157220 = output1;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch403_g157220 = temp_cast_0;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch403_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch403_g157220 = temp_cast_0;
				#endif
				half Local_MultiMask249_g157220 = (staticSwitch403_g157220).b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( io.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157228 = Local_Albedo239_g157220;
				float3 In_AlbedoRaw3_g157228 = Local_Albedo239_g157220;
				float2 temp_cast_3 = (0.0).xx;
				float2 In_NormalTS3_g157228 = temp_cast_3;
				float3 In_NormalWS3_g157228 = io.WorldNormal;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 temp_cast_5 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch385_g157220 = temp_cast_4;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch385_g157220 = temp_cast_5;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch385_g157220 = temp_cast_4;
				#endif
				half Local_Metallic247_g157220 = (staticSwitch385_g157220).r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				float4 temp_cast_6 = (1.0).xxxx;
				float4 temp_cast_7 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch392_g157220 = temp_cast_6;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch392_g157220 = temp_cast_7;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch392_g157220 = temp_cast_6;
				#endif
				half Local_OcclusionOrEmissive248_g157220 = (staticSwitch392_g157220).g;
				float lerpResult431_g157220 = lerp( 1.0 , Local_OcclusionOrEmissive248_g157220 , _ImpostorOcclusionValue);
				#ifdef TVE_EMISSIVE
				float staticSwitch428_g157220 = 1.0;
				#else
				float staticSwitch428_g157220 = lerpResult431_g157220;
				#endif
				half Final_Occlusion424_g157220 = staticSwitch428_g157220;
				float4 temp_cast_8 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch408_g157220 = temp_cast_8;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch408_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch408_g157220 = temp_cast_8;
				#endif
				half Local_Smoothness250_g157220 = (staticSwitch408_g157220).a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , Final_Occlusion424_g157220 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157228 = appendResult257_g157220;
				float4 appendResult286_g157220 = (float4(Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , 1.0));
				float4 In_Emissive3_g157228 = appendResult286_g157220;
				float3 temp_output_3_0_g157221 = Local_Albedo239_g157220;
				float dotResult20_g157221 = dot( temp_output_3_0_g157221 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale268_g157220 = dotResult20_g157221;
				float In_Grayscale3_g157228 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157228 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157228 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157228 = 0.0;
				float In_AlphaFade3_g157228 = 1.0;
				float3 temp_cast_9 = (1.0).xxx;
				float3 In_Translucency3_g157228 = temp_cast_9;
				float In_Transmission3_g157228 = 1.0;
				float In_Thickness3_g157228 = 0.0;
				float In_Diffusion3_g157228 = 0.0;
				float In_Depth3_g157228 = ClipPos.z;
				{
				Data3_g157228.Dummy = In_Dummy3_g157228;
				Data3_g157228.Albedo = In_Albedo3_g157228;
				Data3_g157228.AlbedoRaw = In_AlbedoRaw3_g157228;
				Data3_g157228.NormalTS = In_NormalTS3_g157228;
				Data3_g157228.NormalWS = In_NormalWS3_g157228;
				Data3_g157228.Shader = In_Shader3_g157228;
				Data3_g157228.Emissive= In_Emissive3_g157228;
				Data3_g157228.MultiMask = In_MultiMask3_g157228;
				Data3_g157228.Grayscale = In_Grayscale3_g157228;
				Data3_g157228.Luminosity = In_Luminosity3_g157228;
				Data3_g157228.AlphaClip = In_AlphaClip3_g157228;
				Data3_g157228.AlphaFade = In_AlphaFade3_g157228;
				Data3_g157228.Translucency = In_Translucency3_g157228;
				Data3_g157228.Transmission = In_Transmission3_g157228;
				Data3_g157228.Thickness = In_Thickness3_g157228;
				Data3_g157228.Diffusion = In_Diffusion3_g157228;
				Data3_g157228.Depth = In_Depth3_g157228;
				}
				TVEVisualData Data4_g158218 = Data3_g157228;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				float Out_Depth4_g158218 = 0;
				{
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_AlbedoRaw4_g158218 = Data4_g158218.AlbedoRaw;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				Out_Depth4_g158218= Data4_g158218.Depth;
				}
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158231 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158237 = _OverlayProjRemap.x;
				float temp_output_9_0_g158237 = ( clampResult17_g158231 - temp_output_7_0_g158237 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158237 * _OverlayProjRemap.z ) + 0.0001 ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158232 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayLumaRemap.x;
				float temp_output_9_0_g158236 = ( clampResult17_g158232 - temp_output_7_0_g158236 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158236 * _OverlayLumaRemap.z ) + 0.0001 ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				TVEModelData Data16_g157227 = (TVEModelData)0;
				float In_Dummy16_g157227 = 0.0;
				half3 Input_PositionWS319_g157220 = GetAbsolutePositionWS( PositionRWS );
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157227 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157227 = Model_PositionWO311_g157220;
				float3 vertexToFrag305_g157220 = packedInput.ase_texcoord12.xyz;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157227 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157227 = Model_PivotWO312_g157220;
				half3 Model_Normal_WS314_g157220 = NormalWS;
				float3 In_NormalWS16_g157227 = Model_Normal_WS314_g157220;
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157227 = Model_ViewDirWS347_g157220;
				float4 temp_cast_10 = (1.0).xxxx;
				half4 Input_Tex2380_g157220 = output2;
				float4 appendResult420_g157220 = (float4((Input_Tex1379_g157220).rg , 1.0 , 1.0));
				float4 temp_cast_13 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch414_g157220 = temp_cast_10;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch414_g157220 = Input_Tex2380_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch414_g157220 = appendResult420_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch414_g157220 = temp_cast_13;
				#else
				float4 staticSwitch414_g157220 = temp_cast_10;
				#endif
				half4 Local_VertexColor422_g157220 = staticSwitch414_g157220;
				float4 In_VertexData16_g157227 = Local_VertexColor422_g157220;
				float4 In_BoundsData16_g157227 = float4( 1,1,1,1 );
				{
				Data16_g157227.Dummy = In_Dummy16_g157227;
				Data16_g157227.PositionWS = In_PositionWS16_g157227;
				Data16_g157227.PositionWO = In_PositionWO16_g157227;
				Data16_g157227.PivotWS = In_PivotWS16_g157227;
				Data16_g157227.PivotWO = In_PivotWO16_g157227;
				Data16_g157227.NormalWS = In_NormalWS16_g157227;
				Data16_g157227.ViewDirWS = In_ViewDirWS16_g157227;
				Data16_g157227.VertexData = In_VertexData16_g157227;
				Data16_g157227.BoundsData = In_BoundsData16_g157227;
				}
				TVEModelData Data15_g158228 = Data16_g157227;
				float Out_Dummy15_g158228 = 0;
				float3 Out_PositionWS15_g158228 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158228 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158228 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g158228 = float3( 0,0,0 );
				float4 Out_VertexData15_g158228 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158228 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158228 = Data15_g158228.Dummy;
				Out_PositionWS15_g158228 = Data15_g158228.PositionWS;
				Out_PositionWO15_g158228 = Data15_g158228.PositionWO;
				Out_PivotWS15_g158228 = Data15_g158228.PivotWS;
				Out_PivotWO15_g158228 = Data15_g158228.PivotWO;
				Out_NormalWS15_g158228 = Data15_g158228.NormalWS;
				Out_ViewDirWS15_g158228 = Data15_g158228.ViewDirWS;
				Out_VertexData15_g158228 = Data15_g158228.VertexData;
				Out_BoundsData15_g158228 = Data15_g158228.BoundsData;
				}
				half4 Model_VertexMasks791_g158217 = Out_VertexData15_g158228;
				float4 break792_g158217 = Model_VertexMasks791_g158217;
				float4 break33_g158229 = _overlay_vert_mode;
				float temp_output_30_0_g158229 = ( break792_g158217.x * break33_g158229.x );
				float temp_output_29_0_g158229 = ( break792_g158217.y * break33_g158229.y );
				float temp_output_31_0_g158229 = ( break792_g158217.z * break33_g158229.z );
				float temp_output_28_0_g158229 = ( temp_output_30_0_g158229 + temp_output_29_0_g158229 + temp_output_31_0_g158229 + ( break792_g158217.w * break33_g158229.w ) );
				float clampResult17_g158230 = clamp( temp_output_28_0_g158229 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayMeshRemap.x;
				float temp_output_9_0_g158238 = ( clampResult17_g158230 - temp_output_7_0_g158238 );
				float lerpResult879_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158238 * _OverlayMeshRemap.z ) + 0.0001 ) ) , _OverlayMeshValue);
				float temp_output_6_0_g158233 = lerpResult879_g158217;
				#ifdef TVE_DUMMY
				float staticSwitch14_g158233 = ( temp_output_6_0_g158233 + _OverlayMeshMode );
				#else
				float staticSwitch14_g158233 = temp_output_6_0_g158233;
				#endif
				half Overlay_VertMask801_g158217 = staticSwitch14_g158233;
				float lerpResult920_g158217 = lerp( 1.0 , ( TVE_AtmoParams.z * TVE_IsEnabled ) , _OverlayGlobalValue);
				half Overlay_MaskGlobal429_g158217 = lerpResult920_g158217;
				float temp_output_7_0_g158239 = _OverlayBlendRemap.x;
				float temp_output_9_0_g158239 = ( ( _OverlayIntensityValue * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ) - temp_output_7_0_g158239 );
				half Overlay_Mask494_g158217 = saturate( ( ( temp_output_9_0_g158239 * _OverlayBlendRemap.z ) + 0.0001 ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				float3 In_AlbedoRaw3_g158220 = Out_AlbedoRaw4_g158218;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				float In_Depth3_g158220 = Out_Depth4_g158218;
				{
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.AlbedoRaw = In_AlbedoRaw3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				Data3_g158220.Depth = In_Depth3_g158220;
				}
				TVEVisualData Data4_g158296 = Data3_g158220;
				float Out_Dummy4_g158296 = 0;
				float3 Out_Albedo4_g158296 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158296 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158296 = float2( 0,0 );
				float3 Out_NormalWS4_g158296 = float3( 0,0,0 );
				float4 Out_Shader4_g158296 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158296 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158296 = 0;
				float Out_Grayscale4_g158296 = 0;
				float Out_Luminosity4_g158296 = 0;
				float Out_AlphaClip4_g158296 = 0;
				float Out_AlphaFade4_g158296 = 0;
				float3 Out_Translucency4_g158296 = float3( 0,0,0 );
				float Out_Transmission4_g158296 = 0;
				float Out_Thickness4_g158296 = 0;
				float Out_Diffusion4_g158296 = 0;
				float Out_Depth4_g158296 = 0;
				{
				Out_Dummy4_g158296 = Data4_g158296.Dummy;
				Out_Albedo4_g158296 = Data4_g158296.Albedo;
				Out_AlbedoRaw4_g158296 = Data4_g158296.AlbedoRaw;
				Out_NormalTS4_g158296 = Data4_g158296.NormalTS;
				Out_NormalWS4_g158296 = Data4_g158296.NormalWS;
				Out_Shader4_g158296 = Data4_g158296.Shader;
				Out_Emissive4_g158296= Data4_g158296.Emissive;
				Out_MultiMask4_g158296 = Data4_g158296.MultiMask;
				Out_Grayscale4_g158296 = Data4_g158296.Grayscale;
				Out_Luminosity4_g158296= Data4_g158296.Luminosity;
				Out_AlphaClip4_g158296 = Data4_g158296.AlphaClip;
				Out_AlphaFade4_g158296 = Data4_g158296.AlphaFade;
				Out_Translucency4_g158296 = Data4_g158296.Translucency;
				Out_Transmission4_g158296 = Data4_g158296.Transmission;
				Out_Thickness4_g158296 = Data4_g158296.Thickness;
				Out_Diffusion4_g158296 = Data4_g158296.Diffusion;
				Out_Depth4_g158296= Data4_g158296.Depth;
				}
				float3 temp_output_297_0_g158292 = Out_Albedo4_g158296;
				float3 In_Albedo3_g158307 = temp_output_297_0_g158292;
				float3 temp_output_297_23_g158292 = Out_AlbedoRaw4_g158296;
				float3 In_AlbedoRaw3_g158307 = temp_output_297_23_g158292;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158296;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158296;
				float4 In_Shader3_g158307 = Out_Shader4_g158296;
				float4 temp_cast_15 = (0.0).xxxx;
				half4 Visual_Emissive255_g158292 = Out_Emissive4_g158296;
				half Emissive_MeshMask221_g158292 = 1.0;
				half Emissive_Mask103_g158292 = 1.0;
				float temp_output_279_0_g158292 = ( Emissive_MeshMask221_g158292 * Emissive_Mask103_g158292 );
				float3 appendResult293_g158292 = (float3(temp_output_279_0_g158292 , temp_output_279_0_g158292 , temp_output_279_0_g158292));
				half3 Local_EmissiveColor278_g158292 = appendResult293_g158292;
				float3 temp_output_316_0_g158292 = (TVE_GlowParams).xyz;
				float3 lerpResult299_g158292 = lerp( float3( 1,1,1 ) , temp_output_316_0_g158292 , ( _EmissiveGlobalValue * TVE_IsEnabled ));
				half3 Emissive_GlobalMask248_g158292 = lerpResult299_g158292;
				half3 Visual_AlbedoRaw306_g158292 = temp_output_297_23_g158292;
				float3 lerpResult307_g158292 = lerp( float3( 1,1,1 ) , Visual_AlbedoRaw306_g158292 , _EmissiveColorMode);
				half3 Local_EmissiveValue88_g158292 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158292 * lerpResult307_g158292 );
				half3 Emissive_Blend260_g158292 = ( ( (Visual_Emissive255_g158292).xyz * Local_EmissiveColor278_g158292 ) * Local_EmissiveValue88_g158292 );
				float3 temp_output_3_0_g158298 = Emissive_Blend260_g158292;
				float temp_output_15_0_g158298 = _emissive_power_value;
				float3 hdEmission22_g158298 = ASEGetEmissionHDRColor(temp_output_3_0_g158298,temp_output_15_0_g158298,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Local_EmissiveMask294_g158292 = temp_output_279_0_g158292;
				float4 appendResult295_g158292 = (float4(hdEmission22_g158298 , Local_EmissiveMask294_g158292));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158292 = appendResult295_g158292;
				#else
				float4 staticSwitch129_g158292 = temp_cast_15;
				#endif
				half4 Final_Emissive184_g158292 = staticSwitch129_g158292;
				float4 In_Emissive3_g158307 = Final_Emissive184_g158292;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158296;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158296;
				float temp_output_297_11_g158292 = Out_MultiMask4_g158296;
				float In_MultiMask3_g158307 = temp_output_297_11_g158292;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158296;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158296;
				float3 In_Translucency3_g158307 = Out_Translucency4_g158296;
				float In_Transmission3_g158307 = Out_Transmission4_g158296;
				float In_Thickness3_g158307 = Out_Thickness4_g158296;
				float In_Diffusion3_g158307 = Out_Diffusion4_g158296;
				float In_Depth3_g158307 = Out_Depth4_g158296;
				{
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.AlbedoRaw = In_AlbedoRaw3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				Data3_g158307.Depth = In_Depth3_g158307;
				}
				TVEVisualData Data4_g158400 = Data3_g158307;
				float Out_Dummy4_g158400 = 0;
				float3 Out_Albedo4_g158400 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158400 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158400 = float2( 0,0 );
				float3 Out_NormalWS4_g158400 = float3( 0,0,0 );
				float4 Out_Shader4_g158400 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158400 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158400 = 0;
				float Out_Grayscale4_g158400 = 0;
				float Out_Luminosity4_g158400 = 0;
				float Out_AlphaClip4_g158400 = 0;
				float Out_AlphaFade4_g158400 = 0;
				float3 Out_Translucency4_g158400 = float3( 0,0,0 );
				float Out_Transmission4_g158400 = 0;
				float Out_Thickness4_g158400 = 0;
				float Out_Diffusion4_g158400 = 0;
				float Out_Depth4_g158400 = 0;
				{
				Out_Dummy4_g158400 = Data4_g158400.Dummy;
				Out_Albedo4_g158400 = Data4_g158400.Albedo;
				Out_AlbedoRaw4_g158400 = Data4_g158400.AlbedoRaw;
				Out_NormalTS4_g158400 = Data4_g158400.NormalTS;
				Out_NormalWS4_g158400 = Data4_g158400.NormalWS;
				Out_Shader4_g158400 = Data4_g158400.Shader;
				Out_Emissive4_g158400= Data4_g158400.Emissive;
				Out_MultiMask4_g158400 = Data4_g158400.MultiMask;
				Out_Grayscale4_g158400 = Data4_g158400.Grayscale;
				Out_Luminosity4_g158400= Data4_g158400.Luminosity;
				Out_AlphaClip4_g158400 = Data4_g158400.AlphaClip;
				Out_AlphaFade4_g158400 = Data4_g158400.AlphaFade;
				Out_Translucency4_g158400 = Data4_g158400.Translucency;
				Out_Transmission4_g158400 = Data4_g158400.Transmission;
				Out_Thickness4_g158400 = Data4_g158400.Thickness;
				Out_Diffusion4_g158400 = Data4_g158400.Diffusion;
				Out_Depth4_g158400= Data4_g158400.Depth;
				}
				half3 Visual_Albedo199_g158399 = Out_Albedo4_g158400;
				half3 Final_Albedo312_g158399 = Visual_Albedo199_g158399;
				float3 In_Albedo3_g158401 = Final_Albedo312_g158399;
				float3 In_AlbedoRaw3_g158401 = Out_AlbedoRaw4_g158400;
				float2 In_NormalTS3_g158401 = Out_NormalTS4_g158400;
				float3 In_NormalWS3_g158401 = Out_NormalWS4_g158400;
				float4 In_Shader3_g158401 = Out_Shader4_g158400;
				float4 In_Emissive3_g158401 = Out_Emissive4_g158400;
				float In_Grayscale3_g158401 = Out_Grayscale4_g158400;
				float In_Luminosity3_g158401 = Out_Luminosity4_g158400;
				float temp_output_301_11_g158399 = Out_MultiMask4_g158400;
				float In_MultiMask3_g158401 = temp_output_301_11_g158399;
				float In_AlphaClip3_g158401 = Out_AlphaClip4_g158400;
				float In_AlphaFade3_g158401 = Out_AlphaFade4_g158400;
				float3 temp_cast_16 = (0.0).xxx;
				half3 Subsurface_Color264_g158399 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158399 );
				half Visual_Transmission138_g158399 = Out_Transmission4_g158400;
				half Subsurface_Value268_g158399 = _SubsurfaceIntensityValue;
				float lerpResult403_g158399 = lerp( 1.0 , TVE_GlowParams.w , ( _SubsurfaceGlobalValue * TVE_IsEnabled ));
				half Subsurface_GlobalMask369_g158399 = lerpResult403_g158399;
				half Visual_MultiMask292_g158399 = temp_output_301_11_g158399;
				float lerpResult293_g158399 = lerp( 1.0 , Visual_MultiMask292_g158399 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158399 = lerpResult293_g158399;
				half Custom_Mask363_g158399 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158399 = ( Visual_Transmission138_g158399 * Subsurface_Value268_g158399 * Subsurface_GlobalMask369_g158399 * Subsurface_MultiMask296_g158399 * Custom_Mask363_g158399 );
				#else
				float staticSwitch345_g158399 = 0.0;
				#endif
				half Final_Transmission269_g158399 = staticSwitch345_g158399;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158399 = ( Subsurface_Color264_g158399 * Final_Transmission269_g158399 * 10.0 );
				#else
				float3 staticSwitch348_g158399 = temp_cast_16;
				#endif
				half3 Final_Translucency254_g158399 = staticSwitch348_g158399;
				float3 In_Translucency3_g158401 = Final_Translucency254_g158399;
				float In_Transmission3_g158401 = Final_Transmission269_g158399;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158399 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158399 = 1.0;
				#endif
				half Final_Thickness275_g158399 = staticSwitch351_g158399;
				float In_Thickness3_g158401 = Final_Thickness275_g158399;
				float Final_Diffusion340_g158399 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158401 = Final_Diffusion340_g158399;
				float In_Depth3_g158401 = Out_Depth4_g158400;
				{
				Data3_g158401.Dummy = In_Dummy3_g158401;
				Data3_g158401.Albedo = In_Albedo3_g158401;
				Data3_g158401.AlbedoRaw = In_AlbedoRaw3_g158401;
				Data3_g158401.NormalTS = In_NormalTS3_g158401;
				Data3_g158401.NormalWS = In_NormalWS3_g158401;
				Data3_g158401.Shader = In_Shader3_g158401;
				Data3_g158401.Emissive= In_Emissive3_g158401;
				Data3_g158401.MultiMask = In_MultiMask3_g158401;
				Data3_g158401.Grayscale = In_Grayscale3_g158401;
				Data3_g158401.Luminosity = In_Luminosity3_g158401;
				Data3_g158401.AlphaClip = In_AlphaClip3_g158401;
				Data3_g158401.AlphaFade = In_AlphaFade3_g158401;
				Data3_g158401.Translucency = In_Translucency3_g158401;
				Data3_g158401.Transmission = In_Transmission3_g158401;
				Data3_g158401.Thickness = In_Thickness3_g158401;
				Data3_g158401.Diffusion = In_Diffusion3_g158401;
				Data3_g158401.Depth = In_Depth3_g158401;
				}
				TVEVisualData Data4_g158410 = Data3_g158401;
				float Out_Dummy4_g158410 = 0;
				float3 Out_Albedo4_g158410 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158410 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158410 = float2( 0,0 );
				float3 Out_NormalWS4_g158410 = float3( 0,0,0 );
				float4 Out_Shader4_g158410 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158410 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158410 = 0;
				float Out_Grayscale4_g158410 = 0;
				float Out_Luminosity4_g158410 = 0;
				float Out_AlphaClip4_g158410 = 0;
				float Out_AlphaFade4_g158410 = 0;
				float3 Out_Translucency4_g158410 = float3( 0,0,0 );
				float Out_Transmission4_g158410 = 0;
				float Out_Thickness4_g158410 = 0;
				float Out_Diffusion4_g158410 = 0;
				float Out_Depth4_g158410 = 0;
				{
				Out_Dummy4_g158410 = Data4_g158410.Dummy;
				Out_Albedo4_g158410 = Data4_g158410.Albedo;
				Out_AlbedoRaw4_g158410 = Data4_g158410.AlbedoRaw;
				Out_NormalTS4_g158410 = Data4_g158410.NormalTS;
				Out_NormalWS4_g158410 = Data4_g158410.NormalWS;
				Out_Shader4_g158410 = Data4_g158410.Shader;
				Out_Emissive4_g158410= Data4_g158410.Emissive;
				Out_MultiMask4_g158410 = Data4_g158410.MultiMask;
				Out_Grayscale4_g158410 = Data4_g158410.Grayscale;
				Out_Luminosity4_g158410= Data4_g158410.Luminosity;
				Out_AlphaClip4_g158410 = Data4_g158410.AlphaClip;
				Out_AlphaFade4_g158410 = Data4_g158410.AlphaFade;
				Out_Translucency4_g158410 = Data4_g158410.Translucency;
				Out_Transmission4_g158410 = Data4_g158410.Transmission;
				Out_Thickness4_g158410 = Data4_g158410.Thickness;
				Out_Diffusion4_g158410 = Data4_g158410.Diffusion;
				Out_Depth4_g158410= Data4_g158410.Depth;
				}
				half3 Input_Albedo24_g158408 = Out_Albedo4_g158410;
				#ifdef UNITY_COLORSPACE_GAMMA
				float4 staticSwitch22_g158408 = half4( 0.2209163, 0.2209163, 0.2209163, 0.7790837 );
				#else
				float4 staticSwitch22_g158408 = half4( 0.04, 0.04, 0.04, 0.96 );
				#endif
				half4 ColorSpaceDielectricSpec23_g158408 = staticSwitch22_g158408;
				float4 break24_g158407 = Out_Shader4_g158410;
				half Metallic117_g158407 = break24_g158407.x;
				half Input_Metallic25_g158408 = Metallic117_g158407;
				half OneMinusReflectivity31_g158408 = ( (ColorSpaceDielectricSpec23_g158408).w - ( (ColorSpaceDielectricSpec23_g158408).w * Input_Metallic25_g158408 ) );
				float3 lerpResult87_g158407 = lerp( half3( 1, 0, 0 ) , ( Input_Albedo24_g158408 * OneMinusReflectivity31_g158408 ) , _IsInitialized);
				

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;

				surfaceDescription.BaseColor = lerpResult87_g158407;
				surfaceDescription.Normal = Out_NormalWS4_g158410;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Smoothness = break24_g158407.w;
				surfaceDescription.Occlusion = break24_g158407.y;
				surfaceDescription.Emission = (Out_Emissive4_g158410).xyz;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = Out_Thickness4_g158410;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = Out_Transmission4_g158410;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = Out_Diffusion4_g158410;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif

				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#if defined( ASE_CHANGES_WORLD_POS )
					posInput.positionWS = PositionRWS;
					#if defined( _WRITE_TRANSPARENT_MOTION_VECTOR )
						float3 positionOS = mul( GetWorldToObjectMatrix(),  float4( PositionRWS, 1.0 ) ).xyz;
						float3 previousPositionRWS = mul( GetPrevObjectToWorldMatrix(),  float4( positionOS, 1.0 ) ).xyz;
						packedInput.vpassPositionCS = mul( UNITY_MATRIX_UNJITTERED_VP, float4( PositionRWS, 1.0 ) ).xyw;
						packedInput.vpassPreviousPositionCS = mul( UNITY_MATRIX_PREV_VP, float4( previousPositionRWS, 1.0 ) ).xyw;
					#endif
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = Out_Depth4_g158410;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);

				#ifdef DEBUG_DISPLAY
				#ifdef OUTPUT_SPLIT_LIGHTING
					outDiffuseLighting = float4(0, 0, 0, 1);
					ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#endif

			    bool viewMaterial = GetMaterialDebugColor(outColor, input, builtinData, posInput, surfaceData, bsdfData);

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);
						GetPBRValidatorDebug(surfaceData, result);
						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
                #endif
					{
                #ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
                #else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
                #endif
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

						// Alias
						float3 diffuseLighting = lightLoopOutput.diffuseLighting;
						float3 specularLighting = lightLoopOutput.specularLighting;

						diffuseLighting *= GetCurrentExposureMultiplier();
						specularLighting *= GetCurrentExposureMultiplier();

                #ifdef OUTPUT_SPLIT_LIGHTING
						if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
						{
							outColor = float4(specularLighting, 1.0);
							outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
						}
						else
						{
							outColor = float4(diffuseLighting + specularLighting, 1.0);
							outDiffuseLighting = float4(0, 0, 0, 1);
						}
						ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
                #else
						outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
						outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
                #endif

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);
						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
                #if defined(HAVE_VFX_MODIFICATION) && !VFX_FEATURE_MOTION_VECTORS
                        forceNoMotion = true;
                #endif
				        if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
				}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif

                #ifdef UNITY_VIRTUAL_TEXTURING
				    float vtAlphaValue = builtinData.opacity;
                    #if defined(HAS_REFRACTION) && HAS_REFRACTION
					vtAlphaValue = 1.0f - bsdfData.transmittanceMask;
                #endif
				outVTFeedback = PackVTFeedbackWithAlpha(builtinData.vtPackedFeedback, input.positionSS.xy, vtAlphaValue);
                #endif

			}
			ENDHLSL
		}

		
		Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

            Cull [_CullMode]

            HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local_fragment _ _DISABLE_SSR
			#define ASE_FRAGMENT_NORMAL 2
			#define ASE_DEPTH_WRITE_ON
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_VERSION 19802
			#define ASE_SRP_VERSION 140012
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma editor_sync_compilation
            #pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_TANGENT_TO_WORLD

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

            #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
            #undef  _REFRACTION_PLANE
            #undef  _REFRACTION_SPHERE
            #define _REFRACTION_THIN
            #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

            CBUFFER_START( UnityPerMaterial )
			half4 _DitherColoring;
			half4 _OverlayLumaRemap;
			half4 _OverlayProjRemap;
			half4 _OverlayColor;
			half4 _DrynessColoring;
			half4 _TintingLumaRemap;
			half4 _ImpostorColor;
			half4 _overlay_vert_mode;
			half4 _ImpostorColorTwo;
			half4 _TintingColoring;
			half4 _SizeFadeColoring;
			float4 _AI_SizeOffset;
			half4 _VariationNoiseRemap;
			half4 _VariationColorOne;
			half4 _VariationColorTwo;
			float4 _TintingColor;
			half4 _OverlayMeshRemap;
			half4 _VariationColoring;
			float4 _DrynessColor;
			half4 _DrynessLumaRemap;
			half4 _EmissiveColor;
			half4 _OverlayBlendRemap;
			half4 _WetnessColoring;
			half4 _CutoutColoring;
			half4 _SubsurfaceColor;
			float4 _SubsurfaceDiffusion_Asset;
			float3 _AI_Offset;
			float3 _AI_BoundsMin;
			float3 _AI_BoundsSize;
			half _SizeFadeCategory;
			half _CutoutLiteInfo;
			half _SizeFadeEnd;
			half _SizeFadeScaleValue1;
			half _SizeFadeLiteInfo;
			half _DitherNoiseTillingValue;
			half _CutoutCategory;
			half _DitherMultiValue;
			half _DitherShadowMode;
			half _DitherDistanceMaxValue;
			half _CutoutNoiseValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseTillingValue;
			half _CutoutGlobalValue;
			half _CutoutMultiValue;
			half _DitherLiteInfo;
			half _CutoutShadowMode;
			half _DitherDistanceMinValue;
			half _CutoutIntensityValue;
			half _DitherCategory;
			half _CutoutSpace;
			half _DitherEnd;
			half _DitherConstantValue;
			half _DitherDistanceValue;
			half _CutoutEnd;
			half _SizeFadeIntensityValue;
			half _ImpostorMaskOffInfo;
			half _SubsurfaceCategory;
			half _SizeFadeScaleValue;
			half _ImpostorSmoothnessValue;
			half _OverlayIntensityValue;
			half _OverlayProjValue;
			half _OverlayLumaValue;
			half _OverlayMeshValue;
			half _OverlayMeshMode;
			half _OverlayGlobalValue;
			half _OverlayNormalValue;
			half _OverlaySmoothnessValue;
			half _OverlaySubsurfaceValue;
			half _EmissiveIntensityValue;
			half _EmissiveGlobalValue;
			half _EmissiveColorMode;
			float _emissive_power_value;
			half _EmissiveExposureValue;
			half _SubsurfaceIntensityValue;
			half _SubsurfaceGlobalValue;
			half _ImpostorOcclusionValue;
			half _SizeFadeScaleMode;
			half _ImpostorMetallicValue;
			half _OverlayBakeInfo;
			half _SizeFadeDistMinValue;
			half _SizeFadeDistMaxValue;
			half _GlobalLiteInfo;
			half _GlobalCategory;
			half _GlobalEnd;
			half _WetnessSmoothnessValue;
			half _SubsurfaceEnd;
			half _SubsurfaceDirectValue;
			half _SubsurfaceNormalValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _EmissiveCategory;
			half _EmissiveEnd;
			half _EmissivePowerMode;
			half _EmissivePowerValue;
			half _OverlayCategory;
			half _OverlayEnd;
			half _ImpostorColorMode;
			half _WetnessContrastValue;
			half _DrynessMultiValue;
			half _WetnessEnd;
			half _IsConverted;
			half _IsIdentifier;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsCollected;
			half _IsLiteShader;
			half _MotionCategory;
			half _MotionEnd;
			half _MotionLiteInfo;
			float _AI_Clip;
			float _AI_TextureBias;
			float _AI_Parallax;
			float _AI_ShadowBias;
			half _ImpostorEnd;
			half _IsShared;
			half _IsCustomShader;
			half _IsTVEShader;
			half _ImpostorMaskDefaultInfo;
			half _ImpostorMaskPackedInfo;
			half _ImpostorMaskShadingInfo;
			half _ImpostorMaskMode;
			half _ImpostorSpace0;
			half _ImpostorSpace1;
			half _ImpostorAlphaClipValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _SubsurfaceScatteringValue;
			half _IsVersion;
			half _RenderDecals;
			half _RenderSSR;
			half _CategoryRender;
			half _EndRender;
			half _IsInitialized;
			float _AI_ShadowView;
			float _AI_ForwardBias;
			float _AI_Frames;
			float _AI_DepthSize;
			half _TintingGlobalValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessIntensityValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _DrynessGlobalValue;
			half _SubsurfaceMultiValue;
			half _DrynessLumaValue;
			half _WetnessLiteInfo;
			half _WetnessCategory;
			half _TintingGrayValue;
			half _WetnessIntensityValue;
			half _TintingIntensityValue;
			half _TintingEnd;
			float _AI_ImpostorSize;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			half _MotionBaseTillingValue;
			half _MotionBaseSpeedValue;
			half _MotionBaseNoiseValue;
			half _MotionIntensityValue;
			half _MotionBaseDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _VariationNoiseTillingValue;
			half _TintingLiteInfo;
			half _TintingCategory;
			half _TintingSpace;
			half _SubsurfaceThicknessValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif

			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			TEXTURE2D(_NoiseTexSS);
			SAMPLER(sampler_NoiseTexSS);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			TEXTURE2D(_MotionNoiseTex);
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_MotionParamsEditor;
			half _DisableSRPBatcher;
			TEXTURE2D(_Shader);
			TEXTURE2D(_Packed);
			TEXTURE2D(_Vertex);
			SAMPLER(sampler_Shader);
			SAMPLER(sampler_Packed);
			SAMPLER(sampler_Vertex);
			half4 TVE_AtmoParams;
			half TVE_IsEnabled;
			half4 TVE_GlowParams;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define AI_ObjectToWorld GetObjectToWorldMatrix()
			#define AI_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_CHANGES_WORLD_POS
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#pragma shader_feature_local _USE_PARALLAX_ON
			#pragma shader_feature_local _HEMI_ON
			#pragma shader_feature_local AI_CLIP_NEIGHBOURS_FRAMES
			#pragma shader_feature_local_vertex TVE_MOTION
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_IMPOSTOR_MASK_OFF TVE_IMPOSTOR_MASK_DEFAULT TVE_IMPOSTOR_MASK_PACKED TVE_IMPOSTOR_MASK_SHADING
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half3 AlbedoRaw;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
				float Depth;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 PhaseData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatDataRT;
				half4 PaintDataRT;
				half4 GlowDataRT;
				half4 AtmoDataRT;
				half4 FadeDataRT;
				half4 FormDataRT;
				half4 FlowDataRT;
			};      
			        
			struct TVEMasksData
			{        
				half4 Mask0;
				half4 Mask1;
				half4 Mask2;
				half4 Mask3;
			};        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			#define TVE_IMPOSTOR_SHADER
			//#define _USE_PARALLAX_ON
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 UVsFrame122_g156549 : TEXCOORD3;
				float4 UVsFrame222_g156549 : TEXCOORD4;
				float4 UVsFrame322_g156549 : TEXCOORD5;
				float4 octaframe22_g156549 : TEXCOORD6;
				float4 viewPos22_g156549 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			struct ImpostorOutput
			{
				half3 Albedo;
				half3 Specular;
				half Metallic;
				half3 WorldNormal;
				half Smoothness;
				half Occlusion;
				half3 Emission;
				half Alpha;
			};
			
			float2 VectorToOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, out float2 uvs, out float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			float2 VectorToHemiOctahedron( float3 N )
			{
				N.xy /= dot( 1.0, abs( N ) );
				return float2( N.x + N.y, N.x - N.y );
			}
			
			float3 HemiOctahedronToVector( float2 Oct )
			{
				Oct = float2( Oct.x + Oct.y, Oct.x - Oct.y ) * 0.5;
				float3 N = float3( Oct, 1 - dot( 1.0, abs( Oct ) ) );
				return normalize( N );
			}
			
			inline void OctaImpostorVertex( inout float3 positionOS, out float3 normalOS, out float4 tangentOS, out float4 uvsFrame1, out float4 uvsFrame2, out float4 uvsFrame3, out float4 octaFrame, out float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = AI_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = AI_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( AI_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				#if defined( _HEMI_ON )
				objectCameraDirection.y = max(0.001, objectCameraDirection.y);
				float2 frameOcta = VectorToHemiOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#else
				float2 frameOcta = VectorToOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				#endif
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa1WorldY = HemiOctahedronToVector( octaFrame1 ).xzy;
				#else
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				#endif
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*out*/ uvFrame1, /*out*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa2WorldY = HemiOctahedronToVector( octaFrame2 ).xzy;
				#else
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				#endif
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*out*/ uvFrame2, /*out*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				#if defined( _HEMI_ON )
				float3 octa3WorldY = HemiOctahedronToVector( octaFrame3 ).xzy;
				#else
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				#endif
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*out*/ uvFrame3, /*out*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				octaFrame.zw = fractionOctaFrame;
				#endif
				positionOS = billboard + _AI_Offset.xyz;
				normalOS = objectCameraDirection;
				tangentOS = float4( objectHorizontalVector, 1 );
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout ImpostorOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 viewPos, out float4 output0, out float4 output1, out float4 output2 )
			{
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, -1 );
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, -1 );
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, -1 );
				float2 parallax1_uv = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float2 parallax2_uv = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float2 parallax3_uv = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1_uv, _AI_TextureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2_uv, _AI_TextureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3_uv, _AI_TextureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				#if defined( AI_CLIP_NEIGHBOURS_FRAMES )
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1_uv - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2_uv, parallax3_uv ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * ( 1 - step_1 );
				step23 = step23 * ( 1 - step23 );
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				#endif
				o.Albedo = blendedAlbedo.rgb;
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1_uv, _AI_TextureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2_uv, _AI_TextureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3_uv, _AI_TextureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				o.WorldNormal = normalize( mul( (float3x3)AI_ObjectToWorld, localNormal ) );
				float depth = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 ) * _AI_DepthSize * length( AI_ObjectToWorld[ 2 ].xyz );
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax1_uv, _AI_TextureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax2_uv, _AI_TextureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Shader, sampler_Shader, parallax3_uv, _AI_TextureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax1_uv, _AI_TextureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax2_uv, _AI_TextureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Packed, sampler_Packed, parallax3_uv, _AI_TextureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float4 output2a = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax1_uv, _AI_TextureBias );
				float4 output2b = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax2_uv, _AI_TextureBias );
				float4 output2c = SAMPLE_TEXTURE2D_BIAS( _Vertex, sampler_Vertex, parallax3_uv, _AI_TextureBias );
				output2 = output2a * weights.x  + output2b * weights.y + output2c * weights.z; 
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView - _AI_ShadowBias;
				#else 
				viewPos.z += depth + _AI_ForwardBias;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				#if defined(SHADERPASS) && defined(UNITY_PASS_SHADOWCASTER)
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#else
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(PickingSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

				float3 bentNormalWS;
                //BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);

            }

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS output;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				TVEModelData Data16_g158391 = (TVEModelData)0;
				float In_Dummy16_g158391 = 0.0;
				TVEModelData Data16_g158266 = (TVEModelData)0;
				half Dummy181_g158264 = ( ( _MotionCategory + _MotionEnd ) + _MotionLiteInfo );
				float In_Dummy16_g158266 = Dummy181_g158264;
				TVEModelData Data16_g157226 = (TVEModelData)0;
				float In_Dummy16_g157226 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS.xyz, inputMesh.normalOS.xyz, inputMesh.tangentOS, output.UVsFrame122_g156549, output.UVsFrame222_g156549, output.UVsFrame322_g156549, output.octaframe22_g156549, output.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( TransformObjectToWorld( inputMesh.positionOS.xyz ) );
				half3 Input_PositionWS319_g157220 = worldPosOut22_g156549;
				float3 worldToObj315_g157220 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS( Input_PositionWS319_g157220 ), 1 ) ).xyz;
				half3 Model_PositionOS316_g157220 = worldToObj315_g157220;
				float3 In_PositionOS16_g157226 = Model_PositionOS316_g157220;
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157226 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157226 = Model_PositionWO311_g157220;
				float3 In_PositionRawOS16_g157226 = Model_PositionOS316_g157220;
				float3 In_PositionAddOS16_g157226 = float3( 0,0,0 );
				float3 In_PivotOS16_g157226 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157223 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157223 = ( localObjectPosition_UNITY_MATRIX_M14_g157223 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157223 = localObjectPosition_UNITY_MATRIX_M14_g157223;
				#endif
				float3 vertexToFrag305_g157220 = staticSwitch13_g157223;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157226 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157226 = Model_PivotWO312_g157220;
				half3 Model_NormalOS313_g157220 = inputMesh.normalOS;
				float3 In_NormalOS16_g157226 = Model_NormalOS313_g157220;
				float3 ase_normalWS = TransformObjectToWorldNormal( inputMesh.normalOS );
				half3 Model_Normal_WS314_g157220 = ase_normalWS;
				float3 In_NormalWS16_g157226 = Model_Normal_WS314_g157220;
				float3 In_NormalRawOS16_g157226 = Model_NormalOS313_g157220;
				float3 In_NormalRawWS16_g157226 = Model_Normal_WS314_g157220;
				float4 In_TangentOS16_g157226 = float4( 0,1,0,1 );
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157226 = Model_ViewDirWS347_g157220;
				float4 In_VertexData16_g157226 = float4( 1,1,1,1 );
				float4 In_PhaseData16_g157226 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157226 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157226 = float4( 0,0,0,0 );
				{
				Data16_g157226.Dummy = In_Dummy16_g157226;
				Data16_g157226.PositionOS = In_PositionOS16_g157226;
				Data16_g157226.PositionWS = In_PositionWS16_g157226;
				Data16_g157226.PositionWO = In_PositionWO16_g157226;
				Data16_g157226.PositionRawOS = In_PositionRawOS16_g157226;
				Data16_g157226.PositionAddOS = In_PositionAddOS16_g157226;
				Data16_g157226.PivotOS = In_PivotOS16_g157226;
				Data16_g157226.PivotWS = In_PivotWS16_g157226;
				Data16_g157226.PivotWO = In_PivotWO16_g157226;
				Data16_g157226.NormalOS = In_NormalOS16_g157226;
				Data16_g157226.NormalWS = In_NormalWS16_g157226;
				Data16_g157226.NormalRawOS = In_NormalRawOS16_g157226;
				Data16_g157226.NormalRawWS = In_NormalRawWS16_g157226;
				Data16_g157226.TangentOS = In_TangentOS16_g157226;
				Data16_g157226.ViewDirWS = In_ViewDirWS16_g157226;
				Data16_g157226.VertexData = In_VertexData16_g157226;
				Data16_g157226.PhaseData = In_PhaseData16_g157226;
				Data16_g157226.BoundsData = In_BoundsData16_g157226;
				Data16_g157226.RotationData = In_RotationData16_g157226;
				}
				TVEModelData Data15_g158265 = Data16_g157226;
				float Out_Dummy15_g158265 = 0;
				float3 Out_PositionOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158265 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158265 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158265 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158265 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158265 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158265 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158265 = float3( 0,0,0 );
				float4 Out_VertexData15_g158265 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158265 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158265 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158265 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158265 = Data15_g158265.Dummy;
				Out_PositionOS15_g158265 = Data15_g158265.PositionOS;
				Out_PositionWS15_g158265 = Data15_g158265.PositionWS;
				Out_PositionWO15_g158265 = Data15_g158265.PositionWO;
				Out_PositionRawOS15_g158265 = Data15_g158265.PositionRawOS;
				Out_PositionAddOS15_g158265 = Data15_g158265.PositionAddOS;
				Out_PivotOS15_g158265 = Data15_g158265.PivotOS;
				Out_PivotWS15_g158265 = Data15_g158265.PivotWS;
				Out_PivotWO15_g158265 = Data15_g158265.PivotWO;
				Out_NormalOS15_g158265 = Data15_g158265.NormalOS;
				Out_NormalWS15_g158265 = Data15_g158265.NormalWS;
				Out_NormalRawOS15_g158265 = Data15_g158265.NormalRawOS;
				Out_NormalRawWS15_g158265 = Data15_g158265.NormalRawWS;
				Out_TangentOS15_g158265 = Data15_g158265.TangentOS;
				Out_ViewDirWS15_g158265 = Data15_g158265.ViewDirWS;
				Out_VertexData15_g158265 = Data15_g158265.VertexData;
				Out_PhaseData15_g158265 = Data15_g158265.PhaseData;
				Out_BoundsData15_g158265 = Data15_g158265.BoundsData;
				Out_RotationData15_g158265 = Data15_g158265.RotationData;
				}
				float3 temp_output_1567_0_g158264 = Out_PositionOS15_g158265;
				float3 In_PositionOS16_g158266 = temp_output_1567_0_g158264;
				float3 In_PositionWS16_g158266 = Out_PositionWS15_g158265;
				float3 temp_output_1567_17_g158264 = Out_PositionWO15_g158265;
				float3 In_PositionWO16_g158266 = temp_output_1567_17_g158264;
				float3 In_PositionRawOS16_g158266 = Out_PositionRawOS15_g158265;
				float3 In_PositionAddOS16_g158266 = Out_PositionAddOS15_g158265;
				float3 In_PivotOS16_g158266 = Out_PivotOS15_g158265;
				float3 In_PivotWS16_g158266 = Out_PivotWS15_g158265;
				float3 temp_output_1567_19_g158264 = Out_PivotWO15_g158265;
				float3 In_PivotWO16_g158266 = temp_output_1567_19_g158264;
				float3 In_NormalOS16_g158266 = Out_NormalOS15_g158265;
				float3 In_NormalWS16_g158266 = Out_NormalWS15_g158265;
				float3 In_NormalRawOS16_g158266 = Out_NormalRawOS15_g158265;
				float3 In_NormalRawWS16_g158266 = Out_NormalRawWS15_g158265;
				float4 In_TangentOS16_g158266 = Out_TangentOS15_g158265;
				float3 In_ViewDirWS16_g158266 = Out_ViewDirWS15_g158265;
				float4 In_VertexData16_g158266 = Out_VertexData15_g158265;
				float4 In_PhaseData16_g158266 = Out_PhaseData15_g158265;
				float4 In_BoundsData16_g158266 = Out_BoundsData15_g158265;
				half3 Model_PositionOS147_g158264 = temp_output_1567_0_g158264;
				half Base_Mask217_g158264 = saturate( ( Model_PositionOS147_g158264.y / _AI_Offset.y ) );
				float4 lerpResult836_g158275 = lerp( half4( 0, 1, 1, 0 ) , TVE_MotionParams , TVE_MotionParams.w);
				half2 Global_WindDirWS1663_g158264 = (lerpResult836_g158275).xy;
				half2 Input_WindDirWS803_g158268 = Global_WindDirWS1663_g158264;
				half3 Model_PositionWO162_g158264 = temp_output_1567_17_g158264;
				half3 Model_PivotWO402_g158264 = temp_output_1567_19_g158264;
				float3 lerpResult829_g158264 = lerp( Model_PositionWO162_g158264 , Model_PivotWO402_g158264 , _MotionBasePivotValue);
				half3 Base_Position1394_g158264 = lerpResult829_g158264;
				half3 Input_PositionWO419_g158268 = Base_Position1394_g158264;
				half Input_MotionTilling321_g158268 = ( _MotionBaseTillingValue + 0.2 );
				half2 Noise_Coord515_g158268 = ( -(Input_PositionWO419_g158268).xz * Input_MotionTilling321_g158268 * 0.005 );
				float2 temp_output_3_0_g158272 = Noise_Coord515_g158268;
				float2 temp_output_21_0_g158272 = Input_WindDirWS803_g158268;
				float mulTime113_g158271 = _TimeParameters.x * 0.02;
				float lerpResult128_g158271 = lerp( mulTime113_g158271 , ( ( mulTime113_g158271 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g158268 = _MotionBaseSpeedValue;
				half Noise_Speed516_g158268 = ( lerpResult128_g158271 * Input_MotionSpeed62_g158268 );
				float temp_output_15_0_g158272 = Noise_Speed516_g158268;
				float temp_output_23_0_g158272 = frac( temp_output_15_0_g158272 );
				float4 lerpResult39_g158272 = lerp( SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * temp_output_23_0_g158272 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, ( temp_output_3_0_g158272 + ( temp_output_21_0_g158272 * frac( ( temp_output_15_0_g158272 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_23_0_g158272 - 0.5 ) ) / 0.5 ));
				float4 temp_output_635_0_g158268 = lerpResult39_g158272;
				half2 Noise_DirWS825_g158268 = ((temp_output_635_0_g158268).rg*2.0 + -1.0);
				half Input_MotionNoise552_g158268 = _MotionBaseNoiseValue;
				half Global_WInd769_g158275 = (lerpResult836_g158275).z;
				float lerpResult853_g158275 = lerp( Global_WInd769_g158275 , saturate( (Global_WInd769_g158275*TVE_MotionParamsEditor.x + TVE_MotionParamsEditor.y) ) , TVE_MotionParamsEditor.w);
				half Input_MotionValue629_g158275 = _MotionIntensityValue;
				half Global_WindValue1664_g158264 = ( lerpResult853_g158275 * Input_MotionValue629_g158275 );
				half Input_WindValue853_g158268 = Global_WindValue1664_g158264;
				float lerpResult701_g158268 = lerp( 1.0 , Input_MotionNoise552_g158268 , Input_WindValue853_g158268);
				float2 lerpResult646_g158268 = lerp( Input_WindDirWS803_g158268 , Noise_DirWS825_g158268 , lerpResult701_g158268);
				half Input_MotionDelay753_g158268 = _MotionBaseDelayValue;
				float lerpResult756_g158268 = lerp( 1.0 , ( Input_WindValue853_g158268 * Input_WindValue853_g158268 ) , Input_MotionDelay753_g158268);
				half Wind_Delay815_g158268 = lerpResult756_g158268;
				float2 temp_output_809_0_g158268 = ( lerpResult646_g158268 * Input_WindValue853_g158268 * Wind_Delay815_g158268 );
				half2 Input_PushDirWS807_g158268 = float2( 1,0 );
				half Input_PushAlpha806_g158268 = ( 1.0 * 1.0 );
				float2 lerpResult811_g158268 = lerp( temp_output_809_0_g158268 , Input_PushDirWS807_g158268 , Input_PushAlpha806_g158268);
				#ifdef TVE_MOTION_ELEMENT
				float2 staticSwitch808_g158268 = lerpResult811_g158268;
				#else
				float2 staticSwitch808_g158268 = temp_output_809_0_g158268;
				#endif
				float2 temp_output_38_0_g158269 = staticSwitch808_g158268;
				float2 break83_g158269 = temp_output_38_0_g158269;
				float3 appendResult79_g158269 = (float3(break83_g158269.x , 0.0 , break83_g158269.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Bending893_g158264 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158269 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Base_Motion1440_g158264 = ( _MotionBaseIntensityValue * Base_Mask217_g158264 * Base_Bending893_g158264 );
				#ifdef TVE_MOTION
				float2 staticSwitch1651_g158264 = Base_Motion1440_g158264;
				#else
				float2 staticSwitch1651_g158264 = float2( 0,0 );
				#endif
				float4 appendResult1658_g158264 = (float4(staticSwitch1651_g158264 , 0.0 , 0.0));
				half4 Final_RoationData1570_g158264 = appendResult1658_g158264;
				float4 In_RotationData16_g158266 = Final_RoationData1570_g158264;
				{
				Data16_g158266.Dummy = In_Dummy16_g158266;
				Data16_g158266.PositionOS = In_PositionOS16_g158266;
				Data16_g158266.PositionWS = In_PositionWS16_g158266;
				Data16_g158266.PositionWO = In_PositionWO16_g158266;
				Data16_g158266.PositionRawOS = In_PositionRawOS16_g158266;
				Data16_g158266.PositionAddOS = In_PositionAddOS16_g158266;
				Data16_g158266.PivotOS = In_PivotOS16_g158266;
				Data16_g158266.PivotWS = In_PivotWS16_g158266;
				Data16_g158266.PivotWO = In_PivotWO16_g158266;
				Data16_g158266.NormalOS = In_NormalOS16_g158266;
				Data16_g158266.NormalWS = In_NormalWS16_g158266;
				Data16_g158266.NormalRawOS = In_NormalRawOS16_g158266;
				Data16_g158266.NormalRawWS = In_NormalRawWS16_g158266;
				Data16_g158266.TangentOS = In_TangentOS16_g158266;
				Data16_g158266.ViewDirWS = In_ViewDirWS16_g158266;
				Data16_g158266.VertexData = In_VertexData16_g158266;
				Data16_g158266.PhaseData = In_PhaseData16_g158266;
				Data16_g158266.BoundsData = In_BoundsData16_g158266;
				Data16_g158266.RotationData = In_RotationData16_g158266;
				}
				TVEModelData Data15_g158390 = Data16_g158266;
				float Out_Dummy15_g158390 = 0;
				float3 Out_PositionOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158390 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158390 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158390 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158390 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158390 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158390 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158390 = float3( 0,0,0 );
				float4 Out_VertexData15_g158390 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158390 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158390 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158390 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158390 = Data15_g158390.Dummy;
				Out_PositionOS15_g158390 = Data15_g158390.PositionOS;
				Out_PositionWS15_g158390 = Data15_g158390.PositionWS;
				Out_PositionWO15_g158390 = Data15_g158390.PositionWO;
				Out_PositionRawOS15_g158390 = Data15_g158390.PositionRawOS;
				Out_PositionAddOS15_g158390 = Data15_g158390.PositionAddOS;
				Out_PivotOS15_g158390 = Data15_g158390.PivotOS;
				Out_PivotWS15_g158390 = Data15_g158390.PivotWS;
				Out_PivotWO15_g158390 = Data15_g158390.PivotWO;
				Out_NormalOS15_g158390 = Data15_g158390.NormalOS;
				Out_NormalWS15_g158390 = Data15_g158390.NormalWS;
				Out_NormalRawOS15_g158390 = Data15_g158390.NormalRawOS;
				Out_NormalRawWS15_g158390 = Data15_g158390.NormalRawWS;
				Out_TangentOS15_g158390 = Data15_g158390.TangentOS;
				Out_ViewDirWS15_g158390 = Data15_g158390.ViewDirWS;
				Out_VertexData15_g158390 = Data15_g158390.VertexData;
				Out_PhaseData15_g158390 = Data15_g158390.PhaseData;
				Out_BoundsData15_g158390 = Data15_g158390.BoundsData;
				Out_RotationData15_g158390 = Data15_g158390.RotationData;
				}
				half3 Model_PositionOS147_g158389 = Out_PositionOS15_g158390;
				half3 VertexPos40_g158393 = Model_PositionOS147_g158389;
				float3 appendResult74_g158393 = (float3(VertexPos40_g158393.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158393 = appendResult74_g158393;
				float3 break84_g158393 = VertexPos40_g158393;
				float3 appendResult81_g158393 = (float3(0.0 , break84_g158393.y , break84_g158393.z));
				half3 VertexPosOtherAxis82_g158393 = appendResult81_g158393;
				float4 temp_output_1567_33_g158389 = Out_RotationData15_g158390;
				half4 Model_VertexBend1569_g158389 = temp_output_1567_33_g158389;
				float2 break1582_g158389 = (Model_VertexBend1569_g158389).xy;
				half Angle44_g158393 = break1582_g158389.y;
				half3 VertexPos40_g158396 = ( VertexPosRotationAxis50_g158393 + ( VertexPosOtherAxis82_g158393 * cos( Angle44_g158393 ) ) + ( cross( float3( 1, 0, 0 ) , VertexPosOtherAxis82_g158393 ) * sin( Angle44_g158393 ) ) );
				float3 appendResult74_g158396 = (float3(0.0 , 0.0 , VertexPos40_g158396.z));
				half3 VertexPosRotationAxis50_g158396 = appendResult74_g158396;
				float3 break84_g158396 = VertexPos40_g158396;
				float3 appendResult81_g158396 = (float3(break84_g158396.x , break84_g158396.y , 0.0));
				half3 VertexPosOtherAxis82_g158396 = appendResult81_g158396;
				half Angle44_g158396 = -break1582_g158389.x;
				float3 temp_output_1584_19_g158389 = ( VertexPosRotationAxis50_g158396 + ( VertexPosOtherAxis82_g158396 * cos( Angle44_g158396 ) ) + ( cross( float3( 0, 0, 1 ) , VertexPosOtherAxis82_g158396 ) * sin( Angle44_g158396 ) ) );
				float3 temp_output_6_0_g158395 = temp_output_1584_19_g158389;
				#ifdef TVE_MOTION
				float3 staticSwitch65_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch65_g158395 = Model_PositionOS147_g158389;
				#endif
				#ifdef TVE_CONFORM
				float3 staticSwitch69_g158395 = temp_output_6_0_g158395;
				#else
				float3 staticSwitch69_g158395 = staticSwitch65_g158395;
				#endif
				float3 temp_output_1585_0_g158389 = staticSwitch69_g158395;
				float3 temp_output_1567_31_g158389 = Out_PositionAddOS15_g158390;
				half3 Model_PositionADD1568_g158389 = temp_output_1567_31_g158389;
				half3 Final_PositionOS178_g158389 = ( temp_output_1585_0_g158389 + Model_PositionADD1568_g158389 );
				float3 In_PositionOS16_g158391 = Final_PositionOS178_g158389;
				float3 In_PositionWS16_g158391 = Out_PositionWS15_g158390;
				float3 In_PositionWO16_g158391 = Out_PositionWO15_g158390;
				float3 In_PositionRawOS16_g158391 = Out_PositionRawOS15_g158390;
				float3 In_PositionAddOS16_g158391 = temp_output_1567_31_g158389;
				float3 In_PivotOS16_g158391 = Out_PivotOS15_g158390;
				float3 In_PivotWS16_g158391 = Out_PivotWS15_g158390;
				float3 In_PivotWO16_g158391 = Out_PivotWO15_g158390;
				float3 In_NormalOS16_g158391 = Out_NormalOS15_g158390;
				float3 In_NormalWS16_g158391 = Out_NormalWS15_g158390;
				float3 In_NormalRawOS16_g158391 = Out_NormalRawOS15_g158390;
				float3 In_NormalRawWS16_g158391 = Out_NormalRawWS15_g158390;
				float4 In_TangentOS16_g158391 = Out_TangentOS15_g158390;
				float3 In_ViewDirWS16_g158391 = Out_ViewDirWS15_g158390;
				float4 In_VertexData16_g158391 = Out_VertexData15_g158390;
				float4 In_PhaseData16_g158391 = Out_PhaseData15_g158390;
				float4 In_BoundsData16_g158391 = Out_BoundsData15_g158390;
				float4 In_RotationData16_g158391 = temp_output_1567_33_g158389;
				{
				Data16_g158391.Dummy = In_Dummy16_g158391;
				Data16_g158391.PositionOS = In_PositionOS16_g158391;
				Data16_g158391.PositionWS = In_PositionWS16_g158391;
				Data16_g158391.PositionWO = In_PositionWO16_g158391;
				Data16_g158391.PositionRawOS = In_PositionRawOS16_g158391;
				Data16_g158391.PositionAddOS = In_PositionAddOS16_g158391;
				Data16_g158391.PivotOS = In_PivotOS16_g158391;
				Data16_g158391.PivotWS = In_PivotWS16_g158391;
				Data16_g158391.PivotWO = In_PivotWO16_g158391;
				Data16_g158391.NormalOS = In_NormalOS16_g158391;
				Data16_g158391.NormalWS = In_NormalWS16_g158391;
				Data16_g158391.NormalRawOS = In_NormalRawOS16_g158391;
				Data16_g158391.NormalRawWS = In_NormalRawWS16_g158391;
				Data16_g158391.TangentOS = In_TangentOS16_g158391;
				Data16_g158391.ViewDirWS = In_ViewDirWS16_g158391;
				Data16_g158391.VertexData = In_VertexData16_g158391;
				Data16_g158391.PhaseData = In_PhaseData16_g158391;
				Data16_g158391.BoundsData = In_BoundsData16_g158391;
				Data16_g158391.RotationData = In_RotationData16_g158391;
				}
				TVEModelData Data15_g158419 = Data16_g158391;
				float Out_Dummy15_g158419 = 0;
				float3 Out_PositionOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158419 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158419 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158419 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158419 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158419 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158419 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158419 = float3( 0,0,0 );
				float4 Out_VertexData15_g158419 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g158419 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158419 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158419 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158419 = Data15_g158419.Dummy;
				Out_PositionOS15_g158419 = Data15_g158419.PositionOS;
				Out_PositionWS15_g158419 = Data15_g158419.PositionWS;
				Out_PositionWO15_g158419 = Data15_g158419.PositionWO;
				Out_PositionRawOS15_g158419 = Data15_g158419.PositionRawOS;
				Out_PositionAddOS15_g158419 = Data15_g158419.PositionAddOS;
				Out_PivotOS15_g158419 = Data15_g158419.PivotOS;
				Out_PivotWS15_g158419 = Data15_g158419.PivotWS;
				Out_PivotWO15_g158419 = Data15_g158419.PivotWO;
				Out_NormalOS15_g158419 = Data15_g158419.NormalOS;
				Out_NormalWS15_g158419 = Data15_g158419.NormalWS;
				Out_NormalRawOS15_g158419 = Data15_g158419.NormalRawOS;
				Out_NormalRawWS15_g158419 = Data15_g158419.NormalRawWS;
				Out_TangentOS15_g158419 = Data15_g158419.TangentOS;
				Out_ViewDirWS15_g158419 = Data15_g158419.ViewDirWS;
				Out_VertexData15_g158419 = Data15_g158419.VertexData;
				Out_PhaseData15_g158419 = Data15_g158419.PhaseData;
				Out_BoundsData15_g158419 = Data15_g158419.BoundsData;
				Out_RotationData15_g158419 = Data15_g158419.RotationData;
				}
				float3 temp_output_31_0_g158407 = Out_PositionOS15_g158419;
				float3 temp_output_6_0_g158420 = ( temp_output_31_0_g158407 + _DisableSRPBatcher );
				float temp_output_371_0_g158324 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingGlobalValue + _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessGlobalValue + _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue + 0.0 ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue + _CutoutGlobalValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeScaleValue1 ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) + temp_output_371_0_g158324 );
				#ifdef TVE_DUMMY
				float3 staticSwitch14_g158420 = ( temp_output_6_0_g158420 + Dummy_Data505.r );
				#else
				float3 staticSwitch14_g158420 = temp_output_6_0_g158420;
				#endif
				
				float4 ase_positionCS = TransformWorldToHClip( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				output.ase_texcoord8 = ase_positionCS;
				output.ase_texcoord9.xyz = vertexToFrag305_g157220;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = staticSwitch14_g158420;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				output.positionCS = TransformWorldToHClip(positionRWS);
				output.positionRWS = positionRWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif
						#if defined( ASE_DEPTH_WRITE_ON )
							, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						 )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS, packedInput.normalWS);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
					input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
					#if defined(ASE_NEED_CULLFACE)
						input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
					#endif
				#endif

				half isFrontFace = input.isFrontFace;
				float3 PositionRWS = posInput.positionWS;
				float3 PositionWS = GetAbsolutePositionWS( posInput.positionWS );
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float3 NormalWS = packedInput.normalWS;
				float4 TangentWS = packedInput.tangentWS;
				float3 BitangentWS = input.tangentToWorld[ 1 ];

				float localBreakData4_g158410 = ( 0.0 );
				float localCompData3_g158401 = ( 0.0 );
				TVEVisualData Data3_g158401 = (TVEVisualData)0;
				half Dummy145_g158399 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) );
				float In_Dummy3_g158401 = Dummy145_g158399;
				float localBreakData4_g158400 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158292 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + 0.0 );
				float In_Dummy3_g158307 = Dummy145_g158292;
				float localBreakData4_g158296 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				half Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlayBakeInfo ) + 0.0 );
				float In_Dummy3_g158220 = Dummy594_g158217;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157228 = ( 0.0 );
				TVEVisualData Data3_g157228 = (TVEVisualData)0;
				float In_Dummy3_g157228 = 0.0;
				float4 output0 = 0;
				float4 output1 = 0;
				float4 output2 = 0;
				float4 ase_positionCS = packedInput.ase_texcoord8;
				ImpostorOutput io = ( ImpostorOutput )0;
				OctaImpostorFragment( io, ase_positionCS, PositionRWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1, output2 );
				float4 temp_cast_0 = (1.0).xxxx;
				half4 Input_Tex0377_g157220 = output0;
				half4 Input_Tex1379_g157220 = output1;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch403_g157220 = temp_cast_0;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch403_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch403_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch403_g157220 = temp_cast_0;
				#endif
				half Local_MultiMask249_g157220 = (staticSwitch403_g157220).b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( io.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157228 = Local_Albedo239_g157220;
				float3 In_AlbedoRaw3_g157228 = Local_Albedo239_g157220;
				float2 temp_cast_3 = (0.0).xx;
				float2 In_NormalTS3_g157228 = temp_cast_3;
				float3 In_NormalWS3_g157228 = io.WorldNormal;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 temp_cast_5 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch385_g157220 = temp_cast_4;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch385_g157220 = temp_cast_5;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch385_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch385_g157220 = temp_cast_4;
				#endif
				half Local_Metallic247_g157220 = (staticSwitch385_g157220).r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				float4 temp_cast_6 = (1.0).xxxx;
				float4 temp_cast_7 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch392_g157220 = temp_cast_6;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch392_g157220 = temp_cast_7;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch392_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch392_g157220 = temp_cast_6;
				#endif
				half Local_OcclusionOrEmissive248_g157220 = (staticSwitch392_g157220).g;
				float lerpResult431_g157220 = lerp( 1.0 , Local_OcclusionOrEmissive248_g157220 , _ImpostorOcclusionValue);
				#ifdef TVE_EMISSIVE
				float staticSwitch428_g157220 = 1.0;
				#else
				float staticSwitch428_g157220 = lerpResult431_g157220;
				#endif
				half Final_Occlusion424_g157220 = staticSwitch428_g157220;
				float4 temp_cast_8 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch408_g157220 = temp_cast_8;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch408_g157220 = Input_Tex1379_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch408_g157220 = Input_Tex0377_g157220;
				#else
				float4 staticSwitch408_g157220 = temp_cast_8;
				#endif
				half Local_Smoothness250_g157220 = (staticSwitch408_g157220).a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , Final_Occlusion424_g157220 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157228 = appendResult257_g157220;
				float4 appendResult286_g157220 = (float4(Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , Local_OcclusionOrEmissive248_g157220 , 1.0));
				float4 In_Emissive3_g157228 = appendResult286_g157220;
				float3 temp_output_3_0_g157221 = Local_Albedo239_g157220;
				float dotResult20_g157221 = dot( temp_output_3_0_g157221 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale268_g157220 = dotResult20_g157221;
				float In_Grayscale3_g157228 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157228 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157228 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157228 = 0.0;
				float In_AlphaFade3_g157228 = 1.0;
				float3 temp_cast_9 = (1.0).xxx;
				float3 In_Translucency3_g157228 = temp_cast_9;
				float In_Transmission3_g157228 = 1.0;
				float In_Thickness3_g157228 = 0.0;
				float In_Diffusion3_g157228 = 0.0;
				float In_Depth3_g157228 = ase_positionCS.z;
				{
				Data3_g157228.Dummy = In_Dummy3_g157228;
				Data3_g157228.Albedo = In_Albedo3_g157228;
				Data3_g157228.AlbedoRaw = In_AlbedoRaw3_g157228;
				Data3_g157228.NormalTS = In_NormalTS3_g157228;
				Data3_g157228.NormalWS = In_NormalWS3_g157228;
				Data3_g157228.Shader = In_Shader3_g157228;
				Data3_g157228.Emissive= In_Emissive3_g157228;
				Data3_g157228.MultiMask = In_MultiMask3_g157228;
				Data3_g157228.Grayscale = In_Grayscale3_g157228;
				Data3_g157228.Luminosity = In_Luminosity3_g157228;
				Data3_g157228.AlphaClip = In_AlphaClip3_g157228;
				Data3_g157228.AlphaFade = In_AlphaFade3_g157228;
				Data3_g157228.Translucency = In_Translucency3_g157228;
				Data3_g157228.Transmission = In_Transmission3_g157228;
				Data3_g157228.Thickness = In_Thickness3_g157228;
				Data3_g157228.Diffusion = In_Diffusion3_g157228;
				Data3_g157228.Depth = In_Depth3_g157228;
				}
				TVEVisualData Data4_g158218 = Data3_g157228;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				float Out_Depth4_g158218 = 0;
				{
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_AlbedoRaw4_g158218 = Data4_g158218.AlbedoRaw;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				Out_Depth4_g158218= Data4_g158218.Depth;
				}
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158231 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158237 = _OverlayProjRemap.x;
				float temp_output_9_0_g158237 = ( clampResult17_g158231 - temp_output_7_0_g158237 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158237 * _OverlayProjRemap.z ) + 0.0001 ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158232 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayLumaRemap.x;
				float temp_output_9_0_g158236 = ( clampResult17_g158232 - temp_output_7_0_g158236 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158236 * _OverlayLumaRemap.z ) + 0.0001 ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				TVEModelData Data16_g157227 = (TVEModelData)0;
				float In_Dummy16_g157227 = 0.0;
				half3 Input_PositionWS319_g157220 = GetAbsolutePositionWS( PositionRWS );
				half3 Model_PositionWS309_g157220 = Input_PositionWS319_g157220;
				float3 In_PositionWS16_g157227 = Model_PositionWS309_g157220;
				half3 Model_PositionWO311_g157220 = ( Model_PositionWS309_g157220 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157227 = Model_PositionWO311_g157220;
				float3 vertexToFrag305_g157220 = packedInput.ase_texcoord9.xyz;
				half3 Model_PivotWS310_g157220 = vertexToFrag305_g157220;
				float3 In_PivotWS16_g157227 = Model_PivotWS310_g157220;
				half3 Model_PivotWO312_g157220 = ( Model_PivotWS310_g157220 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157227 = Model_PivotWO312_g157220;
				half3 Model_Normal_WS314_g157220 = NormalWS;
				float3 In_NormalWS16_g157227 = Model_Normal_WS314_g157220;
				float3 normalizeResult351_g157220 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS309_g157220 ) );
				half3 Model_ViewDirWS347_g157220 = normalizeResult351_g157220;
				float3 In_ViewDirWS16_g157227 = Model_ViewDirWS347_g157220;
				float4 temp_cast_10 = (1.0).xxxx;
				half4 Input_Tex2380_g157220 = output2;
				float4 appendResult420_g157220 = (float4((Input_Tex1379_g157220).rg , 1.0 , 1.0));
				float4 temp_cast_13 = (1.0).xxxx;
				#if defined( TVE_IMPOSTOR_MASK_OFF )
				float4 staticSwitch414_g157220 = temp_cast_10;
				#elif defined( TVE_IMPOSTOR_MASK_DEFAULT )
				float4 staticSwitch414_g157220 = Input_Tex2380_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_PACKED )
				float4 staticSwitch414_g157220 = appendResult420_g157220;
				#elif defined( TVE_IMPOSTOR_MASK_SHADING )
				float4 staticSwitch414_g157220 = temp_cast_13;
				#else
				float4 staticSwitch414_g157220 = temp_cast_10;
				#endif
				half4 Local_VertexColor422_g157220 = staticSwitch414_g157220;
				float4 In_VertexData16_g157227 = Local_VertexColor422_g157220;
				float4 In_BoundsData16_g157227 = float4( 1,1,1,1 );
				{
				Data16_g157227.Dummy = In_Dummy16_g157227;
				Data16_g157227.PositionWS = In_PositionWS16_g157227;
				Data16_g157227.PositionWO = In_PositionWO16_g157227;
				Data16_g157227.PivotWS = In_PivotWS16_g157227;
				Data16_g157227.PivotWO = In_PivotWO16_g157227;
				Data16_g157227.NormalWS = In_NormalWS16_g157227;
				Data16_g157227.ViewDirWS = In_ViewDirWS16_g157227;
				Data16_g157227.VertexData = In_VertexData16_g157227;
				Data16_g157227.BoundsData = In_BoundsData16_g157227;
				}
				TVEModelData Data15_g158228 = Data16_g157227;
				float Out_Dummy15_g158228 = 0;
				float3 Out_PositionWS15_g158228 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158228 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158228 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158228 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g158228 = float3( 0,0,0 );
				float4 Out_VertexData15_g158228 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158228 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g158228 = Data15_g158228.Dummy;
				Out_PositionWS15_g158228 = Data15_g158228.PositionWS;
				Out_PositionWO15_g158228 = Data15_g158228.PositionWO;
				Out_PivotWS15_g158228 = Data15_g158228.PivotWS;
				Out_PivotWO15_g158228 = Data15_g158228.PivotWO;
				Out_NormalWS15_g158228 = Data15_g158228.NormalWS;
				Out_ViewDirWS15_g158228 = Data15_g158228.ViewDirWS;
				Out_VertexData15_g158228 = Data15_g158228.VertexData;
				Out_BoundsData15_g158228 = Data15_g158228.BoundsData;
				}
				half4 Model_VertexMasks791_g158217 = Out_VertexData15_g158228;
				float4 break792_g158217 = Model_VertexMasks791_g158217;
				float4 break33_g158229 = _overlay_vert_mode;
				float temp_output_30_0_g158229 = ( break792_g158217.x * break33_g158229.x );
				float temp_output_29_0_g158229 = ( break792_g158217.y * break33_g158229.y );
				float temp_output_31_0_g158229 = ( break792_g158217.z * break33_g158229.z );
				float temp_output_28_0_g158229 = ( temp_output_30_0_g158229 + temp_output_29_0_g158229 + temp_output_31_0_g158229 + ( break792_g158217.w * break33_g158229.w ) );
				float clampResult17_g158230 = clamp( temp_output_28_0_g158229 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayMeshRemap.x;
				float temp_output_9_0_g158238 = ( clampResult17_g158230 - temp_output_7_0_g158238 );
				float lerpResult879_g158217 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g158238 * _OverlayMeshRemap.z ) + 0.0001 ) ) , _OverlayMeshValue);
				float temp_output_6_0_g158233 = lerpResult879_g158217;
				#ifdef TVE_DUMMY
				float staticSwitch14_g158233 = ( temp_output_6_0_g158233 + _OverlayMeshMode );
				#else
				float staticSwitch14_g158233 = temp_output_6_0_g158233;
				#endif
				half Overlay_VertMask801_g158217 = staticSwitch14_g158233;
				float lerpResult920_g158217 = lerp( 1.0 , ( TVE_AtmoParams.z * TVE_IsEnabled ) , _OverlayGlobalValue);
				half Overlay_MaskGlobal429_g158217 = lerpResult920_g158217;
				float temp_output_7_0_g158239 = _OverlayBlendRemap.x;
				float temp_output_9_0_g158239 = ( ( _OverlayIntensityValue * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ) - temp_output_7_0_g158239 );
				half Overlay_Mask494_g158217 = saturate( ( ( temp_output_9_0_g158239 * _OverlayBlendRemap.z ) + 0.0001 ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				float3 In_AlbedoRaw3_g158220 = Out_AlbedoRaw4_g158218;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				float In_Depth3_g158220 = Out_Depth4_g158218;
				{
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.AlbedoRaw = In_AlbedoRaw3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				Data3_g158220.Depth = In_Depth3_g158220;
				}
				TVEVisualData Data4_g158296 = Data3_g158220;
				float Out_Dummy4_g158296 = 0;
				float3 Out_Albedo4_g158296 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158296 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158296 = float2( 0,0 );
				float3 Out_NormalWS4_g158296 = float3( 0,0,0 );
				float4 Out_Shader4_g158296 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158296 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158296 = 0;
				float Out_Grayscale4_g158296 = 0;
				float Out_Luminosity4_g158296 = 0;
				float Out_AlphaClip4_g158296 = 0;
				float Out_AlphaFade4_g158296 = 0;
				float3 Out_Translucency4_g158296 = float3( 0,0,0 );
				float Out_Transmission4_g158296 = 0;
				float Out_Thickness4_g158296 = 0;
				float Out_Diffusion4_g158296 = 0;
				float Out_Depth4_g158296 = 0;
				{
				Out_Dummy4_g158296 = Data4_g158296.Dummy;
				Out_Albedo4_g158296 = Data4_g158296.Albedo;
				Out_AlbedoRaw4_g158296 = Data4_g158296.AlbedoRaw;
				Out_NormalTS4_g158296 = Data4_g158296.NormalTS;
				Out_NormalWS4_g158296 = Data4_g158296.NormalWS;
				Out_Shader4_g158296 = Data4_g158296.Shader;
				Out_Emissive4_g158296= Data4_g158296.Emissive;
				Out_MultiMask4_g158296 = Data4_g158296.MultiMask;
				Out_Grayscale4_g158296 = Data4_g158296.Grayscale;
				Out_Luminosity4_g158296= Data4_g158296.Luminosity;
				Out_AlphaClip4_g158296 = Data4_g158296.AlphaClip;
				Out_AlphaFade4_g158296 = Data4_g158296.AlphaFade;
				Out_Translucency4_g158296 = Data4_g158296.Translucency;
				Out_Transmission4_g158296 = Data4_g158296.Transmission;
				Out_Thickness4_g158296 = Data4_g158296.Thickness;
				Out_Diffusion4_g158296 = Data4_g158296.Diffusion;
				Out_Depth4_g158296= Data4_g158296.Depth;
				}
				float3 temp_output_297_0_g158292 = Out_Albedo4_g158296;
				float3 In_Albedo3_g158307 = temp_output_297_0_g158292;
				float3 temp_output_297_23_g158292 = Out_AlbedoRaw4_g158296;
				float3 In_AlbedoRaw3_g158307 = temp_output_297_23_g158292;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158296;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158296;
				float4 In_Shader3_g158307 = Out_Shader4_g158296;
				float4 temp_cast_15 = (0.0).xxxx;
				half4 Visual_Emissive255_g158292 = Out_Emissive4_g158296;
				half Emissive_MeshMask221_g158292 = 1.0;
				half Emissive_Mask103_g158292 = 1.0;
				float temp_output_279_0_g158292 = ( Emissive_MeshMask221_g158292 * Emissive_Mask103_g158292 );
				float3 appendResult293_g158292 = (float3(temp_output_279_0_g158292 , temp_output_279_0_g158292 , temp_output_279_0_g158292));
				half3 Local_EmissiveColor278_g158292 = appendResult293_g158292;
				float3 temp_output_316_0_g158292 = (TVE_GlowParams).xyz;
				float3 lerpResult299_g158292 = lerp( float3( 1,1,1 ) , temp_output_316_0_g158292 , ( _EmissiveGlobalValue * TVE_IsEnabled ));
				half3 Emissive_GlobalMask248_g158292 = lerpResult299_g158292;
				half3 Visual_AlbedoRaw306_g158292 = temp_output_297_23_g158292;
				float3 lerpResult307_g158292 = lerp( float3( 1,1,1 ) , Visual_AlbedoRaw306_g158292 , _EmissiveColorMode);
				half3 Local_EmissiveValue88_g158292 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158292 * lerpResult307_g158292 );
				half3 Emissive_Blend260_g158292 = ( ( (Visual_Emissive255_g158292).xyz * Local_EmissiveColor278_g158292 ) * Local_EmissiveValue88_g158292 );
				float3 temp_output_3_0_g158298 = Emissive_Blend260_g158292;
				float temp_output_15_0_g158298 = _emissive_power_value;
				float3 hdEmission22_g158298 = ASEGetEmissionHDRColor(temp_output_3_0_g158298,temp_output_15_0_g158298,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Local_EmissiveMask294_g158292 = temp_output_279_0_g158292;
				float4 appendResult295_g158292 = (float4(hdEmission22_g158298 , Local_EmissiveMask294_g158292));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158292 = appendResult295_g158292;
				#else
				float4 staticSwitch129_g158292 = temp_cast_15;
				#endif
				half4 Final_Emissive184_g158292 = staticSwitch129_g158292;
				float4 In_Emissive3_g158307 = Final_Emissive184_g158292;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158296;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158296;
				float temp_output_297_11_g158292 = Out_MultiMask4_g158296;
				float In_MultiMask3_g158307 = temp_output_297_11_g158292;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158296;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158296;
				float3 In_Translucency3_g158307 = Out_Translucency4_g158296;
				float In_Transmission3_g158307 = Out_Transmission4_g158296;
				float In_Thickness3_g158307 = Out_Thickness4_g158296;
				float In_Diffusion3_g158307 = Out_Diffusion4_g158296;
				float In_Depth3_g158307 = Out_Depth4_g158296;
				{
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.AlbedoRaw = In_AlbedoRaw3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				Data3_g158307.Depth = In_Depth3_g158307;
				}
				TVEVisualData Data4_g158400 = Data3_g158307;
				float Out_Dummy4_g158400 = 0;
				float3 Out_Albedo4_g158400 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158400 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158400 = float2( 0,0 );
				float3 Out_NormalWS4_g158400 = float3( 0,0,0 );
				float4 Out_Shader4_g158400 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158400 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158400 = 0;
				float Out_Grayscale4_g158400 = 0;
				float Out_Luminosity4_g158400 = 0;
				float Out_AlphaClip4_g158400 = 0;
				float Out_AlphaFade4_g158400 = 0;
				float3 Out_Translucency4_g158400 = float3( 0,0,0 );
				float Out_Transmission4_g158400 = 0;
				float Out_Thickness4_g158400 = 0;
				float Out_Diffusion4_g158400 = 0;
				float Out_Depth4_g158400 = 0;
				{
				Out_Dummy4_g158400 = Data4_g158400.Dummy;
				Out_Albedo4_g158400 = Data4_g158400.Albedo;
				Out_AlbedoRaw4_g158400 = Data4_g158400.AlbedoRaw;
				Out_NormalTS4_g158400 = Data4_g158400.NormalTS;
				Out_NormalWS4_g158400 = Data4_g158400.NormalWS;
				Out_Shader4_g158400 = Data4_g158400.Shader;
				Out_Emissive4_g158400= Data4_g158400.Emissive;
				Out_MultiMask4_g158400 = Data4_g158400.MultiMask;
				Out_Grayscale4_g158400 = Data4_g158400.Grayscale;
				Out_Luminosity4_g158400= Data4_g158400.Luminosity;
				Out_AlphaClip4_g158400 = Data4_g158400.AlphaClip;
				Out_AlphaFade4_g158400 = Data4_g158400.AlphaFade;
				Out_Translucency4_g158400 = Data4_g158400.Translucency;
				Out_Transmission4_g158400 = Data4_g158400.Transmission;
				Out_Thickness4_g158400 = Data4_g158400.Thickness;
				Out_Diffusion4_g158400 = Data4_g158400.Diffusion;
				Out_Depth4_g158400= Data4_g158400.Depth;
				}
				half3 Visual_Albedo199_g158399 = Out_Albedo4_g158400;
				half3 Final_Albedo312_g158399 = Visual_Albedo199_g158399;
				float3 In_Albedo3_g158401 = Final_Albedo312_g158399;
				float3 In_AlbedoRaw3_g158401 = Out_AlbedoRaw4_g158400;
				float2 In_NormalTS3_g158401 = Out_NormalTS4_g158400;
				float3 In_NormalWS3_g158401 = Out_NormalWS4_g158400;
				float4 In_Shader3_g158401 = Out_Shader4_g158400;
				float4 In_Emissive3_g158401 = Out_Emissive4_g158400;
				float In_Grayscale3_g158401 = Out_Grayscale4_g158400;
				float In_Luminosity3_g158401 = Out_Luminosity4_g158400;
				float temp_output_301_11_g158399 = Out_MultiMask4_g158400;
				float In_MultiMask3_g158401 = temp_output_301_11_g158399;
				float In_AlphaClip3_g158401 = Out_AlphaClip4_g158400;
				float In_AlphaFade3_g158401 = Out_AlphaFade4_g158400;
				float3 temp_cast_16 = (0.0).xxx;
				half3 Subsurface_Color264_g158399 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158399 );
				half Visual_Transmission138_g158399 = Out_Transmission4_g158400;
				half Subsurface_Value268_g158399 = _SubsurfaceIntensityValue;
				float lerpResult403_g158399 = lerp( 1.0 , TVE_GlowParams.w , ( _SubsurfaceGlobalValue * TVE_IsEnabled ));
				half Subsurface_GlobalMask369_g158399 = lerpResult403_g158399;
				half Visual_MultiMask292_g158399 = temp_output_301_11_g158399;
				float lerpResult293_g158399 = lerp( 1.0 , Visual_MultiMask292_g158399 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158399 = lerpResult293_g158399;
				half Custom_Mask363_g158399 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158399 = ( Visual_Transmission138_g158399 * Subsurface_Value268_g158399 * Subsurface_GlobalMask369_g158399 * Subsurface_MultiMask296_g158399 * Custom_Mask363_g158399 );
				#else
				float staticSwitch345_g158399 = 0.0;
				#endif
				half Final_Transmission269_g158399 = staticSwitch345_g158399;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158399 = ( Subsurface_Color264_g158399 * Final_Transmission269_g158399 * 10.0 );
				#else
				float3 staticSwitch348_g158399 = temp_cast_16;
				#endif
				half3 Final_Translucency254_g158399 = staticSwitch348_g158399;
				float3 In_Translucency3_g158401 = Final_Translucency254_g158399;
				float In_Transmission3_g158401 = Final_Transmission269_g158399;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158399 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158399 = 1.0;
				#endif
				half Final_Thickness275_g158399 = staticSwitch351_g158399;
				float In_Thickness3_g158401 = Final_Thickness275_g158399;
				float Final_Diffusion340_g158399 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158401 = Final_Diffusion340_g158399;
				float In_Depth3_g158401 = Out_Depth4_g158400;
				{
				Data3_g158401.Dummy = In_Dummy3_g158401;
				Data3_g158401.Albedo = In_Albedo3_g158401;
				Data3_g158401.AlbedoRaw = In_AlbedoRaw3_g158401;
				Data3_g158401.NormalTS = In_NormalTS3_g158401;
				Data3_g158401.NormalWS = In_NormalWS3_g158401;
				Data3_g158401.Shader = In_Shader3_g158401;
				Data3_g158401.Emissive= In_Emissive3_g158401;
				Data3_g158401.MultiMask = In_MultiMask3_g158401;
				Data3_g158401.Grayscale = In_Grayscale3_g158401;
				Data3_g158401.Luminosity = In_Luminosity3_g158401;
				Data3_g158401.AlphaClip = In_AlphaClip3_g158401;
				Data3_g158401.AlphaFade = In_AlphaFade3_g158401;
				Data3_g158401.Translucency = In_Translucency3_g158401;
				Data3_g158401.Transmission = In_Transmission3_g158401;
				Data3_g158401.Thickness = In_Thickness3_g158401;
				Data3_g158401.Diffusion = In_Diffusion3_g158401;
				Data3_g158401.Depth = In_Depth3_g158401;
				}
				TVEVisualData Data4_g158410 = Data3_g158401;
				float Out_Dummy4_g158410 = 0;
				float3 Out_Albedo4_g158410 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g158410 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158410 = float2( 0,0 );
				float3 Out_NormalWS4_g158410 = float3( 0,0,0 );
				float4 Out_Shader4_g158410 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158410 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158410 = 0;
				float Out_Grayscale4_g158410 = 0;
				float Out_Luminosity4_g158410 = 0;
				float Out_AlphaClip4_g158410 = 0;
				float Out_AlphaFade4_g158410 = 0;
				float3 Out_Translucency4_g158410 = float3( 0,0,0 );
				float Out_Transmission4_g158410 = 0;
				float Out_Thickness4_g158410 = 0;
				float Out_Diffusion4_g158410 = 0;
				float Out_Depth4_g158410 = 0;
				{
				Out_Dummy4_g158410 = Data4_g158410.Dummy;
				Out_Albedo4_g158410 = Data4_g158410.Albedo;
				Out_AlbedoRaw4_g158410 = Data4_g158410.AlbedoRaw;
				Out_NormalTS4_g158410 = Data4_g158410.NormalTS;
				Out_NormalWS4_g158410 = Data4_g158410.NormalWS;
				Out_Shader4_g158410 = Data4_g158410.Shader;
				Out_Emissive4_g158410= Data4_g158410.Emissive;
				Out_MultiMask4_g158410 = Data4_g158410.MultiMask;
				Out_Grayscale4_g158410 = Data4_g158410.Grayscale;
				Out_Luminosity4_g158410= Data4_g158410.Luminosity;
				Out_AlphaClip4_g158410 = Data4_g158410.AlphaClip;
				Out_AlphaFade4_g158410 = Data4_g158410.AlphaFade;
				Out_Translucency4_g158410 = Data4_g158410.Translucency;
				Out_Transmission4_g158410 = Data4_g158410.Transmission;
				Out_Thickness4_g158410 = Data4_g158410.Thickness;
				Out_Diffusion4_g158410 = Data4_g158410.Diffusion;
				Out_Depth4_g158410= Data4_g158410.Depth;
				}
				

				PickingSurfaceDescription surfaceDescription = (PickingSurfaceDescription)0;

				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					#if !defined( _DEPTHOFFSET_ON )
						posInput.deviceDepth = Out_Depth4_g158410;
					#else
						surfaceDescription.DepthOffset = 0;
					#endif
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = posInput.deviceDepth;
				#endif

				outColor = _SelectionID;
			}

            ENDHLSL
		}

        Pass
        {
            Name "FullScreenDebug"
            Tags
			{
				"LightMode" = "FullScreenDebug"
            }

            Cull [_CullMode]
			ZTest LEqual
			ZWrite Off

            HLSLPROGRAM
            /*ase_pragma_before*/
            #pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#define SHADERPASS SHADERPASS_FULL_SCREEN_DEBUG

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
		    #define OUTPUT_SPLIT_LIGHTING
		    #endif

            #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
            #undef  _REFRACTION_PLANE
            #undef  _REFRACTION_SPHERE
            #define _REFRACTION_THIN
            #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};

			struct VaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			struct VertexDescriptionInputs
			{
				 float3 ObjectSpaceNormal;
				 float3 ObjectSpaceTangent;
				 float3 ObjectSpacePosition;
			};

			struct SurfaceDescriptionInputs
			{
				 float3 TangentSpaceNormal;
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
			{
				PackedVaryingsMeshToPS output;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

			VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
			{
				VaryingsMeshToPS output;
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

            struct VertexDescription
			{
				float3 Position;
				float3 Normal;
				float3 Tangent;
			};

			VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
			{
				VertexDescription description = (VertexDescription)0;
				description.Position = IN.ObjectSpacePosition;
				description.Normal = IN.ObjectSpaceNormal;
				description.Tangent = IN.ObjectSpaceTangent;
				return description;
			}

            struct SurfaceDescription
			{
				float3 BaseColor;
				float3 Emission;
				float Alpha;
				float3 BentNormal;
				float Smoothness;
				float Occlusion;
				float3 NormalTS;
				float Metallic;
			};

			SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
			{
				SurfaceDescription surface = (SurfaceDescription)0;
				surface.BaseColor = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
				surface.Emission = float3(0, 0, 0);
				surface.Alpha = 1;
				surface.BentNormal = IN.TangentSpaceNormal;
				surface.Smoothness = 0.5;
				surface.Occlusion = 1;
				surface.NormalTS = IN.TangentSpaceNormal;
				surface.Metallic = 0;
				return surface;
			}

			VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
			{
				VertexDescriptionInputs output;
				ZERO_INITIALIZE(VertexDescriptionInputs, output);

				output.ObjectSpaceNormal = input.normalOS;
				output.ObjectSpaceTangent = input.tangentOS.xyz;
				output.ObjectSpacePosition = input.positionOS;

				return output;
			}

			AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters  )
			{
				VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);

				VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);

				input.positionOS = vertexDescription.Position;
				input.normalOS = vertexDescription.Normal;
				input.tangentOS.xyz = vertexDescription.Tangent;
				return input;
			}

			FragInputs BuildFragInputs(VaryingsMeshToPS input)
			{
				FragInputs output;
				ZERO_INITIALIZE(FragInputs, output);

				output.tangentToWorld = k_identity3x3;
				output.positionSS = input.positionCS; // input.positionCS is SV_Position

				return output;
			}

			FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
			{
				UNITY_SETUP_INSTANCE_ID(input);
				VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
				return BuildFragInputs(unpacked);
			}

			#define DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

			PackedVaryingsType Vert(AttributesMesh inputMesh)
			{
				VaryingsType varyingsType;
				varyingsType.vmesh = VertMesh(inputMesh);
				return PackVaryingsType(varyingsType);
			}

			#if !defined(_DEPTHOFFSET_ON)
			[earlydepthstencil]
			#endif
			void Frag(PackedVaryingsToPS packedInput)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				FragInputs input = UnpackVaryingsToFragInputs(packedInput);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

			#ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
				if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
				{
					IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
				}
			#endif
			}
            ENDHLSL
        }
		
	}
	
	CustomEditor "TheVisualEngineLite.MaterialGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19802
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;513;-6144,-128;Inherit;False;Impostor Pass Octahedron;72;;156549;47d9a0b51a8fa984f975828bdfee2fa3;0;0;7;FLOAT4;0;FLOAT4;23;FLOAT4;29;FLOAT3;25;FLOAT3;26;FLOAT3;27;FLOAT;65
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;529;-5760,-128;Inherit;False;Block Impostor Builder;110;;157220;f5a6295b5f4a3004ebbb03db403bc544;0;7;229;COLOR;0,0,0,0;False;285;COLOR;0,0,0,0;False;372;COLOR;0,0,0,0;False;224;FLOAT3;0,0,0;False;217;FLOAT3;0,0,0;False;360;FLOAT3;0,0,0;False;434;FLOAT;0;False;3;OBJECT;272;OBJECT;375;OBJECT;374
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;526;-5312,0;Half;False;Model Frag;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;530;-5312,-128;Half;False;Visual  Raw;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;532;-3456,-128;Inherit;False;530;Visual  Raw;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;546;-3456,0;Inherit;False;526;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;534;-5312,-64;Half;False;Model Vert;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;537;-4864,-128;Inherit;False;534;Model Vert;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;536;-3072,-128;Inherit;False;Block Lite Overlay;192;;158217;df6d6bbf01172a34387d93d862d3d156;8,813,0,821,0,819,0,929,0,923,1,826,1,823,1,828,1;3;572;OBJECT;0,0,0,0;False;596;OBJECT;0,0,0,0;False;600;OBJECT;0,0,0,0;False;1;OBJECT;566
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;541;-4608,-128;Inherit;False;Block Lite Impostor Motion;350;;158264;38077585734a3224db90527d4119d9c6;0;2;146;OBJECT;0,0,0,0;False;212;OBJECT;0,0,0,0;False;1;OBJECT;128
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;500;-1536,-128;Inherit;False;Block Lite Variation;123;;158285;3df1ad26aa7a397488e4d172ec7355ef;0;0;1;COLOR;116
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;499;-1536,256;Inherit;False;Block Lite Size Fade;338;;158286;828b7cb552f180f4193fb67dbaaae0ce;0;0;1;COLOR;128
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;501;-1536,-64;Inherit;False;Block Lite Tinting;135;;158287;c2bee839afbcbb7499ebde2af2a2b317;3,352,0,377,0,375,0;0;1;COLOR;204
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;502;-1536,0;Inherit;False;Block Lite Dryness;162;;158288;d0ad841a44e589843b633cc1b97af190;3,398,0,440,0,438,0;0;1;COLOR;346
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;503;-1536,128;Inherit;False;Block Lite Cutout;259;;158289;0780bee94024ab547ae8bb1fac250cb1;2,775,0,824,0;0;1;COLOR;566
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;509;-1536,192;Inherit;False;Block Lite Dithering;277;;158290;6e52cef07120daa408f9658182b29574;3,847,0,848,0,855,1;0;1;COLOR;566
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;508;-1536,64;Inherit;False;Block Lite Wetness;229;;158291;30361f2d9d7742e4db0b62746ed1affc;6,850,0,893,0,877,0,894,0,873,0,895,0;0;1;COLOR;566
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;539;-2688,-128;Inherit;False;Block Emissive;294;;158292;64497f287b9096b43b688b52b4a0bf20;6,282,0,273,0,319,1,312,0,264,0,267,0;3;146;OBJECT;0,0,0,0;False;148;OBJECT;0,0,0,0;False;178;OBJECT;0,0,0,0;False;1;OBJECT;183
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;528;-1536,384;Inherit;False;Block Lite Global;31;;158324;3cde0aa66f3d8ec4a9b80a215a26f02b;14,315,1,311,1,317,1,321,1,319,1,323,1,337,1,283,1,285,1,282,1,308,1,276,1,287,1,349,1;1;206;OBJECT;0,0,0,0;False;1;FLOAT;151
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;543;-4224,-128;Inherit;False;Block Transform;-1;;158389;5ac6202bdddd8b34a85c261af6b8de8b;0;1;146;OBJECT;0,0,0,0;False;1;OBJECT;128
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;504;-1152,-128;Inherit;False;8;8;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;542;-2304,-128;Inherit;False;Block Subsurface;318;;158399;d738d295ada6b1f409db6776b5efe789;5,315,0,413,1,411,0,359,1,362,0;4;146;OBJECT;0,0,0,0;False;385;OBJECT;0,0,0,0;False;371;OBJECT;0,0,0,0;False;361;FLOAT;1;False;1;OBJECT;183
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;544;-1984,-128;Half;False;Visual Data;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;545;-3904,-128;Half;False;Model Data;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;505;-960,-128;Half;False;Dummy Data;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;485;-256,-128;Inherit;False;544;Visual Data;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;484;-256,-64;Inherit;False;545;Model Data;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;507;-256,0;Inherit;False;505;Dummy Data;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;486;0,-128;Inherit;False;Block Render Impostor;0;;158407;1dac90ed7ee26b743a17d6c74e115d86;0;3;17;OBJECT;;False;19;OBJECT;;False;126;FLOAT;0;False;22;FLOAT3;21;FLOAT3;83;FLOAT3;34;FLOAT3;77;FLOAT;123;FLOAT;27;FLOAT;114;FLOAT;113;FLOAT;72;FLOAT;28;FLOAT;71;FLOAT3;65;FLOAT;66;FLOAT;67;FLOAT;68;FLOAT;73;FLOAT;127;FLOAT;128;FLOAT3;37;FLOAT3;30;FLOAT3;32;FLOAT4;33
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;493;-256,-640;Half;False;Property;_ImpostorCategory;[ Impostor Category ];71;0;Create;True;0;0;0;True;1;StyledCategory(Impostor Settings, true, 0, 10);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;490;1024,-640;Inherit;False;Base Compile;-1;;158421;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;487;352,-640;Half;False;Property;_IsImpostorShader;_IsImpostorShader;363;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;488;576,-640;Half;False;Property;_IsSubsurfaceShader;_IsSubsurfaceShader;364;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;494;800,-640;Half;False;Property;_IsLiteShader;_IsLiteShader;365;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;492;0,-640;Half;False;Property;_ImpostorEnd;[ Impostor End ];122;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;489;-256,-512;Half;False;Property;_render_coverage;_render_coverage;366;1;[Enum];Create;True;0;1;Off;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;547;768,-128;Float;False;True;-1;3;TheVisualEngineLite.MaterialGUI;0;15;BOXOPHOBIC/The Visual Engine/Impostors/Octahedron Subsurface Lit (Lite);28cd5599e02859647ae1798e4fcaef6c;True;GBuffer;0;0;GBuffer;35;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;True;True;True;True;0;True;_LightLayersMaskBuffer4;False;False;False;False;False;False;False;True;True;0;True;_StencilRefGBuffer;255;False;;255;True;_StencilWriteMaskGBuffer;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;False;True;0;True;_ZTestGBuffer;False;True;1;LightMode=GBuffer;False;False;0;;0;0;Standard;40;Surface Type;0;0;  Rendering Pass;1;0;  Refraction Model;0;0;    Blending Mode;0;0;    Blend Preserves Specular;1;0;  Back Then Front Rendering;0;0;  Transparent Depth Prepass;0;0;  Transparent Depth Postpass;0;0;  ZWrite;0;0;  Z Test;4;0;Double-Sided;0;0;Alpha Clipping;0;0;  Use Shadow Threshold;0;0;Material Type,InvertActionOnDeselection;5;638799651537088693;  Energy Conserving Specular;0;638799650981828389;  Transmission,InvertActionOnDeselection;0;0;Normal Space,InvertActionOnDeselection;2;638799651023715094;Receive Decals;0;638799651008380468;Receive SSR;0;638799651012975445;Receive SSR Transparent;0;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;Specular AA;0;0;Specular Occlusion Mode;1;638799653768284808;Override Baked GI;0;0;Write Depth;1;638799651073566326;  Depth Offset;0;0;  Conservative;0;0;GPU Instancing;1;0;LOD CrossFade;1;638799651088175945;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position;0;638799651099314810;0;11;True;True;True;True;True;True;False;False;False;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;548;768,-128;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;549;768,-128;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;550;768,-128;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;551;768,-128;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;552;768,-128;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;MotionVectors;0;5;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefMV;255;False;;255;True;_StencilWriteMaskMV;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;553;768,-128;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentBackface;0;6;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;True;3;1;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;False;False;True;0;True;_ZWrite;True;0;True;_ZTestTransparent;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;554;768,-128;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPrepass;0;7;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;555;768,-128;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPostpass;0;8;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;556;768,-128;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;9;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;True;3;1;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;True;_CullModeForward;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;True;True;0;True;_StencilRef;255;False;;255;True;_StencilWriteMask;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;0;True;_ZWrite;True;0;True;_ZTestDepthEqualForOpaque;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;557;768,-128;Float;False;False;-1;3;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ScenePickingPass;0;10;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
WireConnection;529;229;513;0
WireConnection;529;285;513;23
WireConnection;529;372;513;29
WireConnection;529;224;513;25
WireConnection;529;217;513;26
WireConnection;529;360;513;27
WireConnection;529;434;513;65
WireConnection;526;0;529;374
WireConnection;530;0;529;272
WireConnection;534;0;529;375
WireConnection;536;572;532;0
WireConnection;536;596;546;0
WireConnection;541;146;537;0
WireConnection;539;146;536;566
WireConnection;543;146;541;128
WireConnection;504;0;500;116
WireConnection;504;1;501;204
WireConnection;504;2;502;346
WireConnection;504;3;508;566
WireConnection;504;4;503;566
WireConnection;504;5;509;566
WireConnection;504;6;499;128
WireConnection;504;7;528;151
WireConnection;542;146;539;183
WireConnection;544;0;542;183
WireConnection;545;0;543;128
WireConnection;505;0;504;0
WireConnection;486;17;485;0
WireConnection;486;19;484;0
WireConnection;486;126;507;0
WireConnection;547;0;486;21
WireConnection;547;1;486;83
WireConnection;547;7;486;27
WireConnection;547;8;486;123
WireConnection;547;6;486;34
WireConnection;547;16;486;67
WireConnection;547;61;486;66
WireConnection;547;62;486;68
WireConnection;547;28;486;127
WireConnection;547;11;486;30
ASEEND*/
//CHKSM=2B6E0DC3BAE16CF2A440B6A3D17A225A99791AA4
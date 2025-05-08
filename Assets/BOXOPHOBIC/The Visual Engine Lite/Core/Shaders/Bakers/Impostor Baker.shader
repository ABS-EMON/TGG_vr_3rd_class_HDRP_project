// Made with Amplify Shader Editor v1.9.8.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/BOXOPHOBIC/The Visual Engine Lite/Helpers/Impostors Baker"
{
	Properties
	{
		[HideInInspector] _NoiseTex3D( "Noise Mask 3D", 3D ) = "white" {}
		[HideInInspector] _IsVersion( "_IsVersion", Float ) = 2070
		[HideInInspector] _render_normal( "_render_normal", Vector ) = ( 1, 1, 1, 0 )
		[StyledCategory(Overlay Settings, true, 0, 10)] _OverlayCategory( "[ Overlay Category ]", Float ) = 1
		[StyledMessage(Warning, The Overlay Glitter feature is only available with The Visual Engine Core package., 0, 10)] _OverlayLiteInfo( "# Overlay Lite Info", Float ) = 0
		_OverlayIntensityValue( "Overlay Intensity", Range( 0, 1 ) ) = 0
		[Enum(Off,0,Bake Settings To Textures,1)] _OverlayBakeMode( "Overlay Baking", Float ) = 0
		[Enum(Off,0,On,1)] _OverlayTextureMode( "Overlay Maps", Float ) = 0
		[Space(10)][StyledTextureSingleLine] _OverlayAlbedoTex( "Overlay Albedo", 2D ) = "white" {}
		[StyledTextureSingleLine] _OverlayNormalTex( "Overlay Normal", 2D ) = "bump" {}
		[Enum(Planar,0,Triplanar,1,Stochastic,2,Stochastic Triplanar,3)][Space(10)] _OverlaySampleMode( "Overlay Sampling", Float ) = 0
		[Enum(Tilling And Offset,0,Scale And Offset,1)] _OverlayCoordMode( "Overlay UV Mode", Float ) = 0
		[StyledVector(9)] _OverlayCoordValue( "Overlay UV Value", Vector ) = ( 1, 1, 0, 0 )
		[HDR] _OverlayColor( "Overlay Color", Color ) = ( 0.2815503, 0.4009458, 0.5377358, 1 )
		_OverlayNormalValue( "Overlay Normal", Range( -8, 8 ) ) = 1
		_OverlaySubsurfaceValue( "Overlay Subsurface", Range( 0, 1 ) ) = 0.5
		_OverlaySmoothnessValue( "Overlay Smoothness", Range( 0, 1 ) ) = 0.5
		[StyledColoring] _OverlayColoringOn( "# Overlay Coloring On", Color ) = ( 1, 1, 1, 0.6 )
		[Space(10)][StyledTextureSingleLine] _OverlayGlitterTexRT( "Overlay Glitter RT", 2D ) = "black" {}
		[Space(10)] _OverlayGlitterIntensityValue( "Overlay Glitter Intensity", Range( 0, 1 ) ) = 1
		[HDR] _OverlayGlitterColor( "Overlay Glitter Color", Color ) = ( 0.7215686, 1.913725, 2.996078, 1 )
		_OverlayGlitterTillingValue( "Overlay Glitter Tilling", Range( 0, 10 ) ) = 2
		_OverlayGlitterDistValue( "Overlay Glitter Limit", Range( 0, 200 ) ) = 100
		_OverlayGlitterAttenValue( "Overlay Glitter Atten Mask", Range( 0, 1 ) ) = 0
		[StyledColoring] _OverlayColoringOff( "# Overlay Coloring Off", Color ) = ( 1, 1, 1, 1 )
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
		[HideInInspector] _overlay_coord_value( "_overlay_coord_value", Vector ) = ( 1, 1, 0, 0 )
		[StyledSpace(10)] _OverlayEnd( "[ Overlay End ]", Float ) = 1
		[StyledCategory(Emissive Settings, true, 0, 10)] _EmissiveCategory( "[ Emissive Category ]", Float ) = 1
		_EmissiveIntensityValue( "Emissive Intensity", Range( 0, 1 ) ) = 0
		[Enum(None,0,Any,1,Baked,2,Realtime,3)] _EmissiveFlagMode( "Emissive GI Mode", Float ) = 0
		[Enum(Constant,0,Multiply With Base Albedo,1)] _EmissiveColorMode( "Emissive Color", Float ) = 0
		[HDR] _EmissiveColor( "Emissive Color", Color ) = ( 1, 1, 1, 1 )
		[Enum(Nits,0,EV100,1)] _EmissivePowerMode( "Emissive Value", Float ) = 0
		_EmissivePowerValue( "Emissive Value", Float ) = 1
		[Space(10)][StyledTextureSingleLine] _EmissiveMaskTex( "Emissive Mask", 2D ) = "white" {}
		[Enum(Main UV,0,Extra UV,1)][Space(10)] _EmissiveSampleMode( "Mask Sampling", Float ) = 0
		[Enum(Tilling And Offset,0,Scale And Offset,1)] _EmissiveCoordMode( "Mask UV Mode", Float ) = 0
		[StyledVector(18)] _EmissiveCoordValue( "Mask UV Value", Vector ) = ( 1, 1, 0, 0 )
		_EmissiveMaskValue( "Emissive TexR Mask", Range( 0, 1 ) ) = 1
		[StyledRemapSlider] _EmissiveMaskRemap( "Emissive TexR Mask", Vector ) = ( 0, 1, 0, 0 )
		_EmissiveMeshValue( "Emissive Mesh Mask", Range( 0, 1 ) ) = 0
		[Enum(Vertex R,0,Vertex G,1,Vertex B,2,Vertex A,3)] _EmissiveMeshMode( "Emissive Mesh Mask", Float ) = 0
		[StyledRemapSlider] _EmissiveMeshRemap( "Emissive Mesh Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledSpace(10)] _EmissiveEnd( "[ Emissive End ]", Float ) = 1
		[HideInInspector] _emissive_power_value( "_emissive_power_value", Float ) = 1
		[HideInInspector] _emissive_vert_mode( "_emissive_vert_mode", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _emissive_coord_value( "_emissive_coord_value", Vector ) = ( 1, 1, 0, 0 )
		[StyledCategory(Object Settings, true, 0, 10)] _ObjectCategory( "[ Object Category ]", Float ) = 1
		[StyledMessage(Info, Use the Object Height and Radius to remap the procedural height and spherical masks when used for motion., 0, 10)] _ObjectBoundsInfo( "# ObjectBoundsInfo", Float ) = 0
		[Enum(Legacy,0,Standard,1)] _ObjectModelMode( "Object Model Mode", Float ) = 1
		[Enum(Off,0,Baked,1,Procedural,2)] _ObjectPivotMode( "Object Pivots Mode", Float ) = 0
		[Enum(Vertex R,0,Vertex G,1,Vertex B,2,Vertex A,3)] _ObjectPhaseMode( "Object Phase Mask", Float ) = 0
		_ObjectHeightValue( "Object Height Value", Range( 0, 40 ) ) = 1
		_ObjectRadiusValue( "Object Radius Value", Range( 0, 40 ) ) = 1
		[HideInInspector] _object_phase_mode( "_object_phase_mode", Vector ) = ( 0, 0, 0, 0 )
		[StyledSpace(10)] _ObjectEnd( "[ Object End ]", Float ) = 1
		[StyledCategory(Main Settings, true, 0, 10)] _MainCategory( "[Main Category ]", Float ) = 1
		[StyledMessage(Info, Use the Multi Mask remap sliders to mask out the leaves when using Dual Colors or for Global Effects. The mask is stored in the Shader texture blue channel. , 0, 10)] _MainMultiMaskInfo( "# MainMultiMaskInfo", Float ) = 0
		[StyledTextureSingleLine] _MainAlbedoTex( "Main Albedo", 2D ) = "white" {}
		[StyledTextureSingleLine] _MainNormalTex( "Main Normal", 2D ) = "bump" {}
		[StyledTextureSingleLine] _MainShaderTex( "Main Shader", 2D ) = "white" {}
		[Enum(Main UV,0,Extra UV,1,Planar,2,Triplanar,3,Stochastic,4,Stochastic Triplanar,5)][Space(10)] _MainSampleMode( "Main Sampling", Float ) = 0
		[Enum(Tilling And Offset,0,Scale And Offset,1)] _MainCoordMode( "Main UV Mode", Float ) = 0
		[StyledVector(9)] _MainCoordValue( "Main UV Value", Vector ) = ( 1, 1, 0, 0 )
		[HideInInspector] _main_coord_value( "_main_coord_value", Vector ) = ( 1, 1, 0, 0 )
		[Enum(Constant,0,Dual Colors,1)] _MainColorMode( "Main Color", Float ) = 0
		[HDR] _MainColor( "Main Color", Color ) = ( 1, 1, 1, 1 )
		[HDR] _MainColorTwo( "Main ColorB", Color ) = ( 1, 1, 1, 1 )
		_MainAlphaClipValue( "Main Alpha", Range( 0, 1 ) ) = 0.5
		_MainAlbedoValue( "Main Albedo", Range( 0, 1 ) ) = 1
		_MainNormalValue( "Main Normal", Range( -8, 8 ) ) = 1
		_MainMetallicValue( "Main Metallic", Range( 0, 1 ) ) = 0
		_MainOcclusionValue( "Main Occlusion", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _MainOcclusionRemap( "Main Occlusion", Vector ) = ( 0, 1, 0, 0 )
		[StyledRemapSlider] _MainMultiRemap( "Main Multi Mask", Vector ) = ( 0, 0, 0, 0 )
		_MainSmoothnessValue( "Main Smoothness", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _MainSmoothnessRemap( "Main Smoothness", Vector ) = ( 0, 1, 0, 0 )
		[StyledSpace(10)] _MainEnd( "[Main End ]", Float ) = 1
		[StyledCategory(Layer Settings, true, 0, 10)] _LayerCategory( "[ Layer Category ]", Float ) = 1
		_SecondIntensityValue( "Layer Intensity", Range( 0, 1 ) ) = 0
		[Enum(Off,0,Bake Settings To Textures,1)] _SecondBakeMode( "Layer Baking", Float ) = 1
		[Space(10)][StyledTextureSingleLine] _SecondAlbedoTex( "Layer Albedo", 2D ) = "white" {}
		[StyledTextureSingleLine] _SecondNormalTex( "Layer Normal", 2D ) = "bump" {}
		[StyledTextureSingleLine] _SecondShaderTex( "Layer Shader", 2D ) = "white" {}
		[Enum(Main UV,0,Extra UV,1,Planar,2,Triplanar,3,Stochastic,4,Stochastic Triplanar,5)][Space(10)] _SecondSampleMode( "Layer Sampling", Float ) = 0
		[Enum(Tilling And Offset,0,Scale And Offset,1)] _SecondCoordMode( "Layer UV Mode", Float ) = 0
		[StyledVector(9)] _SecondCoordValue( "Layer UV Value", Vector ) = ( 1, 1, 0, 0 )
		[Enum(Constant,0,Dual Colors,1)] _SecondColorMode( "Layer Color", Float ) = 0
		[HDR] _SecondColor( "Layer Color", Color ) = ( 1, 1, 1, 1 )
		[HDR] _SecondColorTwo( "Layer ColorB", Color ) = ( 1, 1, 1, 1 )
		_SecondAlphaClipValue( "Layer Alpha", Range( 0, 1 ) ) = 0.5
		_SecondAlbedoValue( "Layer Albedo", Range( 0, 1 ) ) = 1
		_SecondNormalValue( "Layer Normal", Range( -8, 8 ) ) = 1
		_SecondMetallicValue( "Layer Metallic", Range( 0, 1 ) ) = 0
		_SecondOcclusionValue( "Layer Occlusion", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _SecondOcclusionRemap( "Layer Occlusion", Vector ) = ( 0, 1, 0, 0 )
		[StyledRemapSlider] _SecondMultiRemap( "Layer Multi Mask", Vector ) = ( 0, 0, 0, 0 )
		_SecondSmoothnessValue( "Layer Smoothness", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _SecondSmoothnessRemap( "Layer Smoothness", Vector ) = ( 0, 1, 0, 0 )
		[Space(10)] _SecondBlendIntensityValue( "Layer Blend Intensity", Range( 0, 1 ) ) = 1
		_SecondBlendAlbedoValue( "Layer Blend Albedos", Range( 0, 1 ) ) = 0
		_SecondBlendNormalValue( "Layer Blend Normals", Range( 0, 1 ) ) = 0
		_SecondBlendShaderValue( "Layer Blend Shaders", Range( 0, 1 ) ) = 0
		[Space(10)][StyledTextureSingleLine] _SecondMaskTex( "Layer Mask", 2D ) = "white" {}
		[Enum(Main UV,0,Extra UV,1,Planar,2,Triplanar,3)][Space(10)] _SecondMaskSampleMode( "Mask Sampling", Float ) = 0
		[Enum(Tilling And Offset,0,Scale And Offset,1)] _SecondMaskCoordMode( "Mask UV Mode", Float ) = 0
		[StyledVector(9)] _SecondMaskCoordValue( "Mask UV Value", Vector ) = ( 1, 1, 0, 0 )
		_SecondMaskValue( "Layer TexB Mask", Range( 0, 1 ) ) = 1
		[StyledRemapSlider] _SecondMaskRemap( "Layer TexB Mask", Vector ) = ( 0, 1, 0, 0 )
		_SecondLumaValue( "Layer Luma Mask", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _SecondLumaRemap( "Layer Luma Mask", Vector ) = ( 0, 1, 0, 0 )
		_SecondProjValue( "Layer ProjY Mask", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _SecondProjRemap( "Layer ProjY Mask", Vector ) = ( 0, 1, 0, 0 )
		_SecondMeshValue( "Layer Mesh Mask", Range( 0, 1 ) ) = 0
		[Enum(Vertex R,0,Vertex G,1,Vertex B,2,Vertex A,3)] _SecondMeshMode( "Layer Mesh Mask", Float ) = 2
		[StyledRemapSlider] _SecondMeshRemap( "Layer Mesh Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledRemapSlider] _SecondBlendRemap( "Layer Blend Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledSpace(10)] _LayerEnd( "[ Layer End ]", Float ) = 1
		[HideInInspector] _second_coord_value( "_second_coord_value", Vector ) = ( 1, 1, 0, 0 )
		[HideInInspector] _second_vert_mode( "_second_vert_mode", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _second_mask_coord_value( "_second_mask_coord_value", Vector ) = ( 1, 1, 0, 0 )
		[StyledCategory(Detail Settings, true, 0, 10)] _DetailCategory( "[ Detail Category ]", Float ) = 1
		_ThirdIntensityValue( "Detail Intensity", Range( 0, 1 ) ) = 0
		[Enum(Off,0,Bake Settings To Textures,1)] _ThirdBakeMode( "Detail Baking", Float ) = 1
		[Space(10)][StyledTextureSingleLine] _ThirdAlbedoTex( "Detail Albedo", 2D ) = "white" {}
		[StyledTextureSingleLine] _ThirdNormalTex( "Detail Normal", 2D ) = "bump" {}
		[StyledTextureSingleLine] _ThirdShaderTex( "Detail Shader", 2D ) = "white" {}
		[Enum(Main UV,0,Extra UV,1,Planar,2,Triplanar,3,Stochastic,4,Stochastic Triplanar,5)][Space(10)] _ThirdSampleMode( "Detail Sampling", Float ) = 0
		[Enum(Tilling And Offset,0,Scale And Offset,1)] _ThirdCoordMode( "Detail UV Mode", Float ) = 0
		[StyledVector(9)] _ThirdCoordValue( "Detail UV Value", Vector ) = ( 1, 1, 0, 0 )
		[Enum(Constant,0,Dual Colors,1)] _ThirdColorMode( "Detail Color", Float ) = 0
		[HDR] _ThirdColor( "Detail Color", Color ) = ( 1, 1, 1, 1 )
		[HDR] _ThirdColorTwo( "Detail ColorB", Color ) = ( 1, 1, 1, 1 )
		_ThirdAlphaClipValue( "Detail Alpha", Range( 0, 1 ) ) = 0.5
		_ThirdAlbedoValue( "Detail Albedo", Range( 0, 1 ) ) = 1
		_ThirdNormalValue( "Detail Normal", Range( -8, 8 ) ) = 1
		_ThirdMetallicValue( "Detail Metallic", Range( 0, 1 ) ) = 0
		_ThirdOcclusionValue( "Detail Occlusion", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _ThirdOcclusionRemap( "Detail Occlusion", Vector ) = ( 0, 1, 0, 0 )
		[StyledRemapSlider] _ThirdMultiRemap( "Detail Multi Mask", Vector ) = ( 0, 0, 0, 0 )
		_ThirdSmoothnessValue( "Detail Smoothness", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _ThirdSmoothnessRemap( "Detail Smoothness", Vector ) = ( 0, 1, 0, 0 )
		[Space(10)] _ThirdBlendIntensityValue( "Detail Blend Intensity", Range( 0, 1 ) ) = 1
		_ThirdBlendAlbedoValue( "Detail Blend Albedos", Range( 0, 1 ) ) = 0
		_ThirdBlendNormalValue( "Detail Blend Normals", Range( 0, 1 ) ) = 0
		_ThirdBlendShaderValue( "Detail Blend Shaders", Range( 0, 1 ) ) = 0
		[Space(10)][StyledTextureSingleLine] _ThirdMaskTex( "Detail Mask", 2D ) = "white" {}
		[Enum(Main UV,0,Extra UV,1,Planar,2,Triplanar,3)][Space(10)] _ThirdMaskSampleMode( "Mask Sampling", Float ) = 0
		[Enum(Tilling And Offset,0,Scale And Offset,1)] _ThirdMaskCoordMode( "Mask UV Mode", Float ) = 0
		[StyledVector(9)] _ThirdMaskCoordValue( "Mask UV Value", Vector ) = ( 1, 1, 0, 0 )
		_ThirdMaskValue( "Detail TexG Mask", Range( 0, 1 ) ) = 1
		[StyledRemapSlider] _ThirdMaskRemap( "Detail TexG Mask", Vector ) = ( 0, 1, 0, 0 )
		_ThirdLumaValue( "Detail Luma Mask", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _ThirdLumaRemap( "Detail Luma Mask", Vector ) = ( 0, 1, 0, 0 )
		_ThirdProjValue( "Detail ProjY Mask", Range( 0, 1 ) ) = 0
		[StyledRemapSlider] _ThirdProjRemap( "Detail ProjY Mask", Vector ) = ( 0, 1, 0, 0 )
		_ThirdMeshValue( "Detail Mesh Mask", Range( 0, 1 ) ) = 0
		[Enum(Vertex R,0,Vertex G,1,Vertex B,2,Vertex A,3)] _ThirdMeshMode( "Detail Mesh Mask", Float ) = 1
		[StyledRemapSlider] _ThirdMeshRemap( "Detail Mesh Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledRemapSlider] _ThirdBlendRemap( "Detail Blend Mask", Vector ) = ( 0, 1, 0, 0 )
		[HideInInspector] _third_coord_value( "_third_coord_value", Vector ) = ( 1, 1, 0, 0 )
		[HideInInspector] _third_vert_mode( "_third_vert_mode", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _third_mask_coord_value( "_third_mask_coord_value", Vector ) = ( 1, 1, 0, 0 )
		[StyledSpace(10)] _DetailEnd( "[ Detail End ]", Float ) = 1
		[StyledCategory(Occlusion Settings, true, 0, 10)] _OcclusionCategory( "[ Occlusion Category ]", Float ) = 1
		_OcclusionIntensityValue( "Occlusion Intensity", Range( 0, 1 ) ) = 0
		[Enum(Off,0,Bake Settings To Textures,1)] _OcclusionBakeMode( "Occlusion Baking", Float ) = 1
		[HDR] _OcclusionColorOne( "Occlusion ColorA", Color ) = ( 1, 1, 1, 1 )
		[HDR] _OcclusionColorTwo( "Occlusion ColorB", Color ) = ( 0.25, 0.25, 0.25, 1 )
		[Enum(Vertex R,0,Vertex G,1,Vertex B,2,Vertex A,3)][Space(10)] _OcclusionMeshMode( "Occlusion Mesh Mask", Float ) = 1
		[StyledRemapSlider] _OcclusionMeshRemap( "Occlusion Mesh Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledSpace(10)] _OcclusionEnd( "[ Occlusion End ]", Float ) = 1
		[HideInInspector] _occlusion_vert_mode( "_occlusion_vert_mode", Vector ) = ( 0, 0, 0, 0 )
		[StyledCategory(Gradient Settings, true, 0, 10)] _GradientCategory( "[ Gradient Category ]", Float ) = 1
		_GradientIntensityValue( "Gradient Intensity", Range( 0, 1 ) ) = 0
		[Enum(Off,0,Bake Settings To Textures,1)] _GradientBakeMode( "Gradient Baking", Float ) = 1
		[HDR] _GradientColorOne( "Gradient ColorA", Color ) = ( 1, 0.6135602, 0, 1 )
		[HDR] _GradientColorTwo( "Gradient ColorB", Color ) = ( 0.754717, 0.0389044, 0.03203986, 1 )
		[Space(10)] _GradientMultiValue( "Gradient Multi Mask", Range( 0, 1 ) ) = 1
		[Enum(Vertex R,0,Vertex G,1,Vertex B,2,Vertex A,3)] _GradientMeshMode( "Gradient Mesh Mask", Float ) = 3
		[StyledRemapSlider] _GradientMeshRemap( "Gradient Mesh Mask", Vector ) = ( 0, 1, 0, 0 )
		[StyledSpace(10)] _GradientEnd( "[ Gradient End ]", Float ) = 1
		[HideInInspector] _gradient_vert_mode( "_gradient_vert_mode", Vector ) = ( 0, 0, 0, 0 )
		_SecondBakeMode( "_SecondBakeMode", Float ) = 0
		_ThirdBakeMode( "_ThirdBakeMode", Float ) = 0
		_OcclusionBakeMode( "_OcclusionBakeMode", Float ) = 0
		_GradientBakeMode( "_GradientBakeMode", Float ) = 0
		_OverlayBakeMode( "_OverlayBakeMode", Float ) = 0
		[HideInInspector] _RenderCull( "_RenderCull", Float ) = 0
		[HideInInspector] _RenderNormal( "_RenderNormal", Float ) = 0
		_NormalBakeMode( "_NormalBakeMode", Float ) = 0
		[StyledCategory(Normal Settings, true, 0, 10)] _NormalCategory( "[ Normal Category ]", Float ) = 1
		_NormalFlattenValue( "Normal Flattening", Range( 0, 1 ) ) = 0
		_NormalSphereValue( "Normal Spherical", Range( 0, 1 ) ) = 0
		[StyledVector(18)] _NormalSphereOffsetValue( "Normal Spherical Offset", Vector ) = ( 0, 0, 0, 0 )
		[Enum(Off,0,Bake Settings To Textures,1)] _NormalBakeMode( "Normal Baking", Float ) = 1
		[StyledSpace(10)] _NormalSpace( "[ Normal Space ]", Float ) = 1
		_NormalMeshValue( "Normal Mesh Mask", Range( 0, 1 ) ) = 0
		[Enum(Vertex R,0,Vertex G,1,Vertex B,2,Vertex A,3)] _NormalMeshMode( "Normal Mesh Mask", Float ) = 2
		[StyledRemapSlider] _NormalMeshRemap( "Normal Mesh Mask", Vector ) = ( 0, 1, 0, 0 )
		[HideInInspector] _normal_vert_mode( "_normal_vert_mode", Vector ) = ( 0, 0, 0, 0 )
		[StyledSpace(10)] _NormalEnd( "[ Normal End ]", Float ) = 1

	}

	SubShader
	{
		Tags { "RenderType"="Opaque" }
	LOD 100
		CGINCLUDE
		#pragma target 4.5
		ENDCG
		Cull [_RenderCull]
		

		Pass
		{
			Name "Unlit"
			CGPROGRAM
			#define ASE_VERSION 19802
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			#pragma multi_compile_fwdbase
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES3
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_MAIN_SAMPLE_MAIN_UV TVE_MAIN_SAMPLE_EXTRA_UV TVE_MAIN_SAMPLE_PLANAR_2D TVE_MAIN_SAMPLE_PLANAR_3D TVE_MAIN_SAMPLE_STOCHASTIC_2D TVE_MAIN_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_vertex TVE_PIVOT_OFF TVE_PIVOT_BAKED TVE_PIVOT_PROC
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local_fragment TVE_SECOND
			#pragma shader_feature_local_fragment TVE_SECOND_SAMPLE_MAIN_UV TVE_SECOND_SAMPLE_EXTRA_UV TVE_SECOND_SAMPLE_PLANAR_2D TVE_SECOND_SAMPLE_PLANAR_3D TVE_SECOND_SAMPLE_STOCHASTIC_2D TVE_SECOND_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_fragment TVE_SECOND_MASK_SAMPLE_MAIN_UV TVE_SECOND_MASK_SAMPLE_EXTRA_UV TVE_SECOND_MASK_SAMPLE_PLANAR_2D TVE_SECOND_MASK_SAMPLE_PLANAR_3D
			#pragma shader_feature_local_fragment TVE_THIRD
			#pragma shader_feature_local_fragment TVE_THIRD_SAMPLE_MAIN_UV TVE_THIRD_SAMPLE_EXTRA_UV TVE_THIRD_SAMPLE_PLANAR_2D TVE_THIRD_SAMPLE_PLANAR_3D TVE_THIRD_SAMPLE_STOCHASTIC_2D TVE_THIRD_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_fragment TVE_THIRD_MASK_SAMPLE_MAIN_UV TVE_THIRD_MASK_SAMPLE_EXTRA_UV TVE_THIRD_MASK_SAMPLE_PLANAR_2D TVE_THIRD_MASK_SAMPLE_PLANAR_3D
			#pragma shader_feature_local_fragment TVE_OCCLUSION
			#pragma shader_feature_local_fragment TVE_GRADIENT
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_OVERLAY_TEX
			#pragma shader_feature_local_fragment TVE_OVERLAY_SAMPLE_PLANAR_2D TVE_OVERLAY_SAMPLE_PLANAR_3D TVE_OVERLAY_SAMPLE_STOCHASTIC_2D TVE_OVERLAY_SAMPLE_STOCHASTIC_3D
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_EMISSIVE_SAMPLE_MAIN_UV TVE_EMISSIVE_SAMPLE_EXTRA_UV
			#pragma shader_feature_local_vertex TVE_NORMAL
			  
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
			#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
			#else//ASE Sampling Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
			#endif//ASE Sampling Macros
			


			struct appdata
			{
				float4 vertex : POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
			};

			struct v2f
			{
				UNITY_POSITION(pos);
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
			};

			uniform half _RenderCull;
			uniform half _RenderNormal;
			uniform half _IsVersion;
			UNITY_DECLARE_TEX3D_NOSAMPLER(_NoiseTex3D);
			SamplerState sampler_NoiseTex3D;
			uniform half _EmissiveCategory;
			uniform half _EmissiveEnd;
			uniform half _EmissivePowerMode;
			uniform half _EmissivePowerValue;
			uniform half _EmissiveFlagMode;
			uniform half _MainCategory;
			uniform half _MainEnd;
			uniform half _MainSampleMode;
			uniform half _MainCoordMode;
			uniform half4 _MainCoordValue;
			uniform half _MainMultiMaskInfo;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
			SamplerState sampler_Linear_Repeat;
			SamplerState sampler_Linear_Repeat_Aniso8;
			SamplerState sampler_Point_Repeat;
			uniform half4 _main_coord_value;
			uniform float3 TVE_WorldOrigin;
			uniform half _MainAlbedoValue;
			uniform half4 _MainColorTwo;
			uniform half4 _MainColor;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainShaderTex);
			uniform half _MainMetallicValue;
			uniform half4 _MainOcclusionRemap;
			uniform half _MainOcclusionValue;
			uniform half4 _MainSmoothnessRemap;
			uniform half _MainSmoothnessValue;
			uniform half4 _MainMultiRemap;
			uniform half _MainColorMode;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
			uniform half _MainNormalValue;
			uniform half _MainAlphaClipValue;
			uniform half _LayerCategory;
			uniform half _LayerEnd;
			uniform half _SecondSampleMode;
			uniform half _SecondCoordMode;
			uniform half4 _SecondCoordValue;
			uniform half _SecondMaskSampleMode;
			uniform half _SecondMaskCoordMode;
			uniform half4 _SecondMaskCoordValue;
			uniform half _SecondBakeMode;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
			uniform half4 _second_coord_value;
			uniform half _SecondAlbedoValue;
			uniform half4 _SecondColorTwo;
			uniform half4 _SecondColor;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondShaderTex);
			uniform half _SecondMetallicValue;
			uniform half4 _SecondOcclusionRemap;
			uniform half _SecondOcclusionValue;
			uniform half4 _SecondSmoothnessRemap;
			uniform half _SecondSmoothnessValue;
			uniform half4 _SecondMultiRemap;
			uniform half _SecondColorMode;
			uniform half _SecondBlendAlbedoValue;
			uniform half _SecondIntensityValue;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
			uniform half4 _second_mask_coord_value;
			uniform half4 _SecondMaskRemap;
			uniform half _SecondMaskValue;
			uniform half4 _SecondLumaRemap;
			uniform half _SecondLumaValue;
			uniform half4 _SecondProjRemap;
			uniform half _SecondProjValue;
			uniform half4 _second_vert_mode;
			uniform half4 _SecondMeshRemap;
			uniform half _SecondMeshValue;
			uniform half _SecondMeshMode;
			uniform half4 _SecondBlendRemap;
			uniform half _SecondBlendIntensityValue;
			uniform half _SecondBlendNormalValue;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
			uniform half _SecondNormalValue;
			uniform half _SecondBlendShaderValue;
			uniform half _SecondAlphaClipValue;
			uniform half _DetailCategory;
			uniform half _DetailEnd;
			uniform half _ThirdSampleMode;
			uniform half _ThirdCoordMode;
			uniform half4 _ThirdCoordValue;
			uniform half _ThirdMaskSampleMode;
			uniform half _ThirdMaskCoordMode;
			uniform half4 _ThirdMaskCoordValue;
			uniform half _ThirdBakeMode;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ThirdAlbedoTex);
			uniform half4 _third_coord_value;
			uniform half _ThirdAlbedoValue;
			uniform half4 _ThirdColorTwo;
			uniform half4 _ThirdColor;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ThirdShaderTex);
			uniform half _ThirdMetallicValue;
			uniform half4 _ThirdOcclusionRemap;
			uniform half _ThirdOcclusionValue;
			uniform half4 _ThirdSmoothnessRemap;
			uniform half _ThirdSmoothnessValue;
			uniform half4 _ThirdMultiRemap;
			uniform half _ThirdColorMode;
			uniform half _ThirdBlendAlbedoValue;
			uniform half _ThirdIntensityValue;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ThirdMaskTex);
			uniform half4 _third_mask_coord_value;
			uniform half4 _ThirdMaskRemap;
			uniform half _ThirdMaskValue;
			uniform half4 _ThirdLumaRemap;
			uniform half _ThirdLumaValue;
			uniform half4 _third_vert_mode;
			uniform half4 _ThirdMeshRemap;
			uniform half _ThirdMeshValue;
			uniform half _ThirdMeshMode;
			uniform half4 _ThirdProjRemap;
			uniform half _ThirdProjValue;
			uniform half4 _ThirdBlendRemap;
			uniform half _ThirdBlendIntensityValue;
			uniform half _ThirdBlendNormalValue;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ThirdNormalTex);
			uniform half _ThirdNormalValue;
			uniform half _ThirdBlendShaderValue;
			uniform half _ThirdAlphaClipValue;
			uniform half _OcclusionCategory;
			uniform half _OcclusionEnd;
			uniform half _OcclusionBakeMode;
			uniform half4 _OcclusionColorTwo;
			uniform half4 _OcclusionColorOne;
			uniform half4 _occlusion_vert_mode;
			uniform half4 _OcclusionMeshRemap;
			uniform half _OcclusionMeshMode;
			uniform half _OcclusionIntensityValue;
			uniform half _GradientCategory;
			uniform half _GradientEnd;
			uniform half _GradientBakeMode;
			uniform half4 _GradientColorTwo;
			uniform half4 _GradientColorOne;
			uniform half4 _gradient_vert_mode;
			uniform half4 _GradientMeshRemap;
			uniform half _GradientMeshMode;
			uniform half _GradientIntensityValue;
			uniform half _GradientMultiValue;
			uniform half _OverlayCategory;
			uniform half _OverlayEnd;
			uniform half _OverlayBakeMode;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_OverlayGlitterTexRT);
			SamplerState sampler_OverlayGlitterTexRT;
			uniform half _OverlayGlitterTillingValue;
			uniform half _OverlayGlitterIntensityValue;
			uniform half4 _OverlayGlitterColor;
			uniform half _OverlayGlitterDistValue;
			uniform half _OverlayGlitterAttenValue;
			uniform half _OverlayLiteInfo;
			uniform half4 _OverlayColoringOn;
			uniform half4 _OverlayColoringOff;
			uniform half4 _OverlayColor;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_OverlayAlbedoTex);
			uniform half4 _overlay_coord_value;
			uniform half _OverlaySampleMode;
			uniform half _OverlayCoordMode;
			uniform half4 _OverlayCoordValue;
			uniform half _OverlayTextureMode;
			uniform half _OverlayIntensityValue;
			uniform half4 _OverlayProjRemap;
			uniform half _OverlayProjValue;
			uniform half4 _OverlayLumaRemap;
			uniform half _OverlayLumaValue;
			uniform half4 _overlay_vert_mode;
			uniform half4 _OverlayMeshRemap;
			uniform half _OverlayMeshValue;
			uniform half _OverlayMeshMode;
			uniform half4 TVE_AtmoParams;
			uniform half TVE_IsEnabled;
			uniform half _OverlayGlobalValue;
			uniform half4 _OverlayBlendRemap;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_OverlayNormalTex);
			uniform half _OverlayNormalValue;
			uniform half _OverlaySmoothnessValue;
			uniform half _OverlaySubsurfaceValue;
			uniform half4 _emissive_vert_mode;
			uniform half4 _EmissiveMeshRemap;
			uniform half _EmissiveMeshValue;
			uniform half _EmissiveMeshMode;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveMaskTex);
			uniform half4 _emissive_coord_value;
			uniform half _EmissiveSampleMode;
			uniform half _EmissiveCoordMode;
			uniform half4 _EmissiveCoordValue;
			uniform half4 _EmissiveMaskRemap;
			uniform half _EmissiveMaskValue;
			uniform half _EmissiveIntensityValue;
			uniform half4 _EmissiveColor;
			uniform half _EmissiveColorMode;
			uniform float _emissive_power_value;
			uniform half3 _render_normal;
			uniform half _ObjectCategory;
			uniform half _ObjectEnd;
			uniform half _ObjectModelMode;
			uniform half _ObjectPivotMode;
			uniform half _ObjectPhaseMode;
			uniform half _ObjectBoundsInfo;
			uniform half4 TVE_TimeParams;
			uniform half4 _object_phase_mode;
			uniform half _ObjectHeightValue;
			uniform half _ObjectRadiusValue;
			uniform half _NormalCategory;
			uniform half _NormalEnd;
			uniform half _NormalSpace;
			uniform half _NormalBakeMode;
			uniform half _NormalFlattenValue;
			uniform half3 _NormalSphereOffsetValue;
			uniform half _NormalSphereValue;
			uniform half4 _normal_vert_mode;
			uniform half4 _NormalMeshRemap;
			uniform half _NormalMeshValue;
			uniform half _NormalMeshMode;
			void ComputeWorldCoords( half4 Coords, half3 WorldPosition, out half2 ZX, out half2 ZY, out half2 XY )
			{
				ZX = WorldPosition.xz * Coords.xx - Coords.zz;
				ZY = WorldPosition.yz * Coords.yx - Coords.wz; 
				XY = WorldPosition.xy * Coords.xy - Coords.zw;
			}
			
			half4 SampleMain( UNITY_DECLARE_TEX2D_NOSAMPLER(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			half4 SampleExtra( UNITY_DECLARE_TEX2D_NOSAMPLER(Texture), SamplerState Sampler, half4 Coords, half2 TexCoord )
			{
				half2 UV = TexCoord * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			half4 SamplePlanar2D( UNITY_DECLARE_TEX2D_NOSAMPLER(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half4 tex = SAMPLE_TEXTURE2D( Texture, Sampler, UV);
				return tex;
			}
			
			void ComputeTriplanarWeights( half3 WorldNormal, out half T1, out half T2, out half T3 )
			{
				half3 powNormal = abs( WorldNormal.xyz );
				half3 weights = max( powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal * powNormal, 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				T1 = weights.y;
				T2 = weights.x;
				T3 = weights.z;
			}
			
			half4 SamplePlanar3D( UNITY_DECLARE_TEX2D_NOSAMPLER(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				half4 tex1 = SAMPLE_TEXTURE2D( Texture, Sampler, ZX);
				half4 tex2 = SAMPLE_TEXTURE2D( Texture, Sampler, ZY);
				half4 tex3 = SAMPLE_TEXTURE2D( Texture, Sampler, XY);
				return tex1 * T1 + tex2 * T2 + tex3 * T3;
			}
			
			void ComputeStochasticCoords( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				half2 vertex1, vertex2, vertex3;
				// Scaling of the input
				half2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				half2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				half3 temp = half3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			float4 SampleStochastic2D( UNITY_DECLARE_TEX2D_NOSAMPLER(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition )
			{
				half2 UV = WorldPosition.xz * Coords.xy + Coords.zw;
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				ComputeStochasticCoords(UV, UV1, UV2, UV3, W1, W2, W3 );
				half4 tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(UV), ddy(UV));
				half4 tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(UV), ddy(UV));
				half4 tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(UV), ddy(UV));
				return tex1 * W1 + tex2 * W2 + tex3 * W3;
			}
			
			half4 SampleStochastic3D( UNITY_DECLARE_TEX2D_NOSAMPLER(Texture), SamplerState Sampler, half4 Coords, float3 WorldPosition, half3 WorldNormal )
			{
				half2 ZX, ZY, XY;
				ComputeWorldCoords(Coords, WorldPosition, ZX, ZY, XY);
				half2 UV1, UV2, UV3;
				half W1, W2, W3;
				half4 tex1, tex2, tex3;
				ComputeStochasticCoords(ZX, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZX), ddy(ZX));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZX), ddy(ZX));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZX), ddy(ZX));
				half4 texZX = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(ZY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(ZY), ddy(ZY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(ZY), ddy(ZY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(ZY), ddy(ZY));
				half4 texZY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				ComputeStochasticCoords(XY, UV1, UV2, UV3, W1, W2, W3 );
				tex1 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV1, ddx(XY), ddy(XY));
				tex2 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV2, ddx(XY), ddy(XY));
				tex3 = SAMPLE_TEXTURE2D_GRAD( Texture, Sampler, UV3, ddx(XY), ddy(XY));
				half4 texXY = tex1 * W1 + tex2 * W2 + tex3 * W3;
				half T1, T2, T3;
				ComputeTriplanarWeights(WorldNormal, T1, T2, T3);
				return texZX * T1 + texZY * T2 + texXY * T3;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			


			v2f vert(appdata v )
			{
				v2f o = (v2f)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				float3 ase_positionWS = mul( unity_ObjectToWorld, float4( ( v.vertex ).xyz, 1 ) ).xyz;
				float3 vertexToFrag73_g76826 = ase_positionWS;
				o.ase_texcoord1.xyz = vertexToFrag73_g76826;
				float4x4 break19_g128370 = unity_ObjectToWorld;
				float3 appendResult20_g128370 = (float3(break19_g128370[ 0 ][ 3 ] , break19_g128370[ 1 ][ 3 ] , break19_g128370[ 2 ][ 3 ]));
				float3 temp_output_340_7_g76826 = appendResult20_g128370;
				float4x4 break19_g128372 = unity_ObjectToWorld;
				float3 appendResult20_g128372 = (float3(break19_g128372[ 0 ][ 3 ] , break19_g128372[ 1 ][ 3 ] , break19_g128372[ 2 ][ 3 ]));
				float3 _Vector0 = float3(0,0,0);
				float3 appendResult60_g128353 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 PositionOS131_g76826 = v.vertex.xyz;
				float3 break233_g76826 = PositionOS131_g76826;
				float3 appendResult234_g76826 = (float3(break233_g76826.x , 0.0 , break233_g76826.z));
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch229_g76826 = _Vector0;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch229_g76826 = appendResult60_g128353;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch229_g76826 = appendResult234_g76826;
				#else
				float3 staticSwitch229_g76826 = _Vector0;
				#endif
				half3 PivotOS149_g76826 = staticSwitch229_g76826;
				float3 temp_output_122_0_g128372 = PivotOS149_g76826;
				float3 PivotsOnlyWS105_g128372 = mul( unity_ObjectToWorld, float4( temp_output_122_0_g128372 , 0.0 ) ).xyz;
				float3 temp_output_341_7_g76826 = ( appendResult20_g128372 + PivotsOnlyWS105_g128372 );
				#if defined( TVE_PIVOT_OFF )
				float3 staticSwitch236_g76826 = temp_output_340_7_g76826;
				#elif defined( TVE_PIVOT_BAKED )
				float3 staticSwitch236_g76826 = temp_output_341_7_g76826;
				#elif defined( TVE_PIVOT_PROC )
				float3 staticSwitch236_g76826 = temp_output_341_7_g76826;
				#else
				float3 staticSwitch236_g76826 = temp_output_340_7_g76826;
				#endif
				float3 vertexToFrag76_g76826 = staticSwitch236_g76826;
				o.ase_texcoord2.xyz = vertexToFrag76_g76826;
				float3 ase_normalWS = UnityObjectToWorldNormal( v.ase_normal );
				o.ase_texcoord3.xyz = ase_normalWS;
				float3 ase_tangentWS = UnityObjectToWorldDir( v.ase_tangent );
				o.ase_texcoord4.xyz = ase_tangentWS;
				float ase_tangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				o.ase_texcoord5.xyz = ase_bitangentWS;
				
				float localIfModelData25_g187489 = ( 0.0 );
				TVEModelData Data25_g187489 = (TVEModelData)0;
				TVEModelData Data16_g76830 = (TVEModelData)0;
				half Dummy207_g76826 = ( _ObjectCategory + _ObjectEnd + _ObjectModelMode + _ObjectPivotMode + _ObjectPhaseMode + _ObjectBoundsInfo );
				float In_Dummy16_g76830 = Dummy207_g76826;
				float3 In_PositionOS16_g76830 = PositionOS131_g76826;
				half3 PositionWS122_g76826 = vertexToFrag73_g76826;
				float3 In_PositionWS16_g76830 = PositionWS122_g76826;
				half3 PivotWS121_g76826 = vertexToFrag76_g76826;
				#ifdef TVE_SCOPE_DYNAMIC
				float3 staticSwitch204_g76826 = ( PositionWS122_g76826 - PivotWS121_g76826 );
				#else
				float3 staticSwitch204_g76826 = PositionWS122_g76826;
				#endif
				half3 PositionWO132_g76826 = ( staticSwitch204_g76826 - TVE_WorldOrigin );
				float3 In_PositionWO16_g76830 = PositionWO132_g76826;
				float3 In_PositionRawOS16_g76830 = PositionOS131_g76826;
				float3 In_PositionAddOS16_g76830 = float3( 0,0,0 );
				float3 In_PivotOS16_g76830 = PivotOS149_g76826;
				float3 In_PivotWS16_g76830 = PivotWS121_g76826;
				half3 PivotWO133_g76826 = ( PivotWS121_g76826 - TVE_WorldOrigin );
				float3 In_PivotWO16_g76830 = PivotWO133_g76826;
				half3 NormalOS134_g76826 = v.ase_normal;
				float3 In_NormalOS16_g76830 = NormalOS134_g76826;
				float3 normalizedWorldNormal = normalize( ase_normalWS );
				half3 Normal_WS95_g76826 = normalizedWorldNormal;
				float3 In_NormalWS16_g76830 = Normal_WS95_g76826;
				float3 In_NormalRawOS16_g76830 = NormalOS134_g76826;
				float3 objToWorldDir298_g76826 = normalize( mul( unity_ObjectToWorld, float4( v.ase_normal, 0.0 ) ).xyz );
				half3 Normal_RawWS136_g76826 = objToWorldDir298_g76826;
				float3 In_NormalRawWS16_g76830 = Normal_RawWS136_g76826;
				half4 TangentlOS153_g76826 = v.ase_tangent;
				float4 In_TangentOS16_g76830 = TangentlOS153_g76826;
				float3 normalizeResult296_g76826 = normalize( ( _WorldSpaceCameraPos - PositionWS122_g76826 ) );
				half3 ViewDirWS169_g76826 = normalizeResult296_g76826;
				float3 In_ViewDirWS16_g76830 = ViewDirWS169_g76826;
				half4 VertexMasks171_g76826 = v.ase_color;
				float4 In_VertexData16_g76830 = VertexMasks171_g76826;
				float mulTime113_g128352 = _Time.y * 0.52;
				float lerpResult128_g128352 = lerp( mulTime113_g128352 , ( ( mulTime113_g128352 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				float3 break319_g76826 = PivotWO133_g76826;
				half Pivot_Position322_g76826 = ( break319_g76826.x + break319_g76826.z );
				float mulTime113_g128351 = _Time.y * 0.27;
				float lerpResult128_g128351 = lerp( mulTime113_g128351 , ( ( mulTime113_g128351 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				float4 break33_g128354 = _object_phase_mode;
				float temp_output_30_0_g128354 = ( v.ase_color.r * break33_g128354.x );
				float temp_output_29_0_g128354 = ( v.ase_color.g * break33_g128354.y );
				float temp_output_31_0_g128354 = ( v.ase_color.b * break33_g128354.z );
				float temp_output_28_0_g128354 = ( temp_output_30_0_g128354 + temp_output_29_0_g128354 + temp_output_31_0_g128354 + ( v.ase_color.a * break33_g128354.w ) );
				float temp_output_315_0_g76826 = (frac( ( temp_output_28_0_g128354 + Pivot_Position322_g76826 ) )*2.0 + -1.0);
				float4 appendResult177_g76826 = (float4(sin( ( lerpResult128_g128352 + Pivot_Position322_g76826 ) ) , sin( ( lerpResult128_g128351 + Pivot_Position322_g76826 ) ) , temp_output_315_0_g76826 , 1.0));
				half4 MotionMasks176_g76826 = appendResult177_g76826;
				float4 In_PhaseData16_g76830 = MotionMasks176_g76826;
				half Object_HeightValue267_g76826 = _ObjectHeightValue;
				half Object_RadiusValue268_g76826 = _ObjectRadiusValue;
				float temp_output_270_0_g76826 = (PositionOS131_g76826).y;
				half Bounds_HeightMask274_g76826 = saturate( ( temp_output_270_0_g76826 / Object_HeightValue267_g76826 ) );
				half Bounds_SphereMask282_g76826 = saturate( ( length( PositionOS131_g76826 ) / max( Object_HeightValue267_g76826 , Object_RadiusValue268_g76826 ) ) );
				float4 appendResult253_g76826 = (float4(Object_HeightValue267_g76826 , Object_RadiusValue268_g76826 , Bounds_HeightMask274_g76826 , Bounds_SphereMask282_g76826));
				half4 BoundsData254_g76826 = appendResult253_g76826;
				float4 In_BoundsData16_g76830 = BoundsData254_g76826;
				float4 In_RotationData16_g76830 = float4( 0,0,0,0 );
				{
				Data16_g76830.Dummy = In_Dummy16_g76830;
				Data16_g76830.PositionOS = In_PositionOS16_g76830;
				Data16_g76830.PositionWS = In_PositionWS16_g76830;
				Data16_g76830.PositionWO = In_PositionWO16_g76830;
				Data16_g76830.PositionRawOS = In_PositionRawOS16_g76830;
				Data16_g76830.PositionAddOS = In_PositionAddOS16_g76830;
				Data16_g76830.PivotOS = In_PivotOS16_g76830;
				Data16_g76830.PivotWS = In_PivotWS16_g76830;
				Data16_g76830.PivotWO = In_PivotWO16_g76830;
				Data16_g76830.NormalOS = In_NormalOS16_g76830;
				Data16_g76830.NormalWS = In_NormalWS16_g76830;
				Data16_g76830.NormalRawOS = In_NormalRawOS16_g76830;
				Data16_g76830.NormalRawWS = In_NormalRawWS16_g76830;
				Data16_g76830.TangentOS = In_TangentOS16_g76830;
				Data16_g76830.ViewDirWS = In_ViewDirWS16_g76830;
				Data16_g76830.VertexData = In_VertexData16_g76830;
				Data16_g76830.PhaseData = In_PhaseData16_g76830;
				Data16_g76830.BoundsData = In_BoundsData16_g76830;
				Data16_g76830.RotationData = In_RotationData16_g76830;
				}
				TVEModelData DataA25_g187489 = Data16_g76830;
				TVEModelData Data16_g187472 = (TVEModelData)0;
				half Dummy1575_g187456 = ( _NormalCategory + _NormalEnd + _NormalSpace + _NormalBakeMode );
				float In_Dummy16_g187472 = Dummy1575_g187456;
				TVEModelData Data15_g187457 = Data16_g76830;
				float Out_Dummy15_g187457 = 0;
				float3 Out_PositionOS15_g187457 = float3( 0,0,0 );
				float3 Out_PositionWS15_g187457 = float3( 0,0,0 );
				float3 Out_PositionWO15_g187457 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g187457 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g187457 = float3( 0,0,0 );
				float3 Out_PivotOS15_g187457 = float3( 0,0,0 );
				float3 Out_PivotWS15_g187457 = float3( 0,0,0 );
				float3 Out_PivotWO15_g187457 = float3( 0,0,0 );
				float3 Out_NormalOS15_g187457 = float3( 0,0,0 );
				float3 Out_NormalWS15_g187457 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g187457 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g187457 = float3( 0,0,0 );
				float4 Out_TangentOS15_g187457 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g187457 = float3( 0,0,0 );
				float4 Out_VertexData15_g187457 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g187457 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g187457 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g187457 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g187457 = Data15_g187457.Dummy;
				Out_PositionOS15_g187457 = Data15_g187457.PositionOS;
				Out_PositionWS15_g187457 = Data15_g187457.PositionWS;
				Out_PositionWO15_g187457 = Data15_g187457.PositionWO;
				Out_PositionRawOS15_g187457 = Data15_g187457.PositionRawOS;
				Out_PositionAddOS15_g187457 = Data15_g187457.PositionAddOS;
				Out_PivotOS15_g187457 = Data15_g187457.PivotOS;
				Out_PivotWS15_g187457 = Data15_g187457.PivotWS;
				Out_PivotWO15_g187457 = Data15_g187457.PivotWO;
				Out_NormalOS15_g187457 = Data15_g187457.NormalOS;
				Out_NormalWS15_g187457 = Data15_g187457.NormalWS;
				Out_NormalRawOS15_g187457 = Data15_g187457.NormalRawOS;
				Out_NormalRawWS15_g187457 = Data15_g187457.NormalRawWS;
				Out_TangentOS15_g187457 = Data15_g187457.TangentOS;
				Out_ViewDirWS15_g187457 = Data15_g187457.ViewDirWS;
				Out_VertexData15_g187457 = Data15_g187457.VertexData;
				Out_PhaseData15_g187457 = Data15_g187457.PhaseData;
				Out_BoundsData15_g187457 = Data15_g187457.BoundsData;
				Out_RotationData15_g187457 = Data15_g187457.RotationData;
				}
				float3 In_PositionOS16_g187472 = Out_PositionOS15_g187457;
				float3 In_PositionWS16_g187472 = Out_PositionWS15_g187457;
				float3 temp_output_1567_17_g187456 = Out_PositionWO15_g187457;
				float3 In_PositionWO16_g187472 = temp_output_1567_17_g187456;
				float3 temp_output_1567_26_g187456 = Out_PositionRawOS15_g187457;
				float3 In_PositionRawOS16_g187472 = temp_output_1567_26_g187456;
				float3 In_PositionAddOS16_g187472 = Out_PositionAddOS15_g187457;
				float3 In_PivotOS16_g187472 = Out_PivotOS15_g187457;
				float3 In_PivotWS16_g187472 = Out_PivotWS15_g187457;
				float3 In_PivotWO16_g187472 = Out_PivotWO15_g187457;
				half3 Model_NormalOS1568_g187456 = Out_NormalOS15_g187457;
				half3 _Vector1 = half3(0,1,0);
				float3 lerpResult1589_g187456 = lerp( Model_NormalOS1568_g187456 , _Vector1 , _NormalFlattenValue);
				half3 Model_PositionRAW1592_g187456 = temp_output_1567_26_g187456;
				float3 normalizeResult1594_g187456 = ASESafeNormalize( ( Model_PositionRAW1592_g187456 + _NormalSphereOffsetValue ) );
				float3 lerpResult1585_g187456 = lerp( lerpResult1589_g187456 , normalizeResult1594_g187456 , _NormalSphereValue);
				float4 temp_output_1567_29_g187456 = Out_VertexData15_g187457;
				half4 Model_VertexData1608_g187456 = temp_output_1567_29_g187456;
				float4 break1683_g187456 = Model_VertexData1608_g187456;
				float4 break33_g187462 = _normal_vert_mode;
				float temp_output_30_0_g187462 = ( break1683_g187456.x * break33_g187462.x );
				float temp_output_29_0_g187462 = ( break1683_g187456.y * break33_g187462.y );
				float temp_output_31_0_g187462 = ( break1683_g187456.z * break33_g187462.z );
				float temp_output_28_0_g187462 = ( temp_output_30_0_g187462 + temp_output_29_0_g187462 + temp_output_31_0_g187462 + ( break1683_g187456.w * break33_g187462.w ) );
				float clampResult17_g187463 = clamp( temp_output_28_0_g187462 , 0.0001 , 0.9999 );
				float temp_output_7_0_g187467 = _NormalMeshRemap.x;
				float temp_output_9_0_g187467 = ( clampResult17_g187463 - temp_output_7_0_g187467 );
				float lerpResult1695_g187456 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g187467 * _NormalMeshRemap.z ) + 0.0001 ) ) , _NormalMeshValue);
				float temp_output_6_0_g187464 = lerpResult1695_g187456;
				#ifdef TVE_DUMMY
				float staticSwitch14_g187464 = ( temp_output_6_0_g187464 + _NormalMeshMode );
				#else
				float staticSwitch14_g187464 = temp_output_6_0_g187464;
				#endif
				float temp_output_1690_0_g187456 = staticSwitch14_g187464;
				half Normal_MeskMask1691_g187456 = temp_output_1690_0_g187456;
				half Normal_Proj_Mask1647_g187456 = 1.0;
				float temp_output_1699_0_g187456 = ( Normal_MeskMask1691_g187456 * Normal_Proj_Mask1647_g187456 );
				float3 lerpResult1670_g187456 = lerp( Model_NormalOS1568_g187456 , lerpResult1585_g187456 , temp_output_1699_0_g187456);
				#ifdef TVE_NORMAL
				float3 staticSwitch1716_g187456 = lerpResult1670_g187456;
				#else
				float3 staticSwitch1716_g187456 = Model_NormalOS1568_g187456;
				#endif
				half3 Final_NormalOS178_g187456 = staticSwitch1716_g187456;
				float3 In_NormalOS16_g187472 = Final_NormalOS178_g187456;
				float3 temp_output_1567_21_g187456 = Out_NormalWS15_g187457;
				float3 In_NormalWS16_g187472 = temp_output_1567_21_g187456;
				float3 In_NormalRawOS16_g187472 = Out_NormalRawOS15_g187457;
				float3 In_NormalRawWS16_g187472 = Out_NormalRawWS15_g187457;
				float4 In_TangentOS16_g187472 = Out_TangentOS15_g187457;
				float3 In_ViewDirWS16_g187472 = Out_ViewDirWS15_g187457;
				float4 In_VertexData16_g187472 = temp_output_1567_29_g187456;
				float4 In_PhaseData16_g187472 = Out_PhaseData15_g187457;
				float4 In_BoundsData16_g187472 = Out_BoundsData15_g187457;
				float4 temp_output_1567_33_g187456 = Out_RotationData15_g187457;
				float4 In_RotationData16_g187472 = temp_output_1567_33_g187456;
				{
				Data16_g187472.Dummy = In_Dummy16_g187472;
				Data16_g187472.PositionOS = In_PositionOS16_g187472;
				Data16_g187472.PositionWS = In_PositionWS16_g187472;
				Data16_g187472.PositionWO = In_PositionWO16_g187472;
				Data16_g187472.PositionRawOS = In_PositionRawOS16_g187472;
				Data16_g187472.PositionAddOS = In_PositionAddOS16_g187472;
				Data16_g187472.PivotOS = In_PivotOS16_g187472;
				Data16_g187472.PivotWS = In_PivotWS16_g187472;
				Data16_g187472.PivotWO = In_PivotWO16_g187472;
				Data16_g187472.NormalOS = In_NormalOS16_g187472;
				Data16_g187472.NormalWS = In_NormalWS16_g187472;
				Data16_g187472.NormalRawOS = In_NormalRawOS16_g187472;
				Data16_g187472.NormalRawWS = In_NormalRawWS16_g187472;
				Data16_g187472.TangentOS = In_TangentOS16_g187472;
				Data16_g187472.ViewDirWS = In_ViewDirWS16_g187472;
				Data16_g187472.VertexData = In_VertexData16_g187472;
				Data16_g187472.PhaseData = In_PhaseData16_g187472;
				Data16_g187472.BoundsData = In_BoundsData16_g187472;
				Data16_g187472.RotationData = In_RotationData16_g187472;
				}
				TVEModelData DataB25_g187489 = Data16_g187472;
				float Alpha25_g187489 = _NormalBakeMode;
				{
				if (Alpha25_g187489 < 0.5 )
				{
				Data25_g187489 = DataA25_g187489;
				}
				else
				{
				Data25_g187489 = DataB25_g187489;
				}
				}
				TVEModelData Data15_g187495 = Data25_g187489;
				float Out_Dummy15_g187495 = 0;
				float3 Out_PositionOS15_g187495 = float3( 0,0,0 );
				float3 Out_PositionWS15_g187495 = float3( 0,0,0 );
				float3 Out_PositionWO15_g187495 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g187495 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g187495 = float3( 0,0,0 );
				float3 Out_PivotOS15_g187495 = float3( 0,0,0 );
				float3 Out_PivotWS15_g187495 = float3( 0,0,0 );
				float3 Out_PivotWO15_g187495 = float3( 0,0,0 );
				float3 Out_NormalOS15_g187495 = float3( 0,0,0 );
				float3 Out_NormalWS15_g187495 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g187495 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g187495 = float3( 0,0,0 );
				float4 Out_TangentOS15_g187495 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g187495 = float3( 0,0,0 );
				float4 Out_VertexData15_g187495 = float4( 0,0,0,0 );
				float4 Out_PhaseData15_g187495 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g187495 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g187495 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g187495 = Data15_g187495.Dummy;
				Out_PositionOS15_g187495 = Data15_g187495.PositionOS;
				Out_PositionWS15_g187495 = Data15_g187495.PositionWS;
				Out_PositionWO15_g187495 = Data15_g187495.PositionWO;
				Out_PositionRawOS15_g187495 = Data15_g187495.PositionRawOS;
				Out_PositionAddOS15_g187495 = Data15_g187495.PositionAddOS;
				Out_PivotOS15_g187495 = Data15_g187495.PivotOS;
				Out_PivotWS15_g187495 = Data15_g187495.PivotWS;
				Out_PivotWO15_g187495 = Data15_g187495.PivotWO;
				Out_NormalOS15_g187495 = Data15_g187495.NormalOS;
				Out_NormalWS15_g187495 = Data15_g187495.NormalWS;
				Out_NormalRawOS15_g187495 = Data15_g187495.NormalRawOS;
				Out_NormalRawWS15_g187495 = Data15_g187495.NormalRawWS;
				Out_TangentOS15_g187495 = Data15_g187495.TangentOS;
				Out_ViewDirWS15_g187495 = Data15_g187495.ViewDirWS;
				Out_VertexData15_g187495 = Data15_g187495.VertexData;
				Out_PhaseData15_g187495 = Data15_g187495.PhaseData;
				Out_BoundsData15_g187495 = Data15_g187495.BoundsData;
				Out_RotationData15_g187495 = Data15_g187495.RotationData;
				}
				float4 vertexToFrag140_g187491 = Out_TangentOS15_g187495;
				o.ase_texcoord6 = vertexToFrag140_g187491;
				o.ase_texcoord1.w = ase_tangentSign;
				float3 vertexToFrag139_g187491 = Out_NormalOS15_g187495;
				o.ase_texcoord7.xyz = vertexToFrag139_g187491;
				float4 ase_positionCS = UnityObjectToClipPos( v.vertex );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				o.ase_texcoord8 = screenPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord.zw = v.ase_texcoord2.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord7.w = 0;

				v.vertex.xyz +=  float3(0,0,0) ;
				o.pos = UnityObjectToClipPos(v.vertex);
				return o;
			}


			void frag(v2f i , bool ase_vface : SV_IsFrontFace,
				out half4 outGBuffer0 : SV_Target0,
				out half4 outGBuffer1 : SV_Target1,
				out half4 outGBuffer2 : SV_Target2,
				out half4 outGBuffer3 : SV_Target3,
				out half4 outGBuffer4 : SV_Target4,
				out half4 outGBuffer5 : SV_Target5,
				out half4 outGBuffer6 : SV_Target6,
				out half4 outGBuffer7 : SV_Target7,
				out float outDepth : SV_Depth
			)
			{
				UNITY_SETUP_INSTANCE_ID( i );
				float localBreakData4_g187493 = ( 0.0 );
				float localCompData3_g187488 = ( 0.0 );
				TVEVisualData Data3_g187488 = (TVEVisualData)0;
				half Dummy145_g187473 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + _EmissiveFlagMode );
				float In_Dummy3_g187488 = Dummy145_g187473;
				float localBreakData4_g187477 = ( 0.0 );
				float localIfVisualData25_g139693 = ( 0.0 );
				TVEVisualData Data25_g139693 = (TVEVisualData)0;
				float localIfVisualData25_g139669 = ( 0.0 );
				TVEVisualData Data25_g139669 = (TVEVisualData)0;
				float localIfVisualData25_g139658 = ( 0.0 );
				TVEVisualData Data25_g139658 = (TVEVisualData)0;
				float localIfVisualData25_g139647 = ( 0.0 );
				TVEVisualData Data25_g139647 = (TVEVisualData)0;
				float localIfVisualData25_g139606 = ( 0.0 );
				TVEVisualData Data25_g139606 = (TVEVisualData)0;
				float localCompData3_g128387 = ( 0.0 );
				TVEVisualData Data3_g128387 = (TVEVisualData)0;
				half4 Dummy130_g128376 = ( _MainCategory + _MainEnd + ( _MainSampleMode + _MainCoordMode + _MainCoordValue ) + _MainMultiMaskInfo );
				float In_Dummy3_g128387 = Dummy130_g128376.x;
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g128380) = _MainAlbedoTex;
				float localFilterTexture19_g128383 = ( 0.0 );
				SamplerState SS19_g128383 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g128383 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g128383 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g128383 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g128383 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g128383 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g128383 = SamplerDefault19_g128383;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g128383 = SamplerDefault19_g128383;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g128383 = SamplerPoint19_g128383;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g128383 = SamplerLow19_g128383;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g128383 = SamplerMedium19_g128383;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g128383 = SamplerHigh19_g128383;
				#endif
				}
				SamplerState Sampler276_g128380 = SS19_g128383;
				half4 Local_Coords180_g128376 = _main_coord_value;
				float4 temp_output_37_0_g128380 = Local_Coords180_g128376;
				half4 Coords276_g128380 = temp_output_37_0_g128380;
				half2 TexCoord276_g128380 = i.ase_texcoord.xy;
				half4 localSampleMain276_g128380 = SampleMain( Texture276_g128380 , Sampler276_g128380 , Coords276_g128380 , TexCoord276_g128380 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g128380) = _MainAlbedoTex;
				SamplerState Sampler275_g128380 = SS19_g128383;
				half4 Coords275_g128380 = temp_output_37_0_g128380;
				half2 TexCoord275_g128380 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g128380 = SampleExtra( Texture275_g128380 , Sampler275_g128380 , Coords275_g128380 , TexCoord275_g128380 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g128380) = _MainAlbedoTex;
				SamplerState Sampler238_g128380 = SS19_g128383;
				half4 Coords238_g128380 = temp_output_37_0_g128380;
				TVEModelData Data16_g76831 = (TVEModelData)0;
				float In_Dummy16_g76831 = 0.0;
				float3 vertexToFrag73_g76826 = i.ase_texcoord1.xyz;
				half3 PositionWS122_g76826 = vertexToFrag73_g76826;
				float3 In_PositionWS16_g76831 = PositionWS122_g76826;
				float3 vertexToFrag76_g76826 = i.ase_texcoord2.xyz;
				half3 PivotWS121_g76826 = vertexToFrag76_g76826;
				#ifdef TVE_SCOPE_DYNAMIC
				float3 staticSwitch204_g76826 = ( PositionWS122_g76826 - PivotWS121_g76826 );
				#else
				float3 staticSwitch204_g76826 = PositionWS122_g76826;
				#endif
				half3 PositionWO132_g76826 = ( staticSwitch204_g76826 - TVE_WorldOrigin );
				float3 In_PositionWO16_g76831 = PositionWO132_g76826;
				float3 In_PivotWS16_g76831 = PivotWS121_g76826;
				half3 PivotWO133_g76826 = ( PivotWS121_g76826 - TVE_WorldOrigin );
				float3 In_PivotWO16_g76831 = PivotWO133_g76826;
				float3 ase_normalWS = i.ase_texcoord3.xyz;
				float3 normalizedWorldNormal = normalize( ase_normalWS );
				half3 Normal_WS95_g76826 = normalizedWorldNormal;
				float3 In_NormalWS16_g76831 = Normal_WS95_g76826;
				float3 normalizeResult296_g76826 = normalize( ( _WorldSpaceCameraPos - PositionWS122_g76826 ) );
				half3 ViewDirWS169_g76826 = normalizeResult296_g76826;
				float3 In_ViewDirWS16_g76831 = ViewDirWS169_g76826;
				half4 VertexMasks171_g76826 = i.ase_color;
				float4 In_VertexData16_g76831 = VertexMasks171_g76826;
				float4 In_BoundsData16_g76831 = float4( 1,1,1,1 );
				{
				Data16_g76831.Dummy = In_Dummy16_g76831;
				Data16_g76831.PositionWS = In_PositionWS16_g76831;
				Data16_g76831.PositionWO = In_PositionWO16_g76831;
				Data16_g76831.PivotWS = In_PivotWS16_g76831;
				Data16_g76831.PivotWO = In_PivotWO16_g76831;
				Data16_g76831.NormalWS = In_NormalWS16_g76831;
				Data16_g76831.ViewDirWS = In_ViewDirWS16_g76831;
				Data16_g76831.VertexData = In_VertexData16_g76831;
				Data16_g76831.BoundsData = In_BoundsData16_g76831;
				}
				TVEModelData Data15_g128386 = Data16_g76831;
				float Out_Dummy15_g128386 = 0;
				float3 Out_PositionWS15_g128386 = float3( 0,0,0 );
				float3 Out_PositionWO15_g128386 = float3( 0,0,0 );
				float3 Out_PivotWS15_g128386 = float3( 0,0,0 );
				float3 Out_PivotWO15_g128386 = float3( 0,0,0 );
				float3 Out_NormalWS15_g128386 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g128386 = float3( 0,0,0 );
				float4 Out_VertexData15_g128386 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g128386 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g128386 = Data15_g128386.Dummy;
				Out_PositionWS15_g128386 = Data15_g128386.PositionWS;
				Out_PositionWO15_g128386 = Data15_g128386.PositionWO;
				Out_PivotWS15_g128386 = Data15_g128386.PivotWS;
				Out_PivotWO15_g128386 = Data15_g128386.PivotWO;
				Out_NormalWS15_g128386 = Data15_g128386.NormalWS;
				Out_ViewDirWS15_g128386 = Data15_g128386.ViewDirWS;
				Out_VertexData15_g128386 = Data15_g128386.VertexData;
				Out_BoundsData15_g128386 = Data15_g128386.BoundsData;
				}
				half3 Model_PositionWO222_g128376 = Out_PositionWO15_g128386;
				float3 temp_output_279_0_g128380 = Model_PositionWO222_g128376;
				half3 WorldPosition238_g128380 = temp_output_279_0_g128380;
				half4 localSamplePlanar2D238_g128380 = SamplePlanar2D( Texture238_g128380 , Sampler238_g128380 , Coords238_g128380 , WorldPosition238_g128380 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g128380) = _MainAlbedoTex;
				SamplerState Sampler246_g128380 = SS19_g128383;
				half4 Coords246_g128380 = temp_output_37_0_g128380;
				half3 WorldPosition246_g128380 = temp_output_279_0_g128380;
				half3 Model_NormalWS226_g128376 = Out_NormalWS15_g128386;
				float3 temp_output_280_0_g128380 = Model_NormalWS226_g128376;
				half3 WorldNormal246_g128380 = temp_output_280_0_g128380;
				half4 localSamplePlanar3D246_g128380 = SamplePlanar3D( Texture246_g128380 , Sampler246_g128380 , Coords246_g128380 , WorldPosition246_g128380 , WorldNormal246_g128380 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g128380) = _MainAlbedoTex;
				SamplerState Sampler234_g128380 = SS19_g128383;
				float4 Coords234_g128380 = temp_output_37_0_g128380;
				float3 WorldPosition234_g128380 = temp_output_279_0_g128380;
				float4 localSampleStochastic2D234_g128380 = SampleStochastic2D( Texture234_g128380 , Sampler234_g128380 , Coords234_g128380 , WorldPosition234_g128380 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g128380) = _MainAlbedoTex;
				SamplerState Sampler263_g128380 = SS19_g128383;
				half4 Coords263_g128380 = temp_output_37_0_g128380;
				half3 WorldPosition263_g128380 = temp_output_279_0_g128380;
				half3 WorldNormal263_g128380 = temp_output_280_0_g128380;
				half4 localSampleStochastic3D263_g128380 = SampleStochastic3D( Texture263_g128380 , Sampler263_g128380 , Coords263_g128380 , WorldPosition263_g128380 , WorldNormal263_g128380 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch184_g128376 = localSampleMain276_g128380;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch184_g128376 = localSampleExtra275_g128380;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch184_g128376 = localSamplePlanar2D238_g128380;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch184_g128376 = localSamplePlanar3D246_g128380;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch184_g128376 = localSampleStochastic2D234_g128380;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch184_g128376 = localSampleStochastic3D263_g128380;
				#else
				float4 staticSwitch184_g128376 = localSampleMain276_g128380;
				#endif
				half4 Local_AlbedoTex185_g128376 = staticSwitch184_g128376;
				float3 lerpResult53_g128376 = lerp( float3( 1,1,1 ) , (Local_AlbedoTex185_g128376).xyz , _MainAlbedoValue);
				half3 Local_AlbedoRGB107_g128376 = lerpResult53_g128376;
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g128382) = _MainShaderTex;
				float localFilterTexture30_g128385 = ( 0.0 );
				SamplerState SS30_g128385 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g128385 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g128385 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g128385 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g128385 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g128385 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g128385 = SamplerDefault30_g128385;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g128385 = SamplerDefault30_g128385;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g128385 = SamplerPoint30_g128385;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g128385 = SamplerLow30_g128385;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g128385 = SamplerMedium30_g128385;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g128385 = SamplerHigh30_g128385;
				#endif
				}
				SamplerState Sampler276_g128382 = SS30_g128385;
				float4 temp_output_37_0_g128382 = Local_Coords180_g128376;
				half4 Coords276_g128382 = temp_output_37_0_g128382;
				half2 TexCoord276_g128382 = i.ase_texcoord.xy;
				half4 localSampleMain276_g128382 = SampleMain( Texture276_g128382 , Sampler276_g128382 , Coords276_g128382 , TexCoord276_g128382 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g128382) = _MainShaderTex;
				SamplerState Sampler275_g128382 = SS30_g128385;
				half4 Coords275_g128382 = temp_output_37_0_g128382;
				half2 TexCoord275_g128382 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g128382 = SampleExtra( Texture275_g128382 , Sampler275_g128382 , Coords275_g128382 , TexCoord275_g128382 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g128382) = _MainShaderTex;
				SamplerState Sampler238_g128382 = SS30_g128385;
				half4 Coords238_g128382 = temp_output_37_0_g128382;
				float3 temp_output_279_0_g128382 = Model_PositionWO222_g128376;
				half3 WorldPosition238_g128382 = temp_output_279_0_g128382;
				half4 localSamplePlanar2D238_g128382 = SamplePlanar2D( Texture238_g128382 , Sampler238_g128382 , Coords238_g128382 , WorldPosition238_g128382 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g128382) = _MainShaderTex;
				SamplerState Sampler246_g128382 = SS30_g128385;
				half4 Coords246_g128382 = temp_output_37_0_g128382;
				half3 WorldPosition246_g128382 = temp_output_279_0_g128382;
				float3 temp_output_280_0_g128382 = Model_NormalWS226_g128376;
				half3 WorldNormal246_g128382 = temp_output_280_0_g128382;
				half4 localSamplePlanar3D246_g128382 = SamplePlanar3D( Texture246_g128382 , Sampler246_g128382 , Coords246_g128382 , WorldPosition246_g128382 , WorldNormal246_g128382 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g128382) = _MainShaderTex;
				SamplerState Sampler234_g128382 = SS30_g128385;
				float4 Coords234_g128382 = temp_output_37_0_g128382;
				float3 WorldPosition234_g128382 = temp_output_279_0_g128382;
				float4 localSampleStochastic2D234_g128382 = SampleStochastic2D( Texture234_g128382 , Sampler234_g128382 , Coords234_g128382 , WorldPosition234_g128382 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g128382) = _MainShaderTex;
				SamplerState Sampler263_g128382 = SS30_g128385;
				half4 Coords263_g128382 = temp_output_37_0_g128382;
				half3 WorldPosition263_g128382 = temp_output_279_0_g128382;
				half3 WorldNormal263_g128382 = temp_output_280_0_g128382;
				half4 localSampleStochastic3D263_g128382 = SampleStochastic3D( Texture263_g128382 , Sampler263_g128382 , Coords263_g128382 , WorldPosition263_g128382 , WorldNormal263_g128382 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch198_g128376 = localSampleMain276_g128382;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch198_g128376 = localSampleExtra275_g128382;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch198_g128376 = localSamplePlanar2D238_g128382;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch198_g128376 = localSamplePlanar3D246_g128382;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch198_g128376 = localSampleStochastic2D234_g128382;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch198_g128376 = localSampleStochastic3D263_g128382;
				#else
				float4 staticSwitch198_g128376 = localSampleMain276_g128382;
				#endif
				half4 Local_ShaderTex199_g128376 = staticSwitch198_g128376;
				float clampResult17_g128394 = clamp( (Local_ShaderTex199_g128376).y , 0.0001 , 0.9999 );
				float temp_output_7_0_g128393 = _MainOcclusionRemap.x;
				float temp_output_9_0_g128393 = ( clampResult17_g128394 - temp_output_7_0_g128393 );
				float lerpResult23_g128376 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g128393 * _MainOcclusionRemap.z ) + 0.0001 ) ) , _MainOcclusionValue);
				half Local_Occlusion313_g128376 = lerpResult23_g128376;
				float clampResult17_g128396 = clamp( (Local_ShaderTex199_g128376).w , 0.0001 , 0.9999 );
				float temp_output_7_0_g128395 = _MainSmoothnessRemap.x;
				float temp_output_9_0_g128395 = ( clampResult17_g128396 - temp_output_7_0_g128395 );
				half Local_Smoothness317_g128376 = ( saturate( ( ( temp_output_9_0_g128395 * _MainSmoothnessRemap.z ) + 0.0001 ) ) * _MainSmoothnessValue );
				float4 appendResult73_g128376 = (float4(( (Local_ShaderTex199_g128376).x * _MainMetallicValue ) , Local_Occlusion313_g128376 , (Local_ShaderTex199_g128376).z , Local_Smoothness317_g128376));
				half4 Local_Masks109_g128376 = appendResult73_g128376;
				float clampResult17_g128391 = clamp( (Local_Masks109_g128376).z , 0.0001 , 0.9999 );
				float temp_output_7_0_g128392 = _MainMultiRemap.x;
				float temp_output_9_0_g128392 = ( clampResult17_g128391 - temp_output_7_0_g128392 );
				half Local_MultiMask78_g128376 = saturate( ( ( temp_output_9_0_g128392 * _MainMultiRemap.z ) + 0.0001 ) );
				float lerpResult58_g128376 = lerp( 1.0 , Local_MultiMask78_g128376 , _MainColorMode);
				float4 lerpResult62_g128376 = lerp( _MainColorTwo , _MainColor , lerpResult58_g128376);
				half3 Local_ColorRGB93_g128376 = (lerpResult62_g128376).rgb;
				half3 Local_Albedo139_g128376 = ( Local_AlbedoRGB107_g128376 * Local_ColorRGB93_g128376 );
				float3 In_Albedo3_g128387 = Local_Albedo139_g128376;
				float3 In_AlbedoRaw3_g128387 = Local_Albedo139_g128376;
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g128381) = _MainNormalTex;
				float localFilterTexture29_g128384 = ( 0.0 );
				SamplerState SS29_g128384 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g128384 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g128384 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g128384 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g128384 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g128384 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g128384 = SamplerDefault29_g128384;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g128384 = SamplerDefault29_g128384;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g128384 = SamplerPoint29_g128384;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g128384 = SamplerLow29_g128384;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g128384 = SamplerMedium29_g128384;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g128384 = SamplerHigh29_g128384;
				#endif
				}
				SamplerState Sampler276_g128381 = SS29_g128384;
				float4 temp_output_37_0_g128381 = Local_Coords180_g128376;
				half4 Coords276_g128381 = temp_output_37_0_g128381;
				half2 TexCoord276_g128381 = i.ase_texcoord.xy;
				half4 localSampleMain276_g128381 = SampleMain( Texture276_g128381 , Sampler276_g128381 , Coords276_g128381 , TexCoord276_g128381 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g128381) = _MainNormalTex;
				SamplerState Sampler275_g128381 = SS29_g128384;
				half4 Coords275_g128381 = temp_output_37_0_g128381;
				half2 TexCoord275_g128381 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g128381 = SampleExtra( Texture275_g128381 , Sampler275_g128381 , Coords275_g128381 , TexCoord275_g128381 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g128381) = _MainNormalTex;
				SamplerState Sampler238_g128381 = SS29_g128384;
				half4 Coords238_g128381 = temp_output_37_0_g128381;
				float3 temp_output_279_0_g128381 = Model_PositionWO222_g128376;
				half3 WorldPosition238_g128381 = temp_output_279_0_g128381;
				half4 localSamplePlanar2D238_g128381 = SamplePlanar2D( Texture238_g128381 , Sampler238_g128381 , Coords238_g128381 , WorldPosition238_g128381 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g128381) = _MainNormalTex;
				SamplerState Sampler246_g128381 = SS29_g128384;
				half4 Coords246_g128381 = temp_output_37_0_g128381;
				half3 WorldPosition246_g128381 = temp_output_279_0_g128381;
				float3 temp_output_280_0_g128381 = Model_NormalWS226_g128376;
				half3 WorldNormal246_g128381 = temp_output_280_0_g128381;
				half4 localSamplePlanar3D246_g128381 = SamplePlanar3D( Texture246_g128381 , Sampler246_g128381 , Coords246_g128381 , WorldPosition246_g128381 , WorldNormal246_g128381 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g128381) = _MainNormalTex;
				SamplerState Sampler234_g128381 = SS29_g128384;
				float4 Coords234_g128381 = temp_output_37_0_g128381;
				float3 WorldPosition234_g128381 = temp_output_279_0_g128381;
				float4 localSampleStochastic2D234_g128381 = SampleStochastic2D( Texture234_g128381 , Sampler234_g128381 , Coords234_g128381 , WorldPosition234_g128381 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g128381) = _MainNormalTex;
				SamplerState Sampler263_g128381 = SS29_g128384;
				half4 Coords263_g128381 = temp_output_37_0_g128381;
				half3 WorldPosition263_g128381 = temp_output_279_0_g128381;
				half3 WorldNormal263_g128381 = temp_output_280_0_g128381;
				half4 localSampleStochastic3D263_g128381 = SampleStochastic3D( Texture263_g128381 , Sampler263_g128381 , Coords263_g128381 , WorldPosition263_g128381 , WorldNormal263_g128381 );
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float4 staticSwitch193_g128376 = localSampleMain276_g128381;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float4 staticSwitch193_g128376 = localSampleExtra275_g128381;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float4 staticSwitch193_g128376 = localSamplePlanar2D238_g128381;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float4 staticSwitch193_g128376 = localSamplePlanar3D246_g128381;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch193_g128376 = localSampleStochastic2D234_g128381;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch193_g128376 = localSampleStochastic3D263_g128381;
				#else
				float4 staticSwitch193_g128376 = localSampleMain276_g128381;
				#endif
				half4 Local_NormaTex191_g128376 = staticSwitch193_g128376;
				half4 Normal_Packed45_g128377 = Local_NormaTex191_g128376;
				float2 appendResult58_g128377 = (float2(( (Normal_Packed45_g128377).x * (Normal_Packed45_g128377).w ) , (Normal_Packed45_g128377).y));
				half2 Normal_Default50_g128377 = appendResult58_g128377;
				half2 Normal_ASTC41_g128377 = (Normal_Packed45_g128377).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g128377 = Normal_ASTC41_g128377;
				#else
				float2 staticSwitch38_g128377 = Normal_Default50_g128377;
				#endif
				half2 Normal_NO_DTX544_g128377 = (Normal_Packed45_g128377).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g128377 = Normal_NO_DTX544_g128377;
				#else
				float2 staticSwitch37_g128377 = staticSwitch38_g128377;
				#endif
				float2 temp_output_26_0_g128376 = ( (staticSwitch37_g128377*2.0 + -1.0) * _MainNormalValue );
				float3 ase_tangentWS = i.ase_texcoord4.xyz;
				float3 ase_bitangentWS = i.ase_texcoord5.xyz;
				float3x3 ase_worldToTangent = float3x3( ase_tangentWS, ase_bitangentWS, ase_normalWS );
				half2 Normal_Planar45_g128378 = temp_output_26_0_g128376;
				float2 break71_g128378 = Normal_Planar45_g128378;
				float3 appendResult72_g128378 = (float3(break71_g128378.x , 0.0 , break71_g128378.y));
				float2 temp_output_205_0_g128376 = (mul( ase_worldToTangent, appendResult72_g128378 )).xy;
				#if defined( TVE_MAIN_SAMPLE_MAIN_UV )
				float2 staticSwitch204_g128376 = temp_output_26_0_g128376;
				#elif defined( TVE_MAIN_SAMPLE_EXTRA_UV )
				float2 staticSwitch204_g128376 = temp_output_26_0_g128376;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_2D )
				float2 staticSwitch204_g128376 = temp_output_205_0_g128376;
				#elif defined( TVE_MAIN_SAMPLE_PLANAR_3D )
				float2 staticSwitch204_g128376 = temp_output_205_0_g128376;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_2D )
				float2 staticSwitch204_g128376 = temp_output_205_0_g128376;
				#elif defined( TVE_MAIN_SAMPLE_STOCHASTIC_3D )
				float2 staticSwitch204_g128376 = temp_output_205_0_g128376;
				#else
				float2 staticSwitch204_g128376 = temp_output_26_0_g128376;
				#endif
				half2 Local_NormalTS108_g128376 = staticSwitch204_g128376;
				float2 In_NormalTS3_g128387 = Local_NormalTS108_g128376;
				float3 appendResult68_g128379 = (float3(Local_NormalTS108_g128376 , 1.0));
				float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
				float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
				float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
				float3 tanNormal74_g128379 = appendResult68_g128379;
				float3 worldNormal74_g128379 = normalize( float3( dot( tanToWorld0, tanNormal74_g128379 ), dot( tanToWorld1, tanNormal74_g128379 ), dot( tanToWorld2, tanNormal74_g128379 ) ) );
				half3 Local_NormalWS250_g128376 = worldNormal74_g128379;
				float3 In_NormalWS3_g128387 = Local_NormalWS250_g128376;
				float4 In_Shader3_g128387 = Local_Masks109_g128376;
				float4 In_Emissive3_g128387 = half4( 1, 1, 1, 1 );
				float3 temp_output_3_0_g128388 = Local_Albedo139_g128376;
				float dotResult20_g128388 = dot( temp_output_3_0_g128388 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Local_Grayscale110_g128376 = dotResult20_g128388;
				float In_Grayscale3_g128387 = Local_Grayscale110_g128376;
				float clampResult144_g128376 = clamp( saturate( ( Local_Grayscale110_g128376 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity145_g128376 = clampResult144_g128376;
				float In_Luminosity3_g128387 = Local_Luminosity145_g128376;
				float In_MultiMask3_g128387 = Local_MultiMask78_g128376;
				float temp_output_187_0_g128376 = (Local_AlbedoTex185_g128376).w;
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch236_g128376 = ( temp_output_187_0_g128376 - _MainAlphaClipValue );
				#else
				float staticSwitch236_g128376 = temp_output_187_0_g128376;
				#endif
				half Local_AlphaClip111_g128376 = staticSwitch236_g128376;
				float In_AlphaClip3_g128387 = Local_AlphaClip111_g128376;
				half Local_AlphaFade246_g128376 = (lerpResult62_g128376).a;
				float In_AlphaFade3_g128387 = Local_AlphaFade246_g128376;
				float3 temp_cast_2 = (1.0).xxx;
				float3 In_Translucency3_g128387 = temp_cast_2;
				float In_Transmission3_g128387 = 1.0;
				float In_Thickness3_g128387 = 0.0;
				float In_Diffusion3_g128387 = 0.0;
				float In_Depth3_g128387 = 0.0;
				{
				Data3_g128387.Dummy = In_Dummy3_g128387;
				Data3_g128387.Albedo = In_Albedo3_g128387;
				Data3_g128387.AlbedoRaw = In_AlbedoRaw3_g128387;
				Data3_g128387.NormalTS = In_NormalTS3_g128387;
				Data3_g128387.NormalWS = In_NormalWS3_g128387;
				Data3_g128387.Shader = In_Shader3_g128387;
				Data3_g128387.Emissive= In_Emissive3_g128387;
				Data3_g128387.MultiMask = In_MultiMask3_g128387;
				Data3_g128387.Grayscale = In_Grayscale3_g128387;
				Data3_g128387.Luminosity = In_Luminosity3_g128387;
				Data3_g128387.AlphaClip = In_AlphaClip3_g128387;
				Data3_g128387.AlphaFade = In_AlphaFade3_g128387;
				Data3_g128387.Translucency = In_Translucency3_g128387;
				Data3_g128387.Transmission = In_Transmission3_g128387;
				Data3_g128387.Thickness = In_Thickness3_g128387;
				Data3_g128387.Diffusion = In_Diffusion3_g128387;
				Data3_g128387.Depth = In_Depth3_g128387;
				}
				TVEVisualData DataA25_g139606 = Data3_g128387;
				float localCompData3_g139583 = ( 0.0 );
				TVEVisualData Data3_g139583 = (TVEVisualData)0;
				half4 Dummy946_g139565 = ( ( _LayerCategory + _LayerEnd ) + ( _SecondSampleMode + _SecondCoordMode + _SecondCoordValue ) + ( _SecondMaskSampleMode + _SecondMaskCoordMode + _SecondMaskCoordValue ) + _SecondBakeMode );
				float In_Dummy3_g139583 = Dummy946_g139565.x;
				float localBreakData4_g139573 = ( 0.0 );
				TVEVisualData Data4_g139573 = Data3_g128387;
				float Out_Dummy4_g139573 = 0;
				float3 Out_Albedo4_g139573 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g139573 = float3( 0,0,0 );
				float2 Out_NormalTS4_g139573 = float2( 0,0 );
				float3 Out_NormalWS4_g139573 = float3( 0,0,0 );
				float4 Out_Shader4_g139573 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g139573 = float4( 0,0,0,0 );
				float Out_MultiMask4_g139573 = 0;
				float Out_Grayscale4_g139573 = 0;
				float Out_Luminosity4_g139573 = 0;
				float Out_AlphaClip4_g139573 = 0;
				float Out_AlphaFade4_g139573 = 0;
				float3 Out_Translucency4_g139573 = float3( 0,0,0 );
				float Out_Transmission4_g139573 = 0;
				float Out_Thickness4_g139573 = 0;
				float Out_Diffusion4_g139573 = 0;
				float Out_Depth4_g139573 = 0;
				{
				Out_Dummy4_g139573 = Data4_g139573.Dummy;
				Out_Albedo4_g139573 = Data4_g139573.Albedo;
				Out_AlbedoRaw4_g139573 = Data4_g139573.AlbedoRaw;
				Out_NormalTS4_g139573 = Data4_g139573.NormalTS;
				Out_NormalWS4_g139573 = Data4_g139573.NormalWS;
				Out_Shader4_g139573 = Data4_g139573.Shader;
				Out_Emissive4_g139573= Data4_g139573.Emissive;
				Out_MultiMask4_g139573 = Data4_g139573.MultiMask;
				Out_Grayscale4_g139573 = Data4_g139573.Grayscale;
				Out_Luminosity4_g139573= Data4_g139573.Luminosity;
				Out_AlphaClip4_g139573 = Data4_g139573.AlphaClip;
				Out_AlphaFade4_g139573 = Data4_g139573.AlphaFade;
				Out_Translucency4_g139573 = Data4_g139573.Translucency;
				Out_Transmission4_g139573 = Data4_g139573.Transmission;
				Out_Thickness4_g139573 = Data4_g139573.Thickness;
				Out_Diffusion4_g139573 = Data4_g139573.Diffusion;
				Out_Depth4_g139573= Data4_g139573.Depth;
				}
				half3 Visual_Albedo527_g139565 = Out_Albedo4_g139573;
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g139566) = _SecondAlbedoTex;
				float localFilterTexture19_g139579 = ( 0.0 );
				SamplerState SS19_g139579 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g139579 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g139579 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g139579 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g139579 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g139579 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g139579 = SamplerDefault19_g139579;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g139579 = SamplerDefault19_g139579;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g139579 = SamplerPoint19_g139579;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g139579 = SamplerLow19_g139579;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g139579 = SamplerMedium19_g139579;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g139579 = SamplerHigh19_g139579;
				#endif
				}
				SamplerState Sampler276_g139566 = SS19_g139579;
				half4 Local_LayerCoords790_g139565 = _second_coord_value;
				float4 temp_output_37_0_g139566 = Local_LayerCoords790_g139565;
				half4 Coords276_g139566 = temp_output_37_0_g139566;
				half2 TexCoord276_g139566 = i.ase_texcoord.xy;
				half4 localSampleMain276_g139566 = SampleMain( Texture276_g139566 , Sampler276_g139566 , Coords276_g139566 , TexCoord276_g139566 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g139566) = _SecondAlbedoTex;
				SamplerState Sampler275_g139566 = SS19_g139579;
				half4 Coords275_g139566 = temp_output_37_0_g139566;
				half2 TexCoord275_g139566 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g139566 = SampleExtra( Texture275_g139566 , Sampler275_g139566 , Coords275_g139566 , TexCoord275_g139566 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g139566) = _SecondAlbedoTex;
				SamplerState Sampler238_g139566 = SS19_g139579;
				half4 Coords238_g139566 = temp_output_37_0_g139566;
				TVEModelData Data15_g139582 = Data16_g76831;
				float Out_Dummy15_g139582 = 0;
				float3 Out_PositionWS15_g139582 = float3( 0,0,0 );
				float3 Out_PositionWO15_g139582 = float3( 0,0,0 );
				float3 Out_PivotWS15_g139582 = float3( 0,0,0 );
				float3 Out_PivotWO15_g139582 = float3( 0,0,0 );
				float3 Out_NormalWS15_g139582 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g139582 = float3( 0,0,0 );
				float4 Out_VertexData15_g139582 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g139582 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g139582 = Data15_g139582.Dummy;
				Out_PositionWS15_g139582 = Data15_g139582.PositionWS;
				Out_PositionWO15_g139582 = Data15_g139582.PositionWO;
				Out_PivotWS15_g139582 = Data15_g139582.PivotWS;
				Out_PivotWO15_g139582 = Data15_g139582.PivotWO;
				Out_NormalWS15_g139582 = Data15_g139582.NormalWS;
				Out_ViewDirWS15_g139582 = Data15_g139582.ViewDirWS;
				Out_VertexData15_g139582 = Data15_g139582.VertexData;
				Out_BoundsData15_g139582 = Data15_g139582.BoundsData;
				}
				half3 Model_PositionWO636_g139565 = Out_PositionWO15_g139582;
				float3 temp_output_279_0_g139566 = Model_PositionWO636_g139565;
				half3 WorldPosition238_g139566 = temp_output_279_0_g139566;
				half4 localSamplePlanar2D238_g139566 = SamplePlanar2D( Texture238_g139566 , Sampler238_g139566 , Coords238_g139566 , WorldPosition238_g139566 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g139566) = _SecondAlbedoTex;
				SamplerState Sampler246_g139566 = SS19_g139579;
				half4 Coords246_g139566 = temp_output_37_0_g139566;
				half3 WorldPosition246_g139566 = temp_output_279_0_g139566;
				half3 Model_NormalWS869_g139565 = Out_NormalWS15_g139582;
				float3 temp_output_280_0_g139566 = Model_NormalWS869_g139565;
				half3 WorldNormal246_g139566 = temp_output_280_0_g139566;
				half4 localSamplePlanar3D246_g139566 = SamplePlanar3D( Texture246_g139566 , Sampler246_g139566 , Coords246_g139566 , WorldPosition246_g139566 , WorldNormal246_g139566 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g139566) = _SecondAlbedoTex;
				SamplerState Sampler234_g139566 = SS19_g139579;
				float4 Coords234_g139566 = temp_output_37_0_g139566;
				float3 WorldPosition234_g139566 = temp_output_279_0_g139566;
				float4 localSampleStochastic2D234_g139566 = SampleStochastic2D( Texture234_g139566 , Sampler234_g139566 , Coords234_g139566 , WorldPosition234_g139566 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g139566) = _SecondAlbedoTex;
				SamplerState Sampler263_g139566 = SS19_g139579;
				half4 Coords263_g139566 = temp_output_37_0_g139566;
				half3 WorldPosition263_g139566 = temp_output_279_0_g139566;
				half3 WorldNormal263_g139566 = temp_output_280_0_g139566;
				half4 localSampleStochastic3D263_g139566 = SampleStochastic3D( Texture263_g139566 , Sampler263_g139566 , Coords263_g139566 , WorldPosition263_g139566 , WorldNormal263_g139566 );
				#if defined( TVE_SECOND_SAMPLE_MAIN_UV )
				float4 staticSwitch693_g139565 = localSampleMain276_g139566;
				#elif defined( TVE_SECOND_SAMPLE_EXTRA_UV )
				float4 staticSwitch693_g139565 = localSampleExtra275_g139566;
				#elif defined( TVE_SECOND_SAMPLE_PLANAR_2D )
				float4 staticSwitch693_g139565 = localSamplePlanar2D238_g139566;
				#elif defined( TVE_SECOND_SAMPLE_PLANAR_3D )
				float4 staticSwitch693_g139565 = localSamplePlanar3D246_g139566;
				#elif defined( TVE_SECOND_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch693_g139565 = localSampleStochastic2D234_g139566;
				#elif defined( TVE_SECOND_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch693_g139565 = localSampleStochastic3D263_g139566;
				#else
				float4 staticSwitch693_g139565 = localSampleMain276_g139566;
				#endif
				half4 Local_AlbedoTex777_g139565 = staticSwitch693_g139565;
				float3 lerpResult716_g139565 = lerp( float3( 1,1,1 ) , (Local_AlbedoTex777_g139565).xyz , _SecondAlbedoValue);
				half3 Local_AlbedoRGB771_g139565 = lerpResult716_g139565;
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g139568) = _SecondShaderTex;
				float localFilterTexture30_g139581 = ( 0.0 );
				SamplerState SS30_g139581 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g139581 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g139581 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g139581 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g139581 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g139581 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g139581 = SamplerDefault30_g139581;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g139581 = SamplerDefault30_g139581;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g139581 = SamplerPoint30_g139581;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g139581 = SamplerLow30_g139581;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g139581 = SamplerMedium30_g139581;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g139581 = SamplerHigh30_g139581;
				#endif
				}
				SamplerState Sampler276_g139568 = SS30_g139581;
				float4 temp_output_37_0_g139568 = Local_LayerCoords790_g139565;
				half4 Coords276_g139568 = temp_output_37_0_g139568;
				half2 TexCoord276_g139568 = i.ase_texcoord.xy;
				half4 localSampleMain276_g139568 = SampleMain( Texture276_g139568 , Sampler276_g139568 , Coords276_g139568 , TexCoord276_g139568 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g139568) = _SecondShaderTex;
				SamplerState Sampler275_g139568 = SS30_g139581;
				half4 Coords275_g139568 = temp_output_37_0_g139568;
				half2 TexCoord275_g139568 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g139568 = SampleExtra( Texture275_g139568 , Sampler275_g139568 , Coords275_g139568 , TexCoord275_g139568 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g139568) = _SecondShaderTex;
				SamplerState Sampler238_g139568 = SS30_g139581;
				half4 Coords238_g139568 = temp_output_37_0_g139568;
				float3 temp_output_279_0_g139568 = Model_PositionWO636_g139565;
				half3 WorldPosition238_g139568 = temp_output_279_0_g139568;
				half4 localSamplePlanar2D238_g139568 = SamplePlanar2D( Texture238_g139568 , Sampler238_g139568 , Coords238_g139568 , WorldPosition238_g139568 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g139568) = _SecondShaderTex;
				SamplerState Sampler246_g139568 = SS30_g139581;
				half4 Coords246_g139568 = temp_output_37_0_g139568;
				half3 WorldPosition246_g139568 = temp_output_279_0_g139568;
				float3 temp_output_280_0_g139568 = Model_NormalWS869_g139565;
				half3 WorldNormal246_g139568 = temp_output_280_0_g139568;
				half4 localSamplePlanar3D246_g139568 = SamplePlanar3D( Texture246_g139568 , Sampler246_g139568 , Coords246_g139568 , WorldPosition246_g139568 , WorldNormal246_g139568 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g139568) = _SecondShaderTex;
				SamplerState Sampler234_g139568 = SS30_g139581;
				float4 Coords234_g139568 = temp_output_37_0_g139568;
				float3 WorldPosition234_g139568 = temp_output_279_0_g139568;
				float4 localSampleStochastic2D234_g139568 = SampleStochastic2D( Texture234_g139568 , Sampler234_g139568 , Coords234_g139568 , WorldPosition234_g139568 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g139568) = _SecondShaderTex;
				SamplerState Sampler263_g139568 = SS30_g139581;
				half4 Coords263_g139568 = temp_output_37_0_g139568;
				half3 WorldPosition263_g139568 = temp_output_279_0_g139568;
				half3 WorldNormal263_g139568 = temp_output_280_0_g139568;
				half4 localSampleStochastic3D263_g139568 = SampleStochastic3D( Texture263_g139568 , Sampler263_g139568 , Coords263_g139568 , WorldPosition263_g139568 , WorldNormal263_g139568 );
				#if defined( TVE_SECOND_SAMPLE_MAIN_UV )
				float4 staticSwitch722_g139565 = localSampleMain276_g139568;
				#elif defined( TVE_SECOND_SAMPLE_EXTRA_UV )
				float4 staticSwitch722_g139565 = localSampleExtra275_g139568;
				#elif defined( TVE_SECOND_SAMPLE_PLANAR_2D )
				float4 staticSwitch722_g139565 = localSamplePlanar2D238_g139568;
				#elif defined( TVE_SECOND_SAMPLE_PLANAR_3D )
				float4 staticSwitch722_g139565 = localSamplePlanar3D246_g139568;
				#elif defined( TVE_SECOND_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch722_g139565 = localSampleStochastic2D234_g139568;
				#elif defined( TVE_SECOND_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch722_g139565 = localSampleStochastic3D263_g139568;
				#else
				float4 staticSwitch722_g139565 = localSampleMain276_g139568;
				#endif
				half4 Local_ShaderTex775_g139565 = staticSwitch722_g139565;
				float clampResult17_g139599 = clamp( (Local_ShaderTex775_g139565).y , 0.0001 , 0.9999 );
				float temp_output_7_0_g139598 = _SecondOcclusionRemap.x;
				float temp_output_9_0_g139598 = ( clampResult17_g139599 - temp_output_7_0_g139598 );
				float lerpResult1058_g139565 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139598 * _SecondOcclusionRemap.z ) + 0.0001 ) ) , _SecondOcclusionValue);
				half Local_Occlusion1067_g139565 = lerpResult1058_g139565;
				float clampResult17_g139601 = clamp( (Local_ShaderTex775_g139565).w , 0.0001 , 0.9999 );
				float temp_output_7_0_g139600 = _SecondSmoothnessRemap.x;
				float temp_output_9_0_g139600 = ( clampResult17_g139601 - temp_output_7_0_g139600 );
				half Local_Smoothness1068_g139565 = ( saturate( ( ( temp_output_9_0_g139600 * _SecondSmoothnessRemap.z ) + 0.0001 ) ) * _SecondSmoothnessValue );
				float4 appendResult749_g139565 = (float4(( (Local_ShaderTex775_g139565).x * _SecondMetallicValue ) , Local_Occlusion1067_g139565 , (Local_ShaderTex775_g139565).z , Local_Smoothness1068_g139565));
				half4 Local_Masks750_g139565 = appendResult749_g139565;
				float clampResult17_g139602 = clamp( (Local_Masks750_g139565).z , 0.0001 , 0.9999 );
				float temp_output_7_0_g139605 = _SecondMultiRemap.x;
				float temp_output_9_0_g139605 = ( clampResult17_g139602 - temp_output_7_0_g139605 );
				float temp_output_765_0_g139565 = saturate( ( ( temp_output_9_0_g139605 * _SecondMultiRemap.z ) + 0.0001 ) );
				half Local_MultiMask767_g139565 = temp_output_765_0_g139565;
				float lerpResult705_g139565 = lerp( 1.0 , Local_MultiMask767_g139565 , _SecondColorMode);
				float4 lerpResult706_g139565 = lerp( _SecondColorTwo , _SecondColor , lerpResult705_g139565);
				half3 Local_ColorRGB774_g139565 = (lerpResult706_g139565).rgb;
				half3 Local_Albedo768_g139565 = ( Local_AlbedoRGB771_g139565 * Local_ColorRGB774_g139565 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g139576 = 2.0;
				#else
				float staticSwitch1_g139576 = 4.594794;
				#endif
				float3 lerpResult985_g139565 = lerp( Local_Albedo768_g139565 , ( Visual_Albedo527_g139565 * Local_Albedo768_g139565 * staticSwitch1_g139576 ) , _SecondBlendAlbedoValue);
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g139569) = _SecondMaskTex;
				SamplerState Sampler276_g139569 = sampler_Linear_Repeat;
				half4 Local_BlendCoords813_g139565 = _second_mask_coord_value;
				float4 temp_output_37_0_g139569 = Local_BlendCoords813_g139565;
				half4 Coords276_g139569 = temp_output_37_0_g139569;
				half2 TexCoord276_g139569 = i.ase_texcoord.xy;
				half4 localSampleMain276_g139569 = SampleMain( Texture276_g139569 , Sampler276_g139569 , Coords276_g139569 , TexCoord276_g139569 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g139569) = _SecondMaskTex;
				SamplerState Sampler275_g139569 = sampler_Linear_Repeat;
				half4 Coords275_g139569 = temp_output_37_0_g139569;
				half2 TexCoord275_g139569 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g139569 = SampleExtra( Texture275_g139569 , Sampler275_g139569 , Coords275_g139569 , TexCoord275_g139569 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g139569) = _SecondMaskTex;
				SamplerState Sampler238_g139569 = sampler_Linear_Repeat;
				half4 Coords238_g139569 = temp_output_37_0_g139569;
				float3 temp_output_279_0_g139569 = Model_PositionWO636_g139565;
				half3 WorldPosition238_g139569 = temp_output_279_0_g139569;
				half4 localSamplePlanar2D238_g139569 = SamplePlanar2D( Texture238_g139569 , Sampler238_g139569 , Coords238_g139569 , WorldPosition238_g139569 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g139569) = _SecondMaskTex;
				SamplerState Sampler246_g139569 = sampler_Linear_Repeat;
				half4 Coords246_g139569 = temp_output_37_0_g139569;
				half3 WorldPosition246_g139569 = temp_output_279_0_g139569;
				float3 temp_output_280_0_g139569 = Model_NormalWS869_g139565;
				half3 WorldNormal246_g139569 = temp_output_280_0_g139569;
				half4 localSamplePlanar3D246_g139569 = SamplePlanar3D( Texture246_g139569 , Sampler246_g139569 , Coords246_g139569 , WorldPosition246_g139569 , WorldNormal246_g139569 );
				#if defined( TVE_SECOND_MASK_SAMPLE_MAIN_UV )
				float4 staticSwitch817_g139565 = localSampleMain276_g139569;
				#elif defined( TVE_SECOND_MASK_SAMPLE_EXTRA_UV )
				float4 staticSwitch817_g139565 = localSampleExtra275_g139569;
				#elif defined( TVE_SECOND_MASK_SAMPLE_PLANAR_2D )
				float4 staticSwitch817_g139565 = localSamplePlanar2D238_g139569;
				#elif defined( TVE_SECOND_MASK_SAMPLE_PLANAR_3D )
				float4 staticSwitch817_g139565 = localSamplePlanar3D246_g139569;
				#else
				float4 staticSwitch817_g139565 = localSampleMain276_g139569;
				#endif
				half4 Local_MaskTex861_g139565 = staticSwitch817_g139565;
				float clampResult17_g139585 = clamp( (Local_MaskTex861_g139565).z , 0.0001 , 0.9999 );
				float temp_output_7_0_g139589 = _SecondMaskRemap.x;
				float temp_output_9_0_g139589 = ( clampResult17_g139585 - temp_output_7_0_g139589 );
				float lerpResult1015_g139565 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139589 * _SecondMaskRemap.z ) + 0.0001 ) ) , _SecondMaskValue);
				half Blend_TexMask429_g139565 = lerpResult1015_g139565;
				half Visual_Luminosity1041_g139565 = Out_Luminosity4_g139573;
				float clampResult17_g139594 = clamp( Visual_Luminosity1041_g139565 , 0.0001 , 0.9999 );
				float temp_output_7_0_g139595 = _SecondLumaRemap.x;
				float temp_output_9_0_g139595 = ( clampResult17_g139594 - temp_output_7_0_g139595 );
				float lerpResult1036_g139565 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139595 * _SecondLumaRemap.z ) + 0.0001 ) ) , _SecondLumaValue);
				half Blend_LumaMask1033_g139565 = lerpResult1036_g139565;
				half3 Visual_NormalWS951_g139565 = Out_NormalWS4_g139573;
				float clampResult17_g139590 = clamp( saturate( (Visual_NormalWS951_g139565).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g139592 = _SecondProjRemap.x;
				float temp_output_9_0_g139592 = ( clampResult17_g139590 - temp_output_7_0_g139592 );
				float lerpResult996_g139565 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139592 * _SecondProjRemap.z ) + 0.0001 ) ) , _SecondProjValue);
				half Blend_ProjMask434_g139565 = lerpResult996_g139565;
				half4 Model_VertexMasks964_g139565 = Out_VertexData15_g139582;
				float4 break965_g139565 = Model_VertexMasks964_g139565;
				float4 break33_g139586 = _second_vert_mode;
				float temp_output_30_0_g139586 = ( break965_g139565.x * break33_g139586.x );
				float temp_output_29_0_g139586 = ( break965_g139565.y * break33_g139586.y );
				float temp_output_31_0_g139586 = ( break965_g139565.z * break33_g139586.z );
				float temp_output_28_0_g139586 = ( temp_output_30_0_g139586 + temp_output_29_0_g139586 + temp_output_31_0_g139586 + ( break965_g139565.w * break33_g139586.w ) );
				float clampResult17_g139584 = clamp( temp_output_28_0_g139586 , 0.0001 , 0.9999 );
				float temp_output_7_0_g139588 = _SecondMeshRemap.x;
				float temp_output_9_0_g139588 = ( clampResult17_g139584 - temp_output_7_0_g139588 );
				float lerpResult1017_g139565 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139588 * _SecondMeshRemap.z ) + 0.0001 ) ) , _SecondMeshValue);
				float temp_output_6_0_g139587 = lerpResult1017_g139565;
				#ifdef TVE_DUMMY
				float staticSwitch14_g139587 = ( temp_output_6_0_g139587 + _SecondMeshMode );
				#else
				float staticSwitch14_g139587 = temp_output_6_0_g139587;
				#endif
				half Blend_VertMask918_g139565 = staticSwitch14_g139587;
				half Blend_GlobalMask972_g139565 = 1.0;
				float clampResult17_g139591 = clamp( ( _SecondIntensityValue * Blend_TexMask429_g139565 * Blend_LumaMask1033_g139565 * Blend_ProjMask434_g139565 * Blend_VertMask918_g139565 * Blend_GlobalMask972_g139565 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g139593 = _SecondBlendRemap.x;
				float temp_output_9_0_g139593 = ( clampResult17_g139591 - temp_output_7_0_g139593 );
				half Blend_Mask412_g139565 = ( saturate( ( ( temp_output_9_0_g139593 * _SecondBlendRemap.z ) + 0.0001 ) ) * _SecondBlendIntensityValue );
				float3 lerpResult403_g139565 = lerp( Visual_Albedo527_g139565 , lerpResult985_g139565 , Blend_Mask412_g139565);
				#ifdef TVE_SECOND
				float3 staticSwitch415_g139565 = lerpResult403_g139565;
				#else
				float3 staticSwitch415_g139565 = Visual_Albedo527_g139565;
				#endif
				half3 Final_Albedo601_g139565 = staticSwitch415_g139565;
				float3 In_Albedo3_g139583 = Final_Albedo601_g139565;
				float3 In_AlbedoRaw3_g139583 = Final_Albedo601_g139565;
				half2 Visual_NormalTS529_g139565 = Out_NormalTS4_g139573;
				float2 lerpResult40_g139574 = lerp( float2( 0,0 ) , Visual_NormalTS529_g139565 , _SecondBlendNormalValue);
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g139567) = _SecondNormalTex;
				float localFilterTexture29_g139580 = ( 0.0 );
				SamplerState SS29_g139580 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g139580 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g139580 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g139580 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g139580 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g139580 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g139580 = SamplerDefault29_g139580;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g139580 = SamplerDefault29_g139580;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g139580 = SamplerPoint29_g139580;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g139580 = SamplerLow29_g139580;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g139580 = SamplerMedium29_g139580;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g139580 = SamplerHigh29_g139580;
				#endif
				}
				SamplerState Sampler276_g139567 = SS29_g139580;
				float4 temp_output_37_0_g139567 = Local_LayerCoords790_g139565;
				half4 Coords276_g139567 = temp_output_37_0_g139567;
				half2 TexCoord276_g139567 = i.ase_texcoord.xy;
				half4 localSampleMain276_g139567 = SampleMain( Texture276_g139567 , Sampler276_g139567 , Coords276_g139567 , TexCoord276_g139567 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g139567) = _SecondNormalTex;
				SamplerState Sampler275_g139567 = SS29_g139580;
				half4 Coords275_g139567 = temp_output_37_0_g139567;
				half2 TexCoord275_g139567 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g139567 = SampleExtra( Texture275_g139567 , Sampler275_g139567 , Coords275_g139567 , TexCoord275_g139567 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g139567) = _SecondNormalTex;
				SamplerState Sampler238_g139567 = SS29_g139580;
				half4 Coords238_g139567 = temp_output_37_0_g139567;
				float3 temp_output_279_0_g139567 = Model_PositionWO636_g139565;
				half3 WorldPosition238_g139567 = temp_output_279_0_g139567;
				half4 localSamplePlanar2D238_g139567 = SamplePlanar2D( Texture238_g139567 , Sampler238_g139567 , Coords238_g139567 , WorldPosition238_g139567 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g139567) = _SecondNormalTex;
				SamplerState Sampler246_g139567 = SS29_g139580;
				half4 Coords246_g139567 = temp_output_37_0_g139567;
				half3 WorldPosition246_g139567 = temp_output_279_0_g139567;
				float3 temp_output_280_0_g139567 = Model_NormalWS869_g139565;
				half3 WorldNormal246_g139567 = temp_output_280_0_g139567;
				half4 localSamplePlanar3D246_g139567 = SamplePlanar3D( Texture246_g139567 , Sampler246_g139567 , Coords246_g139567 , WorldPosition246_g139567 , WorldNormal246_g139567 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g139567) = _SecondNormalTex;
				SamplerState Sampler234_g139567 = SS29_g139580;
				float4 Coords234_g139567 = temp_output_37_0_g139567;
				float3 WorldPosition234_g139567 = temp_output_279_0_g139567;
				float4 localSampleStochastic2D234_g139567 = SampleStochastic2D( Texture234_g139567 , Sampler234_g139567 , Coords234_g139567 , WorldPosition234_g139567 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g139567) = _SecondNormalTex;
				SamplerState Sampler263_g139567 = SS29_g139580;
				half4 Coords263_g139567 = temp_output_37_0_g139567;
				half3 WorldPosition263_g139567 = temp_output_279_0_g139567;
				half3 WorldNormal263_g139567 = temp_output_280_0_g139567;
				half4 localSampleStochastic3D263_g139567 = SampleStochastic3D( Texture263_g139567 , Sampler263_g139567 , Coords263_g139567 , WorldPosition263_g139567 , WorldNormal263_g139567 );
				#if defined( TVE_SECOND_SAMPLE_MAIN_UV )
				float4 staticSwitch698_g139565 = localSampleMain276_g139567;
				#elif defined( TVE_SECOND_SAMPLE_EXTRA_UV )
				float4 staticSwitch698_g139565 = localSampleExtra275_g139567;
				#elif defined( TVE_SECOND_SAMPLE_PLANAR_2D )
				float4 staticSwitch698_g139565 = localSamplePlanar2D238_g139567;
				#elif defined( TVE_SECOND_SAMPLE_PLANAR_3D )
				float4 staticSwitch698_g139565 = localSamplePlanar3D246_g139567;
				#elif defined( TVE_SECOND_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch698_g139565 = localSampleStochastic2D234_g139567;
				#elif defined( TVE_SECOND_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch698_g139565 = localSampleStochastic3D263_g139567;
				#else
				float4 staticSwitch698_g139565 = localSampleMain276_g139567;
				#endif
				half4 Local_NormalTex776_g139565 = staticSwitch698_g139565;
				half4 Normal_Packed45_g139570 = Local_NormalTex776_g139565;
				float2 appendResult58_g139570 = (float2(( (Normal_Packed45_g139570).x * (Normal_Packed45_g139570).w ) , (Normal_Packed45_g139570).y));
				half2 Normal_Default50_g139570 = appendResult58_g139570;
				half2 Normal_ASTC41_g139570 = (Normal_Packed45_g139570).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g139570 = Normal_ASTC41_g139570;
				#else
				float2 staticSwitch38_g139570 = Normal_Default50_g139570;
				#endif
				half2 Normal_NO_DTX544_g139570 = (Normal_Packed45_g139570).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g139570 = Normal_NO_DTX544_g139570;
				#else
				float2 staticSwitch37_g139570 = staticSwitch38_g139570;
				#endif
				float2 temp_output_724_0_g139565 = ( (staticSwitch37_g139570*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g139571 = temp_output_724_0_g139565;
				float2 break71_g139571 = Normal_Planar45_g139571;
				float3 appendResult72_g139571 = (float3(break71_g139571.x , 0.0 , break71_g139571.y));
				float2 temp_output_858_0_g139565 = (mul( ase_worldToTangent, appendResult72_g139571 )).xy;
				#if defined( TVE_SECOND_SAMPLE_MAIN_UV )
				float2 staticSwitch727_g139565 = temp_output_724_0_g139565;
				#elif defined( TVE_SECOND_SAMPLE_EXTRA_UV )
				float2 staticSwitch727_g139565 = temp_output_724_0_g139565;
				#elif defined( TVE_SECOND_SAMPLE_PLANAR_2D )
				float2 staticSwitch727_g139565 = temp_output_858_0_g139565;
				#elif defined( TVE_SECOND_SAMPLE_PLANAR_3D )
				float2 staticSwitch727_g139565 = temp_output_858_0_g139565;
				#elif defined( TVE_SECOND_SAMPLE_STOCHASTIC_2D )
				float2 staticSwitch727_g139565 = temp_output_858_0_g139565;
				#elif defined( TVE_SECOND_SAMPLE_STOCHASTIC_3D )
				float2 staticSwitch727_g139565 = temp_output_858_0_g139565;
				#else
				float2 staticSwitch727_g139565 = temp_output_724_0_g139565;
				#endif
				half2 Local_NormalTS729_g139565 = staticSwitch727_g139565;
				float2 temp_output_36_0_g139574 = ( lerpResult40_g139574 + Local_NormalTS729_g139565 );
				float2 lerpResult405_g139565 = lerp( Visual_NormalTS529_g139565 , temp_output_36_0_g139574 , Blend_Mask412_g139565);
				#ifdef TVE_SECOND
				float2 staticSwitch418_g139565 = lerpResult405_g139565;
				#else
				float2 staticSwitch418_g139565 = Visual_NormalTS529_g139565;
				#endif
				half2 Final_NormalTS612_g139565 = staticSwitch418_g139565;
				float2 In_NormalTS3_g139583 = Final_NormalTS612_g139565;
				float3 appendResult68_g139575 = (float3(Final_NormalTS612_g139565 , 1.0));
				float3 tanNormal74_g139575 = appendResult68_g139575;
				float3 worldNormal74_g139575 = normalize( float3( dot( tanToWorld0, tanNormal74_g139575 ), dot( tanToWorld1, tanNormal74_g139575 ), dot( tanToWorld2, tanNormal74_g139575 ) ) );
				half3 Final_NormalWS950_g139565 = worldNormal74_g139575;
				float3 In_NormalWS3_g139583 = Final_NormalWS950_g139565;
				half4 Visual_Shader531_g139565 = Out_Shader4_g139573;
				float4 lerpResult994_g139565 = lerp( Local_Masks750_g139565 , ( Visual_Shader531_g139565 * Local_Masks750_g139565 ) , _SecondBlendShaderValue);
				float4 lerpResult440_g139565 = lerp( Visual_Shader531_g139565 , lerpResult994_g139565 , Blend_Mask412_g139565);
				#ifdef TVE_SECOND
				float4 staticSwitch451_g139565 = lerpResult440_g139565;
				#else
				float4 staticSwitch451_g139565 = Visual_Shader531_g139565;
				#endif
				half4 Final_Masks613_g139565 = staticSwitch451_g139565;
				float4 In_Shader3_g139583 = Final_Masks613_g139565;
				float4 In_Emissive3_g139583 = Out_Emissive4_g139573;
				float3 temp_output_3_0_g139577 = Final_Albedo601_g139565;
				float dotResult20_g139577 = dot( temp_output_3_0_g139577 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Final_Grayscale615_g139565 = dotResult20_g139577;
				float In_Grayscale3_g139583 = Final_Grayscale615_g139565;
				float clampResult651_g139565 = clamp( saturate( ( Final_Grayscale615_g139565 * 5.0 ) ) , 0.2 , 1.0 );
				half Final_Luminosity652_g139565 = clampResult651_g139565;
				float In_Luminosity3_g139583 = Final_Luminosity652_g139565;
				half Visual_MultiMask547_g139565 = Out_MultiMask4_g139573;
				float lerpResult477_g139565 = lerp( Visual_MultiMask547_g139565 , Local_MultiMask767_g139565 , Blend_Mask412_g139565);
				#ifdef TVE_SECOND
				float staticSwitch482_g139565 = lerpResult477_g139565;
				#else
				float staticSwitch482_g139565 = Visual_MultiMask547_g139565;
				#endif
				half Final_MultiMask572_g139565 = staticSwitch482_g139565;
				float In_MultiMask3_g139583 = Final_MultiMask572_g139565;
				half Visual_AlphaClip559_g139565 = Out_AlphaClip4_g139573;
				float temp_output_718_0_g139565 = (Local_AlbedoTex777_g139565).w;
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch932_g139565 = ( temp_output_718_0_g139565 - _SecondAlphaClipValue );
				#else
				float staticSwitch932_g139565 = temp_output_718_0_g139565;
				#endif
				half Local_AlphaClip772_g139565 = staticSwitch932_g139565;
				float lerpResult448_g139565 = lerp( Visual_AlphaClip559_g139565 , Local_AlphaClip772_g139565 , Blend_Mask412_g139565);
				#ifdef TVE_SECOND
				float staticSwitch564_g139565 = lerpResult448_g139565;
				#else
				float staticSwitch564_g139565 = Visual_AlphaClip559_g139565;
				#endif
				half Final_AlphaClip602_g139565 = staticSwitch564_g139565;
				float In_AlphaClip3_g139583 = Final_AlphaClip602_g139565;
				half Visual_AlphaFade588_g139565 = Out_AlphaFade4_g139573;
				half Local_AlphaFade773_g139565 = (lerpResult706_g139565).a;
				float lerpResult604_g139565 = lerp( Visual_AlphaFade588_g139565 , Local_AlphaFade773_g139565 , Blend_Mask412_g139565);
				#ifdef TVE_SECOND
				float staticSwitch608_g139565 = lerpResult604_g139565;
				#else
				float staticSwitch608_g139565 = Visual_AlphaFade588_g139565;
				#endif
				half Final_AlphaFade611_g139565 = staticSwitch608_g139565;
				float In_AlphaFade3_g139583 = Final_AlphaFade611_g139565;
				float3 In_Translucency3_g139583 = Out_Translucency4_g139573;
				float In_Transmission3_g139583 = Out_Transmission4_g139573;
				float In_Thickness3_g139583 = Out_Thickness4_g139573;
				float In_Diffusion3_g139583 = Out_Diffusion4_g139573;
				float In_Depth3_g139583 = Out_Depth4_g139573;
				{
				Data3_g139583.Dummy = In_Dummy3_g139583;
				Data3_g139583.Albedo = In_Albedo3_g139583;
				Data3_g139583.AlbedoRaw = In_AlbedoRaw3_g139583;
				Data3_g139583.NormalTS = In_NormalTS3_g139583;
				Data3_g139583.NormalWS = In_NormalWS3_g139583;
				Data3_g139583.Shader = In_Shader3_g139583;
				Data3_g139583.Emissive= In_Emissive3_g139583;
				Data3_g139583.MultiMask = In_MultiMask3_g139583;
				Data3_g139583.Grayscale = In_Grayscale3_g139583;
				Data3_g139583.Luminosity = In_Luminosity3_g139583;
				Data3_g139583.AlphaClip = In_AlphaClip3_g139583;
				Data3_g139583.AlphaFade = In_AlphaFade3_g139583;
				Data3_g139583.Translucency = In_Translucency3_g139583;
				Data3_g139583.Transmission = In_Transmission3_g139583;
				Data3_g139583.Thickness = In_Thickness3_g139583;
				Data3_g139583.Diffusion = In_Diffusion3_g139583;
				Data3_g139583.Depth = In_Depth3_g139583;
				}
				TVEVisualData DataB25_g139606 = Data3_g139583;
				float Alpha25_g139606 = _SecondBakeMode;
				{
				if (Alpha25_g139606 < 0.5 )
				{
				Data25_g139606 = DataA25_g139606;
				}
				else
				{
				Data25_g139606 = DataB25_g139606;
				}
				}
				TVEVisualData DataA25_g139647 = Data25_g139606;
				float localCompData3_g139615 = ( 0.0 );
				TVEVisualData Data3_g139615 = (TVEVisualData)0;
				half4 Dummy944_g139607 = ( ( _DetailCategory + _DetailEnd ) + ( _ThirdSampleMode + _ThirdCoordMode + _ThirdCoordValue ) + ( _ThirdMaskSampleMode + _ThirdMaskCoordMode + _ThirdMaskCoordValue ) + _ThirdBakeMode );
				float In_Dummy3_g139615 = Dummy944_g139607.x;
				float localBreakData4_g139614 = ( 0.0 );
				TVEVisualData Data4_g139614 = Data25_g139606;
				float Out_Dummy4_g139614 = 0;
				float3 Out_Albedo4_g139614 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g139614 = float3( 0,0,0 );
				float2 Out_NormalTS4_g139614 = float2( 0,0 );
				float3 Out_NormalWS4_g139614 = float3( 0,0,0 );
				float4 Out_Shader4_g139614 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g139614 = float4( 0,0,0,0 );
				float Out_MultiMask4_g139614 = 0;
				float Out_Grayscale4_g139614 = 0;
				float Out_Luminosity4_g139614 = 0;
				float Out_AlphaClip4_g139614 = 0;
				float Out_AlphaFade4_g139614 = 0;
				float3 Out_Translucency4_g139614 = float3( 0,0,0 );
				float Out_Transmission4_g139614 = 0;
				float Out_Thickness4_g139614 = 0;
				float Out_Diffusion4_g139614 = 0;
				float Out_Depth4_g139614 = 0;
				{
				Out_Dummy4_g139614 = Data4_g139614.Dummy;
				Out_Albedo4_g139614 = Data4_g139614.Albedo;
				Out_AlbedoRaw4_g139614 = Data4_g139614.AlbedoRaw;
				Out_NormalTS4_g139614 = Data4_g139614.NormalTS;
				Out_NormalWS4_g139614 = Data4_g139614.NormalWS;
				Out_Shader4_g139614 = Data4_g139614.Shader;
				Out_Emissive4_g139614= Data4_g139614.Emissive;
				Out_MultiMask4_g139614 = Data4_g139614.MultiMask;
				Out_Grayscale4_g139614 = Data4_g139614.Grayscale;
				Out_Luminosity4_g139614= Data4_g139614.Luminosity;
				Out_AlphaClip4_g139614 = Data4_g139614.AlphaClip;
				Out_AlphaFade4_g139614 = Data4_g139614.AlphaFade;
				Out_Translucency4_g139614 = Data4_g139614.Translucency;
				Out_Transmission4_g139614 = Data4_g139614.Transmission;
				Out_Thickness4_g139614 = Data4_g139614.Thickness;
				Out_Diffusion4_g139614 = Data4_g139614.Diffusion;
				Out_Depth4_g139614= Data4_g139614.Depth;
				}
				half3 Visual_Albedo527_g139607 = Out_Albedo4_g139614;
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g139608) = _ThirdAlbedoTex;
				float localFilterTexture19_g139623 = ( 0.0 );
				SamplerState SS19_g139623 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g139623 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g139623 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g139623 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g139623 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g139623 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g139623 = SamplerDefault19_g139623;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g139623 = SamplerDefault19_g139623;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g139623 = SamplerPoint19_g139623;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g139623 = SamplerLow19_g139623;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g139623 = SamplerMedium19_g139623;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g139623 = SamplerHigh19_g139623;
				#endif
				}
				SamplerState Sampler276_g139608 = SS19_g139623;
				half4 Local_LayerCoords790_g139607 = _third_coord_value;
				float4 temp_output_37_0_g139608 = Local_LayerCoords790_g139607;
				half4 Coords276_g139608 = temp_output_37_0_g139608;
				half2 TexCoord276_g139608 = i.ase_texcoord.xy;
				half4 localSampleMain276_g139608 = SampleMain( Texture276_g139608 , Sampler276_g139608 , Coords276_g139608 , TexCoord276_g139608 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g139608) = _ThirdAlbedoTex;
				SamplerState Sampler275_g139608 = SS19_g139623;
				half4 Coords275_g139608 = temp_output_37_0_g139608;
				half2 TexCoord275_g139608 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g139608 = SampleExtra( Texture275_g139608 , Sampler275_g139608 , Coords275_g139608 , TexCoord275_g139608 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g139608) = _ThirdAlbedoTex;
				SamplerState Sampler238_g139608 = SS19_g139623;
				half4 Coords238_g139608 = temp_output_37_0_g139608;
				TVEModelData Data15_g139626 = Data16_g76831;
				float Out_Dummy15_g139626 = 0;
				float3 Out_PositionWS15_g139626 = float3( 0,0,0 );
				float3 Out_PositionWO15_g139626 = float3( 0,0,0 );
				float3 Out_PivotWS15_g139626 = float3( 0,0,0 );
				float3 Out_PivotWO15_g139626 = float3( 0,0,0 );
				float3 Out_NormalWS15_g139626 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g139626 = float3( 0,0,0 );
				float4 Out_VertexData15_g139626 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g139626 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g139626 = Data15_g139626.Dummy;
				Out_PositionWS15_g139626 = Data15_g139626.PositionWS;
				Out_PositionWO15_g139626 = Data15_g139626.PositionWO;
				Out_PivotWS15_g139626 = Data15_g139626.PivotWS;
				Out_PivotWO15_g139626 = Data15_g139626.PivotWO;
				Out_NormalWS15_g139626 = Data15_g139626.NormalWS;
				Out_ViewDirWS15_g139626 = Data15_g139626.ViewDirWS;
				Out_VertexData15_g139626 = Data15_g139626.VertexData;
				Out_BoundsData15_g139626 = Data15_g139626.BoundsData;
				}
				half3 Model_PositionWO636_g139607 = Out_PositionWO15_g139626;
				float3 temp_output_279_0_g139608 = Model_PositionWO636_g139607;
				half3 WorldPosition238_g139608 = temp_output_279_0_g139608;
				half4 localSamplePlanar2D238_g139608 = SamplePlanar2D( Texture238_g139608 , Sampler238_g139608 , Coords238_g139608 , WorldPosition238_g139608 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g139608) = _ThirdAlbedoTex;
				SamplerState Sampler246_g139608 = SS19_g139623;
				half4 Coords246_g139608 = temp_output_37_0_g139608;
				half3 WorldPosition246_g139608 = temp_output_279_0_g139608;
				half3 Model_NormalWS869_g139607 = Out_NormalWS15_g139626;
				float3 temp_output_280_0_g139608 = Model_NormalWS869_g139607;
				half3 WorldNormal246_g139608 = temp_output_280_0_g139608;
				half4 localSamplePlanar3D246_g139608 = SamplePlanar3D( Texture246_g139608 , Sampler246_g139608 , Coords246_g139608 , WorldPosition246_g139608 , WorldNormal246_g139608 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g139608) = _ThirdAlbedoTex;
				SamplerState Sampler234_g139608 = SS19_g139623;
				float4 Coords234_g139608 = temp_output_37_0_g139608;
				float3 WorldPosition234_g139608 = temp_output_279_0_g139608;
				float4 localSampleStochastic2D234_g139608 = SampleStochastic2D( Texture234_g139608 , Sampler234_g139608 , Coords234_g139608 , WorldPosition234_g139608 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g139608) = _ThirdAlbedoTex;
				SamplerState Sampler263_g139608 = SS19_g139623;
				half4 Coords263_g139608 = temp_output_37_0_g139608;
				half3 WorldPosition263_g139608 = temp_output_279_0_g139608;
				half3 WorldNormal263_g139608 = temp_output_280_0_g139608;
				half4 localSampleStochastic3D263_g139608 = SampleStochastic3D( Texture263_g139608 , Sampler263_g139608 , Coords263_g139608 , WorldPosition263_g139608 , WorldNormal263_g139608 );
				#if defined( TVE_THIRD_SAMPLE_MAIN_UV )
				float4 staticSwitch693_g139607 = localSampleMain276_g139608;
				#elif defined( TVE_THIRD_SAMPLE_EXTRA_UV )
				float4 staticSwitch693_g139607 = localSampleExtra275_g139608;
				#elif defined( TVE_THIRD_SAMPLE_PLANAR_2D )
				float4 staticSwitch693_g139607 = localSamplePlanar2D238_g139608;
				#elif defined( TVE_THIRD_SAMPLE_PLANAR_3D )
				float4 staticSwitch693_g139607 = localSamplePlanar3D246_g139608;
				#elif defined( TVE_THIRD_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch693_g139607 = localSampleStochastic2D234_g139608;
				#elif defined( TVE_THIRD_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch693_g139607 = localSampleStochastic3D263_g139608;
				#else
				float4 staticSwitch693_g139607 = localSampleMain276_g139608;
				#endif
				half4 Local_AlbedoTex777_g139607 = staticSwitch693_g139607;
				float3 lerpResult716_g139607 = lerp( float3( 1,1,1 ) , (Local_AlbedoTex777_g139607).xyz , _ThirdAlbedoValue);
				half3 Local_AlbedoRGB771_g139607 = lerpResult716_g139607;
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g139610) = _ThirdShaderTex;
				float localFilterTexture30_g139625 = ( 0.0 );
				SamplerState SS30_g139625 = sampler_Linear_Repeat;
				SamplerState SamplerDefault30_g139625 = sampler_Linear_Repeat;
				SamplerState SamplerPoint30_g139625 = sampler_Point_Repeat;
				SamplerState SamplerLow30_g139625 = sampler_Linear_Repeat;
				SamplerState SamplerMedium30_g139625 = sampler_Linear_Repeat;
				SamplerState SamplerHigh30_g139625 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS30_g139625 = SamplerDefault30_g139625;
				#if defined (TVE_FILTER_DEFAULT)
				    SS30_g139625 = SamplerDefault30_g139625;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS30_g139625 = SamplerPoint30_g139625;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS30_g139625 = SamplerLow30_g139625;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS30_g139625 = SamplerMedium30_g139625;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS30_g139625 = SamplerHigh30_g139625;
				#endif
				}
				SamplerState Sampler276_g139610 = SS30_g139625;
				float4 temp_output_37_0_g139610 = Local_LayerCoords790_g139607;
				half4 Coords276_g139610 = temp_output_37_0_g139610;
				half2 TexCoord276_g139610 = i.ase_texcoord.xy;
				half4 localSampleMain276_g139610 = SampleMain( Texture276_g139610 , Sampler276_g139610 , Coords276_g139610 , TexCoord276_g139610 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g139610) = _ThirdShaderTex;
				SamplerState Sampler275_g139610 = SS30_g139625;
				half4 Coords275_g139610 = temp_output_37_0_g139610;
				half2 TexCoord275_g139610 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g139610 = SampleExtra( Texture275_g139610 , Sampler275_g139610 , Coords275_g139610 , TexCoord275_g139610 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g139610) = _ThirdShaderTex;
				SamplerState Sampler238_g139610 = SS30_g139625;
				half4 Coords238_g139610 = temp_output_37_0_g139610;
				float3 temp_output_279_0_g139610 = Model_PositionWO636_g139607;
				half3 WorldPosition238_g139610 = temp_output_279_0_g139610;
				half4 localSamplePlanar2D238_g139610 = SamplePlanar2D( Texture238_g139610 , Sampler238_g139610 , Coords238_g139610 , WorldPosition238_g139610 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g139610) = _ThirdShaderTex;
				SamplerState Sampler246_g139610 = SS30_g139625;
				half4 Coords246_g139610 = temp_output_37_0_g139610;
				half3 WorldPosition246_g139610 = temp_output_279_0_g139610;
				float3 temp_output_280_0_g139610 = Model_NormalWS869_g139607;
				half3 WorldNormal246_g139610 = temp_output_280_0_g139610;
				half4 localSamplePlanar3D246_g139610 = SamplePlanar3D( Texture246_g139610 , Sampler246_g139610 , Coords246_g139610 , WorldPosition246_g139610 , WorldNormal246_g139610 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g139610) = _ThirdShaderTex;
				SamplerState Sampler234_g139610 = SS30_g139625;
				float4 Coords234_g139610 = temp_output_37_0_g139610;
				float3 WorldPosition234_g139610 = temp_output_279_0_g139610;
				float4 localSampleStochastic2D234_g139610 = SampleStochastic2D( Texture234_g139610 , Sampler234_g139610 , Coords234_g139610 , WorldPosition234_g139610 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g139610) = _ThirdShaderTex;
				SamplerState Sampler263_g139610 = SS30_g139625;
				half4 Coords263_g139610 = temp_output_37_0_g139610;
				half3 WorldPosition263_g139610 = temp_output_279_0_g139610;
				half3 WorldNormal263_g139610 = temp_output_280_0_g139610;
				half4 localSampleStochastic3D263_g139610 = SampleStochastic3D( Texture263_g139610 , Sampler263_g139610 , Coords263_g139610 , WorldPosition263_g139610 , WorldNormal263_g139610 );
				#if defined( TVE_THIRD_SAMPLE_MAIN_UV )
				float4 staticSwitch722_g139607 = localSampleMain276_g139610;
				#elif defined( TVE_THIRD_SAMPLE_EXTRA_UV )
				float4 staticSwitch722_g139607 = localSampleExtra275_g139610;
				#elif defined( TVE_THIRD_SAMPLE_PLANAR_2D )
				float4 staticSwitch722_g139607 = localSamplePlanar2D238_g139610;
				#elif defined( TVE_THIRD_SAMPLE_PLANAR_3D )
				float4 staticSwitch722_g139607 = localSamplePlanar3D246_g139610;
				#elif defined( TVE_THIRD_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch722_g139607 = localSampleStochastic2D234_g139610;
				#elif defined( TVE_THIRD_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch722_g139607 = localSampleStochastic3D263_g139610;
				#else
				float4 staticSwitch722_g139607 = localSampleMain276_g139610;
				#endif
				half4 Local_ShaderTex775_g139607 = staticSwitch722_g139607;
				float clampResult17_g139644 = clamp( (Local_ShaderTex775_g139607).y , 0.0001 , 0.9999 );
				float temp_output_7_0_g139643 = _ThirdOcclusionRemap.x;
				float temp_output_9_0_g139643 = ( clampResult17_g139644 - temp_output_7_0_g139643 );
				float lerpResult1072_g139607 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139643 * _ThirdOcclusionRemap.z ) + 0.0001 ) ) , _ThirdOcclusionValue);
				half Local_Occlusion1084_g139607 = lerpResult1072_g139607;
				float clampResult17_g139646 = clamp( (Local_ShaderTex775_g139607).w , 0.0001 , 0.9999 );
				float temp_output_7_0_g139645 = _ThirdSmoothnessRemap.x;
				float temp_output_9_0_g139645 = ( clampResult17_g139646 - temp_output_7_0_g139645 );
				half Local_Smoothness1085_g139607 = ( saturate( ( ( temp_output_9_0_g139645 * _ThirdSmoothnessRemap.z ) + 0.0001 ) ) * _ThirdSmoothnessValue );
				float4 appendResult749_g139607 = (float4(( (Local_ShaderTex775_g139607).x * _ThirdMetallicValue ) , Local_Occlusion1084_g139607 , (Local_ShaderTex775_g139607).z , Local_Smoothness1085_g139607));
				half4 Local_Masks750_g139607 = appendResult749_g139607;
				float clampResult17_g139641 = clamp( (Local_Masks750_g139607).z , 0.0001 , 0.9999 );
				float temp_output_7_0_g139642 = _ThirdMultiRemap.x;
				float temp_output_9_0_g139642 = ( clampResult17_g139641 - temp_output_7_0_g139642 );
				float temp_output_765_0_g139607 = saturate( ( ( temp_output_9_0_g139642 * _ThirdMultiRemap.z ) + 0.0001 ) );
				half Local_MultiMask767_g139607 = temp_output_765_0_g139607;
				float lerpResult705_g139607 = lerp( 1.0 , Local_MultiMask767_g139607 , _ThirdColorMode);
				float4 lerpResult706_g139607 = lerp( _ThirdColorTwo , _ThirdColor , lerpResult705_g139607);
				half3 Local_ColorRGB774_g139607 = (lerpResult706_g139607).rgb;
				half3 Local_Albedo768_g139607 = ( Local_AlbedoRGB771_g139607 * Local_ColorRGB774_g139607 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g139619 = 2.0;
				#else
				float staticSwitch1_g139619 = 4.594794;
				#endif
				float3 lerpResult985_g139607 = lerp( Local_Albedo768_g139607 , ( Visual_Albedo527_g139607 * Local_Albedo768_g139607 * staticSwitch1_g139619 ) , _ThirdBlendAlbedoValue);
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g139621) = _ThirdMaskTex;
				SamplerState Sampler276_g139621 = sampler_Linear_Repeat;
				half4 Local_MaskCoords813_g139607 = _third_mask_coord_value;
				float4 temp_output_37_0_g139621 = Local_MaskCoords813_g139607;
				half4 Coords276_g139621 = temp_output_37_0_g139621;
				half2 TexCoord276_g139621 = i.ase_texcoord.xy;
				half4 localSampleMain276_g139621 = SampleMain( Texture276_g139621 , Sampler276_g139621 , Coords276_g139621 , TexCoord276_g139621 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g139621) = _ThirdMaskTex;
				SamplerState Sampler275_g139621 = sampler_Linear_Repeat;
				half4 Coords275_g139621 = temp_output_37_0_g139621;
				half2 TexCoord275_g139621 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g139621 = SampleExtra( Texture275_g139621 , Sampler275_g139621 , Coords275_g139621 , TexCoord275_g139621 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g139621) = _ThirdMaskTex;
				SamplerState Sampler238_g139621 = sampler_Linear_Repeat;
				half4 Coords238_g139621 = temp_output_37_0_g139621;
				float3 temp_output_279_0_g139621 = Model_PositionWO636_g139607;
				half3 WorldPosition238_g139621 = temp_output_279_0_g139621;
				half4 localSamplePlanar2D238_g139621 = SamplePlanar2D( Texture238_g139621 , Sampler238_g139621 , Coords238_g139621 , WorldPosition238_g139621 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g139621) = _ThirdMaskTex;
				SamplerState Sampler246_g139621 = sampler_Linear_Repeat;
				half4 Coords246_g139621 = temp_output_37_0_g139621;
				half3 WorldPosition246_g139621 = temp_output_279_0_g139621;
				float3 temp_output_280_0_g139621 = Model_NormalWS869_g139607;
				half3 WorldNormal246_g139621 = temp_output_280_0_g139621;
				half4 localSamplePlanar3D246_g139621 = SamplePlanar3D( Texture246_g139621 , Sampler246_g139621 , Coords246_g139621 , WorldPosition246_g139621 , WorldNormal246_g139621 );
				#if defined( TVE_THIRD_MASK_SAMPLE_MAIN_UV )
				float4 staticSwitch817_g139607 = localSampleMain276_g139621;
				#elif defined( TVE_THIRD_MASK_SAMPLE_EXTRA_UV )
				float4 staticSwitch817_g139607 = localSampleExtra275_g139621;
				#elif defined( TVE_THIRD_MASK_SAMPLE_PLANAR_2D )
				float4 staticSwitch817_g139607 = localSamplePlanar2D238_g139621;
				#elif defined( TVE_THIRD_MASK_SAMPLE_PLANAR_3D )
				float4 staticSwitch817_g139607 = localSamplePlanar3D246_g139621;
				#else
				float4 staticSwitch817_g139607 = localSampleMain276_g139621;
				#endif
				half4 Local_MaskTex861_g139607 = staticSwitch817_g139607;
				float clampResult17_g139628 = clamp( (Local_MaskTex861_g139607).y , 0.0001 , 0.9999 );
				float temp_output_7_0_g139632 = _ThirdMaskRemap.x;
				float temp_output_9_0_g139632 = ( clampResult17_g139628 - temp_output_7_0_g139632 );
				float lerpResult1028_g139607 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139632 * _ThirdMaskRemap.z ) + 0.0001 ) ) , _ThirdMaskValue);
				half Detail_TexMask429_g139607 = lerpResult1028_g139607;
				half Visual_Luminosity1049_g139607 = Out_Luminosity4_g139614;
				float clampResult17_g139637 = clamp( Visual_Luminosity1049_g139607 , 0.0001 , 0.9999 );
				float temp_output_7_0_g139638 = _ThirdLumaRemap.x;
				float temp_output_9_0_g139638 = ( clampResult17_g139637 - temp_output_7_0_g139638 );
				float lerpResult1040_g139607 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139638 * _ThirdLumaRemap.z ) + 0.0001 ) ) , _ThirdLumaValue);
				half Blend_LumaMask1046_g139607 = lerpResult1040_g139607;
				half4 Model_VertexMasks960_g139607 = Out_VertexData15_g139626;
				float4 break961_g139607 = Model_VertexMasks960_g139607;
				float4 break33_g139629 = _third_vert_mode;
				float temp_output_30_0_g139629 = ( break961_g139607.x * break33_g139629.x );
				float temp_output_29_0_g139629 = ( break961_g139607.y * break33_g139629.y );
				float temp_output_31_0_g139629 = ( break961_g139607.z * break33_g139629.z );
				float temp_output_28_0_g139629 = ( temp_output_30_0_g139629 + temp_output_29_0_g139629 + temp_output_31_0_g139629 + ( break961_g139607.w * break33_g139629.w ) );
				float clampResult17_g139627 = clamp( temp_output_28_0_g139629 , 0.0001 , 0.9999 );
				float temp_output_7_0_g139631 = _ThirdMeshRemap.x;
				float temp_output_9_0_g139631 = ( clampResult17_g139627 - temp_output_7_0_g139631 );
				float lerpResult1026_g139607 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139631 * _ThirdMeshRemap.z ) + 0.0001 ) ) , _ThirdMeshValue);
				float temp_output_6_0_g139630 = lerpResult1026_g139607;
				#ifdef TVE_DUMMY
				float staticSwitch14_g139630 = ( temp_output_6_0_g139630 + _ThirdMeshMode );
				#else
				float staticSwitch14_g139630 = temp_output_6_0_g139630;
				#endif
				half Blend_VertMask913_g139607 = staticSwitch14_g139630;
				half3 Visual_NormalWS953_g139607 = Out_NormalWS4_g139614;
				float clampResult17_g139633 = clamp( saturate( (Visual_NormalWS953_g139607).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g139635 = _ThirdProjRemap.x;
				float temp_output_9_0_g139635 = ( clampResult17_g139633 - temp_output_7_0_g139635 );
				float lerpResult1004_g139607 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139635 * _ThirdProjRemap.z ) + 0.0001 ) ) , _ThirdProjValue);
				half Blend_ProjMask912_g139607 = lerpResult1004_g139607;
				half Blend_GlobalMask968_g139607 = 1.0;
				float clampResult17_g139634 = clamp( ( _ThirdIntensityValue * Detail_TexMask429_g139607 * Blend_LumaMask1046_g139607 * Blend_VertMask913_g139607 * Blend_ProjMask912_g139607 * Blend_GlobalMask968_g139607 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g139636 = _ThirdBlendRemap.x;
				float temp_output_9_0_g139636 = ( clampResult17_g139634 - temp_output_7_0_g139636 );
				half Detail_Mask412_g139607 = ( saturate( ( ( temp_output_9_0_g139636 * _ThirdBlendRemap.z ) + 0.0001 ) ) * _ThirdBlendIntensityValue );
				float3 lerpResult989_g139607 = lerp( Visual_Albedo527_g139607 , lerpResult985_g139607 , Detail_Mask412_g139607);
				#ifdef TVE_THIRD
				float3 staticSwitch415_g139607 = lerpResult989_g139607;
				#else
				float3 staticSwitch415_g139607 = Visual_Albedo527_g139607;
				#endif
				half3 Final_Albedo601_g139607 = staticSwitch415_g139607;
				float3 In_Albedo3_g139615 = Final_Albedo601_g139607;
				float3 In_AlbedoRaw3_g139615 = Final_Albedo601_g139607;
				half2 Visual_NormalTS529_g139607 = Out_NormalTS4_g139614;
				float2 lerpResult40_g139617 = lerp( float2( 0,0 ) , Visual_NormalTS529_g139607 , _ThirdBlendNormalValue);
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g139609) = _ThirdNormalTex;
				float localFilterTexture29_g139624 = ( 0.0 );
				SamplerState SS29_g139624 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g139624 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g139624 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g139624 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g139624 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g139624 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g139624 = SamplerDefault29_g139624;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g139624 = SamplerDefault29_g139624;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g139624 = SamplerPoint29_g139624;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g139624 = SamplerLow29_g139624;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g139624 = SamplerMedium29_g139624;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g139624 = SamplerHigh29_g139624;
				#endif
				}
				SamplerState Sampler276_g139609 = SS29_g139624;
				float4 temp_output_37_0_g139609 = Local_LayerCoords790_g139607;
				half4 Coords276_g139609 = temp_output_37_0_g139609;
				half2 TexCoord276_g139609 = i.ase_texcoord.xy;
				half4 localSampleMain276_g139609 = SampleMain( Texture276_g139609 , Sampler276_g139609 , Coords276_g139609 , TexCoord276_g139609 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g139609) = _ThirdNormalTex;
				SamplerState Sampler275_g139609 = SS29_g139624;
				half4 Coords275_g139609 = temp_output_37_0_g139609;
				half2 TexCoord275_g139609 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g139609 = SampleExtra( Texture275_g139609 , Sampler275_g139609 , Coords275_g139609 , TexCoord275_g139609 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g139609) = _ThirdNormalTex;
				SamplerState Sampler238_g139609 = SS29_g139624;
				half4 Coords238_g139609 = temp_output_37_0_g139609;
				float3 temp_output_279_0_g139609 = Model_PositionWO636_g139607;
				half3 WorldPosition238_g139609 = temp_output_279_0_g139609;
				half4 localSamplePlanar2D238_g139609 = SamplePlanar2D( Texture238_g139609 , Sampler238_g139609 , Coords238_g139609 , WorldPosition238_g139609 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g139609) = _ThirdNormalTex;
				SamplerState Sampler246_g139609 = SS29_g139624;
				half4 Coords246_g139609 = temp_output_37_0_g139609;
				half3 WorldPosition246_g139609 = temp_output_279_0_g139609;
				float3 temp_output_280_0_g139609 = Model_NormalWS869_g139607;
				half3 WorldNormal246_g139609 = temp_output_280_0_g139609;
				half4 localSamplePlanar3D246_g139609 = SamplePlanar3D( Texture246_g139609 , Sampler246_g139609 , Coords246_g139609 , WorldPosition246_g139609 , WorldNormal246_g139609 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g139609) = _ThirdNormalTex;
				SamplerState Sampler234_g139609 = SS29_g139624;
				float4 Coords234_g139609 = temp_output_37_0_g139609;
				float3 WorldPosition234_g139609 = temp_output_279_0_g139609;
				float4 localSampleStochastic2D234_g139609 = SampleStochastic2D( Texture234_g139609 , Sampler234_g139609 , Coords234_g139609 , WorldPosition234_g139609 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g139609) = _ThirdNormalTex;
				SamplerState Sampler263_g139609 = SS29_g139624;
				half4 Coords263_g139609 = temp_output_37_0_g139609;
				half3 WorldPosition263_g139609 = temp_output_279_0_g139609;
				half3 WorldNormal263_g139609 = temp_output_280_0_g139609;
				half4 localSampleStochastic3D263_g139609 = SampleStochastic3D( Texture263_g139609 , Sampler263_g139609 , Coords263_g139609 , WorldPosition263_g139609 , WorldNormal263_g139609 );
				#if defined( TVE_THIRD_SAMPLE_MAIN_UV )
				float4 staticSwitch698_g139607 = localSampleMain276_g139609;
				#elif defined( TVE_THIRD_SAMPLE_EXTRA_UV )
				float4 staticSwitch698_g139607 = localSampleExtra275_g139609;
				#elif defined( TVE_THIRD_SAMPLE_PLANAR_2D )
				float4 staticSwitch698_g139607 = localSamplePlanar2D238_g139609;
				#elif defined( TVE_THIRD_SAMPLE_PLANAR_3D )
				float4 staticSwitch698_g139607 = localSamplePlanar3D246_g139609;
				#elif defined( TVE_THIRD_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch698_g139607 = localSampleStochastic2D234_g139609;
				#elif defined( TVE_THIRD_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch698_g139607 = localSampleStochastic3D263_g139609;
				#else
				float4 staticSwitch698_g139607 = localSampleMain276_g139609;
				#endif
				half4 Local_NormalTex776_g139607 = staticSwitch698_g139607;
				half4 Normal_Packed45_g139611 = Local_NormalTex776_g139607;
				float2 appendResult58_g139611 = (float2(( (Normal_Packed45_g139611).x * (Normal_Packed45_g139611).w ) , (Normal_Packed45_g139611).y));
				half2 Normal_Default50_g139611 = appendResult58_g139611;
				half2 Normal_ASTC41_g139611 = (Normal_Packed45_g139611).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g139611 = Normal_ASTC41_g139611;
				#else
				float2 staticSwitch38_g139611 = Normal_Default50_g139611;
				#endif
				half2 Normal_NO_DTX544_g139611 = (Normal_Packed45_g139611).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g139611 = Normal_NO_DTX544_g139611;
				#else
				float2 staticSwitch37_g139611 = staticSwitch38_g139611;
				#endif
				float2 temp_output_724_0_g139607 = ( (staticSwitch37_g139611*2.0 + -1.0) * _ThirdNormalValue );
				half2 Normal_Planar45_g139612 = temp_output_724_0_g139607;
				float2 break71_g139612 = Normal_Planar45_g139612;
				float3 appendResult72_g139612 = (float3(break71_g139612.x , 0.0 , break71_g139612.y));
				float2 temp_output_858_0_g139607 = (mul( ase_worldToTangent, appendResult72_g139612 )).xy;
				#if defined( TVE_THIRD_SAMPLE_MAIN_UV )
				float2 staticSwitch727_g139607 = temp_output_724_0_g139607;
				#elif defined( TVE_THIRD_SAMPLE_EXTRA_UV )
				float2 staticSwitch727_g139607 = temp_output_724_0_g139607;
				#elif defined( TVE_THIRD_SAMPLE_PLANAR_2D )
				float2 staticSwitch727_g139607 = temp_output_858_0_g139607;
				#elif defined( TVE_THIRD_SAMPLE_PLANAR_3D )
				float2 staticSwitch727_g139607 = temp_output_858_0_g139607;
				#elif defined( TVE_THIRD_SAMPLE_STOCHASTIC_2D )
				float2 staticSwitch727_g139607 = temp_output_858_0_g139607;
				#elif defined( TVE_THIRD_SAMPLE_STOCHASTIC_3D )
				float2 staticSwitch727_g139607 = temp_output_858_0_g139607;
				#else
				float2 staticSwitch727_g139607 = temp_output_724_0_g139607;
				#endif
				half2 Local_NormalTS729_g139607 = staticSwitch727_g139607;
				float2 temp_output_36_0_g139617 = ( lerpResult40_g139617 + Local_NormalTS729_g139607 );
				float2 lerpResult405_g139607 = lerp( Visual_NormalTS529_g139607 , temp_output_36_0_g139617 , Detail_Mask412_g139607);
				#ifdef TVE_THIRD
				float2 staticSwitch418_g139607 = lerpResult405_g139607;
				#else
				float2 staticSwitch418_g139607 = Visual_NormalTS529_g139607;
				#endif
				half2 Final_NormalTS612_g139607 = staticSwitch418_g139607;
				float2 In_NormalTS3_g139615 = Final_NormalTS612_g139607;
				float3 appendResult68_g139618 = (float3(Final_NormalTS612_g139607 , 1.0));
				float3 tanNormal74_g139618 = appendResult68_g139618;
				float3 worldNormal74_g139618 = normalize( float3( dot( tanToWorld0, tanNormal74_g139618 ), dot( tanToWorld1, tanNormal74_g139618 ), dot( tanToWorld2, tanNormal74_g139618 ) ) );
				half3 Final_NormalWS956_g139607 = worldNormal74_g139618;
				float3 In_NormalWS3_g139615 = Final_NormalWS956_g139607;
				half4 Visual_Shader531_g139607 = Out_Shader4_g139614;
				float4 lerpResult1000_g139607 = lerp( Local_Masks750_g139607 , ( Visual_Shader531_g139607 * Local_Masks750_g139607 ) , _ThirdBlendShaderValue);
				float4 lerpResult998_g139607 = lerp( Visual_Shader531_g139607 , lerpResult1000_g139607 , Detail_Mask412_g139607);
				#ifdef TVE_THIRD
				float4 staticSwitch451_g139607 = lerpResult998_g139607;
				#else
				float4 staticSwitch451_g139607 = Visual_Shader531_g139607;
				#endif
				half4 Final_Masks613_g139607 = staticSwitch451_g139607;
				float4 In_Shader3_g139615 = Final_Masks613_g139607;
				float4 In_Emissive3_g139615 = Out_Emissive4_g139614;
				float3 temp_output_3_0_g139620 = Final_Albedo601_g139607;
				float dotResult20_g139620 = dot( temp_output_3_0_g139620 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Final_Grayscale615_g139607 = dotResult20_g139620;
				float In_Grayscale3_g139615 = Final_Grayscale615_g139607;
				float clampResult651_g139607 = clamp( saturate( ( Final_Grayscale615_g139607 * 5.0 ) ) , 0.2 , 1.0 );
				half Final_Luminosity652_g139607 = clampResult651_g139607;
				float In_Luminosity3_g139615 = Final_Luminosity652_g139607;
				half Visual_MultiMask547_g139607 = Out_MultiMask4_g139614;
				float lerpResult477_g139607 = lerp( Visual_MultiMask547_g139607 , Local_MultiMask767_g139607 , Detail_Mask412_g139607);
				#ifdef TVE_THIRD
				float staticSwitch482_g139607 = lerpResult477_g139607;
				#else
				float staticSwitch482_g139607 = Visual_MultiMask547_g139607;
				#endif
				half Final_MultiMask572_g139607 = staticSwitch482_g139607;
				float In_MultiMask3_g139615 = Final_MultiMask572_g139607;
				half Visual_AlphaClip559_g139607 = Out_AlphaClip4_g139614;
				float temp_output_718_0_g139607 = (Local_AlbedoTex777_g139607).w;
				#ifdef TVE_ALPHA_CLIP
				float staticSwitch924_g139607 = ( temp_output_718_0_g139607 - _ThirdAlphaClipValue );
				#else
				float staticSwitch924_g139607 = temp_output_718_0_g139607;
				#endif
				half Local_AlphaClip772_g139607 = staticSwitch924_g139607;
				float lerpResult448_g139607 = lerp( Visual_AlphaClip559_g139607 , Local_AlphaClip772_g139607 , Detail_Mask412_g139607);
				#ifdef TVE_THIRD
				float staticSwitch564_g139607 = lerpResult448_g139607;
				#else
				float staticSwitch564_g139607 = Visual_AlphaClip559_g139607;
				#endif
				half Final_AlphaClip602_g139607 = staticSwitch564_g139607;
				float In_AlphaClip3_g139615 = Final_AlphaClip602_g139607;
				half Visual_AlphaFade588_g139607 = Out_AlphaFade4_g139614;
				half Local_AlphaFade773_g139607 = (lerpResult706_g139607).a;
				float lerpResult604_g139607 = lerp( Visual_AlphaFade588_g139607 , Local_AlphaFade773_g139607 , Detail_Mask412_g139607);
				#ifdef TVE_THIRD
				float staticSwitch608_g139607 = lerpResult604_g139607;
				#else
				float staticSwitch608_g139607 = Visual_AlphaFade588_g139607;
				#endif
				half Final_AlphaFade611_g139607 = staticSwitch608_g139607;
				float In_AlphaFade3_g139615 = Final_AlphaFade611_g139607;
				float3 In_Translucency3_g139615 = Out_Translucency4_g139614;
				float In_Transmission3_g139615 = Out_Transmission4_g139614;
				float In_Thickness3_g139615 = Out_Thickness4_g139614;
				float In_Diffusion3_g139615 = Out_Diffusion4_g139614;
				float In_Depth3_g139615 = Out_Depth4_g139614;
				{
				Data3_g139615.Dummy = In_Dummy3_g139615;
				Data3_g139615.Albedo = In_Albedo3_g139615;
				Data3_g139615.AlbedoRaw = In_AlbedoRaw3_g139615;
				Data3_g139615.NormalTS = In_NormalTS3_g139615;
				Data3_g139615.NormalWS = In_NormalWS3_g139615;
				Data3_g139615.Shader = In_Shader3_g139615;
				Data3_g139615.Emissive= In_Emissive3_g139615;
				Data3_g139615.MultiMask = In_MultiMask3_g139615;
				Data3_g139615.Grayscale = In_Grayscale3_g139615;
				Data3_g139615.Luminosity = In_Luminosity3_g139615;
				Data3_g139615.AlphaClip = In_AlphaClip3_g139615;
				Data3_g139615.AlphaFade = In_AlphaFade3_g139615;
				Data3_g139615.Translucency = In_Translucency3_g139615;
				Data3_g139615.Transmission = In_Transmission3_g139615;
				Data3_g139615.Thickness = In_Thickness3_g139615;
				Data3_g139615.Diffusion = In_Diffusion3_g139615;
				Data3_g139615.Depth = In_Depth3_g139615;
				}
				TVEVisualData DataB25_g139647 = Data3_g139615;
				float Alpha25_g139647 = _ThirdBakeMode;
				{
				if (Alpha25_g139647 < 0.5 )
				{
				Data25_g139647 = DataA25_g139647;
				}
				else
				{
				Data25_g139647 = DataB25_g139647;
				}
				}
				TVEVisualData DataA25_g139658 = Data25_g139647;
				float localCompData3_g139650 = ( 0.0 );
				TVEVisualData Data3_g139650 = (TVEVisualData)0;
				half Dummy202_g139648 = ( _OcclusionCategory + _OcclusionEnd + _OcclusionBakeMode );
				float In_Dummy3_g139650 = Dummy202_g139648;
				float localBreakData4_g139649 = ( 0.0 );
				TVEVisualData Data4_g139649 = Data25_g139647;
				float Out_Dummy4_g139649 = 0;
				float3 Out_Albedo4_g139649 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g139649 = float3( 0,0,0 );
				float2 Out_NormalTS4_g139649 = float2( 0,0 );
				float3 Out_NormalWS4_g139649 = float3( 0,0,0 );
				float4 Out_Shader4_g139649 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g139649 = float4( 0,0,0,0 );
				float Out_MultiMask4_g139649 = 0;
				float Out_Grayscale4_g139649 = 0;
				float Out_Luminosity4_g139649 = 0;
				float Out_AlphaClip4_g139649 = 0;
				float Out_AlphaFade4_g139649 = 0;
				float3 Out_Translucency4_g139649 = float3( 0,0,0 );
				float Out_Transmission4_g139649 = 0;
				float Out_Thickness4_g139649 = 0;
				float Out_Diffusion4_g139649 = 0;
				float Out_Depth4_g139649 = 0;
				{
				Out_Dummy4_g139649 = Data4_g139649.Dummy;
				Out_Albedo4_g139649 = Data4_g139649.Albedo;
				Out_AlbedoRaw4_g139649 = Data4_g139649.AlbedoRaw;
				Out_NormalTS4_g139649 = Data4_g139649.NormalTS;
				Out_NormalWS4_g139649 = Data4_g139649.NormalWS;
				Out_Shader4_g139649 = Data4_g139649.Shader;
				Out_Emissive4_g139649= Data4_g139649.Emissive;
				Out_MultiMask4_g139649 = Data4_g139649.MultiMask;
				Out_Grayscale4_g139649 = Data4_g139649.Grayscale;
				Out_Luminosity4_g139649= Data4_g139649.Luminosity;
				Out_AlphaClip4_g139649 = Data4_g139649.AlphaClip;
				Out_AlphaFade4_g139649 = Data4_g139649.AlphaFade;
				Out_Translucency4_g139649 = Data4_g139649.Translucency;
				Out_Transmission4_g139649 = Data4_g139649.Transmission;
				Out_Thickness4_g139649 = Data4_g139649.Thickness;
				Out_Diffusion4_g139649 = Data4_g139649.Diffusion;
				Out_Depth4_g139649= Data4_g139649.Depth;
				}
				half3 Visual_Albedo127_g139648 = Out_Albedo4_g139649;
				TVEModelData Data15_g139656 = Data16_g76831;
				float Out_Dummy15_g139656 = 0;
				float3 Out_PositionWS15_g139656 = float3( 0,0,0 );
				float3 Out_PositionWO15_g139656 = float3( 0,0,0 );
				float3 Out_PivotWS15_g139656 = float3( 0,0,0 );
				float3 Out_PivotWO15_g139656 = float3( 0,0,0 );
				float3 Out_NormalWS15_g139656 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g139656 = float3( 0,0,0 );
				float4 Out_VertexData15_g139656 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g139656 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g139656 = Data15_g139656.Dummy;
				Out_PositionWS15_g139656 = Data15_g139656.PositionWS;
				Out_PositionWO15_g139656 = Data15_g139656.PositionWO;
				Out_PivotWS15_g139656 = Data15_g139656.PivotWS;
				Out_PivotWO15_g139656 = Data15_g139656.PivotWO;
				Out_NormalWS15_g139656 = Data15_g139656.NormalWS;
				Out_ViewDirWS15_g139656 = Data15_g139656.ViewDirWS;
				Out_VertexData15_g139656 = Data15_g139656.VertexData;
				Out_BoundsData15_g139656 = Data15_g139656.BoundsData;
				}
				half4 Model_VertexData206_g139648 = Out_VertexData15_g139656;
				float4 break208_g139648 = Model_VertexData206_g139648;
				float4 break33_g139654 = _occlusion_vert_mode;
				float temp_output_30_0_g139654 = ( break208_g139648.x * break33_g139654.x );
				float temp_output_29_0_g139654 = ( break208_g139648.y * break33_g139654.y );
				float temp_output_31_0_g139654 = ( break208_g139648.z * break33_g139654.z );
				float temp_output_28_0_g139654 = ( temp_output_30_0_g139654 + temp_output_29_0_g139654 + temp_output_31_0_g139654 + ( break208_g139648.w * break33_g139654.w ) );
				float temp_output_194_0_g139648 = temp_output_28_0_g139654;
				float clampResult17_g139652 = clamp( temp_output_194_0_g139648 , 0.0001 , 0.9999 );
				float temp_output_7_0_g139657 = _OcclusionMeshRemap.x;
				float temp_output_9_0_g139657 = ( clampResult17_g139652 - temp_output_7_0_g139657 );
				float temp_output_6_0_g139653 = saturate( ( ( temp_output_9_0_g139657 * _OcclusionMeshRemap.z ) + 0.0001 ) );
				#ifdef TVE_DUMMY
				float staticSwitch14_g139653 = ( temp_output_6_0_g139653 + _OcclusionMeshMode );
				#else
				float staticSwitch14_g139653 = temp_output_6_0_g139653;
				#endif
				half Occlusion_Mask82_g139648 = staticSwitch14_g139653;
				float3 lerpResult75_g139648 = lerp( (_OcclusionColorTwo).rgb , (_OcclusionColorOne).rgb , Occlusion_Mask82_g139648);
				float3 lerpResult186_g139648 = lerp( Visual_Albedo127_g139648 , ( Visual_Albedo127_g139648 * lerpResult75_g139648 ) , _OcclusionIntensityValue);
				#ifdef TVE_OCCLUSION
				float3 staticSwitch171_g139648 = lerpResult186_g139648;
				#else
				float3 staticSwitch171_g139648 = Visual_Albedo127_g139648;
				#endif
				half3 Final_Albedo160_g139648 = staticSwitch171_g139648;
				float3 In_Albedo3_g139650 = Final_Albedo160_g139648;
				float3 In_AlbedoRaw3_g139650 = Final_Albedo160_g139648;
				float2 In_NormalTS3_g139650 = Out_NormalTS4_g139649;
				float3 In_NormalWS3_g139650 = Out_NormalWS4_g139649;
				float4 In_Shader3_g139650 = Out_Shader4_g139649;
				float4 In_Emissive3_g139650 = Out_Emissive4_g139649;
				float3 temp_output_3_0_g139651 = Final_Albedo160_g139648;
				float dotResult20_g139651 = dot( temp_output_3_0_g139651 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Final_Grayscale164_g139648 = dotResult20_g139651;
				float In_Grayscale3_g139650 = Final_Grayscale164_g139648;
				float clampResult180_g139648 = clamp( saturate( ( Final_Grayscale164_g139648 * 5.0 ) ) , 0.2 , 1.0 );
				half Final_Shading181_g139648 = clampResult180_g139648;
				float In_Luminosity3_g139650 = Final_Shading181_g139648;
				float In_MultiMask3_g139650 = Out_MultiMask4_g139649;
				float In_AlphaClip3_g139650 = Out_AlphaClip4_g139649;
				float In_AlphaFade3_g139650 = Out_AlphaFade4_g139649;
				float3 In_Translucency3_g139650 = Out_Translucency4_g139649;
				float In_Transmission3_g139650 = Out_Transmission4_g139649;
				float In_Thickness3_g139650 = Out_Thickness4_g139649;
				float In_Diffusion3_g139650 = Out_Diffusion4_g139649;
				float In_Depth3_g139650 = Out_Depth4_g139649;
				{
				Data3_g139650.Dummy = In_Dummy3_g139650;
				Data3_g139650.Albedo = In_Albedo3_g139650;
				Data3_g139650.AlbedoRaw = In_AlbedoRaw3_g139650;
				Data3_g139650.NormalTS = In_NormalTS3_g139650;
				Data3_g139650.NormalWS = In_NormalWS3_g139650;
				Data3_g139650.Shader = In_Shader3_g139650;
				Data3_g139650.Emissive= In_Emissive3_g139650;
				Data3_g139650.MultiMask = In_MultiMask3_g139650;
				Data3_g139650.Grayscale = In_Grayscale3_g139650;
				Data3_g139650.Luminosity = In_Luminosity3_g139650;
				Data3_g139650.AlphaClip = In_AlphaClip3_g139650;
				Data3_g139650.AlphaFade = In_AlphaFade3_g139650;
				Data3_g139650.Translucency = In_Translucency3_g139650;
				Data3_g139650.Transmission = In_Transmission3_g139650;
				Data3_g139650.Thickness = In_Thickness3_g139650;
				Data3_g139650.Diffusion = In_Diffusion3_g139650;
				Data3_g139650.Depth = In_Depth3_g139650;
				}
				TVEVisualData DataB25_g139658 = Data3_g139650;
				float Alpha25_g139658 = _OcclusionBakeMode;
				{
				if (Alpha25_g139658 < 0.5 )
				{
				Data25_g139658 = DataA25_g139658;
				}
				else
				{
				Data25_g139658 = DataB25_g139658;
				}
				}
				TVEVisualData DataA25_g139669 = Data25_g139658;
				float localCompData3_g139662 = ( 0.0 );
				TVEVisualData Data3_g139662 = (TVEVisualData)0;
				half Dummy220_g139659 = ( _GradientCategory + _GradientEnd + _GradientBakeMode );
				float In_Dummy3_g139662 = Dummy220_g139659;
				float localBreakData4_g139661 = ( 0.0 );
				TVEVisualData Data4_g139661 = Data25_g139658;
				float Out_Dummy4_g139661 = 0;
				float3 Out_Albedo4_g139661 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g139661 = float3( 0,0,0 );
				float2 Out_NormalTS4_g139661 = float2( 0,0 );
				float3 Out_NormalWS4_g139661 = float3( 0,0,0 );
				float4 Out_Shader4_g139661 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g139661 = float4( 0,0,0,0 );
				float Out_MultiMask4_g139661 = 0;
				float Out_Grayscale4_g139661 = 0;
				float Out_Luminosity4_g139661 = 0;
				float Out_AlphaClip4_g139661 = 0;
				float Out_AlphaFade4_g139661 = 0;
				float3 Out_Translucency4_g139661 = float3( 0,0,0 );
				float Out_Transmission4_g139661 = 0;
				float Out_Thickness4_g139661 = 0;
				float Out_Diffusion4_g139661 = 0;
				float Out_Depth4_g139661 = 0;
				{
				Out_Dummy4_g139661 = Data4_g139661.Dummy;
				Out_Albedo4_g139661 = Data4_g139661.Albedo;
				Out_AlbedoRaw4_g139661 = Data4_g139661.AlbedoRaw;
				Out_NormalTS4_g139661 = Data4_g139661.NormalTS;
				Out_NormalWS4_g139661 = Data4_g139661.NormalWS;
				Out_Shader4_g139661 = Data4_g139661.Shader;
				Out_Emissive4_g139661= Data4_g139661.Emissive;
				Out_MultiMask4_g139661 = Data4_g139661.MultiMask;
				Out_Grayscale4_g139661 = Data4_g139661.Grayscale;
				Out_Luminosity4_g139661= Data4_g139661.Luminosity;
				Out_AlphaClip4_g139661 = Data4_g139661.AlphaClip;
				Out_AlphaFade4_g139661 = Data4_g139661.AlphaFade;
				Out_Translucency4_g139661 = Data4_g139661.Translucency;
				Out_Transmission4_g139661 = Data4_g139661.Transmission;
				Out_Thickness4_g139661 = Data4_g139661.Thickness;
				Out_Diffusion4_g139661 = Data4_g139661.Diffusion;
				Out_Depth4_g139661= Data4_g139661.Depth;
				}
				half3 Visual_Albedo127_g139659 = Out_Albedo4_g139661;
				TVEModelData Data15_g139667 = Data16_g76831;
				float Out_Dummy15_g139667 = 0;
				float3 Out_PositionWS15_g139667 = float3( 0,0,0 );
				float3 Out_PositionWO15_g139667 = float3( 0,0,0 );
				float3 Out_PivotWS15_g139667 = float3( 0,0,0 );
				float3 Out_PivotWO15_g139667 = float3( 0,0,0 );
				float3 Out_NormalWS15_g139667 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g139667 = float3( 0,0,0 );
				float4 Out_VertexData15_g139667 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g139667 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g139667 = Data15_g139667.Dummy;
				Out_PositionWS15_g139667 = Data15_g139667.PositionWS;
				Out_PositionWO15_g139667 = Data15_g139667.PositionWO;
				Out_PivotWS15_g139667 = Data15_g139667.PivotWS;
				Out_PivotWO15_g139667 = Data15_g139667.PivotWO;
				Out_NormalWS15_g139667 = Data15_g139667.NormalWS;
				Out_ViewDirWS15_g139667 = Data15_g139667.ViewDirWS;
				Out_VertexData15_g139667 = Data15_g139667.VertexData;
				Out_BoundsData15_g139667 = Data15_g139667.BoundsData;
				}
				half4 Model_VertexData224_g139659 = Out_VertexData15_g139667;
				float4 break226_g139659 = Model_VertexData224_g139659;
				float4 break33_g139660 = _gradient_vert_mode;
				float temp_output_30_0_g139660 = ( break226_g139659.x * break33_g139660.x );
				float temp_output_29_0_g139660 = ( break226_g139659.y * break33_g139660.y );
				float temp_output_31_0_g139660 = ( break226_g139659.z * break33_g139660.z );
				float temp_output_28_0_g139660 = ( temp_output_30_0_g139660 + temp_output_29_0_g139660 + temp_output_31_0_g139660 + ( break226_g139659.w * break33_g139660.w ) );
				float temp_output_211_0_g139659 = temp_output_28_0_g139660;
				float clampResult17_g139665 = clamp( temp_output_211_0_g139659 , 0.0001 , 0.9999 );
				float temp_output_7_0_g139668 = _GradientMeshRemap.x;
				float temp_output_9_0_g139668 = ( clampResult17_g139665 - temp_output_7_0_g139668 );
				float temp_output_6_0_g139666 = saturate( ( ( temp_output_9_0_g139668 * _GradientMeshRemap.z ) + 0.0001 ) );
				#ifdef TVE_DUMMY
				float staticSwitch14_g139666 = ( temp_output_6_0_g139666 + _GradientMeshMode );
				#else
				float staticSwitch14_g139666 = temp_output_6_0_g139666;
				#endif
				half Gradient_VertMask82_g139659 = staticSwitch14_g139666;
				half Gradient_Mask200_g139659 = Gradient_VertMask82_g139659;
				float3 lerpResult75_g139659 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Gradient_Mask200_g139659);
				float temp_output_162_11_g139659 = Out_MultiMask4_g139661;
				half Visual_MultiMask196_g139659 = temp_output_162_11_g139659;
				float lerpResult190_g139659 = lerp( 1.0 , Visual_MultiMask196_g139659 , _GradientMultiValue);
				half Gradient_MultiMask194_g139659 = lerpResult190_g139659;
				float3 lerpResult186_g139659 = lerp( Visual_Albedo127_g139659 , ( Visual_Albedo127_g139659 * lerpResult75_g139659 ) , ( _GradientIntensityValue * Gradient_MultiMask194_g139659 ));
				#ifdef TVE_GRADIENT
				float3 staticSwitch171_g139659 = lerpResult186_g139659;
				#else
				float3 staticSwitch171_g139659 = Visual_Albedo127_g139659;
				#endif
				half3 Final_Albedo160_g139659 = staticSwitch171_g139659;
				float3 In_Albedo3_g139662 = Final_Albedo160_g139659;
				float3 In_AlbedoRaw3_g139662 = Final_Albedo160_g139659;
				float2 In_NormalTS3_g139662 = Out_NormalTS4_g139661;
				float3 In_NormalWS3_g139662 = Out_NormalWS4_g139661;
				float4 In_Shader3_g139662 = Out_Shader4_g139661;
				float4 In_Emissive3_g139662 = Out_Emissive4_g139661;
				float3 temp_output_3_0_g139663 = Final_Albedo160_g139659;
				float dotResult20_g139663 = dot( temp_output_3_0_g139663 , float3( 0.2126, 0.7152, 0.0722 ) );
				half Final_Grayscale164_g139659 = dotResult20_g139663;
				float In_Grayscale3_g139662 = Final_Grayscale164_g139659;
				float clampResult180_g139659 = clamp( saturate( ( Final_Grayscale164_g139659 * 5.0 ) ) , 0.2 , 1.0 );
				half Final_Luminosity181_g139659 = clampResult180_g139659;
				float In_Luminosity3_g139662 = Final_Luminosity181_g139659;
				float In_MultiMask3_g139662 = temp_output_162_11_g139659;
				float In_AlphaClip3_g139662 = Out_AlphaClip4_g139661;
				float In_AlphaFade3_g139662 = Out_AlphaFade4_g139661;
				float3 In_Translucency3_g139662 = Out_Translucency4_g139661;
				float In_Transmission3_g139662 = Out_Transmission4_g139661;
				float In_Thickness3_g139662 = Out_Thickness4_g139661;
				float In_Diffusion3_g139662 = Out_Diffusion4_g139661;
				float In_Depth3_g139662 = Out_Depth4_g139661;
				{
				Data3_g139662.Dummy = In_Dummy3_g139662;
				Data3_g139662.Albedo = In_Albedo3_g139662;
				Data3_g139662.AlbedoRaw = In_AlbedoRaw3_g139662;
				Data3_g139662.NormalTS = In_NormalTS3_g139662;
				Data3_g139662.NormalWS = In_NormalWS3_g139662;
				Data3_g139662.Shader = In_Shader3_g139662;
				Data3_g139662.Emissive= In_Emissive3_g139662;
				Data3_g139662.MultiMask = In_MultiMask3_g139662;
				Data3_g139662.Grayscale = In_Grayscale3_g139662;
				Data3_g139662.Luminosity = In_Luminosity3_g139662;
				Data3_g139662.AlphaClip = In_AlphaClip3_g139662;
				Data3_g139662.AlphaFade = In_AlphaFade3_g139662;
				Data3_g139662.Translucency = In_Translucency3_g139662;
				Data3_g139662.Transmission = In_Transmission3_g139662;
				Data3_g139662.Thickness = In_Thickness3_g139662;
				Data3_g139662.Diffusion = In_Diffusion3_g139662;
				Data3_g139662.Depth = In_Depth3_g139662;
				}
				TVEVisualData DataB25_g139669 = Data3_g139662;
				float Alpha25_g139669 = _GradientBakeMode;
				{
				if (Alpha25_g139669 < 0.5 )
				{
				Data25_g139669 = DataA25_g139669;
				}
				else
				{
				Data25_g139669 = DataB25_g139669;
				}
				}
				TVEVisualData DataA25_g139693 = Data25_g139669;
				float localCompData3_g139673 = ( 0.0 );
				TVEVisualData Data3_g139673 = (TVEVisualData)0;
				float2 temp_cast_5 = (0.0).xx;
				half4 Dummy594_g139670 = ( ( _OverlayCategory + _OverlayEnd + _OverlayBakeMode ) + ( SAMPLE_TEXTURE2D( _OverlayGlitterTexRT, sampler_OverlayGlitterTexRT, temp_cast_5 ).r + _OverlayGlitterTillingValue + _OverlayGlitterIntensityValue + _OverlayGlitterColor.r + _OverlayGlitterDistValue + _OverlayGlitterAttenValue + ( _OverlayLiteInfo + _OverlayColoringOn + _OverlayColoringOff ) ) );
				float In_Dummy3_g139673 = Dummy594_g139670.r;
				float localBreakData4_g139671 = ( 0.0 );
				TVEVisualData Data4_g139671 = Data25_g139669;
				float Out_Dummy4_g139671 = 0;
				float3 Out_Albedo4_g139671 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g139671 = float3( 0,0,0 );
				float2 Out_NormalTS4_g139671 = float2( 0,0 );
				float3 Out_NormalWS4_g139671 = float3( 0,0,0 );
				float4 Out_Shader4_g139671 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g139671 = float4( 0,0,0,0 );
				float Out_MultiMask4_g139671 = 0;
				float Out_Grayscale4_g139671 = 0;
				float Out_Luminosity4_g139671 = 0;
				float Out_AlphaClip4_g139671 = 0;
				float Out_AlphaFade4_g139671 = 0;
				float3 Out_Translucency4_g139671 = float3( 0,0,0 );
				float Out_Transmission4_g139671 = 0;
				float Out_Thickness4_g139671 = 0;
				float Out_Diffusion4_g139671 = 0;
				float Out_Depth4_g139671 = 0;
				{
				Out_Dummy4_g139671 = Data4_g139671.Dummy;
				Out_Albedo4_g139671 = Data4_g139671.Albedo;
				Out_AlbedoRaw4_g139671 = Data4_g139671.AlbedoRaw;
				Out_NormalTS4_g139671 = Data4_g139671.NormalTS;
				Out_NormalWS4_g139671 = Data4_g139671.NormalWS;
				Out_Shader4_g139671 = Data4_g139671.Shader;
				Out_Emissive4_g139671= Data4_g139671.Emissive;
				Out_MultiMask4_g139671 = Data4_g139671.MultiMask;
				Out_Grayscale4_g139671 = Data4_g139671.Grayscale;
				Out_Luminosity4_g139671= Data4_g139671.Luminosity;
				Out_AlphaClip4_g139671 = Data4_g139671.AlphaClip;
				Out_AlphaFade4_g139671 = Data4_g139671.AlphaFade;
				Out_Translucency4_g139671 = Data4_g139671.Translucency;
				Out_Transmission4_g139671 = Data4_g139671.Transmission;
				Out_Thickness4_g139671 = Data4_g139671.Thickness;
				Out_Diffusion4_g139671 = Data4_g139671.Diffusion;
				Out_Depth4_g139671= Data4_g139671.Depth;
				}
				half3 Visual_Albedo127_g139670 = Out_Albedo4_g139671;
				float3 temp_output_622_0_g139670 = (_OverlayColor).rgb;
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g139674) = _OverlayAlbedoTex;
				float localFilterTexture19_g139680 = ( 0.0 );
				SamplerState SS19_g139680 = sampler_Linear_Repeat;
				SamplerState SamplerDefault19_g139680 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerPoint19_g139680 = sampler_Point_Repeat;
				SamplerState SamplerLow19_g139680 = sampler_Linear_Repeat;
				SamplerState SamplerMedium19_g139680 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh19_g139680 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS19_g139680 = SamplerDefault19_g139680;
				#if defined (TVE_FILTER_DEFAULT)
				    SS19_g139680 = SamplerDefault19_g139680;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS19_g139680 = SamplerPoint19_g139680;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS19_g139680 = SamplerLow19_g139680;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS19_g139680 = SamplerMedium19_g139680;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS19_g139680 = SamplerHigh19_g139680;
				#endif
				}
				SamplerState Sampler238_g139674 = SS19_g139680;
				float4 temp_output_6_0_g139677 = _overlay_coord_value;
				#ifdef TVE_DUMMY
				float4 staticSwitch14_g139677 = ( temp_output_6_0_g139677 + ( _OverlaySampleMode + _OverlayCoordMode + _OverlayCoordValue ) );
				#else
				float4 staticSwitch14_g139677 = temp_output_6_0_g139677;
				#endif
				half4 Overlay_Coords639_g139670 = staticSwitch14_g139677;
				float4 temp_output_37_0_g139674 = Overlay_Coords639_g139670;
				half4 Coords238_g139674 = temp_output_37_0_g139674;
				TVEModelData Data15_g139681 = Data16_g76831;
				float Out_Dummy15_g139681 = 0;
				float3 Out_PositionWS15_g139681 = float3( 0,0,0 );
				float3 Out_PositionWO15_g139681 = float3( 0,0,0 );
				float3 Out_PivotWS15_g139681 = float3( 0,0,0 );
				float3 Out_PivotWO15_g139681 = float3( 0,0,0 );
				float3 Out_NormalWS15_g139681 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g139681 = float3( 0,0,0 );
				float4 Out_VertexData15_g139681 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g139681 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g139681 = Data15_g139681.Dummy;
				Out_PositionWS15_g139681 = Data15_g139681.PositionWS;
				Out_PositionWO15_g139681 = Data15_g139681.PositionWO;
				Out_PivotWS15_g139681 = Data15_g139681.PivotWS;
				Out_PivotWO15_g139681 = Data15_g139681.PivotWO;
				Out_NormalWS15_g139681 = Data15_g139681.NormalWS;
				Out_ViewDirWS15_g139681 = Data15_g139681.ViewDirWS;
				Out_VertexData15_g139681 = Data15_g139681.VertexData;
				Out_BoundsData15_g139681 = Data15_g139681.BoundsData;
				}
				half3 Model_PositionWO602_g139670 = Out_PositionWO15_g139681;
				float3 temp_output_279_0_g139674 = Model_PositionWO602_g139670;
				half3 WorldPosition238_g139674 = temp_output_279_0_g139674;
				half4 localSamplePlanar2D238_g139674 = SamplePlanar2D( Texture238_g139674 , Sampler238_g139674 , Coords238_g139674 , WorldPosition238_g139674 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g139674) = _OverlayAlbedoTex;
				SamplerState Sampler246_g139674 = SS19_g139680;
				half4 Coords246_g139674 = temp_output_37_0_g139674;
				half3 WorldPosition246_g139674 = temp_output_279_0_g139674;
				half3 Model_NormalWS712_g139670 = Out_NormalWS15_g139681;
				float3 temp_output_280_0_g139674 = Model_NormalWS712_g139670;
				half3 WorldNormal246_g139674 = temp_output_280_0_g139674;
				half4 localSamplePlanar3D246_g139674 = SamplePlanar3D( Texture246_g139674 , Sampler246_g139674 , Coords246_g139674 , WorldPosition246_g139674 , WorldNormal246_g139674 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g139674) = _OverlayAlbedoTex;
				SamplerState Sampler234_g139674 = SS19_g139680;
				float4 Coords234_g139674 = temp_output_37_0_g139674;
				float3 WorldPosition234_g139674 = temp_output_279_0_g139674;
				float4 localSampleStochastic2D234_g139674 = SampleStochastic2D( Texture234_g139674 , Sampler234_g139674 , Coords234_g139674 , WorldPosition234_g139674 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g139674) = _OverlayAlbedoTex;
				SamplerState Sampler263_g139674 = SS19_g139680;
				half4 Coords263_g139674 = temp_output_37_0_g139674;
				half3 WorldPosition263_g139674 = temp_output_279_0_g139674;
				half3 WorldNormal263_g139674 = temp_output_280_0_g139674;
				half4 localSampleStochastic3D263_g139674 = SampleStochastic3D( Texture263_g139674 , Sampler263_g139674 , Coords263_g139674 , WorldPosition263_g139674 , WorldNormal263_g139674 );
				#if defined( TVE_OVERLAY_SAMPLE_PLANAR_2D )
				float4 staticSwitch676_g139670 = localSamplePlanar2D238_g139674;
				#elif defined( TVE_OVERLAY_SAMPLE_PLANAR_3D )
				float4 staticSwitch676_g139670 = localSamplePlanar3D246_g139674;
				#elif defined( TVE_OVERLAY_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch676_g139670 = localSampleStochastic2D234_g139674;
				#elif defined( TVE_OVERLAY_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch676_g139670 = localSampleStochastic3D263_g139674;
				#else
				float4 staticSwitch676_g139670 = localSamplePlanar2D238_g139674;
				#endif
				half3 Overlay_Albedo526_g139670 = (staticSwitch676_g139670).xyz;
				#ifdef TVE_OVERLAY_TEX
				float3 staticSwitch578_g139670 = ( temp_output_622_0_g139670 * Overlay_Albedo526_g139670 );
				#else
				float3 staticSwitch578_g139670 = temp_output_622_0_g139670;
				#endif
				float3 temp_output_6_0_g139687 = staticSwitch578_g139670;
				#ifdef TVE_DUMMY
				float3 staticSwitch14_g139687 = ( temp_output_6_0_g139687 + _OverlayTextureMode );
				#else
				float3 staticSwitch14_g139687 = temp_output_6_0_g139687;
				#endif
				float3 temp_output_739_21_g139670 = Out_NormalWS4_g139671;
				half3 Visual_NormalWS749_g139670 = temp_output_739_21_g139670;
				float clampResult17_g139684 = clamp( saturate( (Visual_NormalWS749_g139670).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g139690 = _OverlayProjRemap.x;
				float temp_output_9_0_g139690 = ( clampResult17_g139684 - temp_output_7_0_g139690 );
				float lerpResult842_g139670 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139690 * _OverlayProjRemap.z ) + 0.0001 ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g139670 = lerpResult842_g139670;
				float temp_output_739_15_g139670 = Out_Luminosity4_g139671;
				half Visual_Luminosity654_g139670 = temp_output_739_15_g139670;
				float clampResult17_g139685 = clamp( Visual_Luminosity654_g139670 , 0.0001 , 0.9999 );
				float temp_output_7_0_g139689 = _OverlayLumaRemap.x;
				float temp_output_9_0_g139689 = ( clampResult17_g139685 - temp_output_7_0_g139689 );
				float lerpResult587_g139670 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139689 * _OverlayLumaRemap.z ) + 0.0001 ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g139670 = lerpResult587_g139670;
				half4 Model_VertexMasks791_g139670 = Out_VertexData15_g139681;
				float4 break792_g139670 = Model_VertexMasks791_g139670;
				float4 break33_g139682 = _overlay_vert_mode;
				float temp_output_30_0_g139682 = ( break792_g139670.x * break33_g139682.x );
				float temp_output_29_0_g139682 = ( break792_g139670.y * break33_g139682.y );
				float temp_output_31_0_g139682 = ( break792_g139670.z * break33_g139682.z );
				float temp_output_28_0_g139682 = ( temp_output_30_0_g139682 + temp_output_29_0_g139682 + temp_output_31_0_g139682 + ( break792_g139670.w * break33_g139682.w ) );
				float clampResult17_g139683 = clamp( temp_output_28_0_g139682 , 0.0001 , 0.9999 );
				float temp_output_7_0_g139691 = _OverlayMeshRemap.x;
				float temp_output_9_0_g139691 = ( clampResult17_g139683 - temp_output_7_0_g139691 );
				float lerpResult879_g139670 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g139691 * _OverlayMeshRemap.z ) + 0.0001 ) ) , _OverlayMeshValue);
				float temp_output_6_0_g139686 = lerpResult879_g139670;
				#ifdef TVE_DUMMY
				float staticSwitch14_g139686 = ( temp_output_6_0_g139686 + _OverlayMeshMode );
				#else
				float staticSwitch14_g139686 = temp_output_6_0_g139686;
				#endif
				half Overlay_VertMask801_g139670 = staticSwitch14_g139686;
				float lerpResult920_g139670 = lerp( 1.0 , ( TVE_AtmoParams.z * TVE_IsEnabled ) , _OverlayGlobalValue);
				half Overlay_MaskGlobal429_g139670 = lerpResult920_g139670;
				float temp_output_7_0_g139692 = _OverlayBlendRemap.x;
				float temp_output_9_0_g139692 = ( ( _OverlayIntensityValue * Overlay_MaskProj457_g139670 * Overlay_MaskLuma438_g139670 * Overlay_VertMask801_g139670 * Overlay_MaskGlobal429_g139670 ) - temp_output_7_0_g139692 );
				half Overlay_Mask494_g139670 = saturate( ( ( temp_output_9_0_g139692 * _OverlayBlendRemap.z ) + 0.0001 ) );
				float3 lerpResult467_g139670 = lerp( Visual_Albedo127_g139670 , staticSwitch14_g139687 , Overlay_Mask494_g139670);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g139670 = lerpResult467_g139670;
				#else
				float3 staticSwitch577_g139670 = Visual_Albedo127_g139670;
				#endif
				half3 Final_Albedo493_g139670 = staticSwitch577_g139670;
				float3 In_Albedo3_g139673 = Final_Albedo493_g139670;
				float3 In_AlbedoRaw3_g139673 = Out_AlbedoRaw4_g139671;
				half2 Visual_NormalTS535_g139670 = Out_NormalTS4_g139671;
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture238_g139678) = _OverlayNormalTex;
				float localFilterTexture29_g139679 = ( 0.0 );
				SamplerState SS29_g139679 = sampler_Linear_Repeat;
				SamplerState SamplerDefault29_g139679 = sampler_Linear_Repeat;
				SamplerState SamplerPoint29_g139679 = sampler_Point_Repeat;
				SamplerState SamplerLow29_g139679 = sampler_Linear_Repeat;
				SamplerState SamplerMedium29_g139679 = sampler_Linear_Repeat_Aniso8;
				SamplerState SamplerHigh29_g139679 = sampler_Linear_Repeat_Aniso8;
				{
				//SamplerState SS29_g139679 = SamplerDefault29_g139679;
				#if defined (TVE_FILTER_DEFAULT)
				    SS29_g139679 = SamplerDefault29_g139679;
				#endif
				#if defined (TVE_FILTER_POINT)
				    SS29_g139679 = SamplerPoint29_g139679;
				#endif
				#if defined (TVE_FILTER_LOW)
				    SS29_g139679 = SamplerLow29_g139679;
				#endif
				#if defined (TVE_FILTER_MEDIUM)
				    SS29_g139679 = SamplerMedium29_g139679;
				#endif
				#if defined (TVE_FILTER_HIGH)
				    SS29_g139679 = SamplerHigh29_g139679;
				#endif
				}
				SamplerState Sampler238_g139678 = SS29_g139679;
				float4 temp_output_37_0_g139678 = Overlay_Coords639_g139670;
				half4 Coords238_g139678 = temp_output_37_0_g139678;
				float3 temp_output_279_0_g139678 = Model_PositionWO602_g139670;
				half3 WorldPosition238_g139678 = temp_output_279_0_g139678;
				half4 localSamplePlanar2D238_g139678 = SamplePlanar2D( Texture238_g139678 , Sampler238_g139678 , Coords238_g139678 , WorldPosition238_g139678 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture246_g139678) = _OverlayNormalTex;
				SamplerState Sampler246_g139678 = SS29_g139679;
				half4 Coords246_g139678 = temp_output_37_0_g139678;
				half3 WorldPosition246_g139678 = temp_output_279_0_g139678;
				float3 temp_output_280_0_g139678 = Model_NormalWS712_g139670;
				half3 WorldNormal246_g139678 = temp_output_280_0_g139678;
				half4 localSamplePlanar3D246_g139678 = SamplePlanar3D( Texture246_g139678 , Sampler246_g139678 , Coords246_g139678 , WorldPosition246_g139678 , WorldNormal246_g139678 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture234_g139678) = _OverlayNormalTex;
				SamplerState Sampler234_g139678 = SS29_g139679;
				float4 Coords234_g139678 = temp_output_37_0_g139678;
				float3 WorldPosition234_g139678 = temp_output_279_0_g139678;
				float4 localSampleStochastic2D234_g139678 = SampleStochastic2D( Texture234_g139678 , Sampler234_g139678 , Coords234_g139678 , WorldPosition234_g139678 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture263_g139678) = _OverlayNormalTex;
				SamplerState Sampler263_g139678 = SS29_g139679;
				half4 Coords263_g139678 = temp_output_37_0_g139678;
				half3 WorldPosition263_g139678 = temp_output_279_0_g139678;
				half3 WorldNormal263_g139678 = temp_output_280_0_g139678;
				half4 localSampleStochastic3D263_g139678 = SampleStochastic3D( Texture263_g139678 , Sampler263_g139678 , Coords263_g139678 , WorldPosition263_g139678 , WorldNormal263_g139678 );
				#if defined( TVE_OVERLAY_SAMPLE_PLANAR_2D )
				float4 staticSwitch686_g139670 = localSamplePlanar2D238_g139678;
				#elif defined( TVE_OVERLAY_SAMPLE_PLANAR_3D )
				float4 staticSwitch686_g139670 = localSamplePlanar3D246_g139678;
				#elif defined( TVE_OVERLAY_SAMPLE_STOCHASTIC_2D )
				float4 staticSwitch686_g139670 = localSampleStochastic2D234_g139678;
				#elif defined( TVE_OVERLAY_SAMPLE_STOCHASTIC_3D )
				float4 staticSwitch686_g139670 = localSampleStochastic3D263_g139678;
				#else
				float4 staticSwitch686_g139670 = localSamplePlanar2D238_g139678;
				#endif
				half4 Normal_Packed45_g139676 = staticSwitch686_g139670;
				float2 appendResult58_g139676 = (float2(( (Normal_Packed45_g139676).x * (Normal_Packed45_g139676).w ) , (Normal_Packed45_g139676).y));
				half2 Normal_Default50_g139676 = appendResult58_g139676;
				half2 Normal_ASTC41_g139676 = (Normal_Packed45_g139676).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g139676 = Normal_ASTC41_g139676;
				#else
				float2 staticSwitch38_g139676 = Normal_Default50_g139676;
				#endif
				half2 Normal_NO_DTX544_g139676 = (Normal_Packed45_g139676).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g139676 = Normal_NO_DTX544_g139676;
				#else
				float2 staticSwitch37_g139676 = staticSwitch38_g139676;
				#endif
				half2 Normal_Planar45_g139675 = (staticSwitch37_g139676*2.0 + -1.0);
				float2 break71_g139675 = Normal_Planar45_g139675;
				float3 appendResult72_g139675 = (float3(break71_g139675.x , 0.0 , break71_g139675.y));
				half2 Overlay_Normal528_g139670 = (mul( ase_worldToTangent, appendResult72_g139675 )).xy;
				#ifdef TVE_OVERLAY_TEX
				float2 staticSwitch579_g139670 = Overlay_Normal528_g139670;
				#else
				float2 staticSwitch579_g139670 = Visual_NormalTS535_g139670;
				#endif
				float2 lerpResult551_g139670 = lerp( Visual_NormalTS535_g139670 , ( staticSwitch579_g139670 * _OverlayNormalValue ) , Overlay_Mask494_g139670);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g139670 = lerpResult551_g139670;
				#else
				float2 staticSwitch583_g139670 = Visual_NormalTS535_g139670;
				#endif
				half2 Final_NormalTS499_g139670 = staticSwitch583_g139670;
				float2 In_NormalTS3_g139673 = Final_NormalTS499_g139670;
				float3 In_NormalWS3_g139673 = temp_output_739_21_g139670;
				half4 Visual_Masks536_g139670 = Out_Shader4_g139671;
				float4 appendResult585_g139670 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g139670 = lerp( Visual_Masks536_g139670 , appendResult585_g139670 , Overlay_Mask494_g139670);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g139670 = lerpResult584_g139670;
				#else
				float4 staticSwitch586_g139670 = Visual_Masks536_g139670;
				#endif
				half4 Final_Masks482_g139670 = staticSwitch586_g139670;
				float4 In_Shader3_g139673 = Final_Masks482_g139670;
				float4 In_Emissive3_g139673 = Out_Emissive4_g139671;
				float temp_output_739_12_g139670 = Out_Grayscale4_g139671;
				float In_Grayscale3_g139673 = temp_output_739_12_g139670;
				float In_Luminosity3_g139673 = temp_output_739_15_g139670;
				float In_MultiMask3_g139673 = Out_MultiMask4_g139671;
				float In_AlphaClip3_g139673 = Out_AlphaClip4_g139671;
				float In_AlphaFade3_g139673 = Out_AlphaFade4_g139671;
				float3 In_Translucency3_g139673 = Out_Translucency4_g139671;
				half Visual_Transmission699_g139670 = Out_Transmission4_g139671;
				float lerpResult746_g139670 = lerp( Visual_Transmission699_g139670 , ( Visual_Transmission699_g139670 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g139670 * Overlay_MaskGlobal429_g139670 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g139670 = lerpResult746_g139670;
				#else
				float staticSwitch703_g139670 = Visual_Transmission699_g139670;
				#endif
				half Final_Transmission702_g139670 = staticSwitch703_g139670;
				float In_Transmission3_g139673 = Final_Transmission702_g139670;
				float In_Thickness3_g139673 = Out_Thickness4_g139671;
				float In_Diffusion3_g139673 = Out_Diffusion4_g139671;
				float In_Depth3_g139673 = Out_Depth4_g139671;
				{
				Data3_g139673.Dummy = In_Dummy3_g139673;
				Data3_g139673.Albedo = In_Albedo3_g139673;
				Data3_g139673.AlbedoRaw = In_AlbedoRaw3_g139673;
				Data3_g139673.NormalTS = In_NormalTS3_g139673;
				Data3_g139673.NormalWS = In_NormalWS3_g139673;
				Data3_g139673.Shader = In_Shader3_g139673;
				Data3_g139673.Emissive= In_Emissive3_g139673;
				Data3_g139673.MultiMask = In_MultiMask3_g139673;
				Data3_g139673.Grayscale = In_Grayscale3_g139673;
				Data3_g139673.Luminosity = In_Luminosity3_g139673;
				Data3_g139673.AlphaClip = In_AlphaClip3_g139673;
				Data3_g139673.AlphaFade = In_AlphaFade3_g139673;
				Data3_g139673.Translucency = In_Translucency3_g139673;
				Data3_g139673.Transmission = In_Transmission3_g139673;
				Data3_g139673.Thickness = In_Thickness3_g139673;
				Data3_g139673.Diffusion = In_Diffusion3_g139673;
				Data3_g139673.Depth = In_Depth3_g139673;
				}
				TVEVisualData DataB25_g139693 = Data3_g139673;
				float Alpha25_g139693 = _OverlayBakeMode;
				{
				if (Alpha25_g139693 < 0.5 )
				{
				Data25_g139693 = DataA25_g139693;
				}
				else
				{
				Data25_g139693 = DataB25_g139693;
				}
				}
				TVEVisualData Data4_g187477 = Data25_g139693;
				float Out_Dummy4_g187477 = 0;
				float3 Out_Albedo4_g187477 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g187477 = float3( 0,0,0 );
				float2 Out_NormalTS4_g187477 = float2( 0,0 );
				float3 Out_NormalWS4_g187477 = float3( 0,0,0 );
				float4 Out_Shader4_g187477 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g187477 = float4( 0,0,0,0 );
				float Out_MultiMask4_g187477 = 0;
				float Out_Grayscale4_g187477 = 0;
				float Out_Luminosity4_g187477 = 0;
				float Out_AlphaClip4_g187477 = 0;
				float Out_AlphaFade4_g187477 = 0;
				float3 Out_Translucency4_g187477 = float3( 0,0,0 );
				float Out_Transmission4_g187477 = 0;
				float Out_Thickness4_g187477 = 0;
				float Out_Diffusion4_g187477 = 0;
				float Out_Depth4_g187477 = 0;
				{
				Out_Dummy4_g187477 = Data4_g187477.Dummy;
				Out_Albedo4_g187477 = Data4_g187477.Albedo;
				Out_AlbedoRaw4_g187477 = Data4_g187477.AlbedoRaw;
				Out_NormalTS4_g187477 = Data4_g187477.NormalTS;
				Out_NormalWS4_g187477 = Data4_g187477.NormalWS;
				Out_Shader4_g187477 = Data4_g187477.Shader;
				Out_Emissive4_g187477= Data4_g187477.Emissive;
				Out_MultiMask4_g187477 = Data4_g187477.MultiMask;
				Out_Grayscale4_g187477 = Data4_g187477.Grayscale;
				Out_Luminosity4_g187477= Data4_g187477.Luminosity;
				Out_AlphaClip4_g187477 = Data4_g187477.AlphaClip;
				Out_AlphaFade4_g187477 = Data4_g187477.AlphaFade;
				Out_Translucency4_g187477 = Data4_g187477.Translucency;
				Out_Transmission4_g187477 = Data4_g187477.Transmission;
				Out_Thickness4_g187477 = Data4_g187477.Thickness;
				Out_Diffusion4_g187477 = Data4_g187477.Diffusion;
				Out_Depth4_g187477= Data4_g187477.Depth;
				}
				float3 temp_output_297_0_g187473 = Out_Albedo4_g187477;
				float3 In_Albedo3_g187488 = temp_output_297_0_g187473;
				float3 temp_output_297_23_g187473 = Out_AlbedoRaw4_g187477;
				float3 In_AlbedoRaw3_g187488 = temp_output_297_23_g187473;
				float2 In_NormalTS3_g187488 = Out_NormalTS4_g187477;
				float3 In_NormalWS3_g187488 = Out_NormalWS4_g187477;
				float4 In_Shader3_g187488 = Out_Shader4_g187477;
				float4 temp_cast_7 = (0.0).xxxx;
				half4 Visual_Emissive255_g187473 = Out_Emissive4_g187477;
				TVEModelData Data15_g187478 = Data16_g76831;
				float Out_Dummy15_g187478 = 0;
				float3 Out_PositionWS15_g187478 = float3( 0,0,0 );
				float3 Out_PositionWO15_g187478 = float3( 0,0,0 );
				float3 Out_PivotWS15_g187478 = float3( 0,0,0 );
				float3 Out_PivotWO15_g187478 = float3( 0,0,0 );
				float3 Out_NormalWS15_g187478 = float3( 0,0,0 );
				float3 Out_ViewDirWS15_g187478 = float3( 0,0,0 );
				float4 Out_VertexData15_g187478 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g187478 = float4( 0,0,0,0 );
				{
				Out_Dummy15_g187478 = Data15_g187478.Dummy;
				Out_PositionWS15_g187478 = Data15_g187478.PositionWS;
				Out_PositionWO15_g187478 = Data15_g187478.PositionWO;
				Out_PivotWS15_g187478 = Data15_g187478.PivotWS;
				Out_PivotWO15_g187478 = Data15_g187478.PivotWO;
				Out_NormalWS15_g187478 = Data15_g187478.NormalWS;
				Out_ViewDirWS15_g187478 = Data15_g187478.ViewDirWS;
				Out_VertexData15_g187478 = Data15_g187478.VertexData;
				Out_BoundsData15_g187478 = Data15_g187478.BoundsData;
				}
				half4 Model_VertexMasks216_g187473 = Out_VertexData15_g187478;
				float4 break251_g187473 = Model_VertexMasks216_g187473;
				float4 break33_g187483 = _emissive_vert_mode;
				float temp_output_30_0_g187483 = ( break251_g187473.x * break33_g187483.x );
				float temp_output_29_0_g187483 = ( break251_g187473.y * break33_g187483.y );
				float temp_output_31_0_g187483 = ( break251_g187473.z * break33_g187483.z );
				float temp_output_28_0_g187483 = ( temp_output_30_0_g187483 + temp_output_29_0_g187483 + temp_output_31_0_g187483 + ( break251_g187473.w * break33_g187483.w ) );
				float clampResult17_g187482 = clamp( temp_output_28_0_g187483 , 0.0001 , 0.9999 );
				float temp_output_7_0_g187486 = _EmissiveMeshRemap.x;
				float temp_output_9_0_g187486 = ( clampResult17_g187482 - temp_output_7_0_g187486 );
				float lerpResult303_g187473 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g187486 * _EmissiveMeshRemap.z ) + 0.0001 ) ) , _EmissiveMeshValue);
				float temp_output_6_0_g187485 = lerpResult303_g187473;
				#ifdef TVE_DUMMY
				float staticSwitch14_g187485 = ( temp_output_6_0_g187485 + _EmissiveMeshMode );
				#else
				float staticSwitch14_g187485 = temp_output_6_0_g187485;
				#endif
				half Emissive_MeshMask221_g187473 = staticSwitch14_g187485;
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture276_g187475) = _EmissiveMaskTex;
				SamplerState Sampler276_g187475 = sampler_Linear_Repeat;
				float4 temp_output_6_0_g187476 = _emissive_coord_value;
				#ifdef TVE_DUMMY
				float4 staticSwitch14_g187476 = ( temp_output_6_0_g187476 + ( _EmissiveSampleMode + _EmissiveCoordMode + _EmissiveCoordValue ) );
				#else
				float4 staticSwitch14_g187476 = temp_output_6_0_g187476;
				#endif
				half4 Emissive_Coords167_g187473 = staticSwitch14_g187476;
				float4 temp_output_37_0_g187475 = Emissive_Coords167_g187473;
				half4 Coords276_g187475 = temp_output_37_0_g187475;
				half2 TexCoord276_g187475 = i.ase_texcoord.xy;
				half4 localSampleMain276_g187475 = SampleMain( Texture276_g187475 , Sampler276_g187475 , Coords276_g187475 , TexCoord276_g187475 );
				UNITY_DECLARE_TEX2D_NOSAMPLER(Texture275_g187475) = _EmissiveMaskTex;
				SamplerState Sampler275_g187475 = sampler_Linear_Repeat;
				half4 Coords275_g187475 = temp_output_37_0_g187475;
				half2 TexCoord275_g187475 = i.ase_texcoord.zw;
				half4 localSampleExtra275_g187475 = SampleExtra( Texture275_g187475 , Sampler275_g187475 , Coords275_g187475 , TexCoord275_g187475 );
				#if defined( TVE_EMISSIVE_SAMPLE_MAIN_UV )
				float4 staticSwitch176_g187473 = localSampleMain276_g187475;
				#elif defined( TVE_EMISSIVE_SAMPLE_EXTRA_UV )
				float4 staticSwitch176_g187473 = localSampleExtra275_g187475;
				#else
				float4 staticSwitch176_g187473 = localSampleMain276_g187475;
				#endif
				half4 Emissive_MaskTex201_g187473 = staticSwitch176_g187473;
				float clampResult17_g187484 = clamp( (Emissive_MaskTex201_g187473).x , 0.0001 , 0.9999 );
				float temp_output_7_0_g187487 = _EmissiveMaskRemap.x;
				float temp_output_9_0_g187487 = ( clampResult17_g187484 - temp_output_7_0_g187487 );
				float lerpResult302_g187473 = lerp( 1.0 , saturate( ( ( temp_output_9_0_g187487 * _EmissiveMaskRemap.z ) + 0.0001 ) ) , _EmissiveMaskValue);
				half Emissive_Mask103_g187473 = lerpResult302_g187473;
				float temp_output_279_0_g187473 = ( Emissive_MeshMask221_g187473 * Emissive_Mask103_g187473 );
				float3 appendResult293_g187473 = (float3(temp_output_279_0_g187473 , temp_output_279_0_g187473 , temp_output_279_0_g187473));
				half3 Local_EmissiveColor278_g187473 = appendResult293_g187473;
				half3 Emissive_GlobalMask248_g187473 = half3( 1, 1, 1 );
				half3 Visual_AlbedoRaw306_g187473 = temp_output_297_23_g187473;
				float3 lerpResult307_g187473 = lerp( float3( 1,1,1 ) , Visual_AlbedoRaw306_g187473 , _EmissiveColorMode);
				half3 Local_EmissiveValue88_g187473 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g187473 * lerpResult307_g187473 );
				half3 Emissive_Blend260_g187473 = ( ( (Visual_Emissive255_g187473).xyz * Local_EmissiveColor278_g187473 ) * Local_EmissiveValue88_g187473 );
				float3 temp_output_3_0_g187479 = Emissive_Blend260_g187473;
				float temp_output_15_0_g187479 = _emissive_power_value;
				float3 temp_output_23_0_g187479 = ( temp_output_3_0_g187479 * temp_output_15_0_g187479 );
				half Local_EmissiveMask294_g187473 = temp_output_279_0_g187473;
				float4 appendResult295_g187473 = (float4(temp_output_23_0_g187479 , Local_EmissiveMask294_g187473));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g187473 = appendResult295_g187473;
				#else
				float4 staticSwitch129_g187473 = temp_cast_7;
				#endif
				half4 Final_Emissive184_g187473 = staticSwitch129_g187473;
				float4 In_Emissive3_g187488 = Final_Emissive184_g187473;
				float In_Grayscale3_g187488 = Out_Grayscale4_g187477;
				float In_Luminosity3_g187488 = Out_Luminosity4_g187477;
				float temp_output_297_11_g187473 = Out_MultiMask4_g187477;
				float In_MultiMask3_g187488 = temp_output_297_11_g187473;
				float In_AlphaClip3_g187488 = Out_AlphaClip4_g187477;
				float In_AlphaFade3_g187488 = Out_AlphaFade4_g187477;
				float3 In_Translucency3_g187488 = Out_Translucency4_g187477;
				float In_Transmission3_g187488 = Out_Transmission4_g187477;
				float In_Thickness3_g187488 = Out_Thickness4_g187477;
				float In_Diffusion3_g187488 = Out_Diffusion4_g187477;
				float In_Depth3_g187488 = Out_Depth4_g187477;
				{
				Data3_g187488.Dummy = In_Dummy3_g187488;
				Data3_g187488.Albedo = In_Albedo3_g187488;
				Data3_g187488.AlbedoRaw = In_AlbedoRaw3_g187488;
				Data3_g187488.NormalTS = In_NormalTS3_g187488;
				Data3_g187488.NormalWS = In_NormalWS3_g187488;
				Data3_g187488.Shader = In_Shader3_g187488;
				Data3_g187488.Emissive= In_Emissive3_g187488;
				Data3_g187488.MultiMask = In_MultiMask3_g187488;
				Data3_g187488.Grayscale = In_Grayscale3_g187488;
				Data3_g187488.Luminosity = In_Luminosity3_g187488;
				Data3_g187488.AlphaClip = In_AlphaClip3_g187488;
				Data3_g187488.AlphaFade = In_AlphaFade3_g187488;
				Data3_g187488.Translucency = In_Translucency3_g187488;
				Data3_g187488.Transmission = In_Transmission3_g187488;
				Data3_g187488.Thickness = In_Thickness3_g187488;
				Data3_g187488.Diffusion = In_Diffusion3_g187488;
				Data3_g187488.Depth = In_Depth3_g187488;
				}
				TVEVisualData Data4_g187493 = Data3_g187488;
				float Out_Dummy4_g187493 = 0;
				float3 Out_Albedo4_g187493 = float3( 0,0,0 );
				float3 Out_AlbedoRaw4_g187493 = float3( 0,0,0 );
				float2 Out_NormalTS4_g187493 = float2( 0,0 );
				float3 Out_NormalWS4_g187493 = float3( 0,0,0 );
				float4 Out_Shader4_g187493 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g187493 = float4( 0,0,0,0 );
				float Out_MultiMask4_g187493 = 0;
				float Out_Grayscale4_g187493 = 0;
				float Out_Luminosity4_g187493 = 0;
				float Out_AlphaClip4_g187493 = 0;
				float Out_AlphaFade4_g187493 = 0;
				float3 Out_Translucency4_g187493 = float3( 0,0,0 );
				float Out_Transmission4_g187493 = 0;
				float Out_Thickness4_g187493 = 0;
				float Out_Diffusion4_g187493 = 0;
				float Out_Depth4_g187493 = 0;
				{
				Out_Dummy4_g187493 = Data4_g187493.Dummy;
				Out_Albedo4_g187493 = Data4_g187493.Albedo;
				Out_AlbedoRaw4_g187493 = Data4_g187493.AlbedoRaw;
				Out_NormalTS4_g187493 = Data4_g187493.NormalTS;
				Out_NormalWS4_g187493 = Data4_g187493.NormalWS;
				Out_Shader4_g187493 = Data4_g187493.Shader;
				Out_Emissive4_g187493= Data4_g187493.Emissive;
				Out_MultiMask4_g187493 = Data4_g187493.MultiMask;
				Out_Grayscale4_g187493 = Data4_g187493.Grayscale;
				Out_Luminosity4_g187493= Data4_g187493.Luminosity;
				Out_AlphaClip4_g187493 = Data4_g187493.AlphaClip;
				Out_AlphaFade4_g187493 = Data4_g187493.AlphaFade;
				Out_Translucency4_g187493 = Data4_g187493.Translucency;
				Out_Transmission4_g187493 = Data4_g187493.Transmission;
				Out_Thickness4_g187493 = Data4_g187493.Thickness;
				Out_Diffusion4_g187493 = Data4_g187493.Diffusion;
				Out_Depth4_g187493= Data4_g187493.Depth;
				}
				float4 appendResult92_g187491 = (float4(Out_Albedo4_g187493 , 1.0));
				
				float3 appendResult123_g187491 = (float3(Out_NormalTS4_g187493 , 1.0));
				float3 temp_output_13_0_g187497 = appendResult123_g187491;
				float3 temp_output_33_0_g187497 = ( temp_output_13_0_g187497 * _render_normal );
				float3 switchResult12_g187497 = (((ase_vface>0)?(temp_output_13_0_g187497):(temp_output_33_0_g187497)));
				float4 vertexToFrag140_g187491 = i.ase_texcoord6;
				float3 objToWorldDir58_g187498 = mul( unity_ObjectToWorld, float4( vertexToFrag140_g187491.xyz, 0.0 ) ).xyz;
				float ase_tangentSign = i.ase_texcoord1.w;
				float3 vertexToFrag139_g187491 = i.ase_texcoord7.xyz;
				float3 objToWorldDir60_g187498 = mul( unity_ObjectToWorld, float4( vertexToFrag139_g187491, 0.0 ) ).xyz;
				float4 screenPos = i.ase_texcoord8;
				float ase_depthRaw = screenPos.z / screenPos.w;
				float4 appendResult94_g187491 = (float4((mul( switchResult12_g187497, float3x3(objToWorldDir58_g187498, ( ase_tangentSign * cross( objToWorldDir60_g187498 , objToWorldDir58_g187498 ) ), objToWorldDir60_g187498) )*0.5 + 0.5) , ase_depthRaw));
				
				float4 break98_g187491 = Out_Shader4_g187493;
				#ifdef TVE_EMISSIVE
				float staticSwitch128_g187491 = Out_Emissive4_g187493.w;
				#else
				float staticSwitch128_g187491 = break98_g187491.y;
				#endif
				float temp_output_110_11_g187491 = Out_MultiMask4_g187493;
				float4 appendResult99_g187491 = (float4(break98_g187491.x , staticSwitch128_g187491 , temp_output_110_11_g187491 , break98_g187491.w));
				
				float4 appendResult118_g187491 = (float4(i.ase_color.r , i.ase_color.g , temp_output_110_11_g187491 , break98_g187491.w));
				

				outGBuffer0 = appendResult92_g187491;
				outGBuffer1 = appendResult94_g187491;
				outGBuffer2 = appendResult99_g187491;
				outGBuffer3 = appendResult118_g187491;
				outGBuffer4 = i.ase_color;
				outGBuffer5 = 0;
				outGBuffer6 = 0;
				outGBuffer7 = 0;
				float alpha = Out_AlphaClip4_g187493;
				clip( alpha );
				outDepth = i.pos.z;
			}
			ENDCG
		}
	}
	
	
	Fallback Off
}
/*ASEBEGIN
Version=19802
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;320;-7040,-384;Inherit;False;Block Model;69;;76826;7ad7765e793a6714babedee0033c36e9;14,240,1,290,1,291,1,289,1,181,0,183,0,185,0,188,0,190,0,184,0,192,0,189,0,300,0,193,0;10;102;FLOAT3;0,0,0;False;163;FLOAT3;0,0,0;False;186;FLOAT3;0,0,0;False;187;FLOAT3;0,0,0;False;166;FLOAT3;0,0,0;False;164;FLOAT3;0,0,0;False;301;FLOAT3;0,0,0;False;167;FLOAT4;0,0,0,0;False;172;FLOAT4;0,0,0,0;False;175;FLOAT4;0,0,0,0;False;2;OBJECT;128;OBJECT;314
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;322;-6720,-320;Half;False;Model Frag;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;323;-3712,-384;Inherit;False;322;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;325;-3456,-256;Inherit;False;322;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;327;-3456,-384;Inherit;False;Block Main;81;;128376;b04cfed9a7b4c0841afdb49a38c282c5;5,65,1,136,1,41,1,133,1,40,1;1;225;OBJECT;0,0,0,0;False;1;OBJECT;106
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;328;-3136,-128;Half;False;Property;_SecondBakeMode;_SecondBakeMode;231;0;Fetch;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;393;-3200,-256;Inherit;False;Block Layer;105;;139565;5f6a6b9e0b5515744bf8e48a9ccead1b;13,986,1,709,1,726,1,748,1,1070,1,1066,1,1048,0,1045,0,1053,1,1035,1,1055,1,1051,1,1008,0;3;585;OBJECT;0,0,0,0;False;633;OBJECT;0,0,0,0;False;974;OBJECT;0,0,0,0;False;1;OBJECT;552
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;330;-2816,-256;Inherit;False;322;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;331;-2816,-384;Inherit;False;If Visual Data;-1;;139606;947a79bd19d4b8e46835240e033f082b;0;3;3;OBJECT;0;False;17;OBJECT;0;False;19;FLOAT;0;False;1;OBJECT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;333;-2496,-128;Half;False;Property;_ThirdBakeMode;_ThirdBakeMode;232;0;Fetch;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;391;-2560,-256;Inherit;False;Block Detail;157;;139607;a5b52fdec7b855a4fba859a90e837892;13,990,1,709,1,726,1,748,1,1073,1,1083,1,1062,0,1057,0,1067,1,1048,1,1069,1,1065,1,1013,0;3;585;OBJECT;0,0,0,0;False;633;OBJECT;0,0,0,0;False;971;OBJECT;0,0,0,0;False;1;OBJECT;552
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;335;-2176,-384;Inherit;False;If Visual Data;-1;;139647;947a79bd19d4b8e46835240e033f082b;0;3;3;OBJECT;0;False;17;OBJECT;0;False;19;FLOAT;0;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;336;-2176,-256;Inherit;False;322;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;337;-1888,-128;Half;False;Property;_OcclusionBakeMode;_OcclusionBakeMode;233;0;Fetch;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;338;-1888,-256;Inherit;False;Block Occlusion;206;;139648;ec16733ec52362048954a75640fbe560;1,210,1;2;144;OBJECT;0,0,0,0;False;204;OBJECT;0,0,0,0;False;1;OBJECT;116
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;339;-1536,-384;Inherit;False;If Visual Data;-1;;139658;947a79bd19d4b8e46835240e033f082b;0;3;3;OBJECT;0;False;17;OBJECT;0;False;19;FLOAT;0;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;340;-1536,-256;Inherit;False;322;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;342;-1216,-128;Half;False;Property;_GradientBakeMode;_GradientBakeMode;234;0;Fetch;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;341;-1248,-256;Inherit;False;Block Gradient;218;;139659;1f0cb348753541648acbe7a6adce694e;1,228,1;2;144;OBJECT;0,0,0,0;False;222;OBJECT;0,0,0,0;False;1;OBJECT;116
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;343;-896,-384;Inherit;False;If Visual Data;-1;;139669;947a79bd19d4b8e46835240e033f082b;0;3;3;OBJECT;0;False;17;OBJECT;0;False;19;FLOAT;0;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;354;-896,-256;Inherit;False;322;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;397;-6720,-384;Half;False;Model Vert;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;357;-576,-128;Half;False;Property;_OverlayBakeMode;_OverlayBakeMode;235;0;Fetch;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;395;-640,-256;Inherit;False;Block Lite Overlay;8;;139670;df6d6bbf01172a34387d93d862d3d156;8,813,1,821,1,819,1,929,1,923,1,826,1,823,1,828,1;3;572;OBJECT;0,0,0,0;False;596;OBJECT;0,0,0,0;False;600;OBJECT;0,0,0,0;False;1;OBJECT;566
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;398;-6272,-384;Inherit;False;397;Model Vert;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;358;-256,-384;Inherit;False;If Visual Data;-1;;139693;947a79bd19d4b8e46835240e033f082b;0;3;3;OBJECT;0;False;17;OBJECT;0;False;19;FLOAT;0;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;379;-256,-256;Inherit;False;322;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;399;-6016,-384;Inherit;False;397;Model Vert;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;401;-5952,-128;Half;False;Property;_NormalBakeMode;_NormalBakeMode;238;0;Fetch;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;404;-6016,-256;Inherit;False;Block Normal;239;;187456;87f7defafe56dbf4b954caf5efc3f5ca;6,1722,0,1724,1,1713,0,1693,1,1700,0,1638,0;2;146;OBJECT;0,0,0,0;False;1631;OBJECT;0,0,0,0;False;1;OBJECT;128
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;392;128,-384;Inherit;False;Block Emissive;45;;187473;64497f287b9096b43b688b52b4a0bf20;6,282,0,273,1,319,0,312,0,264,1,267,1;3;146;OBJECT;0,0,0,0;False;148;OBJECT;0,0,0,0;False;178;OBJECT;0,0,0,0;False;1;OBJECT;183
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;402;-5632,-384;Inherit;False;If Model Data;-1;;187489;d269c9c511ff160419055604aade1e70;0;3;3;OBJECT;0;False;17;OBJECT;0;False;19;FLOAT;0;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;368;512,-384;Half;False;Visual Data;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;403;-5440,-384;Half;False;Model Data;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;369;1280,-384;Inherit;False;368;Visual Data;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;405;1280,-320;Inherit;False;403;Model Data;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;319;-4992,-384;Inherit;False;Constant;_Vector1;Vector 1;14;0;Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CustomExpressionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;321;-4736,-384;Inherit;False;Data.Dummy = In_Dummy@$Data.CoatParams = In_CoatParams@$Data.PaintParams = In_PaintParams@$Data.GlowParams = In_GlowParams@$Data.AtmoParams = In_AtmoParams@$Data.FormParams= In_FormParams@$Data.WindParams = In_WindParams@$Data.PushParams = In_PushParams@$$$$$$;1;Call;9;True;Data;OBJECT;(TVEGlobalData)0;Out;TVEGlobalData;Half;False;True;In_Dummy;FLOAT;0;In;;Half;False;True;In_CoatParams;FLOAT4;0,0,0,0;In;;Half;False;True;In_PaintParams;FLOAT4;0,0,0,0;In;;Half;False;True;In_GlowParams;FLOAT4;0,0,0,0;In;;Half;False;True;In_AtmoParams;FLOAT4;0,0,0,0;In;;Half;False;True;In_FormParams;FLOAT4;0,0,0,0;In;;Half;False;True;In_WindParams;FLOAT4;0,0,0,0;In;;Half;False;True;In_PushParams;FLOAT4;0,0,0,0;In;;Half;False;BuildGlobalData;False;False;0;;False;10;0;FLOAT;0;False;1;OBJECT;(TVEGlobalData)0;False;2;FLOAT;0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;9;FLOAT4;0,0,0,0;False;2;FLOAT;0;OBJECT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;324;-4416,-384;Half;False;Global Data;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;373;1888,-512;Inherit;False;Base Compile;-1;;187490;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;268;1280,-512;Half;False;Property;_RenderCull;_RenderCull;236;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;384;1472,-512;Half;False;Property;_RenderNormal;_RenderNormal;237;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;386;1536,-384;Inherit;False;Block Render Baker;0;;187491;5fadd80fe4bec3e42b1e9ce050e0c79b;0;2;17;OBJECT;;False;129;OBJECT;;False;6;FLOAT4;90;FLOAT4;96;FLOAT4;97;FLOAT4;113;COLOR;117;FLOAT;93
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;396;1888,-384;Float;False;True;-1;3;;100;16;Hidden/BOXOPHOBIC/The Visual Engine Lite/Helpers/Impostors Baker;b7b0c094c5aa58c468ed57de8fb0ffda;True;Unlit;0;0;Unlit;10;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;0;True;_RenderCull;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;5;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;0;0;1;True;False;;True;0
WireConnection;322;0;320;314
WireConnection;327;225;323;0
WireConnection;393;585;327;106
WireConnection;393;633;325;0
WireConnection;331;3;327;106
WireConnection;331;17;393;552
WireConnection;331;19;328;0
WireConnection;391;585;331;0
WireConnection;391;633;330;0
WireConnection;335;3;331;0
WireConnection;335;17;391;552
WireConnection;335;19;333;0
WireConnection;338;144;335;0
WireConnection;338;204;336;0
WireConnection;339;3;335;0
WireConnection;339;17;338;116
WireConnection;339;19;337;0
WireConnection;341;144;339;0
WireConnection;341;222;340;0
WireConnection;343;3;339;0
WireConnection;343;17;341;116
WireConnection;343;19;342;0
WireConnection;397;0;320;128
WireConnection;395;572;343;0
WireConnection;395;596;354;0
WireConnection;358;3;343;0
WireConnection;358;17;395;566
WireConnection;358;19;357;0
WireConnection;404;146;398;0
WireConnection;392;146;358;0
WireConnection;392;148;379;0
WireConnection;402;3;399;0
WireConnection;402;17;404;128
WireConnection;402;19;401;0
WireConnection;368;0;392;183
WireConnection;403;0;402;0
WireConnection;321;3;319;0
WireConnection;321;4;319;0
WireConnection;321;6;319;0
WireConnection;324;0;321;2
WireConnection;386;17;369;0
WireConnection;386;129;405;0
WireConnection;396;0;386;90
WireConnection;396;1;386;96
WireConnection;396;2;386;97
WireConnection;396;3;386;113
WireConnection;396;4;386;117
WireConnection;396;8;386;93
ASEEND*/
//CHKSM=969B3BE3B8FBA3AFCE4F1E5EFD1978D7DC446F81
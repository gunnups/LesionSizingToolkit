itk_wrap_module(LesionSizingToolkit)

set(WRAPPER_SUBMODULE_ORDER
   itkBinaryThresholdFeatureGenerator
   itkCannyEdgeDetectionRecursiveGaussianImageFilter
   itkCannyEdgesDistanceAdvectionFieldFeatureGenerator
   itkCannyEdgesDistanceFeatureGenerator
   itkCannyEdgesFeatureGenerator
   itkConfidenceConnectedSegmentationModule
   itkConnectedThresholdSegmentationModule
   itkDescoteauxSheetnessFeatureGenerator
   itkDescoteauxSheetnessImageFilter
   itkFastMarchingAndGeodesicActiveContourLevelSetSegmentationModule
   itkFastMarchingAndShapeDetectionLevelSetSegmentationModule
   itkFastMarchingSegmentationModule
   itkFeatureAggregator
   itkFeatureGenerator
   itkFrangiTubularnessFeatureGenerator
   itkFrangiTubularnessImageFilter
   itkGeodesicActiveContourLevelSetSegmentationModule
   itkGradientMagnitudeSigmoidFeatureGenerator
   itkGrayscaleImageSegmentationVolumeEstimator
   itkIsotropicResampler
   itkIsotropicResamplerImageFilter
   itkLandmarksReader
   itkLesionSegmentationImageFilter8
   itkLesionSegmentationMethod
   itkLocalStructureImageFilter
   itkLungWallFeatureGenerator
   itkMaximumFeatureAggregator
   itkMinimumFeatureAggregator
   itkMorphologicalOpeningFeatureGenerator
   itkRegionCompetitionImageFilter
   itkRegionGrowingSegmentationModule
   itkSatoLocalStructureFeatureGenerator
   itkSatoVesselnessFeatureGenerator
   itkSatoVesselnessSigmoidFeatureGenerator
   itkSegmentationModule
   itkSegmentationVolumeEstimator
   itkShapeDetectionLevelSetSegmentationModule
   itkSigmoidFeatureGenerator
   itkSinglePhaseLevelSetSegmentationModule
   itkVesselEnhancingDiffusion3DImageFilter
   itkVotingBinaryHoleFillFloodingImageFilter
   itkWeightedSumFeatureAggregator
   )

itk_auto_load_submodules()
itk_end_wrap_module()

/*=========================================================================

  Program:   Lesion Sizing Toolkit
  Module:    itkGeodesicActiveContourLevelSetSegmentationModuleTest1.cxx

  Copyright (c) Kitware Inc. 
  All rights reserved.
  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notice for more information.

=========================================================================*/

#include "itkGeodesicActiveContourLevelSetSegmentationModule.h"
#include "itkImage.h"
#include "itkSpatialObject.h"
#include "itkImageSpatialObject.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"

int itkGeodesicActiveContourLevelSetSegmentationModuleTest1( int argc, char * argv [] )
{

  if( argc < 3 )
    {
    std::cerr << "Missing Arguments" << std::endl;
    std::cerr << argv[0] << " inputImage featureImage outputImage [advectionScaling] [curvatureScaling] [propagationScaling] [maxIterations]" << std::endl;
    return EXIT_FAILURE;
    }


  constexpr unsigned int Dimension = 3;

  using SegmentationModuleType = itk::GeodesicActiveContourLevelSetSegmentationModule< Dimension >;

  SegmentationModuleType::Pointer  segmentationModule = SegmentationModuleType::New();
  
  using InputImageType = SegmentationModuleType::InputImageType;
  using FeatureImageType = SegmentationModuleType::FeatureImageType;
  using OutputImageType = SegmentationModuleType::OutputImageType;

  using InputReaderType = itk::ImageFileReader< InputImageType >;
  using FeatureReaderType = itk::ImageFileReader< FeatureImageType >;
  using WriterType = itk::ImageFileWriter< OutputImageType >;

  InputReaderType::Pointer inputReader = InputReaderType::New();
  FeatureReaderType::Pointer featureReader = FeatureReaderType::New();

  inputReader->SetFileName( argv[1] );
  featureReader->SetFileName( argv[2] );

  try 
    {
    inputReader->Update();
    featureReader->Update();
    }
  catch( itk::ExceptionObject & excp )
    {
    std::cerr << excp << std::endl;
    return EXIT_FAILURE;
    }


  using InputSpatialObjectType = SegmentationModuleType::InputSpatialObjectType;
  using FeatureSpatialObjectType = SegmentationModuleType::FeatureSpatialObjectType;
  using OutputSpatialObjectType = SegmentationModuleType::OutputSpatialObjectType;

  InputSpatialObjectType::Pointer inputObject = InputSpatialObjectType::New();
  FeatureSpatialObjectType::Pointer featureObject = FeatureSpatialObjectType::New();

  inputObject->SetImage( inputReader->GetOutput() );
  featureObject->SetImage( featureReader->GetOutput() );

  segmentationModule->SetInput( inputObject );
  segmentationModule->SetFeature( featureObject );
   
  if (argc > 4)
    {
    segmentationModule->SetAdvectionScaling( atof(argv[4]) );
    std::cout << "Setting advection scaling to " << atof(argv[4]) << std::endl;
    }

  if (argc > 5)
    {
    segmentationModule->SetCurvatureScaling( atof(argv[5]) );
    std::cout << "Setting curvature scaling to " << atof(argv[5]) << std::endl;
    }

  if (argc > 6)
    {
    segmentationModule->SetPropagationScaling( atof(argv[6]) );
    std::cout << "Setting propagation scaling to " << atof(argv[6]) << std::endl;
    }

  if (argc > 7)
    {
    segmentationModule->SetMaximumNumberOfIterations( atof(argv[7]) );
    std::cout << "Setting maximum iterations to " << atof(argv[7]) << std::endl;
    }
  
  segmentationModule->Update();

  using SpatialObjectType = SegmentationModuleType::SpatialObjectType;
  SpatialObjectType::ConstPointer segmentation = segmentationModule->GetOutput();

  OutputSpatialObjectType::ConstPointer outputObject = 
    dynamic_cast< const OutputSpatialObjectType * >( segmentation.GetPointer() );

  OutputImageType::ConstPointer outputImage = outputObject->GetImage();

  WriterType::Pointer writer = WriterType::New();

  writer->SetFileName( argv[3] );
  writer->SetInput( outputImage );

  try 
    {
    writer->Update();
    }
  catch( itk::ExceptionObject & excp )
    {
    std::cerr << excp << std::endl;
    return EXIT_FAILURE;
    }


  segmentationModule->Print( std::cout );

  std::cout << "Class name = " << segmentationModule->GetNameOfClass() << std::endl;
  
  return EXIT_SUCCESS;
}

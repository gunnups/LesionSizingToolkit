/*=========================================================================

  Program:   Lesion Sizing Toolkit
  Module:    itkSegmentationVolumeEstimatorTest1.cxx

  Copyright (c) Kitware Inc.
  All rights reserved.
  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notice for more information.

=========================================================================*/

#include "itkSegmentationVolumeEstimator.h"
#include "itkImage.h"
#include "itkSpatialObject.h"
#include "itkImageSpatialObject.h"
#include "itkImageMaskSpatialObject.h"

namespace itk
{

class VolumeEstimatorSurrogate : public SegmentationVolumeEstimator<3>
{
public:
  /** Standard class type alias. */
  using Self = VolumeEstimatorSurrogate;
  using Superclass = ProcessObject;
  using Pointer = SmartPointer<Self>;
  using ConstPointer = SmartPointer<const Self>;

  itkNewMacro( Self );

};

}


int itkSegmentationVolumeEstimatorTest1( int itkNotUsed(argc), char * itkNotUsed(argv) [] )
{
  constexpr unsigned int Dimension = 3;

  using VolumeEstimatorType = itk::VolumeEstimatorSurrogate;

  VolumeEstimatorType::Pointer  volumeEstimator = VolumeEstimatorType::New();

  using ImageSpatialObjectType = itk::ImageSpatialObject< Dimension >;

  ImageSpatialObjectType::Pointer inputObject = ImageSpatialObjectType::New();

  volumeEstimator->SetInput( inputObject );

  volumeEstimator->Update();

  VolumeEstimatorType::RealType volume1 = volumeEstimator->GetVolume();

  const VolumeEstimatorType::RealObjectType * volumeObject = volumeEstimator->GetVolumeOutput();

  if( volumeObject->Get() != volume1 )
    {
    std::cerr << "Error in GetVolumeOutput() and/or GetVolume() " << std::endl;
    return EXIT_FAILURE;
    }

  volumeEstimator->Print( std::cout );

  std::cout << "Class name = " << volumeEstimator->GetNameOfClass() << std::endl;

  return EXIT_SUCCESS;
}

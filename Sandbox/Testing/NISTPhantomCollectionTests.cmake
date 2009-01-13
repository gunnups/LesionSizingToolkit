
SET(COLLECTION_PATH ${TEST_NIST_DATA_ROOT} )

MACRO(TEST_NIST_PHANTOM_DATASET DATASET_ID ROI_X ROI_Y ROI_Z ROI_DX ROI_DY ROI_DZ)

SET(DATASET_ROI ${TEMP}/${DATASET_ID}_ROI.mha)

EXTRACT_REGION_OF_INTEREST( ${DATASET_ID} ${ROI_X} ${ROI_Y} ${ROI_Z} ${ROI_DX} ${ROI_DY} ${ROI_DZ} )
GENERATE_FEATURES( ${DATASET_ID} )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 001 )

ENDMACRO(TEST_NIST_PHANTOM_DATASET)


CONVERT_DICOM_TO_META( ${COLLECTION_PATH} NIST001 "BX0317/20000101-135244-7-1")


#
# Extract ROI and compute features for it
#
TEST_NIST_PHANTOM_DATASET(NIST001 
  168 291 109
   68  41  26
  )


#
# From the same feature images and ROI, use different sets of seed points
#
COMPUTE_SEGMENTATIONS( NIST001 001 )
COMPUTE_SEGMENTATIONS( NIST001 002 )
COMPUTE_SEGMENTATIONS( NIST001 003 )

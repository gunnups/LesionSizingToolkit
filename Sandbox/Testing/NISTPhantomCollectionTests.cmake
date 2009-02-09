
SET(COLLECTION_PATH ${TEST_NIST_DATA_ROOT} )

MACRO(TEST_NIST_PHANTOM_DATASET MASTER_DATASET_ID DATASET_ID ROI_X ROI_Y ROI_Z ROI_DX ROI_DY ROI_DZ)

SET(DATASET_ROI ${TEMP}/${DATASET_ID}_ROI.mha)

EXTRACT_REGION_OF_INTEREST(${MASTER_DATASET_ID} ${DATASET_ID} ${ROI_X} ${ROI_Y} ${ROI_Z} ${ROI_DX} ${ROI_DY} ${ROI_DZ} )
GENERATE_FEATURES( ${DATASET_ID} )

SCREEN_SHOT_FEATURES( ${DATASET_ID} 001 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 002 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 003 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 004 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 005 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 006 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 007 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 008 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 009 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 010 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 011 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 012 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 013 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 014 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 015 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 016 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 017 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 018 )

ENDMACRO(TEST_NIST_PHANTOM_DATASET)


# These phantoms have been arranged in the following configuration. If you look
# along the axial view, 
#             A
#    
#        CR1     CL1          
#        CR2     CL2          
#        CR3     CL3          
# R      CR4     CL4       L
#        CR5     CL5          
#        CR6     CL6          
#        CR7     CL7          
#        
#             P
#
CONVERT_DICOM_TO_META( ${COLLECTION_PATH} NIST_A "BX0317/20000101-135244-7-1")

#
# Extract ROI and compute features for it
#
# CR5 ..
TEST_NIST_PHANTOM_DATASET(NIST_A NIST001 
  168  291   75
   70   40  110
  )

# CR1 ..
TEST_NIST_PHANTOM_DATASET(NIST_A NIST002 
  160  95   60
   70  40  110
  )

# CL7
TEST_NIST_PHANTOM_DATASET(NIST_A NIST003 
  310 390 120 
   70  40 110
  )

# CR3 
TEST_NIST_PHANTOM_DATASET(NIST_A NIST004 
  170 200 44 
   70  40 110
  )

# CR7
TEST_NIST_PHANTOM_DATASET(NIST_A NIST005 
  160 392   85
   70  40  110
  )


SET(VOLUME_NIST_BEAD_A    89.801 ) # Diameter 5.556 mm
SET(VOLUME_NIST_BEAD_B   134.066 ) # Diameter 6.350 mm
SET(VOLUME_NIST_BEAD_C   190.907 ) # Diameter 7.144 mm
SET(VOLUME_NIST_BEAD_D   261.897 ) # Diameter 7.938 mm

#
# From the same feature images and ROI, use different sets of seed points
#
COMPUTE_SEGMENTATIONS( NIST001 001  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST001 002  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST001 003  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST001 004  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST001 005  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST001 006  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST001 007  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST001 008  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST001 009  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST001 010  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST001 011  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST001 012  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST001 013  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST001 014  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST001 015  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST001 016  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST001 017  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST001 018  ${VOLUME_NIST_BEAD_D} )

COMPUTE_SEGMENTATIONS( NIST002 001  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST002 002  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST002 003  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST002 004  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST002 005  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST002 006  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST002 007  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST002 008  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST002 009  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST002 010  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST002 011  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST002 012  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST002 013  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST002 014  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST002 015  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST002 016  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST002 017  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST002 018  ${VOLUME_NIST_BEAD_D} )

COMPUTE_SEGMENTATIONS( NIST003 001  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NIST003 002  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NIST003 003  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NIST003 004  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NIST003 005  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NIST003 006  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NIST003 007  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NIST003 008  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NIST003 009  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NIST003 010  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NIST003 011  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NIST003 012  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NIST003 013  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NIST003 014  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NIST003 015  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NIST003 016  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NIST003 017  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NIST003 018  ${VOLUME_NIST_BEAD_C} )

COMPUTE_SEGMENTATIONS( NIST004 001  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST004 002  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST004 003  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST004 004  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST004 005  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST004 006  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST004 007  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST004 008  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST004 009  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST004 010  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST004 011  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST004 012  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST004 013  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST004 014  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST004 015  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST004 016  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NIST004 017  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NIST004 018  ${VOLUME_NIST_BEAD_D} )


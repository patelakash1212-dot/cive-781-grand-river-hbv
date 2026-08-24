########################################################################
:FileType          rvp ASCII Raven 4.1
:WrittenBy         Akash Patel
:CreationDate      Jul 2026
#
# HBV-EC parameter file for the BasinMaker-derived
# Grand River below Shand Dam model.
#
# Class names in this file match Basinmaker_model.rvh exactly.
# Initial HBV parameter values are adapted from the professor's
# Salmon River HBV-EC template and require calibration.
# ----------------------------------------------------------------------

# Load BasinMaker channel profiles referenced by the .rvh file
:RedirectToFile channel_properties.rvp

# ----------------------------------------------------------------------
# HBV soil storage classes
# ----------------------------------------------------------------------

:SoilClasses
  :Attributes,
  :Units,
  TOPSOIL,  1.0, 0.0, 0
  SLOW_RES, 1.0, 0.0, 0
  FAST_RES, 1.0, 0.0, 0
:EndSoilClasses

# BasinMaker uses the soil-profile names SAND and LAKE.
# Both profiles retain the three-layer HBV storage structure.
:SoilProfiles
# name, layers, {soilClass, thickness} x layers
  SAND, 3, TOPSOIL, 2.036937, FAST_RES, 100.0, SLOW_RES, 100.0
  LAKE, 3, TOPSOIL, 2.036937, FAST_RES, 100.0, SLOW_RES, 100.0
:EndSoilProfiles

# ----------------------------------------------------------------------
# Vegetation classes referenced by Basinmaker_model.rvh
# ----------------------------------------------------------------------

:VegetationClasses
  :Attributes, MAX_HT, MAX_LAI, MAX_LEAF_COND
  :Units,      m,      none,    mm_per_s
  FOREST,      25.0,   6.0,     5.3
  AGRICULTURE,  1.5,   4.0,     4.0
  NO_VEG,       0.1,   0.1,     0.5
  LAKE,         0.0,   0.0,     0.0
:EndVegetationClasses

:VegetationParameterList
  :Parameters, MAX_CAPACITY, MAX_SNOW_CAPACITY, TFRAIN, TFSNOW
  :Units,      mm,           mm,                frac,   frac
  FOREST,      3.0,          4.0,               0.85,   0.80
  AGRICULTURE, 1.5,          2.0,               0.92,   0.90
  NO_VEG,      0.1,          0.1,               0.99,   0.99
  LAKE,        0.0,          0.0,               1.00,   1.00
:EndVegetationParameterList

# ----------------------------------------------------------------------
# Land-use classes referenced by Basinmaker_model.rvh
# ----------------------------------------------------------------------

:LandUseClasses
  :Attributes, IMPERM, FOREST_COV
  :Units,      frac,   frac
  FOREST,      0.00,   1.00
  AGRICULTURE, 0.02,   0.05
  URBAN,       0.70,   0.05
  LAKE,        1.00,   0.00
:EndLandUseClasses




# ----------------------------------------------------------------------
# HBV global parameters
# ----------------------------------------------------------------------

:GlobalParameter ADIABATIC_LAPSE  0.5718813
:GlobalParameter RAINSNOW_TEMP    0.05984519
:GlobalParameter RAINSNOW_DELTA   2.0
:GlobalParameter SNOW_SWI         0.03473693
:GlobalParameter PRECIP_LAPSE     4.873686

:AvgAnnualRunoff 350
# ----------------------------------------------------------------------
# HBV land-use parameters
# ----------------------------------------------------------------------




:LandUseParameterList
  :Parameters, MELT_FACTOR, MIN_MELT_FACTOR, HBV_MELT_FOR_CORR, REFREEZE_FACTOR, HBV_MELT_ASP_CORR
  :Units,      mm/d/K,      mm/d/K,          none,              mm/d/K,          none
  [DEFAULT],   par_MELT,         2.2,             0.4452843,         2.001574,        0.48
:EndLandUseParameterList

:LandUseParameterList
  :Parameters, HBV_MELT_GLACIER_CORR, HBV_GLACIER_KMIN, GLAC_STORAGE_COEFF, HBV_GLACIER_AG
  :Units,      none,                  1/d,               1/d,                1/mm
  [DEFAULT],   1.64,                  0.05,              0.6771759,          0.05
:EndLandUseParameterList





# ----------------------------------------------------------------------
# HBV soil and reservoir parameters
# ----------------------------------------------------------------------

:SoilParameterList
  :Parameters, POROSITY, FIELD_CAPACITY, SAT_WILT, HBV_BETA, MAX_CAP_RISE_RATE, MAX_PERC_RATE, BASEFLOW_COEFF, BASEFLOW_N
  :Units,      none,     none,           none,     none,     mm/d,              mm/d,          1/d,            none

  [DEFAULT],   par_POROSITY,     0.60,           0.04505643, par_HBV_BETA     , 18.94145,          0.0,           0.0,             0.0

  FAST_RES,    _DEFAULT,   _DEFAULT,  0.0,        _DEFAULT, _DEFAULT,  par_MAX_PERC, par_FAST_BASEFLOW,     1.877607

  SLOW_RES,    _DEFAULT,   _DEFAULT,  0.0,        _DEFAULT, _DEFAULT, _DEFAULT, par_SLOW_BASEFLOW,    1.0
:EndSoilParameterList

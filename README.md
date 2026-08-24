# Grand River HBV Model

Hydrologic modelling and calibration project. This repository contains a Raven HBV-EC model of the Grand River watershed below Shand Dam, BasinMaker-derived spatial inputs, observed and meteorological data, model outputs, and an OSTRICH/PADDS calibration setup.

## Model overview

- **Hydrologic model:** Raven 4.1
- **Model structure:** HBV-EC
- **Watershed:** Grand River below Shand Dam
- **Outlet gauge:** WSC 02GA016
- **Simulation period:** January 1, 2013 for 4,017 daily time steps
- **Calibration tool:** OSTRICH
- **Algorithm:** Pareto Archived Dynamically Dimensioned Search (PADDS)
- **Evaluation metrics:** Nash-Sutcliffe Efficiency (NSE), RMSE, Kling-Gupta Efficiency (KGE), and absolute percent bias

## Repository structure

```text
.
|-- Final_model/
|   |-- BasinMaker_Data/       # DEM, elevation bands, land-cover, and soil GIS inputs
|   |-- Model/                 # Raven and OSTRICH calibration setup
|   |   |-- Model/             # Raven configuration, observations, and outputs
|   |   |-- GrandRiver_BM_HBV.rvp.tpl
|   |   |-- ostIn.txt
|   |   `-- Ost-RAVEN.bat
|   |-- RavenInput-.../        # BasinMaker-generated Raven and GeoJSON inputs
|   |-- daily_20260713T1735.csv
|   `-- Met.xlsx
|-- Layout.pdf                 # Watershed/model layout
`-- Project.docx             # Project report
```

## Key model files

The main Raven input files are in `Final_model/Model/Model/`:

- `GrandRiver_BM_HBV.rvi` - run configuration and hydrologic processes
- `GrandRiver_BM_HBV.rvh` - watershed and HRU definition
- `GrandRiver_BM_HBV.rvp` - model parameters
- `GrandRiver_BM_HBV.rvc` - initial conditions
- `GrandRiver_BM_HBV.rvt` - forcing and observation references
- `channel_properties.rvp` - channel properties
- `Lakes.rvh` - lake/reservoir definition
- `data_obs/` - meteorological and observed-flow time series
- `output/` - generated simulation results and diagnostics

The OSTRICH calibration configuration is in `Final_model/Model/`. Six HBV parameters are calibrated using a multi-objective PADDS setup with 200 iterations.

## Running the Raven model

This repository includes Windows executables for reproducibility. Only run executables that you trust and that are compatible with your system.

From PowerShell:

```powershell
cd Final_model\Model\Model
.\Raven.exe GrandRiver_BM_HBV -o output\
```

Review `output/Diagnostics.csv`, `output/Hydrographs.csv`, and `output/Raven_errors.txt` after the run.

## Running the calibration

From PowerShell:

```powershell
cd Final_model\Model
.\Ostrich.exe
```

The calibration workflow is configured by `ostIn.txt`. `Ost-RAVEN.bat` runs Raven for each parameter set, and `CreateAbsPBIAS.ps1` prepares the absolute PBIAS response used by OSTRICH.

## Notes

- Paths and batch scripts are configured for Windows.
- Generated output files are included so results can be reviewed without rerunning the model.
- Binary executables are included for project reproducibility; obtain current Raven and OSTRICH releases from their official sources when possible.
- GIS shapefiles require all companion files (`.shp`, `.shx`, `.dbf`, and `.prj`) to remain together.

## Author

Akash Patel - CIVE 781 course project.

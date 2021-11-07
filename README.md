This repository contains all the files (2 apps and 3 scripts) necessary to run the Analysis Tool.
# Applications
## Analysis Tool

The Analysis Tool App is the main app. It allows the user to perform MEG or EEG analysis. The user can create/delete protocol/subjects/studies, import anatomy/data and apply multiple processes. There is two ways to perfom an analysis. 
One way is to apply each process individually, which allows the user to view the data between each process. The user can also view and modify (creating, renaming, deleting) the detected events or consult the history of each study.
The other way is to apply a pipeline. From the Analysis Tool App, the user can import a Pipeline previously created with the Pipeline Builder (explained later) and apply it to multiples studies.

### Supported File Format
Here is the list of the supported recording software and file format. We will be adding new software and file format as we go!
- BrainVision (.eeg, .vhdr, .vmrk)
- BioSemi (.eeg, .vhdr, .vmrk)
- NeuroLite - Coherance Software (.bin, .elc)
- CTF MEG 275 ()


### Anatomy
When creating a new subject, there is the possibility to use a default anatomy or import a specific anatomy. The default anatomy is a template provided by Brainstorm. Multiple templates are available (template for babies, children, young adults, adults, etc.). If the user wants to import a specific anatomy, the minimum requirements is a MRI of the subjects (T1). The user will then have to mark the fiducials points (nasion, left ear, right ear, anterior commissure, posterior commissure, inter-hemispheric point)

## Pipeline_Builder

This side App allows the user to create, save and modify pipelines. The pipeline are saved as a MatLab structure (.mat) that can be imported in the Analysis Tool and applied on studies. 

### MatLab Structure
The MatLab structure contains a field for every process selected. Each process field contains subfield that contains the parameters for that process.
Example of a typical structure:
```
Structure
├── DateOfCreation
│   └── YYYY-MM-DD-HH-MM-SS
├── Folder
│   └── C:\...
├── Name
│   └── PipelineName
├── NumberOfProcesses
│   └── 4
├── Process
│   ├── AddEEGPosition
│   │   ├── FileType
│   │   │   └── Use Default Pattern
│   │   └── Cap
│   │       └── Colin27: BrainProducts EasyCap 128
│   ├── NotchFilter
│   │   └── Frequence
│   │       └── 60, 120, 180
│   ├── BandPassFilter
│   │   ├── LowFreq
│   │   │   └── 20
│   │   └── HighFreq
│   │       └── 140
│   └── ICA
│       └── NumberOfComponents
│           └── 32
└── Type
    └── EEG 
```

# Scripts
## EEG_Pipeline

This script contains all the process that can be applied on an EEG study. It takes as input (1) a list of the studies to analyze and (2) a MatLab structure with the processes to apply.

Functions available:
- Add EEG Position
- Refine Registration
- Project Electrode on Scalp
- Detect Heartbeats
- Notch Filter
- Band Pass Filter
- Power Spectrum Density
- Average Reference
- ICA


## MEG_Pipeline

This script contains all the process that can be applied on an MEG study. It takes as input (1) a list of the studies to analyze and (2) a MatLab structure with the processes to apply.

Functions available:
- Convert Epoch To Continue
- Notch Filter
- Band Pass Filter
- Power Spectrum Density
- Detect Artifact
- Remove Simultaneous Events
- SSP
- ICA

## Utility_Pipeline

This script contains all the process needed to run the basic operations for the Analysis Tool. It takes as input (1) a MatLab structure with the processes to apply.

Functions available:
- Import Anatomy
- Review Raw Files
- Convert to BIDS
- Import Events

### Conversion to BIDS

```
BIDS
├── derivatives
│   └── bst_db_mapping.mat
├── sub-<label>
│   └── ses-YYYYMMDD
│       ├── anat
│       │   └── sub-<label>_ses-YYYYMMDD_T1w.nii.gz
│       ├── eeg
│       │   ├── sub-<label>[_ses-<label>]_task-<label>[_acq-<label>][_run-<index>]_eeg.edf
│       │   ├── sub-<label>[_ses-<label>]_task-<label>[_acq-<label>][_run-<index>]_eeg.json
│       │   ├── <label>_events.tsv
│       │   ├── <label>_events.json
│       │   └── <label>_provenance.json
│       └── sub-0001_ses-YYYYMMDD_scans.tsv
├── dataset_description.json
└── README
```

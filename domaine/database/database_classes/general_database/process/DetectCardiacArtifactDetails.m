function details = DetectCardiacArtifactDetails()
details = struct( ...
        'fName', 'process_evt_detect_ecg', ...
        'AnalyzerFct', @detectCardiacArtifact);
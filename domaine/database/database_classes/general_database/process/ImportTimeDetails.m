function details = ImportTimeDetails()
details = struct( ...
        'fName', 'process_import_data_time', ...
        'AnalyzerFct', @importTime);

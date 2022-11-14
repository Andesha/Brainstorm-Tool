function parameters = ExportDataParameter()
    p1 = ParameterFactory.create('folder', 'char', char.empty());
    p2 = ParameterFactory.create('extension', 'char', char.empty(), getPossibleExtension());
    p3 = ParameterFactory.create('file_format', 'char', char.empty(), getPossibleFileFormat());
    p3 = p3.setOptionnal();
    parameters = {p1, p2, p3};
end

function possibleExtension = getPossibleExtension()
    possibleExtension = {...
    '.bst', ...  
    '.eeg', ... 
    '.eph', ...
    '.raw', ...
    '.edf', ...
    '.snirf', ...
    '.txt', ...
    '.csv', ...
    '.tsv', ...
    '.xlsx', ...
    '.mat', ...
    };

end

function possibleFileFormat = getPossibleFileFormat()
    possibleFileFormat = {...
        'SPM-DAT', ...
        'EEG-BRAINAMP', ...
        'EEG-CARTOOL-EPH', ...
        'EEG-EGI-RAW', ...
        'EEG-EDF', ...
        'NIRS-SNIRF', ...
        'ASCII-CSV', ...
        'ASCII-CSV-HDR', ...
        'ASCII-CSV-HDR-TR', ...
        'ASCII-TSV', ...
        'ASCII-TSV-HDR', ...
        'ASCII-TSV-HDR-TR', ...
        'ASCII-SPC', ...
        'ASCII-SPC-HDR', ...
        'EXCEL', ...
        'EXCEL-TR', ...
        'BST', ...
        };
end
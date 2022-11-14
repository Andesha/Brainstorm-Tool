function sFilesOut = Bst_ImportTime(sFilesIn, timeWindow)
    sFilesOut = bst_process('CallProcess', 'process_import_data_time', sFilesIn, [], ...
                'subjectname',   sFilesIn.SubjectName, ...
                'condition',     '', ...
                'timewindow',    timeWindow, ...
                'split',         0, ...
                'ignoreshort',   1, ...
                'usectfcomp',    1, ...
                'usessp',        1, ...
                'freq',          [], ...
                'baseline',      [], ...
                'blsensortypes', 'MEG, EEG');
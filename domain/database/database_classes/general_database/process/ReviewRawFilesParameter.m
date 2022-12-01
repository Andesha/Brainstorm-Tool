function parameters = ReviewRawFilesParameter()
    p1 = ParameterFactory.create('subject', 'cell', cell.empty());
    p2 = ParameterFactory.create('raw_files', 'cell', cell.empty());
    p2 = p2.setValidityFunction(@AreFilesValid);
    p2 = p2.setConverterFunction(@RawFilesConverter);
    p3 = ParameterFactory.create('file_format', 'char', char.empty(), getPossibleFileFormat());
    parameters = {p1, p2, p3};
end
    
function AreFilesValid(value)
    classOfCellContent = cellfun(@(x) class(x), value, 'UniformOutput', false);
    isCell = strcmpi(unique(classOfCellContent), 'cell');
    if isCell
        for i = 1:length(value)
            DoFilesExist(value{i});
        end
    else
        DoFilesExist(value);
    end
end

function possibleFileFormat = getPossibleFileFormat()
    possibleFileFormat = {...
        'EEG-DELTAMED', ...
        'EEG-BRAINAMP', ...
        'EEG-EDF', ...
        'CTF', ...
        };
end

function value = RawFilesConverter(value)
    if all(cellfun(@(x) isa(x, 'char'), value))
        value = {value};
    end
end

function DoFilesExist(files)
    isFiles = cellfun(@(x) isfile(x), files);
    invalidFiles = files(~isFiles);
    if ~isempty(invalidFiles)
        invalidFilesAsChars = char(strjoin(invalidFiles, '\n'));
        errorMessage = ['The following files do not exist:' newline invalidFilesAsChars];
        error(errorMessage);
    end
end
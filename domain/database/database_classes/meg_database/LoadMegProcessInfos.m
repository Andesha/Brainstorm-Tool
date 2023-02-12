function eegProcessNames = LoadMegProcessInfos()
    eegProcessNames = {...        
        'convert_epochs_to_continue', @ConvertEpochsToContinueDetails, @ConvertEpochsToContinueParameter; ...
        'ssp_cardiac', @SspCardiacDetails, @SspCardiacParameter; ...
        'ssp_blink', @SspBlinkDetails, @SspBlinkParameter; ...
        'ssp_generic', @SspGenericDetails, @SspGenericParameter; ...
        'remove_simultaneaous_events', @RemoveSimultaneaousEventsDetails, @RemoveSimultaneaousEventsParameter; ...
        };
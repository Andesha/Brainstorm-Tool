function is_created = protocol_is_created(protocol_name)            
    all_protocols = protocol_get_all();
    is_created = any(strcmpi(all_protocols, protocol_name));            
end
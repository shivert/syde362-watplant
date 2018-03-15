function str = modifyDomain(domain_file_id, d1, d2, d3, d4)
    file = strsplit(fscanf(domain_file_id, '%c'), '\n');
    file_offset_header = 6;
 
    mesh_node_lookup = [3 23 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 2]; % node numbers along the top
    rows_to_switch_on = [];
    
    if d1 ~= 0
      rows_to_switch_on(end + 1) = mesh_node_lookup(d1);
      rows_to_switch_on(end + 1) = mesh_node_lookup(d1 + 1);
    end
    
    if d2 ~= 0
        rows_to_switch_on(end + 1) = mesh_node_lookup(d2);
        rows_to_switch_on(end + 1) = mesh_node_lookup(d2 + 1);
    end

    if d3 ~= 0
        rows_to_switch_on(end + 1) = mesh_node_lookup(d3);
        rows_to_switch_on(end + 1) = mesh_node_lookup(d3 + 1);
    end
    
    if d4 ~= 0
        rows_to_switch_on(end + 1) = mesh_node_lookup(d4);
        rows_to_switch_on(end + 1) = mesh_node_lookup(d4 + 1);
    end
    
    rows_to_switch_on_unique = unique(rows_to_switch_on);
    
    % Turn all rows off
    for elm = mesh_node_lookup
        file{elm + file_offset_header} = modifyDomainRow(file{elm + file_offset_header}, false);
    end

    % Turn on appropriate rows
    for elm = rows_to_switch_on_unique
        file{elm + file_offset_header} = modifyDomainRow(file{elm + file_offset_header}, true);
    end
    
    str= strjoin(file, '\n');
end


function str = modifyDomain(domain_file_id, nodes_on,q)
    file = strsplit(fscanf(domain_file_id, '%c'), '\n');
    file_offset_header = 6;
    
    mesh_node_lookup = [3 23 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 2]; % node numbers along the top
    
    % Turn all rows off
    for elm = mesh_node_lookup
        file{elm + file_offset_header} = modifyDomainRow(file{elm + file_offset_header}, false,0);
    end

    % Turn on appropriate rows
    for elm = nodes_on
        file{elm + file_offset_header} = modifyDomainRow(file{elm + file_offset_header}, true, q);
    end
    
    str= strjoin(file, '\n');
end


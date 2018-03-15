function str = modifyBoundary(boundary_file_id, nodes_on)
    file = strsplit(fscanf(boundary_file_id, '%c'), '\n');
    num_nodes = length(nodes_on);
    
    nodes_on_str = strings(num_nodes);
    width_array = strings(num_nodes);
    
    %% Modify NumBP  
    Row=file{4};
    RowSplit = string(strsplit(strtrim(Row), ' '));
    RowSplit{1} = num2str(num_nodes);
    
    % Each col needs to occupy eight spaces
     for k = 1:6
         padNum = 0;
         if k <= 2
             padNum = 9;
         else
             padNum = 7;
         end
         
         RowSplit(k) = pad(RowSplit(k), padNum, 'left');
     end
    
    newRow = strjoin(RowSplit,'');
    file{4} = convertStringsToChars(newRow);
    
    %% Modify Node Number Array
    
    % Add paddig to each column
     for k = 1:num_nodes
         nodes_on_str(k) = pad(num2str(nodes_on(k)), 7, 'left');
     end
    
    newRow = strjoin(nodes_on_str,'');
    file{10} = convertStringsToChars(newRow + ' ');
    
    %% Modify Width Number Array
    
    % Each col needs to occupy eight spaces
     for k = 1:num_nodes
         width_array(k) = "    0.5";
     end
    
    newRow = strjoin(width_array,'');
    file{12} = convertStringsToChars(newRow  + ' ');
    
    %% Join all lines together
    str= strjoin(file, '\n');
end


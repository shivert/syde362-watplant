function str = modifyDimension(dimension_file_id, num_nodes)
    file = strsplit(fscanf(dimension_file_id, '%c'), '\n');
    
    Row=file{3};
    RowSplit = string(strsplit(strtrim(Row), ' '));
    RowSplit{3} = num2str(num_nodes);
    
    % Each col needs to occupy eight spaces
     for k = 1:11
         RowSplit(k) = pad(RowSplit(k), 8, 'left');
     end
    
    newRow = strjoin(RowSplit,'');
    
    file{3} = convertStringsToChars(newRow);
    str= strjoin(file, '\n');
end


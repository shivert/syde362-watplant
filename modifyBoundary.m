function str = modifyBoundary(boundary_file_id, num_boundary)
    file = strsplit(fscanf(boundary_file_id, '%c'), '\n');
    
    Row=file{4};
    RowSplit = string(strsplit(strtrim(Row), ' '));
    RowSplit{1} = num2str(num_boundary);
    
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
    str= strjoin(file, '\n');
end


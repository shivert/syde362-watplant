function new_row = modifyDomainRow(row, row_on)
    RowSplit = string(strsplit(strtrim(row), ' '));
    
    if row_on
        RowSplit{2} = num2str(-1);
        RowSplit{4} = num2str(0.75);
    else
        RowSplit{2} = num2str(0);
        RowSplit{4} = num2str(0);
    end
    
    spacing_mapping = [10,7,12,14,5,9,9,9,9,12];
    
    % Each col needs to occupy a different number of spaces
    % Use mapping defined aboce to keep track of these spaces
     for k = 1:10
         RowSplit(k) = pad(RowSplit(k), spacing_mapping(k), 'left');
     end
    
    new_row = convertStringsToChars(strjoin(RowSplit,'') + ' ');
end


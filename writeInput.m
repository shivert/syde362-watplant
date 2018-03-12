function str=writeInput(file_id, skip_line, char_index, new_value)
file = strsplit(fscanf(file_id, '%c'), '\n');
Row=file{skip_line};
RowSplit =strsplit(Row, ' ');
RowSplit{char_index} = num2str(new_value);
newRow=strjoin(RowSplit,' ');
file{skip_line} = newRow;
str= strjoin(file, '\n');


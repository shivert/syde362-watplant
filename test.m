num_emitter = 3;
d1=1;
d2=13;
d3=18; % these must be 0-20
d4=0
% get rid of repeats
if d1 == d2
    d1=0;
end
if d1 == d3
    d1=0;
end
if d1 == d4
    d1=0;
end
if d2 == d3
    d2=0;
end
if d2 == d4
    d2=0;
end
if d3 == d4
    d3=0;
end

num_boundary = num_emitter*2;


%% 

dimension_file_id = fopen(dimensionIN);
dimension_skip_line = 3;
NumBoundary_dimention_index=4;

newDimensionContent = writeInput(dimension_file_id, dimension_skip_line, NumBoundary_dimention_index, num_boundary);
fclose(dimension_file_id);
dimension_file_id = fopen(dimensionIN, 'wt');
fprintf(dimension_file_id, '%s\n', newDimensionContent);
fclose(dimension_file_id);
%% 

boundary_file_id = fopen(boundaryIN);
boundary_skip_line = 4;
NumBoundary_boundary_index=2;
newBoundaryContent = writeInput(boundary_file_id, boundary_skip_line, NumBoundary_boundary_index, num_boundary);
fclose(boundary_file_id);
boundary_file_id = fopen(boundaryIN, 'wt');
fprintf(boundary_file_id, '%s\n', newBoundaryContent);
fclose(boundary_file_id);



% domain_file_id = fopen(domainDAT);
% domain_file = strsplit(fscanf(domain_file_id, '%c'), '\n');
% 
% domainSplit =strsplit(domain_file, ' ');
% RowSplit{char_index} = num2str(new_value);
% newRow=strjoin(RowSplit,' ');
% file{skip_line} = newRow;
% str= strjoin(file, '\n');






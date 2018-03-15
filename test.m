
num_emitter = 4;
num_boundary = num_emitter*2;

d1=3;
d2=4;
d3=5; % these must be 0-20
d4=0;

%% get rid of repeats
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

%% [Done] Modify DIMENSIO.IN
%% Must change NumBPD to be num_boundary

dimension_file_id = fopen(dimensionIN);
newDimensionContent = modifyDimension(dimension_file_id, num_boundary);
fclose(dimension_file_id);

dimension_file_id = fopen(dimensionIN, 'wt');
fprintf(dimension_file_id, '%s', newDimensionContent);
fclose(dimension_file_id);

%% [Done] Modify BOUNDARY.IN
%% Must change NumBPD to be num_boundary

boundary_file_id = fopen(boundaryIN);
newBoundaryContent = modifyBoundary(boundary_file_id, num_boundary);
fclose(boundary_file_id);

boundary_file_id = fopen(boundaryIN, 'wt');
fprintf(boundary_file_id, '%s', newBoundaryContent);
fclose(boundary_file_id);


%% Modify DOMAIN.DAT
%% This is where all the magic happens!

domain_file_id = fopen(domainDAT);
newDomainContent = modifyDomain(domain_file_id, d1, d2, d3, d4);
fclose(domain_file_id);

domain_file_id = fopen(domainDAT, 'wt');
fprintf(domain_file_id, '%s', newDomainContent);
fclose(domain_file_id);

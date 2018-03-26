
flow_rate = 1;
d1=0;
d2=7;
d3=0; % these must be 0-20
d4=13;

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

num_emitter = 4;
if d1 == 0
    num_emitter = num_emitter -1;
end
if d2 == 0
    num_emitter = num_emitter -1;
end
if d3 == 0
    num_emitter = num_emitter -1;
end
if d4 == 0
    num_emitter = num_emitter -1;
end

nodes_on = getNodes(d1, d2, d3, d4); % find the notes to be turned on

%% [Done] Modify DIMENSIO.IN
%% Must change NumBPD to be num_boundary

dimension_file_id = fopen(dimensionIN);
newDimensionContent = modifyDimension(dimension_file_id, length(nodes_on));
fclose(dimension_file_id);

dimension_file_id = fopen(dimensionIN, 'w');
fprintf(dimension_file_id, '%s', newDimensionContent);
fclose(dimension_file_id);

%% [Done] Modify BOUNDARY.IN
%% Must change NumBPD to be num_boundary

boundary_file_id = fopen(boundaryIN);
newBoundaryContent = modifyBoundary(boundary_file_id, nodes_on);
fclose(boundary_file_id);

boundary_file_id = fopen(boundaryIN, 'w');
fprintf(boundary_file_id, '%s', newBoundaryContent);
fclose(boundary_file_id);


%% Modify DOMAIN.DAT
%% This is where all the magic happens!

domain_file_id = fopen(domainDAT);
newDomainContent = modifyDomain(domain_file_id, nodes_on, flow_rate);
fclose(domain_file_id);

domain_file_id = fopen(domainDAT, 'wt');
fprintf(domain_file_id, '%s', newDomainContent);
fclose(domain_file_id);
%% Run hydrus
dos(dos_command);
%% get watercontent for the root zone nodes
nodeIndex = getRootZoneNodes(meshPath, numNodes, rootZone);
[time, waterContent] = processOutput(outputPath, numNodes);
adjustedWater=waterContent-0.1502;
relevantWaterContent = waterContent(nodeIndex); % get water content of the nodes of interest
totalRootZoneWater = avgNodeArea *trapz(relevantWaterContent);
totalWaterInput = flow_rate *time *num_emitter;
efficiency = totalRootZoneWater/totalWaterInput;

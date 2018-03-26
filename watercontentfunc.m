function [content, time]= watercontentfunc(parameter_vec)
run("setup.m");
try
    flow_rate = parameter_vec(1);
    d1 = parameter_vec(2);
    d2 = parameter_vec(3);
    d3 = parameter_vec(4);
    d4 = parameter_vec(5);

    % flow_rate = 1;
    % d1=1;
    % d2=7;
    % d3=20; % these must be 0-20
    % d4=13;

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
    [t, waterContent] = processOutput(outputPath, numNodes);
    if t <20
        warning("calculation stopped before 20 seconds")
        warning(t)
        time=t;
        content=0;
    else
        adjustedWater=waterContent-0.1502;
        relevantWaterContent = adjustedWater(nodeIndex); % get water content of the nodes of interest
        satWater=ones(378,1)*(0.43-0.1502);
        totalsatwater = avgNodeArea *trapz(satWater);
        totalRootZoneWater = avgNodeArea *trapz(relevantWaterContent);
        totalWaterInput = flow_rate *t *num_emitter;
        content = totalRootZoneWater;
        time=t;
    end 
    
catch
    warning("something failed, discarding this try")
    content=0;
    time=0;
end



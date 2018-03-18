function rootZoneNodes = getRootZoneNodes(meshPath, numNode, rootZoneCutoff)
skipLine = 21;
meshFile = fopen(meshPath);
nodes = [];

for k=1:(skipLine)
    x = fgetl(meshFile);
end

for k=1:(numNode)
    node = fgetl(meshFile);
    values = strsplit(node, ' ');
    if str2double(values{4})>= 0.11
        nodes = horzcat(nodes, str2num(values{2}));
    end
end
fclose(meshFile);
rootZoneNodes = nodes;



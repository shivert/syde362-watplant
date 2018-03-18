function [endTime, outputMatrix] = processOutput(fileUrl, numNode)
    fileId = fopen(fileUrl);
    rawValue = fread(fileId, inf, 'float');
    fclose(fileId);
    outputMatrix = rawValue(end-numNode+1:end);
    endTime = rawValue(end-numNode);
end
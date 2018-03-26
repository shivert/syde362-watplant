flowRate = 0.4049;

designVector = [flowRate,0,20,3,7];
flowRateInc = 0.4049:0.004049:0.6;
efficiencyInc=1:1:49;
timeInc=1:1:49;
efficiencyDecc=1:1:51;
timeDecc=1:1:51;
flowRateDec =  0.4049:-0.004049:0.2;

for k=1:length(flowRateDec)
    designVector= [flowRateDec(k),0,20,3,7];
    [efficiency, time] = efficiencyfunc(designVector);
    efficiencyDecc(k)=efficiency;
    timeDecc(k) = time;
end
%% water content calculation
flowRate = 0.4049;

designVector = [flowRate,0,20,3,7];
flowRateInc = 0.4049:0.004049:0.6;
watercontentInc=1:1:49;
timeInc=1:1:49;
watercontentDecc=1:1:51;
timeDecc=1:1:51;
flowRateDec =  0.4049:-0.004049:0.2;

for k=1:length(flowRateInc)
    designVector= [flowRateInc(k),0,20,3,7];
    [content, time] = watercontentfunc(designVector);
    watercontentInc(k)=content;
    timeInc(k) = time;
end

for k=1:length(flowRateDec)
    designVector= [flowRateDec(k),0,20,3,7];
    [content, time] = watercontentfunc(designVector);
    watercontentDecc(k)=content;
    timeDecc(k) = time;
end

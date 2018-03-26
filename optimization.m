lb=[0.24,0,0,0,0];
ub=[10,20,20,20,20];
rng default;
[x,fval]=ga(@fitnessfunc, 5,[],[],[],[],lb,ub,[],[2,3,4,5]);
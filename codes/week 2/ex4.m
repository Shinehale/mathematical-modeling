x0 = [-1.2 2];
% options=optimset('HessUpdate','bfgs')
% options=optimset('HessUpdate','dfp')
options=optimset('HessUpdate','steepdesc')
[x,fval,exitflag,output]=fminunc('fun2',x0,options)

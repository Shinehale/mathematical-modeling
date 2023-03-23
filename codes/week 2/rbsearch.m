f='100*(x(2)-x(1)^2)^2+(1-x(1))^2';
[x,fval,exitflag,output]=fminsearch(f, [-1.2 2])

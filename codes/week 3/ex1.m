c=[-72 -64];
A=[1 1;12 8;3 0];
b=[50;480;100];
[x,fval,exitflag,output,lambda]=linprog(c,A,b,[],[],zeros(2,1),[]);

r=A*x-b;
b2=[51;480;100];
[x2,fval2,exitflag,output]=linprog(c,A,b2);
b3=[50;481;100];
[x3,fval3,exitflag,output]=linprog(c,A,b3);
fval-fval2
fval-fval3

[y,fval,exitflag,output,lambda2]=linprog(b',-A',c',[],[],zeros(3,1),[])
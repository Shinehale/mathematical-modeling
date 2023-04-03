c=[-24 -16 -44 -32 3 3];
A=[1 0 0 0 1 0;1/3 1/4 0 0 1/3 1/4;4 2 0 0 6 4];
b=[100 50 480]';
Aeq=[0 0 1 0 -0.8 0;0 0 0 1 0 -0.75];
beq=zeros(2,1);
lb=zeros(6,1);
[x,fval,exitflag,output,lambda]=linprog(c,A,b,Aeq,beq,lb,[]);

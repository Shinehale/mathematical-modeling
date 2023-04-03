c=[-2 -3 -4];
intcon=[1 2 3];
A=[1.5 3 5;280 250 400];
b=[600 60000]';
lb=zeros(3,1);
[x,fval,exitflag,output]=intlinprog(c,intcon,A,b,[],[],lb,[]);

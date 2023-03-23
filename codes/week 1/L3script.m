% dsolve('Du=1+u^2','t')
% syms u(t)
% dsolve(diff(u)==1+u^2)
% 
% 
y=dsolve('D2y+4*Dy+29*y=0','y(0)=0,Dy(0)=15','x')
syms y(t)
Dy = diff(y);
D2y = diff(y,2);
y=dsolve(D2y+4*Dy+29*y==0,y(0)==0,Dy(0)==15)


% [T,Y]=ode15s('vdp1000',[0 3000],[2 0]); 
% plot(T,Y(:,1),'-')

% [T,Y]=ode45('rigid',[0 12],[0 1 1]);
% plot(T,Y(:,1),'-',T,Y(:,2),'*',T,Y(:,3),'+')


ts=0:50;
x0=[0.02,0.98];
[t,x]=ode45('ill', ts, x0);
[t,x]
plot(t,x(:,1),t,x(:,2)), grid, pause
plot(x(:,2),x(:,1)),grid
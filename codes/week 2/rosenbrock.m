[x,y]=meshgrid(-2:0.1:2,-1:0.1:3);
z=100*(y-x.^2).^2+(1-x).^2;
mesh(x,y,z)
figure
contour(x,y,z,20)
hold on
plot(-1.2,2,' o ');
text(-1.2,2,'start point')
plot(1,1,'o')
text(1,1,'solution')


f='2*exp(-x).*sin(x)';
fplot(f,[0,8]);         %×÷Í¼Óï¾ä
[xmin,ymin]=fminbnd (f, 0,8)
f1='-2*exp(-x).*sin(x)';
[xmax,ymax]=fminbnd (f1, 0,8)

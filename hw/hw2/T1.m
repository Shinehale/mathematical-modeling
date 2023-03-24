x1 = [10, 10];
[x, fval, exitflag, output] = fminsearch('funt1', x1);
x = round(x);
disp(x);
disp(round(-funt1(x)));

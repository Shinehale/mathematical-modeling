x2 = [0];
[x, fval, exitflag, output] = fminsearch('funt2', x2);
x_1 = ceil(x);
x_2 = floor(x);
ans_x = 0;
if (funt2(x_1) < funt2(x_2))
    ans_x = x_1;
else 
    ans_x = x_2;
end
disp(ans_x);
disp(vpa(-funt2(ans_x)));
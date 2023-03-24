% plot the figure
fplot(@(t) funEa(t), [1 20], 'red');
grid on
title('Ea(t) from 1 to 20');
xlabel('t');
ylabel('Ea(t)');
ylim([2000 11000]);
xlim([-1 21]);
% find the target point
t0 = 2;
[t, fval, exitflag, output] = fminsearch('funEa', t0);
t_1 = floor(t);
t_2 = ceil(t);
digits(8);
if (funEa(t_1) < funEa(t_2)) 
    disp(t_1);
    disp(funEa(t_1));
else
    disp(t_2);
    disp(funEa(t_2));
end
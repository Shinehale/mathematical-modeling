% p(t) = 0.95 - 0.01t
% w(t) = 800 + 35t
% c(t) = 6.5t
% g(t) = p(t) * w(t) - c(t)
function f = funt2(x)
    f = - ((0.95 - 0.01 * x) * (800 +35 * x) - 6.5 * x);

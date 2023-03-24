function f = funE(t)
    f = 9000 + C(t);
end
function c = C(t) 
    c = 640 + 180 .* (t + 1) .* t;
end
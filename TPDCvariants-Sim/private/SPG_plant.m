%% TORA system plant
function [dx] = SPG_plant(t,x,u,lpv)
p = [x(3) x(4)];

AB = querylpv(lpv, p);

% dx = A x + B u
dx = AB * [x(:); u];
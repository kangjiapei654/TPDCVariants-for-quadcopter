%% Quad system plant
function [dx] = Quad_plant(t,x,u,lpv)
p = [x(1) x(2) x(4) x(5)];
AB = querylpv(lpv, p);
% dx = A x + B u
dx = AB * [x(:); u];

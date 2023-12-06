%% Quad system plant
function [dx] = QuadVI_plant(t,x,u,lpv)
p = [x(1) x(4)];
AB = querylpv(lpv, p);
% dx = A x + B u
dx = AB * [x(:); u];

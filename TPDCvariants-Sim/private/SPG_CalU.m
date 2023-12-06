function u = tora_CalU(x,K,U,domain)
%% PDC ¿ØÖÆÆ÷
% u = tpcontroller(p, x, K, U, domain);
%TPCONTROLLER Outputs the control signal for a TP controller at a given state
%	u = TPCONTROLLER(p, x, K, U, domain)
%	
%	p      - parameter point
%	x      - state vector
%	K      - core tensor of the feedback TP model
%	U      - weighting function data
%	domain - parameter domain (intervals)
%
%	u      - resulting control signal

p = [x(3) x(4)];
W = queryw1(U,domain,p);
z = tprod(K,W);
z = shiftdim(z);
[n1 n2] = size(z);
% TODO
if n1 > n2
	u = -z' * x(:);
else
	u = -z * x(:);
end
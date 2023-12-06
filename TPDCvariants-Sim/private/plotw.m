function plotw(U, M, Omega, labels)
%PLOTW Plot weight functions of a TP model
%	plotw(U, M, Omega, labels)
%	
%	U      - weight function data for each dimension
%	M      - sampling grid density for each diomension
%	Omega  - sampling intervals for each dimension
%	labels - axis labels for each dimension

fs = 20; % font size
together = 0; % plot all figures together as well
P = size(Omega, 1);
if length(M) == 1
	M = M*ones(1, P);
end
for n = 1:P
	figure(n);
	x = linspace(Omega(n,1), Omega(n,2), M(n));
	plot(x, U{n});
	xlabel(labels(n,1), 'Fontsize', fs);
	ylabel(labels(n,2), 'Fontsize', fs);
	grid on;
	axis tight;
	if together
		figure(P+1);
		subplot(ceil(P/2), 2, n);
		plot(x, U{n});
		xlabel(labels(n,1), 'Fontsize', fs);
		ylabel(labels(n,2), 'Fontsize', fs);
		grid on;
		axis tight;
	end
end

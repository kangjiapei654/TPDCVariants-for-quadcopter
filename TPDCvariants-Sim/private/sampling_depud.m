function D = sampling_depud(f, depidx, domain, gridsize,UDn,X_scaled)
%SAMPLING_DEP Sampling a (multivariate) function
%	D = SAMPLING_DEP(f, depidx, domain, gridsize)
%
%	f        - function of a real^P vector (f depends on a subset of its input)
%	depidx   - index of the dependent elements
%	domain   - [min1 max1;... minP maxP] intervals for each element
%	gridsize - number of sampling grid points for each dependent element
%
%	D        - P-dimensional array of the sampled data
%
%	This function is used internally by the tptoool toolbox
%
%	eg.:   sampling_dep(@(x) x(2)+x(3), [2 3] [-1 1; 0 3], [7 5])
%
%	See also SAMPLING_LPV

% internal function (used by sampling_lpv)

%DIMENSIONS
P = length(gridsize);
p = zeros(max(depidx), 1);
%SAMPLING
if P > 0
	% allocation of sample array
	siz = prod(gridsize);
	for k = 1:siz
		% argument
		% sampling
        p=X_scaled(k,:);
		D(k,1) = f(p);
    end
    if P > 1
		% reshape to proper size
		D = reshape(D, gridsize');
	end
else
	D = f(p);
end
end
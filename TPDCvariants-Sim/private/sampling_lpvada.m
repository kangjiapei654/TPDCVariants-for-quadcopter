function data = sampling_lpvada(TP)
%SAMPLING_TP.lpv Sampling an TP.lpv model
%	sampled = SAMPLING_TP.lpv(TP.lpv, TP.dep, TP.domain, TP.gridsize)
%
%	TP.lpv      - TP.lpv model (cell array of functions with given TP.domain)
%	TP.dep      - parameter TP.dependency of each function (makes sampling more efficient)
%	TP.domain   - sampling intervals for each parameter
%	TP.gridsize - sampling grid size for each parameter
%
%	data     - cell array of the sampled data, not a whole ndim array
%	           (should be used together with TP.domain and TP.gridsize)
%
%	eg. sampling_TP.lpv({@(x)1 @(x)x(1) @(x)x(1)+x(2)}, [0 0; 0 1; 1 1], [-2 2; 0 3], [3 5])
%
%	See also SAMPLING_VEC

% TODO: TP.lpv docs, data docs
% TODO: data -> ndim array
% TODO: TP.gridsize(i) == 1

%DIMENSIONS, PARAMETERS
[Sy, Sx] = size(TP.lpv);
P = size(TP.domain,1);
if length(TP.gridsize) == 1
	gridsize = TP.gridsize * ones(P,1);
else
	if not(length(TP.gridsize) == P)
		error 'length(TP.gridsize) == P must be true'
	end
	gridsize = TP.gridsize(:);
end

%SAMPLING ELEMENT BY ELEMENT OF Sx * Sy MATRIX
data = cell(Sy,Sx);
if Sy == 1 || Sx == 1
	for i = 1:length(TP.lpv)
		% index of TP.dependent params
		TP.depidx = squeeze(TP.dep(i,:) > 0);
		% sampling
		data{i} = sampling_depada(TP,gridsize,i);
	end
else
	for i = 1:Sy
		for j = 1:Sx
			% index of TP.dependent params
			TP.depidx = squeeze(TP.dep(i,j,:) > 0);
            %extremaind=isempty(TP.chebfextrema{i,j});
			% sampling
			data{i,j} = sampling_depada(TP,gridsize,i,j);
		end
	end
end

function Tf = ndim_fold(Mf, dimf, sizf)
ndim = length(sizf);
if ndim == 2
	if dimf == 2
		Tf = Mf';
	else
		Tf = Mf;
	end
else
	% TODO: better wshift
	
	% restore M into T
	new_size = wshift('1D', sizf, dimf-1);
	new_size(1) = size(Mf, 1);
	T = reshape(Mf, new_size);
	
	% rotate T into the right position
	dim_order = wshift('1D', [1:length(sizf)], -(dimf-1));
	Tf = permute(T, dim_order);
end

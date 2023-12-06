function Mu = ndim_unfold(Tu, dimu1)
ndimu = ndims(Tu);
if ndimu == 2
	if dimu1 == 2
		Mu = Tu';
	else
		Mu = Tu;
	end
else
	dimorderu =1:ndimu;
	newdimorderu = wshift('1D', dimorderu, dimu1-1);
	Tu = permute(Tu, newdimorderu);
	% layout the rotated T
	sizu = size(Tu, 1);
	Mu = reshape(Tu, sizu, []);
end

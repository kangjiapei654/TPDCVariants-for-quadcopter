function D = sampling_depada(TP,gridsize,i,j)
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
f=TP.lpv{i,j};
depidx=TP.depidx;
gridsize=gridsize(TP.depidx); 
X_scaled=TP.X_scaled;
deppos=find(TP.dep(i,j,:)>=1)'; % number of variables
veclen=zeros(length(deppos),1);
if ~isempty(deppos)
    for iid=deppos
        % cal the vector length
         veclen(iid)=size(TP.chebfextrema{i,j, iid},1);
    end
    indada=0;
    vecprod=prod(veclen);
    adadata=[];
    for ii=1:vecprod
           indada=indada+1;
           if length(veclen)==1
               X_scaled(ii,1)=TP.chebfextrema{i,j, 1}(ii);
           end
              % for 2-D
           if length(veclen)==2
               xind=ceil(ii/veclen(2));
               yind= ii-2*(xind-1);% ii=2*(xind-1)+yind
               X_scaled(ii,:)=[TP.chebfextrema{i,j, 1}(xind),TP.chebfextrema{i,j, 2}(yind)];
           end           
    end
end
% sort the data
[~,xscal_ind]=sort(X_scaled(:,1));
X_scaled=X_scaled(xscal_ind,:);

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
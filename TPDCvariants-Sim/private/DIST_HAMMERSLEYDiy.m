function POINT_LIST = DIST_HAMMERSLEYDiy(BOUNDS, N,p)
% Generates N points within given bounds chosen using the
% Hammersley method
% BOUNDS is a Dx2 matrix of bounds
% V0.1 Nov 2007. Prakash Manandhar, pmanandhar@umassd.edu
% POINT_LIST = DIST_HAMMERSLEY([-1,1;-1,1], 200)
% plot(POINT_LIST(:,1),POINT_LIST(:,2),'.')
k = size(BOUNDS, 1);
if k > 80
    ERROR('DIST_HAMMERSLEY is only designed for k <= 80 (see primes below)');
end
z = zeros(N,k);
for n=1:N
    z(n,1)=n/N;
    for i=2:k
        R=p( (i-1) );
        %Convert n into base R notation
        m=fix( log(n)/log(R)) ; %Ensure m is an integer
        base=zeros(1,m+1);
        phi=zeros(1,m+1);
        coefs=zeros(m+1,1);
        for j=0:m
            base(j+1)=R^j;
            phi(j+1)=R^(-j-1);
        end
        remain=n;
        for j=m+1:-1:1
            coefs(j)=fix( (remain)/base(j) );
            remain=remain-coefs(j)*base(j);
        end
        z(n,i)=phi*coefs;
    end
end
%z = z( 1 : size(z,1)-1, : );   %Skip the last point

POINT_LIST = zeros (N, k);
for j = 1:k
    LOWER = BOUNDS(j, 1);
    UPPER = BOUNDS(j, 2);
    LEN   = UPPER - LOWER;
    for i = 1:N
        r = LOWER + (z(i,j) * LEN);
        POINT_LIST (i, j) = r;
    end
end

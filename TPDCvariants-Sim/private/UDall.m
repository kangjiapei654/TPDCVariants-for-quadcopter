function uns = UDall(n,s,udflag)
% ���ȷֲ��� �ø��ӵ㷨
% n ˮƽ�� s ������
% UDflag =0, r=0 one UD matrix;
% =1, return all UDflag
h = 1:n;
ind = find(gcd(h,n)==1); %Ѱ�ұ� n С���� n ���ص��� h
hm = h(ind);            %��������
m = length(hm);         %��������ά��, ��С�������� s
udt = mod(h'*hm,n);     %�ø��ӵ㷨
ind0 = find(udt==0);
udt(ind0) = n;          %���ɾ�����Ʊ� U(n^s)
%udt(end,:)=[ ];        %���ɾ�����Ʊ� U^*((n- 1)^s)
if s>m
    disp('s ����С�ڻ���� m');
return;
else
    mcs =nchoosek(m,s);
    if mcs<1e5
        tind = nchoosek(1:m,s);
        [p,q] = size(tind);
        cd2 = zeros(p,1);
        for k=1:p
            UT = udt(1:n,tind(k,:));
            cd2(k,1) = UDCD2(UT);
        end
        if udflag==1 % ���е�UD����
            tc=tind(find(abs(cd2 - min(cd2))<1e-5),:);
            for r=1:size(tc,1)
                uns (:,:,r)= udt(:,tc(r,:));
            end
        else
           tc=tind(find(abs(cd2 - min(cd2))<1e-5),:);
           uns (:,:,1)= udt(:,tc(1,:));
        end
    else
        for k = 1:n
            a = k;
            UT = mod(h'*a.^(0:s- 1),n);
            cd2(k,1) = UDCD2(UT);
        end
        if udflag==1% ���е�UD����
            tc = find(abs(cd2 - min(cd2))<1e-5);
            for r=1:size(tc,1)
                uns (:,:,r)= mod(h'*tc(r).^(0:s- 1),n);
            end
        ind0 = find(uns==0); 
        uns(ind0)=n;            
        else
            tc = find(abs(cd2 - min(cd2))<1e-5);
            uns (:,:,1)= mod(h'*tc(1).^(0:s- 1),n);
            ind0 = find(uns==0); 
            uns(ind0)=n;
        end
    end
end
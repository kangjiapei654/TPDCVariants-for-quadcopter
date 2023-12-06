function [matind,facets]=UijFacets(Uij)
% matind---- row index 4 Uij
%
% 2019-8-3
clc

[m,n]=size(Uij);
if n<=m
	nck=nchoosek(m,n)
else
	error('n should be equalor less than m')
end

matind=[];
for ii=1:nck
    ii_index=randperm(m,n);
    matind=[matind;ii_index];
%     Ktildemat=Uij(ii_index,:);
%     permmatrix(ii,n,n)=Ktildemat;
end
matind=unique(matind,'rows');
facdim1=size(matind,1);
facets={};
kk=0;
for jj=1:facdim1
    Facematrn=Uij(matind(jj,:),:);
    if det(Facematrn)~=0
        kk=kk+1;
        facets{kk,1}= Facematrn;
    end   
end
end

%unique(A)
% x1=[1 2 3 4]; %表示类型一机组运行的台数可能为0台或1台或2台或3台或4台
% x2=[1 2 3]; %表示类型一机组运行的台数可能为0台或1台或2台或3台
% x3=[1 2]; %表示类型一机组运行的台数可能为0台或1台或2台
% [x3,x2,x1] = ndgrid(x3,x2,x1);
% combinatorics=[x1(:) x2(:) x3(:)]; %所有排列组合情况
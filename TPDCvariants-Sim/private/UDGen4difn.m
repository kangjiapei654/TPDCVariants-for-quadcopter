clc
clear all
coli=1;
n=147;
TotNum=prod([n,n])
s=2;
if s==2
    min_ranges_p=[-1,-1]  
    max_ranges_p=[1, 1]  
elseif s==3
    min_ranges_p=[-1,-1,-1]  
    max_ranges_p=[1, 1,1]  
end
udflag=0;
[X_scaled,Xij]=UniformDesignWithScale(TotNum,s,coli,min_ranges_p,max_ranges_p,udflag);
if udflag==0  
    dfnamestr=strcat('UDData',num2str(TotNum),'.mat')
else
    dfnamestr=strcat('UDDatan',num2str(TotNum),'.mat')
end
save(dfnamestr,'Xij')
plot(X_scaled(:,1),X_scaled(:,2),'r*')
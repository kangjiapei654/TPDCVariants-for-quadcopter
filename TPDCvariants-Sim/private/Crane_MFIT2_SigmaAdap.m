function u_c = LDIP_MFIT2_SigmaAdap(x,error,Q,B,u_star,kt_0,Psi1,alpha1,flag)
Omega_star_t= -MF_IT2(error,flag);
E_star=x' * Q *alpha1* B;  % in this case, Q=P, P is calculated by decay rate LMI;
u_c=Omega_star_t;
f_0=abs(u_c-u_star);
T1 = abs(E_star*f_0);
T = x' * Q*alpha1 * x/2;
if T1 < T
    u_s=0;
else
    %u_s=-sign(E_star) * f_0-kt_0*sign(E_star);
    u_s=-(f_0+kt_0)*saturat(E_star,Psi1);
end
u_c=u_c+u_s;
%% Cal membership function
function Omega_t=MF_IT2(error,flag)
% triangle MFs
if flag==1
A1 = zmf(error(1),[-2,-4/3]);
A2 = trimf(error(1),[-2 -4/3 -2/3]);
A3 = trimf(error(1),[-4/3 -2/3 0]);
A4 = trimf(error(1),[-2/3 0 2/3]);
A5 = trimf(error(1),[0 2/3 4/3]);
A6 = trimf(error(1),[2/3 4/3 2]);
A7 = smf(error(1),[4/3 2]);
elseif flag==2
%----------------------------------------
% Gauss MFs
A1 = zmf(error(1),[-2,-4/3]);
A2 = gaussmf(error(1),[1/4 -4/3]);
A3 = gaussmf(error(1),[1/4 -2/3]);
A4 = gaussmf(error(1),[1/4 0 ]);
A5 = gaussmf(error(1),[1/4 2/3]);
A6 = gaussmf(error(1),[1/4 4/3]);
A7 = smf(error(1),[4/3 2]);
%-----------------IT2--e-----------------
%MfsOfErr=[LMF UMF];
elseif flag==3
    MfsOfErr=0.5*[-2,-5/3,-2,-1;     
            1/6,-2/3,1/3,-2/3;
            1/6,0,1/3,0;
            1/6,2/3,1/3,2/3;
            5/3,2,3/3,2];
else
    flag=1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                B(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if flag==1
    B1 = zmf(error(2),[-8,-16/3]);
    B2 = trimf(error(2),[-8,-16/3,-8/3]);
    B3 = trimf(error(2),[-16/3,-8/3 0]);
    B4 = trimf(error(2),[-8/3,0,8/3]);
    B5 = trimf(error(2),[0,8/3,16/3]);
    B6 = trimf(error(2),[8/3,16/3,8]);
    B7 = smf(error(2),[16/3,8]);
%----------------------------------------
elseif flag==2
    B1 = zmf(error(2),[-8,-16/3]);
    B2 = gaussmf(error(2),[1,-16/3]);
    B3 = gaussmf(error(2),[1,-8/3]);
    B4 = gaussmf(error(2),[1,0]);
    B5 = gaussmf(error(2),[1,8/3]);
    B6 = gaussmf(error(2),[1,16/3]);
    B7 = smf(error(2),[16/3,8]);
elseif flag==3
%------------IT2 edot---------------------    
    MfsDotError=0.01*[-8,-15/3,-8,-17/3;
                0.8,-8/3,1,-8/3;
                0.8,0,1,0;
                0.8,8/3,1,8/3;
                17/3,8,16/3,8];
    DimFs1=size(MfsOfErr,1);
    DimFs2=size(MfsDotError,1);
else
   disp('Ñ¡Ôñ´íÎó')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if flag==1||flag==2
We=0.4*[-3,-3,-3,-3,-2,0,0;
    -3,-3,-3,-3,-2,0,0;
    2,-2,-2,-2,0,1,1;
    -2,-2,-1,0,1,2,2;
    -1,-1,0,2,2,2,2;
    0,0,2,3,3,3,3;
    0,0,2,3,3,3,3;];
%--------------------------------------
%kron([A1,A2,A3,A4,A5,A6,A7],[B1;B2;B3;B4;B5;B6;B7]);
A=[A1,A2,A3,A4,A5,A6,A7];
B=[B1;B2;B3;B4;B5;B6;B7];
Omega_t=0;
for i=1:size(We,1)
    Omega_t=Omega_t + We(i,:) * A(i) * B;
end
elseif flag==3
%------------IT2 Y--------------------- 
Y=0.1*[-5,-5;     -4,-4;  -3,-3;  -2,-2;   0,0;
         -2,-2;     -2,-2;  -2,-2; 0,0;    1,1; 
        -2,-2;     -1,-1;  0,0;  1,1;       2,2;
        -1,-1;     0,0;  2,2;      2,2;     2,2;
        0,0;      2,2;   3,3;     4,4;      5,5;
    ];
Y=Y+repmat([-.1,0.1],size(Y,1),1);
Y_l=Y(:,1);
Y_E=Y(:,2);
sz1=size(MfsOfErr,1);
for i=1:sz1
    if i==1
    y1=zmf(error(1),MfsOfErr(i,1:2));% LMF
    y2=zmf(error(1),MfsOfErr(i,3:4));% UMF
    elseif i==sz1
    y1=smf(error(1),MfsOfErr(i,1:2));
    y2=smf(error(1),MfsOfErr(i,3:4));       
    else
    y1=gaussmf(error(1),MfsOfErr(i,1:2));
    y2=gaussmf(error(1),MfsOfErr(i,3:4));  
    end
    V_MfsOfErr.LMF{i}=y1;
    V_MfsOfErr.UMF{i}=y2;
end
% Cal membership funciton value of x, array
sz2=size(MfsDotError,1);
for i=1:size(MfsDotError,1)
    if i==1
    y11=zmf(error(2),MfsDotError(i,1:2));
    y21=zmf(error(2),MfsDotError(i,3:4));
    elseif i==sz2
    y11=smf(error(2),MfsDotError(i,1:2));
    y21=smf(error(2),MfsDotError(i,3:4));       
    else
    y11=gaussmf(error(2),MfsDotError(i,1:2));
    y21=gaussmf(error(2),MfsDotError(i,3:4));  
    end
    V_MfsDotError.LMF{i}=y11;
    V_MfsDotError.UMF{i}=y21;
end
% V_MfsOfErr
% V_MfsDotError
F.fl{1}= kron(cell2mat(V_MfsOfErr.LMF),cell2mat(V_MfsDotError.LMF))';    
F.fu{1}=kron(cell2mat(V_MfsOfErr. UMF),cell2mat(V_MfsDotError.UMF))';   
% F.fl=prod(cell2mat(V_MfsOfErr.LMF));
% F.fu=prod(cell2mat(V_MfsOfErr.UMF));

ly0x=F.fl{1}' * Y(:,1)/(sum(F.fl{1})+eps);
lyKx=F.fu{1}' * Y(:,1)/sum(F.fu{1});
uy_lx=min(ly0x,lyKx);%
part1=(F.fu{1}' * (Y(:,1)-Y(1,1)) * (F.fl{1}' * (Y(end,1)-Y(:,1))))/(F.fu{1}' * (Y(:,1)-Y(1,1))+F.fl{1}' * (Y(end,1)-Y(:,1)));
ly_lx=uy_lx-(sum(F.fu{1}-F.fl{1})/(sum(F.fu{1}) * sum(F.fl{1})+eps)+eps) * part1;
y_lx=(ly_lx+uy_lx)/2;

uy0x=F.fu{1}' * Y(:,2)/sum(F.fu{1});
uyKx=F.fl{1}' * Y(:,2)/(sum(F.fl{1})+eps);
ly_rx=max(uy0x,uyKx);% 
part2=(F.fu{1}' * (Y(:,2)-Y(1,2)) * (F.fl{1}' * (Y(end,2)-Y(:,2))))/(F.fu{1}' * (Y(:,2)-Y(1,2))+F.fl{1}' * (Y(end,2)-Y(:,2)));
uy_rx=uy_lx+(sum(F.fu{1}-F.fl{1})/(sum(F.fu{1}) * sum(F.fl{1})+eps)) * part2;
y_rx=(ly_rx+uy_rx)/2;
Omega_t=(y_lx+y_rx)/2;
else
   disp('Ñ¡Ôñ´íÎó')
end

% Cal membership funciton value of x, array



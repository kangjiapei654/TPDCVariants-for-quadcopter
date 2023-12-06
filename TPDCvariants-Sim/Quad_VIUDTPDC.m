%% Graduation project experiment
%% Chang_Fei_31956084
%% Email:15827093367@163.com
% clc
% clear
%% quadrotor simulation parameter
%I_x=0.082;I_y=0.082;I_z=0.149;
%I_x=0.082;I_y=0.082;I_z=0.149;
I_x=0.000058286; 
I_y=0.000071691; 
I_z=0.0001;
%I_x=0.082;I_y=0.082;I_z=0.149;
a1 =(I_y-I_z)/I_x; a2 =(I_z-I_x)/I_y;
a3=(I_x-I_y)/I_z;
%% LPV model definition for quadrotor attitude model
%% system matrix: lpv = [A(p) B(p)]
%%	p(1): phi x1(t)
%%	p(2): theta x2(t)
%%  p(3): \dotphi x4(t)
%%  p(4): \dottheta x5(t)
%%  x(t)=[phi, theta, psi, dotphi, dottheta, dotpsi]
% Quad_LPV2={@(p)0,@(p)0,@(p)0,@(p)1,@(p)sin(p(2))/cos(p(2))*sin(p(1)),@(p)sin(p(2))/cos(p(2))*cos(p(1)),@(p)0,@(p)0,@(p)0;...
%             @(p)0,@(p)0,@(p)0,@(p)0,@(p)cos(p(1)),@(p)-sin(p(1)),@(p)0,@(p)0,@(p)0;...
%             @(p)0,@(p)0,@(p)0,@(p)0,@(p)sin(p(1))/cos(p(2)),@(p)cos(p(1))/cos(p(2)),@(p)0,@(p)0,@(p)0;...
%             @(p)0,@(p)0,@(p)0,@(p)0,@(p)0,@(p)a1*p(4),@(p)1/I_x,@(p)0,@(p)0;...
%             @(p)0,@(p)0,@(p)0,@(p)0,@(p)0,@(p)a2*p(3),@(p)0,@(p)1/I_y,@(p)0;...
%             @(p)0,@(p)0,@(p)0,@(p)a3*p(4),@(p)0,@(p)0,@(p)0,@(p)0,@(p)1/I_z;...
% };
% %% Parameter relation tensor
% dep1 = zeros([size(Quad_LPV2) 4]);%% p(1): phi x1(t); p(2): theta x2(t); p(3): \dotphi x4(t); p(4): \dottheta x5(t)
% %---------------------------
% dep1(1,5,:) = [1 1 0 0];
% dep1(1,6,:) = [1 1 0 0];
% dep1(2,5,:) = [1 0 0 0];
% dep1(2,6,:) = [1 0 0 0];
% dep1(3,5,:) = [1 1 0 0];
% dep1(3,6,:) = [1 1 0 0];
% dep1(4,6,:) = [0 0 0 1];
% dep1(5,6,:) = [0 0 1 0];
% dep1(6,4,:) = [0 0 0 1];

Quad_LPV2={ @(p)0,@(p)0,@(p)0,@(p)1,@(p)sin(p(1))/cos(p(1))*sin(p(1)),@(p)sin(p(1))/cos(p(1))*cos(p(1)),@(p)0,@(p)0,@(p)0;...
            @(p)0,@(p)0,@(p)0,@(p)0,@(p)cos(p(1)),@(p)-sin(p(1)),@(p)0,@(p)0,@(p)0;...
            @(p)0,@(p)0,@(p)0,@(p)0,@(p)sin(p(1))/cos(p(1)),@(p)cos(p(1))/cos(p(1)),@(p)0,@(p)0,@(p)0;...
            @(p)0,@(p)0,@(p)0,@(p)0,@(p)0,@(p)a1*p(2),@(p)1/I_x,@(p)0,@(p)0;...
            @(p)0,@(p)0,@(p)0,@(p)0,@(p)0,@(p)a2*p(2),@(p)0,@(p)1/I_y,@(p)0;...
            @(p)0,@(p)0,@(p)0,@(p)a3*p(2),@(p)0,@(p)0,@(p)0,@(p)0,@(p)1/I_z;...
};
%% Parameter relation tensor
dep1 = zeros([size(Quad_LPV2) 2]);%% p(1): phi x1(t); p(2): theta x2(t); p(3): \dotphi x4(t); p(4): \dottheta x5(t)
%---------------------------
dep1(1,5,:) = [1 0];
dep1(1,6,:) = [1 0];
dep1(2,5,:) = [1 0];
dep1(2,6,:) = [1 0];
dep1(3,5,:) = [1 0];
dep1(3,6,:) = [1 0];
dep1(4,6,:) = [0 1];
dep1(5,6,:) = [0 1];
dep1(6,4,:) = [0 1];

n = 6;  
%% sampling intervals for each parameter
domain = [-60*pi/180,60*pi/180;-0.8,0.8];
gridsize = [137,137];
filename=strcat('UDData',num2str(prod(gridsize)),'.mat');
load(filename);
TP.X_scaled=Xij;
% lpvdata = sampling_lpv(Quad_LPV2, dep1, domain, gridsize)
%% hosvd decomposition
% [S U sv tol] = hosvd_lpv(lpvdata, dep1, gridsize, 0.001,[5,2]);

%% generating tight polytopic representation
TP.lpv=Quad_LPV2;
TP.dep=dep1;
TP.domain =domain;
TP.gridsize=gridsize;
TP.siz=prod(gridsize);
%% UD parameters

TP.coli=1;
TP.s=1;
TP.UDflag=1;
if TP.s==2
    min_ranges_p=domain(:,1); 
    max_ranges_p=domain(:,2);
elseif TP.s==3
    min_ranges_p=domain(:,1); 
    max_ranges_p=domain(:,2); 
end
lpvdata = sampling_lpvud(TP);
[S U sv tol] = hosvd_lpv(lpvdata, dep1, gridsize, 0.001,[3,2]);

hull = 'cno';
VIUDU = genhull(U, hull);
S = coretensor(VIUDU, lpvdata, dep1);
save('VIUDU14.mat','VIUDU');

% plot the results
% plothull(U, domain);
%% plot hull
% for ii=1:length(U)  
%     plothull(U(ii))
%     pause(10)
%     name=strcat('SPGLRTPDCshul',num2str(ii));
%     epsname1=strcat(name,'.eps' );
%     saveas(gcf,epsname1,'epsc2')
% end
% close all

%% check model approximation error
[maxerr meanerr] = tperror(Quad_LPV2, S, VIUDU, domain, 1000);
disp('max and mean error:'); 
disp(maxerr); 
disp(meanerr);
% save('Quadr_data', 'S', 'U', 'n', 'domain', 'gridsize');

%% State feedback TP controller design
lmi = lmistruct(S, n);
%lmi = lmi_asym_decay(lmi, 2.3);
% 1.85
lmi = lmi_asym_decay(lmi, 0.5);  % |x(t)| < c exp(-0.05 t)
% umax = 10;
umax = 1;
phi = 0.005;
lmi = lmi_input(lmi, umax, phi);  % if |x| < phi then |u| < umax
VIUDK = lmi_solve(lmi);
save('VIUDK14.mat','VIUDK');


% x_0=[pi/3,0,0,0,0,0]';
% opt = odeset('RelTol',1e-4,'AbsTol',1e-5);
% Tspan=0.01;
% SimTime=50;
% IterationTimes=floor(SimTime/Tspan);
% QUADVIUDTPPDC.X=zeros(6,IterationTimes);
% time=QUADVIUDTPPDC.X(1,:);
% for i=1:IterationTimes
%     QUADVIUDTPPDC.time(i)=i*Tspan;
%     QUADVIUDTPPDC.X(:,i)=x_0;
%     %% model of quadrotor attitude model
%     u(:,i) =QuadVIUD_CalU(x_0,VIUDK,VIUDU,domain);
%     [t,x]=ode45(@QuadVIUD_plant,[0,Tspan],x_0,opt,u(:,i),Quad_LPV2);
%     x_0=x(end,:)';
%     QUADVIUDTPPDC.u(:,i)=u(:,i);
% end
% QUADVIUDTPPDC.X

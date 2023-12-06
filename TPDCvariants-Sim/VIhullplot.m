% plothull(U(1));
% xlabel('Roll angle $p(1)=\phi$ [rad]','Interpreter','latex');
% ylabel('Weighting functions','Interpreter','latex');
% saveas(gcf,'x7.pdf');
% plothull(U(2));
% xlabel('Pitch angle $p(2)=\theta$ [rad]','Interpreter','latex');
% ylabel('Weighting functions','Interpreter','latex');
% saveas(gcf,'x8.pdf');
% plothull(U(3));
% xlabel('Roll angle velocity of the quadrotor $p(3)=p$ [rad/s]','Interpreter','latex');
% ylabel('Weighting functions','Interpreter','latex');
% saveas(gcf,'x10.pdf');
% plothull(U(3));
% xlabel('Pitch angle velocity of the quadrotor $p(4)=q$ [rad/s]','Interpreter','latex');
% ylabel('Weighting functions','Interpreter','latex');
% saveas(gcf,'x11.pdf');
domain = [-60*pi/180,60*pi/180;-60*pi/180,60*pi/180;-0.8,0.8;-0.8,0.8];
x1=linspace(domain(1,1),domain(1,2),size(VIU{1},1));
figure(1)
% subplot(121)
plot(x1,VIU{1},'LineWidth',2);
xlim([-pi/3,pi/3]);
xlabel('Sampling interval [$-\pi/3,\pi/3$]','Interpreter','latex','Fontsize',16);
ylabel('Weighting functions','Interpreter','latex','Fontsize',16);
legend('MF1','MF2','MF3')
saveas(gcf,'VIx7x8.pdf');
% subplot(122)
figure(2)
x2=linspace(domain(3,1),domain(3,2),size(VIU{2},1));
plot(x2,VIU{2},'LineWidth',2);
xlim([-0.8,0.8])
xlabel('Sampling interval [-0.8,0.8]','Interpreter','latex','Fontsize',16);
ylabel('Weighting functions','Interpreter','latex','Fontsize',16);
legend('MF1','MF2')
saveas(gcf,'VIx10x11.pdf');

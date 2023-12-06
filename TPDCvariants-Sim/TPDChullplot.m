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
x1=linspace(domain(1,1),domain(1,2),size(U{1},1));
figure(1)
plot(x1,U{1},'LineWidth',2);
xlabel('Roll angle $p(1)=\phi$ [rad]','Interpreter','latex');
ylabel('Weighting functions','Interpreter','latex');
saveas(gcf,'x7.pdf');
figure(2)
plot(x1,U{2},'LineWidth',2);
xlabel('Pitch angle $p(2)=\theta$ [rad]','Interpreter','latex');
ylabel('Weighting functions','Interpreter','latex');
saveas(gcf,'x8.pdf');
figure(3)
x2=linspace(domain(3,1),domain(3,2),size(U{3},1));
plot(x2,U{3},'LineWidth',2);
xlabel('Roll angle velocity of the quadrotor $p(3)=p$ [rad/s]','Interpreter','latex');
ylabel('Weighting functions','Interpreter','latex');
saveas(gcf,'x10.pdf');
figure(4)
plot(x2,U{4},'LineWidth',2);
xlabel('Pitch angle velocity of the quadrotor $p(4)=q$ [rad/s]','Interpreter','latex');
ylabel('Weighting functions','Interpreter','latex');
saveas(gcf,'x11.pdf');
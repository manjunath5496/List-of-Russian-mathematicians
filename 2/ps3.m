function ps3

close all;
fnt=14;

%% question 1

% plot characteristics
figure(1); 
h=plot([-5/2,1/2],[3,0],'k--',[-3,-1],[2,0],'k--',...
       [-1,2],[0,3],'k--',[1/2,2],[0,3/2],'k--');
set(gca,'fontname','times','fontsize',14);
set(h,'linewidth',1);

text(-1/3,0.3,'R_1','fontname','times','fontsize',14);
text(2/3,1,'R_2','fontname','times','fontsize',14);
text(-4/3,1,'R_3','fontname','times','fontsize',14);
text(-1/3,2,'R_4','fontname','times','fontsize',14);
text(-2,0.3,'R_5','fontname','times','fontsize',14);
text(1.5,0.3,'R_6','fontname','times','fontsize',14);

text(-2.4,1.5,'x+t=-1','fontname','times','fontsize',14);
text(-2,2.6,'x+t=1/2','fontname','times','fontsize',14);
text(1.1,2.6,'x-t=-1','fontname','times','fontsize',14);
text(1.2,1.5,'x-t=1/2','fontname','times','fontsize',14);

xlabel('x','fontname','times','fontsize',14);
ylabel('t','fontname','times','fontsize',14);
saveas(1,'q1char.eps');

x=-3:0.05:3;
ux0=f1(x);
ux1_2=1/2*(f1(x-1/2)+f1(x+1/2));
ux1=1/2*(f1(x-1)+f1(x+1));
ux3_2=1/2*(f1(x-3/2)+f1(x+3/2));
figure(2),subplot(4,1,1),plot(x,ux0,'k'); hold on; ylabel('u(x,0)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[0,1]);
subplot(4,1,2),plot(x,ux1_2,'k'); hold on; ylabel('u(x,1/2)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[0,1]);
f12chk=(x/2+3/4).*(x>-3/2&x<=-1/2) ...
      +(-x/2+1/4).*(x>-1/2&x<=0)...
      +(x/2+1/4).*(x>0&x<=1/2)...
      +(1-x).*(x>1/2&x<=1);
plot(x,f12chk,'k');
subplot(4,1,3),plot(x,ux1,'k'); hold on; ylabel('u(x,1)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[0,1]);
f1chk=(x/2+1).*(x>-2&x<=-1) ...
      +(-1/2-x).*(x>-1&x<=-1/2)...
      +(x/2).*(x>0&x<=1)...
      +(3/2-x).*(x>1&x<=3/2);
plot(x,f1chk,'k');
subplot(4,1,4),plot(x,ux3_2,'k'); hold on; ylabel('u(x,3/2)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[0,1]);
f32chk=(x/2+5/4).*(x>-5/2&x<=-3/2) ...
      +(-1-x).*(x>-3/2&x<=-1)...
      +(x/2-1/4).*(x>1/2&x<=3/2)...
      +(2-x).*(x>3/2&x<=2);
plot(x,f32chk,'k');
xlabel('x','fontname','times','fontsize',14);
saveas(2,'q1u.eps');

t=linspace(0,2,20);
[TT,XX]=meshgrid(t,x);
uxt=1/2*(f1(XX-TT)+f1(XX+TT));
figure(3),colormap([eps eps eps]),waterfall(TT.',XX.',uxt.');
ylabel('x','fontname','times','fontsize',14);
xlabel('t','fontname','times','fontsize',14);
zlabel('u(x,t)','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',fnt,'view',[85,66]);
saveas(3,'q1u3d.eps');

%% question 1b
x=-3:0.01:3;
u12=1/2*( (abs(x+1/2)-abs(x-1/2)).*(x>=-1/2&x<=1/2)...
         +(1-abs(x-1/2)).*(x>1/2&x<=3/2)...
         +(abs(x+1/2)-1).*(x>=-3/2&x<-1/2));
u1= 1/2*( (1-abs(x-1)).*(x>=0&x<=2)...
         +(abs(x+1)-1).*(x>=-2&x<0));
u32=1/2*( (1-abs(x-3/2)).*(x>=1/2&x<=5/2)...
         +(abs(x+3/2)-1).*(x>=-5/2&x<=-1/2));
figure(4),subplot(4,1,1),plot(x,zeros(size(x)),'k'); hold on; ylabel('u(x,0)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[-1,1]);
subplot(4,1,2),plot(x,u12,'k'); hold on; ylabel('u(x,1/2)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[-1,1]);
subplot(4,1,3),plot(x,u1,'k'); hold on; ylabel('u(x,1)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[-1,1]);
subplot(4,1,4),plot(x,u32,'k'); hold on; ylabel('u(x,3/2)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[-1,1]);
xlabel('x','fontname','times','fontsize',14);
saveas(4,'q1bu.eps');

%% question 3
% plot characteristics
figure(5); 
h=plot([-2,-5],[0,3],'k--', [-2,1],[0,3],'k--',...
       [-1,-4],[0,3],'k--', [-1,2],[0,3],'k--',...
       [1,-2], [0,3],'k--', [1,4], [0,3],'k--',...
       [2,-1], [0,3],'k--', [2,5], [0,3],'k--'); hold on;
set(gca,'fontname','times','fontsize',14,'xtick',-5:5);
set(h,'linewidth',1);
h=plot([0 0],[0,3],'k'); set(h,'linewidth',2);
xlabel('x','fontname','times','fontsize',14);
ylabel('t','fontname','times','fontsize',14);
saveas(5,'q3char.eps');

x=0:0.05:5;
figure(6),subplot(4,1,1),plot(x,f3(x),'k'); hold on; ylabel('u(x,0)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[-1,1]);
subplot(4,1,2),plot(x,1/2*(f3(x-1)+f3(x+1)),'k'); hold on; ylabel('u(x,1)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[-1,1]);
subplot(4,1,3),plot(x,1/2*(f3(x-2)+f3(x+2)),'k'); hold on; ylabel('u(x,2)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[-1,1]);
subplot(4,1,4),plot(x,1/2*(f3(x-3)+f3(x+3)),'k'); hold on; ylabel('u(x,3)','fontname','times','fontsize',14); set(gca,'fontname','times','fontsize',fnt,'ylim',[-1,1]);
xlabel('x','fontname','times','fontsize',14);
saveas(6,'q3u.eps');

%% question 4

%% plot first two normal modes
x=0:0.01:1;
p1=cos(pi/2*x);
p2=cos(3*pi/2*x);
figure(7);
subplot(2,1,1),plot(x,p1,'k',x,-p1,'k',x,0.5*p1,'k--',x,-0.5*p1,'k--',[0,1],[0,0],'k--');
ylabel('p_1(x,t)','fontname','times','fontsize',14);
subplot(2,1,2),plot(x,p2,'k',x,-p2,'k',x,0.5*p2,'k--',x,-0.5*p2,'k--',[0,1],[0,0],'k--');
ylabel('p_2(x,t)','fontname','times','fontsize',14);
xlabel('x/L','fontname','times','fontsize',14);
saveas(7,'q4p.eps');

%-------------------------------------------------
function ff=f1(x)
ff=(x+1).*(x>=-1 & x<=0) + (1-2*x).*(x>0 & x<=1/2);

%-------------------------------------------------
function ff=f3(x)
ff = sin(pi*x).^2.*(x>=1&x<=2) - sin(pi*x).^2.*(x>=-2&x<=-1);
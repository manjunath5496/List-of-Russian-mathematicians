function ps2

close all;

% Question 1
x=0:0.1:2;
fx=1/2*(1-x);
figure(1),plot(x,fx,'k',x-2,fx,'k',x-4,fx,'k',x+2,fx,'k',[-3,3],[0,0],'k--',...
    -2:2:2,zeros(size(-2:2:2)),'k.',-2:2:2,0.5*ones(size(-2:2:2)),'ko',-2:2:2,-0.5*ones(size(-2:2:2)),'ko');
xlabel('x','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',14,'xlim',[-3,3],'ylim',[-0.5,0.5]);
set(gca,'plotboxaspectratio',[1,0.3,1]);
saveas(1,'sine.eps');

fx=abs(1/2*(1-x));
figure(2),plot(x,fx,'k',x-2,fx,'k',x-4,fx,'k',x+2,fx,'k');
xlabel('x','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',14,'xlim',[-3,3],'ylim',[0,0.5]);
set(gca,'plotboxaspectratio',[1,0.3,1]);
saveas(2,'cosine.eps');


% Question 5
x=0:0.01:1; t0=0;
u0=uxt(x,0);
u02=uxt(x,0.2);
u05=uxt(x,0.5);
u1=uxt(x,1);

figure(3),plot(x,u0,'k--',x,u02,'k',x,u05,'k-.',x,u1,'k');
xlabel('x','fontname','times','fontsize',14);
ylabel('u(x,t_0)','fontname','times','fontsize',14);

x=0:0.01:1;
t=linspace(0,0.5,100);

% spatial profile
uE_b=x.*(1-x)/2;
uxt1=uE_b-4/pi^3*sin(pi*x)*exp(-pi^2*0.05);
uxt2=uE_b-4/pi^3*sin(pi*x)*exp(-pi^2*0.15);

figure(4),plot(x,uxt1,'k',x,uxt2,'k',x,uE_b,'k');
xlabel('x','fontname','times','fontsize',14);
ylabel('u(x,t_0)/b','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',14,'ylim',[0,0.125]);
saveas(4,'ux.eps');

% time profile
u_b=1/8;
for n=1:5
    u_b=u_b-4/pi^3/(2*n-1)^3*(-1)^(n+1)*exp(-(2*n-1)^2*pi^2*t);
end

figure(5),plot(t,u_b,'k');
xlabel('t','fontname','times','fontsize',14);
ylabel('u(1/2,t)/b','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',14,'ylim',[0,0.125]);
saveas(5,'ut.eps');

%------------------------------
function u=uxt(x,t)

u= 3*sin(pi*x)*exp(-pi^2*t)-sin(3*pi*x)*exp(-9*pi^2*t);

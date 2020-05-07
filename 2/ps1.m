%% 18.303 Matlab script for Assignment 1
%% Sept 2005 by Matthew J. Hancock

% Usage: 
%>> ps1('probs1')
%>> ps1('probs2')
%>> ps1('probs3')
%>> ps1('probs4b')
%>> ps1('probs4c')
% choose the one corresponding to the problem number you want to see

function varargout=ps1(varargin)

close all;

[varargout{1:nargout}]=feval(varargin{:});


%------------------------------
function probs1

x=0:0.1:2;
fx=1/2*(1-x);
figure(1),plot(x,fx,'k',x-2,fx,'k',x-4,fx,'k',x+2,fx,'k',[-3,3],[0,0],'k--',...
    -2:2:2,zeros(size(-2:2:2)),'k.',-2:2:2,0.5*ones(size(-2:2:2)),'ko',-2:2:2,-0.5*ones(size(-2:2:2)),'ko');
xlabel('x','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',14,'xlim',[-3,3],'ylim',[-0.5,0.5]);
set(gca,'plotboxaspectratio',[1,0.3,1]);
%saveas(1,'sine.eps');

fx=abs(1/2*(1-x));
figure(2),plot(x,fx,'k',x-2,fx,'k',x-4,fx,'k',x+2,fx,'k');
xlabel('x','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',14,'xlim',[-3,3],'ylim',[0,0.5]);
set(gca,'plotboxaspectratio',[1,0.3,1]);
%saveas(2,'cosine.eps');


x=0:0.01:1; t0=0;
u0=uxt(x,0);
u02=uxt(x,0.2);
u05=uxt(x,0.5);
u1=uxt(x,1);

figure(3),plot(x,u0,'k--',x,u02,'k',x,u05,'k-.',x,u1,'k');
xlabel('x','fontname','times','fontsize',14);
ylabel('u(x,t_0)','fontname','times','fontsize',14);

%------------------------------
function u=uxt(x,t)

u= (3*sin(pi*x)*exp(-pi^2*t)-sin(3*pi*x)*exp(-9*pi^2*t))/2;

%----------------------------------------
function probs2

close all;

x=linspace(0,1,128);
t=10.^linspace(-4,-1,100);
N=100;
EP=0.1;
mm=1:N;
nn=2*mm-1;
Bnn=(-1).^(mm+1).*sin( nn*pi*EP/2 )./( nn*pi*EP/2 );

fnt=20;

%% 3D plot
[XX,TT]=meshgrid(x(1:2:128),t);
u_u0 = 2*heatsolTypeI(XX,TT,N,nn,Bnn);
figure(1),mesh(XX,TT,u_u0);
set(gca,'fontname','times','fontsize',fnt,'view',[150,50],'Xdir','reverse','xlim',[0,1],'ylim',[0,0.1],'zlim',[0,12]);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('t','fontname','times','fontsize',fnt); 
zlabel('u(x,t)/u_0','fontname','times','fontsize',fnt); 
title('3D plot of u(x,t)','fontname','times','fontsize',fnt); 
%saveas(1,'uxt3D.eps');

% level curves
figure(2);
[cs,hdl]=contour(XX,TT,u_u0,[4,2,1,0.5,0.25]); 
clabel(cs,hdl,'fontsize',15,'rotation',0,'labelspacing',1024)
set(gca,'xlim',[0,1],'ylim',[0,0.1],'fontname','times','fontsize',fnt);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('t','fontname','times','fontsize',fnt); 
title('Level curves u(x,t)=const','fontname','times','fontsize',fnt); 
%saveas(2,'uxtlevel.eps');

% 2D u-x plot
u_u0_ta = 2*heatsolTypeI(x,0.001,N,nn,Bnn);
u_u0_tb = 2*heatsolTypeI(x,0.01,N,nn,Bnn);
u_u0_tc = 2*heatsolTypeI(x,0.1,N,nn,Bnn);
figure(3),plot(x,u_u0_ta,'b',x,u_u0_tb,'r',x,u_u0_tc,'m'); hold on;
plot((1/2-EP/2)*[1,1],[0,1/EP],'k--',(1/2+EP/2)*[1,1],[0,1/EP],'k--',[1/2-EP/2,1/2+EP/2],[1/EP,1/EP],'k--');
set(gca,'fontname','times','fontsize',fnt,'xlim',[0,1],'ylim',[0,12]);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('u(x,t_0)/u_0','fontname','times','fontsize',fnt); 
title('u-x plot','fontname','times','fontsize',fnt); 
%saveas(3,'ux.eps');

% 2D u-t plot
u_u0_xa = 2*heatsolTypeI(1/2,t,N,nn,Bnn);
u_u0_xb = 2*heatsolTypeI(0.4,t,N,nn,Bnn);
u_u0_xc = 2*heatsolTypeI(0.1,t,N,nn,Bnn);
figure(4),plot(t,u_u0_xa,'b',t,u_u0_xb,'r',t,u_u0_xc,'m');
set(gca,'fontname','times','fontsize',fnt,'xlim',[0,0.1],'ylim',[0,10]);
xlabel('t','fontname','times','fontsize',fnt); 
ylabel('u(x_0,t)/u_0','fontname','times','fontsize',fnt); 
title('u-t plot','fontname','times','fontsize',fnt); 
%saveas(4,'ut.eps');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function probs3

close all;

x=linspace(0,1,128);
t=10.^linspace(-4,-1,100);
N=100;
EP=0.1;
mm=1:N;
nn=2*mm;
Bnn=2*(-1).^mm.*sin( mm*pi*EP )./( mm*pi*EP );

fnt=20;

%% 3D plot
[XX,TT]=meshgrid(x(1:2:128),t);
u_u0 = 1+heatsolTypeII(XX,TT,N,nn,Bnn);
figure(1),mesh(XX,TT,u_u0);
set(gca,'fontname','times','fontsize',fnt,'view',[150,50],'Xdir','reverse','xlim',[0,1],'ylim',[0,0.1],'zlim',[0,12]);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('t','fontname','times','fontsize',fnt); 
zlabel('u(x,t)/u_0','fontname','times','fontsize',fnt); 
title('3D plot of u(x,t)','fontname','times','fontsize',fnt); 
%saveas(1,'P3uxt3D.eps');

% level curves
figure(2);
[cs,hdl]=contour(XX,TT,u_u0,[4,2,1,0.5,0.25]); 
clabel(cs,hdl,'fontsize',15,'rotation',0,'labelspacing',1024)
set(gca,'xlim',[0,1],'ylim',[0,0.1],'fontname','times','fontsize',fnt);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('t','fontname','times','fontsize',fnt); 
title('Level curves u(x,t)=const','fontname','times','fontsize',fnt); 
%saveas(2,'P3uxtlevel.eps');

% 2D u-x plot
u_u0_ta = 1+heatsolTypeII(x,0.001,N,nn,Bnn);
u_u0_tb = 1+heatsolTypeII(x,0.03,N,nn,Bnn);
u_u0_tc = 1+heatsolTypeII(x,0.1,N,nn,Bnn);
figure(3),plot(x,u_u0_ta,'b',x,u_u0_tb,'r',x,u_u0_tc,'m'); hold on;
plot((1/2-EP/2)*[1,1],[0,1/EP],'k--',(1/2+EP/2)*[1,1],[0,1/EP],'k--',[1/2-EP/2,1/2+EP/2],[1/EP,1/EP],'k--');
set(gca,'fontname','times','fontsize',fnt,'xlim',[0,1],'ylim',[0,12]);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('u(x,t_0)/u_0','fontname','times','fontsize',fnt); 
title('u-x plot','fontname','times','fontsize',fnt); 
%saveas(3,'P3ux.eps');

% 2D u-t plot
u_u0_xa = 1+heatsolTypeII(1/2,t,N,nn,Bnn);
u_u0_xb = 1+heatsolTypeII(0.4,t,N,nn,Bnn);
u_u0_xc = 1+heatsolTypeII(0.1,t,N,nn,Bnn);
figure(4),plot(t,u_u0_xa,'b',t,u_u0_xb,'r',t,u_u0_xc,'m');
set(gca,'fontname','times','fontsize',fnt,'xlim',[0,0.1],'ylim',[0,10]);
xlabel('t','fontname','times','fontsize',fnt); 
ylabel('u(x_0,t)/u_0','fontname','times','fontsize',fnt); 
title('u-t plot','fontname','times','fontsize',fnt); 
%saveas(4,'P3ut.eps');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function probs4b

close all;

x=linspace(0,1,128);
t=10.^linspace(-4,0,100);
N=100;
nn=1:N;
Bnn=4*(-1).^(nn+1)./(pi*(2*nn-1));

fnt=20;

%% 3D plot
[XX,TT]=meshgrid(x(1:2:128),t);
u_u0 = heatsolTypeMX(XX,TT,N,nn,Bnn);
figure(1),mesh(XX,TT,u_u0);
set(gca,'fontname','times','fontsize',fnt,'view',[167,52],'Xdir','reverse','xlim',[0,1],'ylim',[0,1],'zlim',[0,1]);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('t','fontname','times','fontsize',fnt); 
zlabel('u(x,t)/u_0','fontname','times','fontsize',fnt); 
title('3D plot of u(x,t)','fontname','times','fontsize',fnt); 
%saveas(1,'P4buxt3D.eps');

% level curves
figure(2);
[cs,hdl]=contour(XX,TT,u_u0,[0.99, 0.9, 0.5,0.25,0.1]); 
clabel(cs,hdl,'fontsize',15,'rotation',0,'labelspacing',1024)
set(gca,'xlim',[0,1],'ylim',[0,1],'fontname','times','fontsize',fnt);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('t','fontname','times','fontsize',fnt); 
title('Level curves u(x,t)=const','fontname','times','fontsize',fnt); 
%saveas(2,'P4buxtlevel.eps');

% 2D u-x plot
u_u0_ta = heatsolTypeMX(x,0.001,N,nn,Bnn);
u_u0_tb = heatsolTypeMX(x,0.01,N,nn,Bnn);
u_u0_tc = heatsolTypeMX(x,0.1,N,nn,Bnn);
u_u0_td = heatsolTypeMX(x,0.5,N,nn,Bnn);
u_u0_te = heatsolTypeMX(x,1,N,nn,Bnn);
figure(3),plot(x,u_u0_ta,'b',x,u_u0_tb,'r',x,u_u0_tc,'m',x,u_u0_td,'m',x,u_u0_te,'m'); hold on;
set(gca,'fontname','times','fontsize',fnt,'xlim',[0,1],'ylim',[0,1]);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('u(x,t_0)/u_0','fontname','times','fontsize',fnt); 
title('u-x plot','fontname','times','fontsize',fnt); 
%saveas(3,'P4bux.eps');

% 2D u-t plot
u_u0_xa = heatsolTypeMX(0.9,t,N,nn,Bnn);
u_u0_xb = heatsolTypeMX(0.5,t,N,nn,Bnn);
u_u0_xc = heatsolTypeMX(0.01,t,N,nn,Bnn);
figure(4),plot(t,u_u0_xa,'b',t,u_u0_xb,'r',t,u_u0_xc,'m');
set(gca,'fontname','times','fontsize',fnt,'xlim',[0,1],'ylim',[0,1]);
xlabel('t','fontname','times','fontsize',fnt); 
ylabel('u(x_0,t)/u_0','fontname','times','fontsize',fnt); 
title('u-t plot','fontname','times','fontsize',fnt); 
%saveas(4,'P4but.eps');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function probs4c

close all;

x=linspace(0,1,128);
t=10.^linspace(-4,log10(0.5),100);
N=100;
EP=0.1;
nn=1:N;
Bnn=8./(EP*pi*(2*nn-1)).*cos( (2*nn-1)*pi/4 ).*sin( (2*nn-1)*pi*EP/4);

fnt=20;

%% 3D plot
[XX,TT]=meshgrid(x(1:2:128),t);
u_u0 = heatsolTypeMX(XX,TT,N,nn,Bnn);
figure(1),mesh(XX,TT,u_u0);
set(gca,'fontname','times','fontsize',fnt,'view',[150,50],'Xdir','reverse','xlim',[0,1],'ylim',[0,0.5],'zlim',[0,12]);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('t','fontname','times','fontsize',fnt); 
zlabel('u(x,t)/u_0','fontname','times','fontsize',fnt); 
title('3D plot of u(x,t)','fontname','times','fontsize',fnt); 
%saveas(1,'P4cuxt3D.eps');

% level curves
figure(2);
[cs,hdl]=contour(XX,TT,u_u0,[4,2,1,0.5,0.25]); 
clabel(cs,hdl,'fontsize',15,'rotation',0,'labelspacing',1024)
set(gca,'xlim',[0,1],'ylim',[0,0.5],'fontname','times','fontsize',fnt);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('t','fontname','times','fontsize',fnt); 
title('Level curves u(x,t)=const','fontname','times','fontsize',fnt); 
%saveas(2,'P4cuxtlevel.eps');

% 2D u-x plot
u_u0_ta = heatsolTypeMX(x,0.001,N,nn,Bnn);
u_u0_tb = heatsolTypeMX(x,0.03,N,nn,Bnn);
u_u0_tc = heatsolTypeMX(x,0.1,N,nn,Bnn);
u_u0_td = heatsolTypeMX(x,0.5,N,nn,Bnn);
figure(3),plot(x,u_u0_ta,'b',x,u_u0_tb,'r',x,u_u0_tc,'m',x,u_u0_td,'m'); hold on;
plot((1/2-EP/2)*[1,1],[0,1/EP],'k--',(1/2+EP/2)*[1,1],[0,1/EP],'k--',[1/2-EP/2,1/2+EP/2],[1/EP,1/EP],'k--');
set(gca,'fontname','times','fontsize',fnt,'xlim',[0,1],'ylim',[0,12]);
xlabel('x','fontname','times','fontsize',fnt); 
ylabel('u(x,t_0)/u_0','fontname','times','fontsize',fnt); 
title('u-x plot','fontname','times','fontsize',fnt); 
%saveas(3,'P4cux.eps');

% 2D u-t plot
u_u0_xa = heatsolTypeMX(1/2,t,N,nn,Bnn);
u_u0_xb = heatsolTypeMX(0.4,t,N,nn,Bnn);
u_u0_xc = heatsolTypeMX(0.1,t,N,nn,Bnn);
figure(4),plot(t,u_u0_xa,'b',t,u_u0_xb,'r',t,u_u0_xc,'m');
set(gca,'fontname','times','fontsize',fnt,'xlim',[0,0.5],'ylim',[0,10]);
xlabel('t','fontname','times','fontsize',fnt); 
ylabel('u(x_0,t)/u_0','fontname','times','fontsize',fnt); 
title('u-t plot','fontname','times','fontsize',fnt); 
%saveas(4,'P4cut.eps');


%--------------------------------------------------
function ff=heatsolTypeI(x,t,N,nn,Bn)

ff=0;
for m=1:N
    ff=ff + Bn(m)*sin(nn(m)*pi*x).*exp(-pi^2*nn(m)^2*t);
end

%--------------------------------------------------
function ff=heatsolTypeII(x,t,N,nn,Bn)

ff=0;
for m=1:N
    ff=ff + Bn(m)*cos(nn(m)*pi*x).*exp(-pi^2*nn(m)^2*t);
end

%--------------------------------------------------
function ff=heatsolTypeMX(x,t,N,nn,Bn)

ff=0;
for m=1:N
    ff=ff + Bn(m)*cos((2*nn(m)-1)/2*pi*x).*exp(-pi^2*(2*nn(m)-1)^2*t/4);
end

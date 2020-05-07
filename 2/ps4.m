function p4

close all;


%% -------- PROBLEM 1 -------------
t=[0,4/3];
figure(1);
for n=-11:12
    plot(x1(t,n/4),t,'k'); hold on;
end
hdl=plot(x1(t,-2),t,'k',x1(t,0),t,'k',x1(t,2),t,'k'); hold on;
set(hdl,'linewidth',4);
xlabel('x','fontname','times','fontsize',14);
ylabel('t','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',14);
set(gca,'plotboxaspectratio',[1,0.3,1]);
saveas(1,'q1char.eps');

figure(2);
s=-4:1:4;
t=[0,2/3,4/3];
simp=[-2,0,2];
disp('Problem 1');
disp(sprintf('s=%g %g %g',simp));
disp(sprintf('u=%g %g %g',f1(simp)));
for n=1:length(t)
    x=(1-2*f1(s))*t(n)+s;
    u=f1(s);
    subplot(3,1,n); hdl=plot(x,u,'k'); hold on;
    set(hdl,'linewidth',1);
    if n==1
        ylabel('u(x,0)','fontname','times','fontsize',14);
    else
        ylabel(sprintf('u(x,%g/3)',n-1),'fontname','times','fontsize',14);
    end
    set(gca,'xlim',[-3,3],'fontname','times','fontsize',14);
    
    disp(sprintf('x=%g %g %g',(1-2*f1(simp))*t(n)+simp));
end
xlabel('x','fontname','times','fontsize',14);
saveas(2,'q1sol.eps');

%% -------- PROBLEM 2 -------------
figure(3);
t=linspace(0,2/3,20);
for n=0:8
    plot(x2(t,pi*n/8),t,'k'); hold on;
end
hdl=plot(x2(t,0),t,'k',x2(t,pi),t,'k',x2(t,pi/2),t,'k'); hold on;
set(hdl,'linewidth',4);
xlabel('x','fontname','times','fontsize',14);
ylabel('t','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',14);
set(gca,'plotboxaspectratio',[1,0.3,1]);
saveas(3,'q2char.eps');

figure(4);
s=pi*linspace(0,1,100);
simp=(0:0.1:1)*pi;
disp('');
disp('Problem 2');
disp(sprintf('s/pi=%g %g %g %g %g %g %g %g %g %g %g',simp/pi));
disp(sprintf('u=%4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f',f2(simp)));
t=[0,1/3,2/3];
for n=1:length(t)
    x=x2(t(n),s);
    u=f2(s);
    subplot(3,1,n); hdl=plot(x,u,'k'); hold on;
    set(hdl,'linewidth',1);
    if n==1
        ylabel('u(x,0)','fontname','times','fontsize',14);
    else
        ylabel(sprintf('u(x,%g/3)',n-1),'fontname','times','fontsize',14);
    end
    set(gca,'xlim',[0,4],'fontname','times','fontsize',14);

    disp(sprintf('x=%4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f',x2(t(n),simp)));
end
xlabel('x','fontname','times','fontsize',14);
saveas(4,'q2sol.eps');

%% -------- PROBLEM 3 -------------
figure(5);
t=linspace(0,2/3*log(2),20);
for n=1:7
    plot(x3(t,pi*n/4)/pi,t,'k'); hold on;
end
hdl=plot(x3(t,2*pi)/pi,t,'k',x3(t,0)/pi,t,'k',x3(t,pi)/pi,t,'k'); hold on;
set(hdl,'linewidth',4);
xlabel('x','fontname','times','fontsize',14);
ylabel('t','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',14,'ylim',[0,0.5],'xlim',[0,2],'xtick',[0,1,2],'xticklabel',{'0','pi','2 pi'});
set(gca,'plotboxaspectratio',[1,0.3,1]);
saveas(5,'q3char.eps');

s=pi*linspace(0,2,200);
simp=(0:0.1:1)*2*pi;
disp('');
disp('Problem 3');
disp(sprintf('s/pi=%g %g %g %g %g %g %g %g %g %g %g',simp/pi));
disp(sprintf('u=%4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f',f3(simp)/4 ));
disp(sprintf('x=%4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f %4.2f',x3(2/3*log(2),simp)));

x=x3(2/3*log(2),s);
u=f3(s)/4;
figure(6);
hdl=plot(x/pi,u,'k',x/pi,f3(x),'k--'); hold on;
set(hdl,'linewidth',1);
set(gca,'xlim',[0,2],'xtick',[0,1,2],'xticklabel',{'0','pi','2 pi'},'fontname','times','fontsize',14);
ylabel('u(x,t_c)','fontname','times','fontsize',14);
xlabel('x','fontname','times','fontsize',14);
saveas(6,'q3sol.eps');

if 0
uu=linspace(0,0.5,100);
xx=2*uu+asin(2*uu);
xx2=2*uu+pi-asin(2*uu);
xx=[xx xx2];
uu=[uu uu];
[xx,I]=sort(xx);
uu=uu(I);
x=linspace(0,1,100)*2*pi;
plot(xx/pi,uu,'m',2-xx/pi,-uu,'m',x/pi,f3(x),'k--');
end

% -----------------------
function o=solfn(x,u)

o=sin(x-2*u)-2*u;


%---------------------------------
function xx=x3(t,s)

xx=2/3*f3(s).*(1-exp(-3*t)) + s;


%---------------------------------
function ff=f3(s)

ff=2*sin(s);

%---------------------------------
function xx=x2(t,s)

xx=(1+3/2*f2(s)).*t + s;


%---------------------------------
function ff=f2(s)

ff=sin(s).*(s>0 & s<pi);

%---------------------------------
function ff=f1(s)

ff=1/4.*(abs(s)>=2) + (1-3/8*abs(s)).*(abs(s)<2);

%---------------------------------
function l=x1(t,s)

l=(t/2+s).*(abs(s)>2) + ((3/4*abs(s)-1).*t+s).*(abs(s)<=2);

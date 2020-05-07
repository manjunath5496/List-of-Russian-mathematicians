
function ps5

close all;

%%%% Question 1
x=linspace(0,1,100);
y=x;

fnt=14;
[xx,yy]=meshgrid(x,y);
u=u11(xx,yy);

figure(1);
[cs,hdl]=contour(xx,yy,u,[0.05 0.2:0.2:0.8 0.95]); hold on;
clabel(cs,hdl,'fontsize',15,'rotation',0,'labelspacing',1024)
plot([0,1],[1,1],'k',[1,1],[0,1],'k');

b=pi/2;

x_=sort([x,1/2]);
y1=1/b*acos(abs(cos(pi*x_)).^(1/4));
y2=1/b*acos(0.1*abs(cos(pi*x_)).^(1/4));
y3=1/b*acos(0.4*abs(cos(pi*x_)).^(1/4));
y3b=1/b*acos(0.8*abs(cos(pi*x_)).^(1/4));

x__=0:0.001:1;
y4=1.2*abs(cos(pi*x__)).^(1/4);
ii=find(y4<=1);
x4=x__(ii);
y4=1/b*acos(y4(ii));

plot([1/2,1/2],[0,1],'k--',x_,y1,'k--',x_,y2,'k--',x_,y3,'k--',x_,y3b,'k--',x4,y4,'k--');
set(gca,'xlim',[0,1.2],'ylim',[0,1.2],'fontname','times','fontsize',fnt);
xlabel('x/L','fontname','times','fontsize',fnt); 
ylabel('y/H','fontname','times','fontsize',fnt); 
saveas(1,'q1.eps');

%%%% Question 4
x=linspace(0,1,100);
y=x*sqrt(3);

[XX,YY]=meshgrid(x,y);

Z=sin(3*pi*XX).*sin(pi*YY/sqrt(3)) - sin(2*pi*XX).*sin(4*pi*YY/sqrt(3)) + sin(pi*XX).*sin(5*pi*YY/sqrt(3));
ZZ=Z.*(YY <= sqrt(3)*XX);

figure(4);
surf(XX,YY,ZZ);
xlabel('x','fontname','times','fontsize',14);
ylabel('y','fontname','times','fontsize',14);
set(gca,'fontname','times','fontsize',14);
saveas(4,'q4.eps');


%------------------------------------------
function u=u11(x,y)

u=sin(pi*x).*sin(pi*y/2);
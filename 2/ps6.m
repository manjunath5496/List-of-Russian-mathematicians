function ps6

x=-8:0.05:6;
figure(1),plot(x,u(x,0.1,1),'k',x,u(x,1,1),'k--',x,u(x,2,1),'k-.');
set(gca,'ylim',[0,1],'fontname','times','fontsize',14);
xlabel('x','fontname','times','fontsize',14); 
ylabel('u(x,t)','fontname','times','fontsize',14); 
saveas(1,'q1a.eps');


x=0:0.05:4;
figure(2),plot(x,u2(x,0.1,1),'k',x,u2(x,1,1),'k--',x,u2(x,2,1),'k-.');
set(gca,'ylim',[0,0.4],'fontname','times','fontsize',14);
xlabel('x','fontname','times','fontsize',14); 
ylabel('u(x,t)','fontname','times','fontsize',14); 
saveas(2,'q1b.eps');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function uu=u(x,kt,c_k)

uu=1./sqrt(4*pi*kt).*exp( -(x+c_k*kt).^2./(4*kt) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function uu=u2(x,kt,c_k)

uu=exp(-(x+c_k*kt/2+1)*c_k/2)./sqrt(4*pi*kt).*( -(c_k-1./kt)./(c_k+1./kt).*exp(-(x+1).^2./(4*kt)) ...
    + exp(-(x-1).^2./(4*kt)) );

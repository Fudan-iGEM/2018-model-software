T=100000;
str=zeros(5,T);
dt=2;
    a=Combiner_AND();
    m=0.01;n=0.04;
    for i =1:T
        str(1,i)=a.S_L;
        str(2,i)=a.B;
        str(3,i)=a.P;
        str(4,i)=a.aN.GFP*(1/15/27000);
        str(5,i)=a.bN.GFP*(1/15/27000);
        %10s
        a.iteration(dt,m,n);
    end
    
    t=1:T;
    %238 138 63 245 215 105 
    %212 232 193 141 136 124
    %plot(t/3600,str,'LineWidth',1,'Color',0.5*(m/0.4*[238 138 63]+(0.4-m)/0.4*[245 215 105])/256+0.5*(n/0.4*[212 232 193]+(0.4-n)/0.4*[141 136 124])/256);
    plot(t*dt/3600,str(1,:),'LineWidth',1);
    hold on
    plot(t*dt/3600,str(2,:),'LineWidth',1);
    hold on
    plot(t*dt/3600,str(3,:),'LineWidth',1);
    hold on
    plot(t*dt/3600,str(4,:),'LineWidth',1);
    hold on
    plot(t*dt/3600,str(5,:),'LineWidth',1);
xlabel('t/h');
ylabel('concentration/mol¡¤L^-^1');
legend('S/L','B','P','Notch A','Notch B');
hold off
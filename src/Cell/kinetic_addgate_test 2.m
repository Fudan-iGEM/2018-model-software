C = linspecer(16,'sequential'); 
axes('NextPlot','replacechildren', 'ColorOrder',C);
ii=1;
for m =0.1:0.1:0.4
    for n=0.1:0.1:0.4
        disp([m,n]);
    T=100000;
    str=zeros(5,T);
    dt=2;
    a=Combiner_AND();
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
    plot(t/3600,str(3,:),'LineWidth',1,'color',C(ii,:));
    %plot(t*dt/3600,str(3,:),'LineWidth',1);
    ii=ii+1;
    hold on
    end
    
end
legend('#neighbor=1A1B','#neighbor=1A2B','#neighbor=1A3B','#neighbor=1A4B','#neighbor=2A1B','#neighbor=2A2B','#neighbor=2A3B','#neighbor=2A4B','#neighbor=3A1B','#neighbor=3A2B','#neighbor=3A3B','#neighbor=3A4B','#neighbor=4A1B','#neighbor=4A2B','#neighbor=4A3B','#neighbor=4A4B');
xlabel('t/h');
ylabel('concentration/mol¡¤L^-^1');
hold off
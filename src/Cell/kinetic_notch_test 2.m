%for kinetics notch testification

str=zeros(1,10000);
for n =0.1:0.1:0.4
    a=Notch();
    for i =1:10000
        str(1,i)=a.GFP;
        a.iteration(0.1,n);
        hold on
    end
    t=0.01:0.01:100;
    plot(t,str,'LineWidth',1,'Color',[0.5-n 0.5+n 0.5+n])
end
hold off
legend('#neighbor=1','#neighbor=2','#neighbor=3','#neighbor=4');
xlabel('t/h');
ylabel('RFU');
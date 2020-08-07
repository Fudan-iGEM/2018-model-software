%for notch dynamic range
%t for
str=zeros(1,1000);
for n =0:0.001:0.4
    a=Notch();
    for i =1:100
        a.iteration(1,n);
        hold on
    end
    plot(10*n,a.GFP,'.','Color',[0.5-n 0.5+n 0.5+n])
end
hold off
xlabel('#neighbor');
ylabel('RFU');
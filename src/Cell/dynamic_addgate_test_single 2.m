rec=zeros(41,41);
for m =0.0:0.01:0.4
    for n=0.0:0.01:0.4
        disp([m,n]);
    T=100000;
    str=zeros(5,T);
    dt=100;
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
    rec(round(m/0.01+1),round(n/0.01+1))=a.P;
    end
end
xvalues={'#neighbor=1','#neighbor=2','#neighbor=3','#neighbor=4'};
yvalues={'#neighbor=1','#neighbor=2','#neighbor=3','#neighbor=4'};
 h = heatmap(rec,[],[], '%0.2f', 'Colormap', 'money', ...
        'Colorbar', true);
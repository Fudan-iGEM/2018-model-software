rec=zeros(2,11);
k=0;

type=2;
init=zeros(1,2*(2*type+2*type^2+1+type));
[Pre,Post]=Pre_Notch_Ligand(type);
k=-2:0.4:2;
for i=1:11
a=ChemicalReactions('NT','NT',Post,Pre,@H_Notch_Ligand,init,type);
b=a.iteration(500,1,10^k(i));

% plot(b(:,(2*type+2*type^2+1+i)));
% hold on
% plot(b(:,(2*type+2*type^2+1+type)+(2*type+2*type^2+1+i)));
% hold on 
rec(1,i)=b(length(b),(2*type+2*type^2+1+2));
rec(2,i)=b(length(b),(2*type+2*type^2+1+type)+(2*type+2*type^2+1+2));
end

semilogx(10.^k,rec(2,:)./rec(1,:));

legend('SNR');
xlabel('affnity ratio');
ylabel('#molecules');
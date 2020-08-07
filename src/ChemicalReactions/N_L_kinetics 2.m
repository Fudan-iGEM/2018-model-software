rec=zeros(2,10);
k=-2;
for j=1:10
type=j;
init=zeros(1,2*(2*type+2*type^2+1+type));
[Pre,Post]=Pre_Notch_Ligand(type);
a=ChemicalReactions('NT','NT',Post,Pre,@H_Notch_Ligand,init,type);
b=a.iteration(500,1,10^k);
for i = 1:type
% plot(b(:,(2*type+2*type^2+1+i)));
% hold on
% plot(b(:,(2*type+2*type^2+1+type)+(2*type+2*type^2+1+i)));
% hold on 
rec(1,j)=b(length(b),(2*type+2*type^2+1+i));
rec(2,j)=b(length(b),(2*type+2*type^2+1+type)+(2*type+2*type^2+1+i));
end
end
for i=1:2
semilogx(1:10,rec(i,:));
hold on
end
legend('icdA in Cell 1','icdA in Cell 2');
xlabel('diversity');
ylabel('#molecules');
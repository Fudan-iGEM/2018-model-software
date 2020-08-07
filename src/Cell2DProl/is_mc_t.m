%for monto carlo
function y=is_mc_t(cell_new,cell_old)
%for initial energy
sz=size(cell_new);
cell_new=[zeros(1,sz(2)+2);[zeros(sz(1),1),cell_new,zeros(sz(1),1)];zeros(1,sz(2)+2)];
cell_old=[zeros(1,sz(2)+2);[zeros(sz(1),1),cell_old,zeros(sz(1),1)];zeros(1,sz(2)+2)];
e_new=0;
e_old=0;
kT=1;
tao_s=0.5;                                                                                                                                   
survival=0.1;
for i =2:(sz(1)+1)
    for j=2:(sz(2)+1)
        if power(cell_new(i,j),2)+power(cell_old(i,j),2)==0
            continue
        end
        e_new=e_new+(1-survival)*(type_remove(cell_new(i,j)))*(type_remove(cell_new(i,j+1))+type_remove(cell_new(i,j-1))+type_remove(cell_new(i-1,j))+type_remove(cell_new(i+1,j)));
        e_old=e_old+(1-survival)*(type_remove(cell_old(i,j)))*(type_remove(cell_old(i,j+1))+type_remove(cell_old(i,j-1))+type_remove(cell_old(i-1,j))+type_remove(cell_old(i+1,j)));
    end
end
y=0;
if e_new<e_old
    odd_ratio=1/tao_s;
else
    odd_ratio=exp((e_old-e_new)/kT)/tao_s;
end
sample=rand(1);
if odd_ratio>=sample
    y=1;
end
end
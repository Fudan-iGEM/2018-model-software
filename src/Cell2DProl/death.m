function [Culture,Prol,HP]=death(Culture,Prol,HP)
    ind=find(HP<0);
    sz_c=size(Culture);
    for k=1:length(ind) 
        [temp_i,temp_j]=ind2sub(sz_c,ind(k));
        Culture(temp_i,temp_j)=0;
        Prol(temp_i,temp_j)=0;
        HP(temp_i,temp_j)=0;
    end
end
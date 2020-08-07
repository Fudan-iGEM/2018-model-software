% for proliferation
function [Culture,Prol,HP]=proliferation(Culture,Prol,HP,r_n,r_t,cell_cycle)

    ind=find(Prol>cell_cycle);
    sz_c=size(Culture);
    ind=ind(randperm(length(ind)));
    for k=1:length(ind)
        [temp_i,temp_j]=ind2sub(sz_c,ind(k));
        if Culture(temp_i,temp_j)<0
            r_spread=r_n;
        else
            r_spread=r_t;
        end
        rl=temp_j-2;
        rr=sz_c(2)-temp_j-1;
        ru=temp_i-2;
        rd=sz_c(1)-temp_i-1;
        Culture_move=[ones(r_spread-ru,2*r_spread+1);[ones(min(ru,r_spread)+min(r_spread,rd)+1,r_spread-rl),Culture(temp_i-min(ru,r_spread):temp_i+min(rd,r_spread),temp_j-min(rl,r_spread):temp_j+min(rr,r_spread)),ones(min(ru,r_spread)+min(r_spread,rd)+1,r_spread-rr)];ones(r_spread-rd,2*r_spread+1)];
        [x_p,y_p]=move_t(Culture_move,r_spread,r_spread+1,r_spread+1);
        for temp_m=length(x_p):1
            x_to=sum(x_p(1:temp_m,1))+temp_i;
            y_to=sum(y_p(1:temp_m,1))+temp_j;
            x_from=sum(x_p(1:(temp_m-1),1))+temp_i;
            y_from=sum(y_p(1:(temp_m-1),1))+temp_j;
            if temp_m==1
                Prol(x_from,y_from)=0;
            end
            if Culture(x_from,y_from)>0
                HP(x_to,y_to)=HP(x_from,y_from);
            end
            Culture(x_to,y_to)=Culture(x_from,y_from);
            Prol(x_to,y_to)=Prol(x_from,y_from);
        end
    end
end

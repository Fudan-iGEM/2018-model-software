%for exchange in tumor
function [Culture,Prol,HP]=exchange_t(Culture,Prol,HP,i,j)
    sz=size(Culture);
    leng=sz(1)-2;
    a=randi([1,10],1,1) ;
    switch a 
    case 1
        p=1;
    case 2
        p=2;
    case 3
        p=3;
    case 4
        p=4;
    otherwise
        p=0;
    end
    %for moves
    %%p_l,p_r,p_u,p_d,p_s
    if p==1
        if j~=2&&Culture(i,j-1)==0
            %submatrix
            c_old=Culture(i-1:i+1,j-2:j+1);
            Culture(i,j-1)=Culture(i,j);
            Culture(i,j)=0;
            Prol(i,j-1)=Prol(i,j);
            Prol(i,j)=0;
            HP(i,j-1)=HP(i,j);
            HP(i,j)=0;
            c_new=Culture(i-1:i+1,j-2:j+1);
            if is_mc_t(c_new,c_old)==0
                Culture(i,j)=Culture(i,j-1);
                Culture(i,j-1)=0;
                Prol(i,j)=Prol(i,j-1);
                Prol(i,j-1)=0;
                HP(i,j)=HP(i,j-1);
                HP(i,j-1)=0;
            end
        end
    elseif p==2
        if j~=leng+1&&Culture(i,j+1)==0
            c_old=Culture(i-1:i+1,j-1:j+2);
            Culture(i,j+1)=Culture(i,j);
            Culture(i,j)=0;
            Prol(i,j+1)=Prol(i,j);
            Prol(i,j)=0;
            HP(i,j+1)=HP(i,j);
            HP(i,j)=0;
            c_new=Culture(i-1:i+1,j-1:j+2);
            if is_mc_t(c_new,c_old)==0
                Culture(i,j)=Culture(i,j+1);
                Culture(i,j+1)=0;
                Prol(i,j)=Prol(i,j+1);
                Prol(i,j+1)=0;
                HP(i,j)=HP(i,j+1);
                HP(i,j+1)=0;
            end
        end
    elseif p==3
        if i~=2&&Culture(i-1,j)==0
            c_old=Culture(i-2:i+1,j-1:j+1);
            Culture(i-1,j)=Culture(i,j);
            Culture(i,j)=0;
            Prol(i-1,j)=Prol(i,j);
            Prol(i,j)=0;
            HP(i-1,j)=HP(i,j);
            HP(i,j)=0;
            c_new=Culture(i-2:i+1,j-1:j+1);
            if is_mc_t(c_new,c_old)==0
                Culture(i,j)=Culture(i-1,j);
                Culture(i-1,j)=0;
                Prol(i,j)=Prol(i-1,j);
                Prol(i-1,j)=0;
                HP(i,j)=HP(i-1,j);
                HP(i-1,j)=0;
            end
        end
    elseif p==4
        if i~=leng+1&&Culture(i+1,j)==0
            c_old=Culture(i-1:i+2,j-1:j+1);
            Culture(i+1,j)=Culture(i,j);
            Culture(i,j)=0;
            Prol(i+1,j)=Prol(i,j);
            Prol(i,j)=0;
            HP(i+1,j)=HP(i,j);
            HP(i,j)=0;
            c_new=Culture(i-1:i+2,j-1:j+1);
            if is_mc_t(c_new,c_old)==0
                Culture(i,j)=Culture(i+1,j);
                Culture(i+1,j)=0;
                Prol(i,j)=Prol(i+1,j);
                Prol(i+1,j)=0;
                HP(i,j)=HP(i+1,j);
                HP(i+1,j)=0;
            end
        end
    end
end
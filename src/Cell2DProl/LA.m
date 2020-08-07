%Lux&acitvation
function [Culture,image_all,Lux1_t,Lux2_t,Signal_t,Notch1_t,Notch2_t]=LA(f,Culture)
    sz=size(Culture);
    sz_l=sz(1);
    image_r=zeros(sz_l*f,sz_l*f);
    image_g=zeros(sz_l*f,sz_l*f);
    image_b=zeros(sz_l*f,sz_l*f);
    for i=1:sz_l
        for j=1:sz_l
            %%for examination
            if Culture(i,j)>0
                for temp1=1:f
                    for temp2=1:f
                        image_r(i*f-f+temp1,j*f-f+temp2)=255;
                        image_g(i*f-f+temp1,j*f-f+temp2)=66;
                        image_b(i*f-f+temp1,j*f-f+temp2)=93;
                    end
                end
            end
            %for notch
            if Culture(i,j)>=0
                continue
            end
            %for notch->lux
            Culture(i,j)=(-1)*l_exp(((Culture(i-1,j)==1)+(Culture(i,j-1)==1)+(Culture(i+1,j)==1)+(Culture(i-1,j)==1)),mod((-1)*Culture(i,j),1))+ceil(Culture(i,j));
            for temp1=1:f
                for temp2=1:f
                    image_r(i*f-f+temp1,j*f-f+temp2)=(mod(-Culture(i,j),1))*167+(1-mod(-Culture(i,j),1))*137;
                    image_g(i*f-f+temp1,j*f-f+temp2)=(mod(-Culture(i,j),1))*220+(1-mod(-Culture(i,j),1))*190;
                    image_b(i*f-f+temp1,j*f-f+temp2)=(mod(-Culture(i,j),1))*213+(1-mod(-Culture(i,j),1))*178;
                end
            end
            %end
        end
    end
    %Lux_t=length(find(Lux_t_image==1));
    Signal_t=sum(sum(Culture>0));
    Notch1_t=sum(sum((Culture>-1).*(Culture<0)));
    Notch2_t=sum(sum(Culture<-1));
    image_all=cat(3,image_r,image_g,image_b);
    Lux1_t=-sum(sum(Culture.*((Culture<0).*(Culture>-1))));
    Lux2_t=-sum(sum(Culture.*(Culture<-1)))-sum(sum(Culture<-1));
end
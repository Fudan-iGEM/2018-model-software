%cell_3D_proliferation
%Cell_2D_random_without overlap
%with shade for lux
%2D cell
%initial
clear;
clc;

%parameters
pro_Notch=1;
pro_Signal=2;
cell_cycle=1169;
f=10;
leng=100;
%for proliferation_t
p_n=1;
p_t=2;
i_t=1;
%for proliferation
r_t=2;
r_n=4;
%for death
%d_t=10;
d_n=1;
T=2000;
% Lux=zeros(100,T);
% Signal=zeros(100,T);
% Notch=zeros(100,T);
% 
Lux1=zeros(1,T);
Signal=zeros(1,T);
Notch2=zeros(1,T);
Notch1=zeros(1,T);
Lux2=zeros(1,T);

aviobj=VideoWriter('1_6_1_6','MPEG-4');
aviobj.FrameRate=25; 
open(aviobj);%Open file for writing video data  
% for rep=100:100:10000
rep=100;

%for dt=1:100
d_t=50;

B=zeros(leng,leng);


%Notch1-proliferation,Notch2-death
%center:cancer cell;
%3600-400->3200/6->500/ 400
for i =21:80
    for j = 21:80
%         if abs(i-50.5)<10 && abs(j-50.5)<10
%         B(i,j)=1;
%         else
            temp=randi([1,6],1);
            if temp==1
                B(i,j)=-1.1 ; 
            else
            if temp<4
                B(i,j)=1 ;  
            end
            end
% %         end
    end
end
%continuation
sz_c=size(B);
Culture=[zeros(1,sz_c(2)+2);[zeros(sz_c(1),1),B,zeros(sz_c(1),1)];zeros(1,sz_c(2)+2)];
%for lux initialization

%for proliferation initialization
Prol=randi([0,1169],sz_c(1)+2,sz_c(2)+2).*(Culture~=0);
HP=randi([1,100],sz_c(1)+2,sz_c(2)+2).*(Culture~=0);
%how to go through??
for t=1:T
    %for move and exchange
    for n=1:rep
        i=randi([2,leng+1],1,1) ;
        j=randi([2,leng+1],1,1) ;
        %%for examination
        if Culture(i,j)==0
            continue
        elseif Culture(i,j)<0
        [Culture,Prol,HP]=exchange(Culture,Prol,HP,i,j);
        else
        [Culture,Prol,HP]=exchange_t(Culture,Prol,HP,i,j);
        end
    end
    
    %for proliferation
    [Culture,Prol,HP]=proliferation(Culture,Prol,HP,r_n,r_t,cell_cycle);   
    %disp(Culture);
    %for proliferation_t
    %caution:
    %counted by number
    Notch_neigh=neighbor_n(Culture);
    %disp(Notch_neigh);
    %counted by activation
    Signal_neigh_Notch1=neighbor_t(Culture,1);
    %disp(Signal_neigh_Notch1);
     Signal_neigh_Notch2=neighbor_t(Culture,2);
    %disp(Signal_neigh_Notch2);
    %culture<0->Notch,%culture>0->cancer cell
    %counted by number
    Notch_neigh_Notch=neighbor_nn(Culture);
    %disp(Notch_neigh_Notch);
    %
    Prol=Prol+((Culture<0)*4+100*Notch_neigh-(Culture<0).*20.*Notch_neigh_Notch)*p_n+(Culture>0)*4*p_t-Signal_neigh_Notch2*i_t;

%     Prol=Prol+((Culture<0)*4+2*Notch_neigh-(Culture<0).*2.*Notch_neigh_Notch)*p_n+(Culture>0)*4*p_t-Signal_neigh_Notch2*i_t;
%     Prol=Prol+((Culture<0)*4+2*Notch_neigh-(Culture<0).*4.*Notch_neigh_Notch)*p_n+(Culture>0)*4*p_t-Signal_neigh_Notch1*i_t;

    %for death_t
    
    HP=min(HP-(Signal_neigh_Notch2).*d_t-(Culture<0).*Notch_neigh_Notch*d_n,100);
    
    %for death
    [Culture,Prol,HP]=death(Culture,Prol,HP);
    
    %for Lux & plot
    [Culture,image_all,Lux1_t,Lux2_t,Signal_t,Notch1_t,Notch2_t]=LA(f,Culture);
    %disp(Culture);
%     Lux(rep/100,t)=Lux_t;
%     Signal(rep/100,t)=Signal_t;
%     Notch(rep/100,t)=Notch_t;
    Lux1(1,t)=Lux1_t;
    Signal(1,t)=Signal_t;
    Notch1(1,t)=Notch1_t;
    Lux2(1,t)=Lux2_t;
    Notch2(1,t)=Notch2_t;
    writeVideo(aviobj,uint8(image_all));
end
    
%end


% backColor=[0 0.6 0.8];
% subsemilogy(1,3,1);
% set(gcf,'Position',[347,162,380,300]);
% t=1:T;
% semilogy(t,Lux(1,t),'ro');
% set(gca,'color',backColor);

% % subsemilogy(1,3,1);
% [y,x]=hist(Lux);         %分为(leng+2)个区间统计，(你可以改你需要的区间数)
% y=y/length(Lux)/mean(diff(x));   %计算概率密度 ，频数除以数据总数，除以组距
% bar(x,y,1);                      %用bar画图，最后的1是画bar图每条bar的宽度

semilogy(Signal);
hold on
semilogy(Notch1);
hold on
semilogy(Notch2);
hold on
semilogy(Lux1./Notch1*100*100);
hold on
semilogy(Lux2./Notch2*100*100);
xlabel('t/min');
ylabel('number/100percentage');
legend('Signal','Notch1','Notch2','Activation1%','Activation2%');

% subplot(1,3,2);
% imshow(Notch);
% subplot(1,3,3);
% imshow(Signal);
%for evenly
%using the matrix to moving the cells 
%using hex to properly 
%stationary limit for possibillity
%white for 1

 close(aviobj);

% % 3D plot
% % a=1:100;
% % b=1:T;
% % [A,B]=meshgrid(b,a);
% % surf(A,B,Signal);
% % ylabel('agressivity of activated Notch')
% % xlabel('time/min')
% % zlabel('#cancer cell')
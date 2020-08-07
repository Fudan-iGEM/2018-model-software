classdef ChemicalReactions<handle
    %CHEMICALREACTIONS for simulation of coupling stochastic processes
    %In our ENABLE project,it is a component of both model and sofetware
    %P the name of each reatants and products
    %T the name of each chemical reactions
    %Post stoichiometric number of products (correlating to the order of T)
    %Pre stoichiometric number of reactants (correlating to the order of T)
    %h a handle for function(the result of with is a vector), measuring the
    %rate of each elementary reaction
    %M the state of a given chemical reaction system
    
    properties
        P
        T
        Post
        Pre
        h
        M
        type
    end
    
    methods
        function obj=ChemicalReactions(P,T,Post,Pre,h,M,type)
            obj.P=P;
            obj.T=T;
            obj.Post=Post;
            obj.Pre=Pre;
            obj.h=h;
            obj.M=M;
            obj.type=type;
        end
        
        function a=iteration(obj,T,dt,k)
            tt=0;
            flag1=0;
            i=1;
            n=floor(T/dt);
            x=obj.M;
            S=(obj.Post-obj.Pre)';
            sz=size(S);
            u=sz(1);
            v=sz(2);
            xmat=zeros(n,u);
            target=0;
            while(1)
                %disp(x);
                %h is a handle for function
                ht=obj.h(x,obj.type,k);
                %disp(ht);
                h0=sum(ht);
                if h0<1e-10
                    tt=1e99;
                else
                    tt=tt+random('Exponential',1/h0);
                end
                while tt>target
                    %disp(size(xmat));
                    %disp(size(x));
                    xmat(i,:)=x;
                    target=target+dt;
                    i=i+1;
                    if tt>T
                        flag1=1;
                        break
                    end
                end
                if flag1==1
                    a=xmat;
                    break
                end
                %disp(ht);
                j=randsample(v,1,true,ht);
                x=x+S(:,j)';
            end
        end
    end
    
end
res1=-Culture.*(Culture<-1);
res2=res1(:);
ecdf(res2);


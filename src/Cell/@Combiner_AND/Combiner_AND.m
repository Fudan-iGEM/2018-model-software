classdef Combiner_AND<handle
    %UNTITLED12 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        aN
        bN
        S_L
        B
        P
        K_a
        kd_SL
        kg_SL
        kd_P
        kd_B
        k1
        k2
        k3
        k_RFU2mol
    end
    
    methods
        function obj=Combiner_AND()
            obj.aN=Notch();
            obj.bN=Notch();
            obj.S_L=0;
            obj.B=0;
            %mol
            obj.K_a=1.184e-7;
            obj.kd_SL=0.1/3600/27000;
            obj.kg_SL=0.1/3600/27000;
            obj.kd_P=0.1/36;
            obj.kd_B=0.1/3600/27000;
            obj.P=0;
            obj.k_RFU2mol=1/15/27000;
            %s-1
            obj.k1=0.05;
            obj.k2=0.016;
            obj.k3=0.032;
        end
        function iteration(obj,dt,A,B)
            %temp_a=obj.aN.GFP*obj.bN.GFP*obj.K_a*(obj.k_RFU2mol)^2+(-obj.S_L*obj.k1-obj.S_L*obj.kd_SL+obj.kg_SL+obj.k2*obj.B)*dt;
%             temp_b=obj.B+dt*(obj.S_L*obj.k1-obj.B*obj.k2-obj.B*obj.kd_B-obj.B*obj.k3);
%             temp_c=obj.P+dt*(obj.B*obj.k3-obj.P*obj.kd_P);

            comp=(-(obj.aN.GFP*obj.k_RFU2mol+obj.bN.GFP*obj.k_RFU2mol+obj.K_a)+sqrt((obj.aN.GFP*obj.k_RFU2mol+obj.bN.GFP*obj.k_RFU2mol+obj.K_a)^2+4*(obj.aN.GFP*obj.k_RFU2mol*obj.bN.GFP*obj.k_RFU2mol)))/2;
            temp_a=comp+(-comp*obj.k1-comp*obj.kd_SL+obj.kg_SL+obj.k2*obj.B)*dt;
            temp_b=obj.B+dt*(comp*obj.k1-obj.B*obj.k2-obj.B*obj.kd_B-obj.B*obj.k3);
            temp_c=obj.P+dt*(obj.B*obj.k3-obj.P*obj.kd_P);
            obj.S_L=temp_a;obj.B=temp_b;obj.P=temp_c;

            obj.aN.iteration(dt/3600,A);
            obj.bN.iteration(dt/3600,B);
        end
    end
        
    
end


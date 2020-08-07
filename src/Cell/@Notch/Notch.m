classdef Notch<handle
    %UNTITLED4 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        Notch_pro=0;
        Notch_act=0;
        g=0.1;
        g_s=0.1;
        g_r=0.1;
        k_t=2;
        k_rs=1500;
        b_n=1;
        b_d=0;
        b_r=1.8*10^8;
        p=2;
        GFP=0;
    end
        
    methods
        function obj=Notch()
        end
        
        function iteration(obj,dt,x)
            temp_a=obj.Notch_pro+dt*(obj.b_n-obj.g*obj.Notch_pro-obj.Notch_pro*x/obj.k_t);
            temp_b=obj.Notch_act+dt*(obj.Notch_pro*x/obj.k_t-obj.g_s*obj.Notch_act);
            temp_c=obj.GFP+dt*(obj.b_r*(obj.Notch_pro*x/obj.k_t/obj.g_s/obj.k_rs)^obj.p-obj.g_r*obj.GFP);
            obj.Notch_pro=temp_a;
            obj.Notch_act=temp_b;
            obj.GFP=temp_c;
        end
    end
    
end


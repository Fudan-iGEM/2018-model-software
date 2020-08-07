classdef Amplifier<handle
    %UNTITLED4 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
                
    end
        
    methods
        function obj=Amplifier()
        end
        
        function iteration(obj,dt,x)
            obj.Notch_pro=obj.Notch_pro+dt*(obj.b_n-obj.g*obj.Notch_pro-obj.Notch_pro*x/obj.k_t);
            obj.Notch_act=obj.Notch_act+dt*(obj.Notch_pro*x/obj.k_t-obj.g_s*obj.Notch_act);
            obj.GFP=obj.GFP+dt*(obj.b_r*(obj.Notch_pro*x/obj.k_t/obj.g_s/obj.k_rs)^obj.p-obj.g_r*obj.GFP);
        end
    end
    
end
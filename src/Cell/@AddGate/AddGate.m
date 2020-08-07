classdef AddGate<Gate
    %UNTITLED2 此处显示有关此类的摘要
    %   此处显示详细说明
    properties
        
        
    end
    methods
        function obj=AddGate(name,add)
           obj=obj@Gate(name);
           obj.Add=add;
        end
        
        function iteration(obj,dt,x)
            obj.Notch=obj.Notch
        end
        
    end
end


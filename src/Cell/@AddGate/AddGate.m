classdef AddGate<Gate
    %UNTITLED2 �˴���ʾ�йش����ժҪ
    %   �˴���ʾ��ϸ˵��
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


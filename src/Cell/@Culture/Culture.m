classdef Culture<handle
    %CULTURE is the simulation for a cell colony in 2D space   
    properties
    a=1
    b=1
    na=100
    nb=100
    gama=90
    neighbor=[0,1,0;1,0,1;0,1,0]
    CellArray={}
    end
    
    methods
        function obj=Culture(initialization_data)
            obj.init(initialization_data);
        end
        function init(obj,initialization_data)
            N=length(initialization_data);
            for i=1:N
                switch lower(initialization_data(i,1))
                    case 'notchcell'
                        obj.CellArray(length(obj.CellArray)+1)=NotchCell(initalization_data(i,2));
                end
            end
        end
        
        function iteration(obj,dt)
            %TODO
        end
        
        function visualization(obj)
            %TODO
        end
       
    end
    
end


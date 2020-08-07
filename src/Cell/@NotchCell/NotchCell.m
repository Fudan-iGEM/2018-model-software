classdef NotchCell<Cell
    %NOTCHCELL 
    properties
        noc1
        noc2
    end
    
    methods
        function obj=NotchCell(x,y,HP,prol)
            obj=obj@Cell(x,y,HP,prol);
            obj.noc1=Notch();
            obj.noc2=Notch();
            %constructor assigns property values in random ways
        end
        function CMove(obj,xmov,ymov)
            obj.x=obj.x+xmov;
            obj.y=obj.y+ymov;
        end
    end
end


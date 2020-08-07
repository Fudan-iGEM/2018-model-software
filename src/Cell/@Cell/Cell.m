classdef Cell<handle
    %Cell is a class for living cells.
    properties
        id=0
        x=0
        y=0
        HP=0
        prol=0
        Age=0
    end
    methods
        function obj=Cell(x,y,HP,prol)
            if nargin > 0
                obj.x=x;
                obj.y=y;
                obj.HP=HP;
                obj.prol=prol;
            end
            obj.Age=0;
            %constructor assigns property values in random ways
        end
    end
    methods(Abstract)
        CMove(obj,xmov,ymov)
    end
end


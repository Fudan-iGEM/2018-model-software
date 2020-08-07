classdef Gate<handle
    %Class Gate: As an abstract for signal cell--
    %Input:2 Ligand
    %Output:1 Ligand
    properties
        Name
        Age
    end
    
    methods
        function obj=Gate(name)
            if nargin > 0
                obj.Name=name;
            end
            obj.Age=0;
            %constructor assigns property values in random ways
        end
        
        function iteration(obj)
            obj.Age=obj.Age+1;
        end
        
    end
end


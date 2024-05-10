classdef Rotation
       
    methods (Static)
        function Rx = X(angle)
            Rx = [1 0 0 0;
                  0 cos(angle) -sin(angle) 0;
                  0 sin(angle) cos(angle) 0;
                  0 0 0 1];
        end
        
        function Ry = Y(angle)
            Ry = [cos(angle) 0 sin(angle) 0;
                  0 1 0 0;
                  -sin(angle) 0 cos(angle) 0;
                  0 0 0 1];
        end

        function Rz = Z(angle)
            Rz = [cos(angle) -sin(angle) 0 0;
                  sin(angle) cos(angle) 0 0;
                  0 0 1 0;
                  0 0 0 1];
        end
    end
end


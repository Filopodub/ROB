classdef Translation
   
    methods (Static)
        function Tx = X(d)
            Tx = [1 0 0 d;
                  0 1 0 0;
                  0 0 1 0;
                  0 0 0 1];
        end
        
        function Ty = Y(d)
            Ty = [1 0 0 0;
                  0 1 0 d;
                  0 0 1 0;
                  0 0 0 1];
        end

        function Tz = Z(d)
            Tz = [1 0 0 0;
                  0 1 0 0;
                  0 0 1 d;
                  0 0 0 1];
        end
    end
end


classdef Task4 
    methods
        function self = Task4(Robot)
            d = Robot.d;
            center = [0 0];
            armL = [0 d];
            armR = [0 -d];
            psi = 0; 
            v = 0;  
            w = 0;

            figure
            Robot.drawRobot(center,armL,armR)

            while true
                if abs(center(1)) > 0.9 || abs(center(2)) > 0.9
                    text(-1, 0, 'Crashed', 'FontSize', 70, 'Color', 'red');
                    break
                end

                key = getkey;
            
                switch key
                    case 'w'
                        v = v + 0.1;
                    case 's'
                        v = v - 0.1;
                    case 'a'
                        w =w + pi/4;
                    case 'd'
                        w =w - pi/4;
                    case 'r'
                        v = 0;
                        w = 0;
                    case 'q'
                        break;  
                end

                psi = psi + w;
                center = center + [v*cos(psi) v*sin(psi)];
                
                [p1r,p2r] = Robot.rotate(psi);

                armL = center + [p1r(1) p1r(2)];
                armR = center + [p2r(1) p2r(2)];
            
                clf;
              
                Robot.drawRobot(center,armL,armR)
                drawnow;
            end   
        end
    end
end




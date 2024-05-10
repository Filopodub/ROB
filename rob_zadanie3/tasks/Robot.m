classdef Robot
    properties
        d
        r
        armL 
        armR
    end
    
    methods
        function self = Robot(d,r)  
           self.d = d;
           self.r = r;
           self.armL = [0; self.d];  
           self.armR = [0; -self.d];
        end
       
        function [] = draw(self,center, armL,armR,k)
            for i = 1:k:length(center)
                plot([armL(i,1) armR(i,1)], [armL(i,2) armR(i,2)], 'red', 'LineWidth',1.5);
                hold on;
                self.circle(center(i,1),center(i,2)); 
            end
        end

        function [] = drawRobot(self,center, armL,armR)
            plot([armL(1) armR(1)], [armL(2) armR(2)], 'red', 'LineWidth',1.5);
            hold on;
            self.circle(center(1),center(2)); 
            xlim([-1, 1]);
            ylim([-1, 1]);
            xlabel('X-position [m]');
            ylabel('Y-position [m]');
            title('Robot Trajectory');
            grid on;
        end
                
        function [] = circle(self, x, y)
            th = 0:pi/50:2*pi;
            xunit = self.r/2 * cos(th) + x;
            yunit = self.r/2 * sin(th) + y;
            plot(xunit, yunit, 'red', 'LineWidth',1.5);
        end
        
        function [armLr,armRr] = rotate(self, angle) 
            rot = [cos(angle) -sin(angle) 0 0;
                  sin(angle) cos(angle) 0 0;
                  0 0 1 0;
                  0 0 0 1];
              
            armLr = rot * [self.armL; 0; 1];  
            armRr = rot * [self.armR; 0; 1];  
        end
    end
end

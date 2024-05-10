classdef Trajectory
    properties
        Robot
        k
        center
        armL
        armR
    end
    
    methods
        
        function self = Trajectory(vl, vr, Robot,k)
            self.Robot = Robot;
            self.k = k;

            dt = 1/k;
            
            vt = (vr+vl)/2;              
            wt = ((vr-vl))/(Robot.d*4);
            
            steps = length(vl)*k;
            center = zeros(steps,2);
            armL = zeros(steps,2);
            armR = zeros(steps,2);
            psit = zeros(steps,1);
            
            % Initial position 
            center(1,:) = [0 0];
            psit(1) = 0; 

            for tm = 2:steps
                index = floor((tm - 1) / k) + 1;
                vx = vt(index) * cos(psit(tm-1));
                vy = vt(index) * sin(psit(tm-1));

                dxt = vx * dt;
                dyt = vy * dt;
                
                center(tm,:) = [center(tm-1,1) + dxt center(tm-1,2) + dyt];

                dpsi = wt(index)*dt;
                psit(tm) = psit(tm-1) + dpsi;

                [p1r,p2r] = Robot.rotate(psit(tm));

                armL(tm,:) = [center(tm,1)+p1r(1) center(tm,2)+p1r(2)];
                armR(tm,:) = [center(tm,1)+p2r(1) center(tm,2)+p2r(2)];
            end
            self.center = center;
            self.armL = armL;
            self.armR = armR;
        end    

        function [] = drawTrajectory(self)
            figure

            plot(self.center(:,1),self.center(:,2),'black','LineWidth',2);
            hold on;
            plot(self.armL(:,1),self.armL(:,2),'black');
            plot(self.armR(:,1),self.armR(:,2),'black');
            xlabel('X-position [m]');
            ylabel('Y-position [m]');
            title('Robot Trajectory');
            grid on;

        end

        function [] = drawRobot(self)
            self.drawTrajectory();
            self.Robot.draw(self.center, self.armL,self.armR,self.k);
        end
    end
end



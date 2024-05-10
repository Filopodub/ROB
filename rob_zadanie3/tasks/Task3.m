classdef Task3 < Trajectory
    methods
        function self = Task3(R1,L, R2,Robot,k)
            steps = L/(1/k);
            vl = zeros(steps,1);
            vr = zeros(steps,1);

            vl(1)=-pi/2;
            vr(1)=pi/2;

            for step = 1:1:6
                 vl(step+1)=(pi*2*Robot.d + pi*R1)/10;
                 vr(step+1)=(-pi*2*Robot.d + pi*R1)/10;
            end

            for step = 1:1:steps 
                 vl(step+6)=1/k;
                 vr(step+6)=1/k;
            end

            for step = 1:1:5
                 vl(step+6+steps)=(-pi*2*Robot.d + pi*R2)/10;
                 vr(step+6+steps)=(pi*2*Robot.d + pi*R2)/10;
            end

            self = self@Trajectory(vl, vr, Robot,k);  
        end
    end
end


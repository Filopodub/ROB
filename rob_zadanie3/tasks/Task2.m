classdef Task2 < Trajectory
    methods
        function self = Task2(side,Robot,k)
            steps = (side*k+1)*4;
            vl = zeros(steps,1);
            vr = zeros(steps,1);

            for step = 1:1:steps
                vl(step+1)=1/k;
                vr(step+1)=1/k;
                if mod(step,steps/4) == 0
                    vl(step+1)=-pi/(2*k);
                    vr(step+1)=pi/(2*k);
                end
            end
            self = self@Trajectory(vl, vr, Robot,k);  
        end
    end
end



classdef Manipulator
    properties
        l1
        l2
        l3
    end
    
    methods 
        function obj = Manipulator(l1, l2, l3)
            obj.l1 = l1;
            obj.l2 = l2;
            obj.l3 = l3;
        end
        
        % Calculate end effector position
        function [Xc0, Yc0, Zc0] = calculateEndEffectorPosition(obj, fi1, fi2, fi3)
            fi1 = fi1 * pi/180;
            fi2 = fi2 * pi/180;
            fi3 = fi3 * pi/180;
            
            Xc0 = sin(fi1)*(obj.l2*sin(fi2) + obj.l3*sin(fi2+fi3));
            Yc0 = cos(fi1)*(obj.l2*sin(fi2) + obj.l3*sin(fi2+fi3));
            Zc0 = obj.l1 + obj.l2*cos(fi2) + obj.l3*cos(fi2+fi3);
        end

        % Calculate robotic segment position
        function [P, A, B, C] = calculateRoboticSegmentPosition(obj, fi1, fi2, fi3)
            fi1 = fi1 * pi/180;
            fi2 = fi2 * pi/180;
            fi3 = fi3 * pi/180;
            
            P = [0 0 0 1];
            A = P * transpose(Translation.Z(obj.l1)) * Rotation.Z(fi1);
            B = P * transpose(Translation.Z(obj.l2)) * Rotation.X(fi2) * Rotation.Z(fi1);
            C = P * transpose(Translation.Z(obj.l3)) * Rotation.X(fi2) * Rotation.X(fi3) * Rotation.Z(fi1);

        end


%% Axis plotting

        function [X, Y, Z, P] = axer_0(obj)
            P = [0 0 0 1];
            X = [200 0 0 1];
            Y = [0 200 0 1];
            Z = [0 0 200 1];            
        end

        function [X, Y, Z, P] = axer_1(obj,fi1)
            fi1 = fi1 * pi/180;
            [X, Y, Z, P] = axer_0(obj);

            X = X * transpose(Rotation.Z(fi1));
            Y = Y * transpose(Rotation.Z(fi1));
            Z = Z * transpose(Rotation.Z(fi1));
            P = P * transpose(Rotation.Z(fi1));
        end

        function [X, Y, Z, P] = axer_2(obj,fi1)
            fi1 = fi1 * pi/180;
            [X, Y, Z, P] = axer_0(obj);

            % Rotating XYZ
            X = X * transpose(Rotation.Z(fi1));
            Y = Y * transpose(Rotation.Z(fi1));
            Z = Z * transpose(Rotation.Z(fi1));
            
            % Finding starting position
            P = P * transpose(Translation.Z(obj.l1));
        end

        function [X, Y, Z, P] = axer_3(obj,fi1,fi2)
            fi1 = fi1 * pi/180;
            fi2 = fi2 * pi/180;
            [X, Y, Z, P] = axer_0(obj);

            % Rotating XYZ
            X = X * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            Y = Y * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            Z = Z * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
    
            % Finding starting position
            P = P * transpose(Translation.Z(obj.l1));
        end

        function [X, Y, Z, P] = axer_4(obj,fi1,fi2)
            fi1 = fi1 * pi/180;
            fi2 = fi2 * pi/180;
            [X, Y, Z, P] = axer_0(obj);

            % Rotating XYZ
            X = X * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            Y = Y * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            Z = Z * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));

            % Finding starting position
            P1 = P * transpose(Translation.Z(obj.l1));
            P2 = P * transpose(Translation.Z(obj.l2)) * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            P = P1 + P2;
        end

        function [X, Y, Z, P] = axer_5(obj,fi1,fi2,fi3)
            fi1 = fi1 * pi/180;
            fi2 = fi2 * pi/180;
            fi3 = fi3 * pi/180;
            [X, Y, Z, P] = axer_0(obj);

            % Rotating XYZ
            X = X * transpose(Rotation.X(fi3)) * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            Y = Y * transpose(Rotation.X(fi3)) * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            Z = Z * transpose(Rotation.X(fi3)) * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));

            % Finding starting position
            P1 = P * transpose(Translation.Z(obj.l1));
            P2 = P * transpose(Translation.Z(obj.l2)) * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            P = P1 + P2;
        end
        
        function [X, Y, Z, P] = axer_6(obj,fi1,fi2,fi3)
            fi1 = fi1 * pi/180;
            fi2 = fi2 * pi/180;
            fi3 = fi3 * pi/180;
            [X, Y, Z, P] = axer_0(obj);

            % Rotating XYZ
            X = X * transpose(Rotation.X(fi3)) * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            Y = Y * transpose(Rotation.X(fi3)) * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            Z = Z * transpose(Rotation.X(fi3)) * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));

            % Finding starting position
            P1 = P * transpose(Translation.Z(obj.l1));
            P2 = P * transpose(Translation.Z(obj.l2)) * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            P3 = P * transpose(Translation.Z(obj.l3)) * transpose(Rotation.X(fi3)) * transpose(Rotation.X(fi2)) * transpose(Rotation.Z(fi1));
            P = P1 + P2 + P3;
        end

    end
end

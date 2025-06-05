%PartB
P = struct();
L = 8; %Beam length (m)
P.x = [ 2 4 6 7]; %Load x positions (m)
P.mag = [-5 -2 3 -8];%Load magnitudes (kN), downward (-)
A_y = 12;
shearForce = zeros(1, 100);
bendingMoment = zeros(1, 100);
xAxis = linspace(0, L, 100);
for i = 1 : length(xAxis)
    px = xAxis(i);
    V = A_y;
    M = A_y * px + ((P.x(1) * P.mag(1)) + (P.x(2) * P.mag(2)) + P.x(3) * P.mag(3) + P.x(4) * P.mag(4));
    for j = 1 : length(P.mag)
        if(px >= P.x(j))
            V = V + P.mag(j);
            M = M + (P.mag(j) * (xAxis(i) - P.x(j)));

        end
    end
    shearForce(i) = V;
    bendingMoment(i) = M;
end
%Plot Loads
quiver(P.x, 0*P.x, 0*P.mag, P.mag, 0)
hold on
plot( [0, L], [0, 0], 'k' )
xlabel('Load Position (m)')
ylabel('Load Magnitude (kN)')
title('Point Loads')

% Plot the internal shear force diagram
figure;
area(xAxis, shearForce, 'LineWidth', 2);
title('Internal Shear Force in the Beam');
xlabel('Position (m)');
ylabel('Shear Force (kN)');

% Plot the internal bending moment diagram
figure;
area(xAxis, bendingMoment, 'LineWidth', 2);
title('Internal Bending Moment in the Beam');
xlabel('Position (m)');
ylabel('Bending Moment (kNm)');


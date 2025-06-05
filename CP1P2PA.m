%{
The method of using a point load approximation is not very accurate because
when taking a point load approximation you convert a distrubuted load into
a point load. Doing this will make the entire distrubuted load concentrated
at one place and will not produce a correct shear and moment diagram. Using
this method will not account for the fact that the forces are distributed 
which can result in different stresses and deflections than those actually 
experienced.
%}
L = 8; %kN
P = 8; %m
d = 5.3; %m
A_y = 8; %kN
xAxis = linspace(0, L, 100);
shearForce = zeros(size(xAxis));

bendingMoment = zeros(size(xAxis));
V = A_y;
M = -L*d;
for i = 1:length(xAxis)
    px = xAxis(i);
    if(px == 0)
        M = M;
        shearForce(i) = V;
    elseif(px <= d) 
        shearForce(i) = V;
        M = L*(px) - (L)*(d);
    elseif(px >d)
        M = 0;
    end
    bendingMoment(i) = M;
end
% Plot the internal shear force diagram
figure;
area(xAxis, shearForce, 'LineWidth', 2);
title('Shear Force Diagram');
xlabel('Position along the beam (m)');
ylabel('Shear Force (kN)');

% Plot the internal bending moment diagram
figure;
area(xAxis, bendingMoment, 'LineWidth', 2);
title('Bending Moment Diagram');
xlabel('Position along the beam (m)');
ylabel('Bending Moment (kNm)');

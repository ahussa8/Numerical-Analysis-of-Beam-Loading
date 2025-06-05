L = 10; %m
w_0 = 10; %kN/m
N = 100;
w = @(x) (w_0) * sqrt((1-(x/L).^2));%Uniform Distributed Load of 2000 (N/m)
PloadsArray = zeros(1, N);
xAxis = linspace(0, L, N + 1);
deltaX = L/N;
for i = 1 : N
   PloadsArray(i) = (w(xAxis(i)) + w(xAxis(i+1))) / 2 * deltaX;
end
shearForce = zeros(1, N + 1);
bendingMoment = zeros(1, N + 1);
for i = 1:N
    for j = i:N
        shearForce(i) = (shearForce(i) + PloadsArray(j));
        bendingMoment(i) = bendingMoment(i) + -PloadsArray(j) * (xAxis(j) + deltaX / 2 - xAxis(i));
    end
end

quiver(xAxis(1:end-1), 0*zeros(1,N), 0*PloadsArray, -PloadsArray, 0);
hold on
plot( [0, L], [0, 0], 'k' )
xlabel('Load Position (m)')
ylabel('Load Magnitude (N)')
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
ylabel('Bending Moment (kNm)')

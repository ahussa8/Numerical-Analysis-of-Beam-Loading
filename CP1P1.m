%fields 
lBeam = 8; %m
load = 2; %N/m
A_y = 8; %N/m
P = @(x) (load * x) / lBeam; % function handle P(x)
V = @(x) ((-1/2) * (x) * ((load * x) / lBeam)) + A_y;
M = @(x) ((-1/6) * (load/lBeam)* (x.^3)) + (A_y*x) - ((1/2)*(lBeam)*(load)*(lBeam)*(2/3));

% Discretize the beam length into 100 points for plotting
xAxis = linspace(0, lBeam, 100);

% Calculate distributed load, shear force, and bending moment for plotting
pValues = arrayfun(P, xAxis);
vValues = arrayfun(V, xAxis);
mValues = arrayfun(M, xAxis);

% Plotting
figure;
area(xAxis, pValues, 'LineWidth', 2);
title('Distributed Load (P) along the Beam');
xlabel('Position (m)');
ylabel('Distributed Load (kN/m)');
grid on;

figure;
area(xAxis, vValues, 'LineWidth', 2);
title('Shear Force (V) along the Beam');
xlabel('Position (m)');
ylabel('Shear Force (kN)');
grid on;

figure;
area(xAxis, mValues, 'LineWidth', 2);
title('Bending Moment (M) along the Beam');
xlabel('Position (m)');
ylabel('Bending Moment (kNm)');
grid on;
ylim([-50,0])


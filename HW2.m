%% Carlin Liao - ME 104 Spring 16 - HW 2

%% Problem 5

% transcribing formulas
v = @(v0,t,theta) sqrt(v0^2+32.174^2*t.^2-2*v0*sind(theta)*32.174*t);
    % in ft/s using degrees
a = @(v0,t,theta,v) 32.174*(32.174.*t-v0*sind(theta))./v(v0,t,theta);
    % in ft/s^2 using degrees
rho = @(v0,t,theta,v,a) sqrt(v(v0,t,theta).^4)./(32.174^2-a(v0,t,theta,v).^2);
    % in ft
t_apex = @(v0,theta) v0*sind(theta)/32.174;
    % in s using ft/s and degrees
   
% setting constants
theta = 35; % degrees
v0 = 80;    % ft/s

% calculating rho at t=1 and t=2
rho1 = rho(v0,1,theta,v,a);
rho2 = rho(v0,2,theta,v,a);

% graphing
t = linspace(0,2*t_apex(v0,theta));
vv0_vals = v(v0,t,theta)./v0;
ag_vals = a(v0,t,theta,v)./32.174;
rho_vals = rho(v0,t,theta,v,a);
plot(t,vv0_vals,t,ag_vals,t,rho_vals)
legend('v/v0','a/g','rho','Location','Southeast')
title('speed, acceleration, and radius of curvature of football')
xlabel('Time (seconds)')
ylabel('ft/s or ft/s^2 or ft (see legend)')

%% Problem 6

% transcribing formulas
x = @(t) 16-12*t+4*t.^2;
y = @(t) 2+15*t-3*t.^2;
v = @(t) sqrt(100*t.^2-372*t+369);
a = @(t) (200*t-372)./(2*v(t));
rho = @(t) sqrt(v(t).^4./(8^2+6^2-a(t).^2));

% calculating rho at t=2
rho2 = rho(2);

t = linspace(0,4);
fig1 = figure('position', [0, 0, 1000, 300])
plot(x(t),y(t))
xlabel('x (mm)')
ylabel('y (mm)')
title('y(x) movement of P')
fig2 = figure('position', [0, 0, 1000, 300])
plot(t,v(t))
xlabel('time (s)')
ylabel('speed (mm/s)')
title('speed v(t) over time')
fig3 = figure('position', [0, 0, 1000, 300])
plot(t,rho(t))
xlabel('time (s)')
ylabel('radius of curvature (mm)')
title('radius of curvature rho over time')

%% Problem 7

% differentiating that huge formula for the radius of curvature
% syms x A L
% rho7 = (1+pi^2*A^2/(L^2)*(cos(pi*x/L))^2)^(3/2) / (pi^2/L^2*A*sin(pi*x/L));
% drho = diff(rho7,x);
% rho0 = solve(drho == 0, L)
    % all of this looks correct but i don't know how to use my output (the
    % k especially), so i copied the formula into wolfram|alpha
    
clear all
v = [40 80 120 160].*.2778; % km/hr converted to m/s
L = 46.1; % m
A = 3; % m
v2rhog = @(v,L,theta,A) v.^2./((1+pi^2*A^2/(L^2)*(cos(theta)).^2).^(3/2)...
    .*9.81 ./ (pi^2/L^2*A*sin(theta)) );
xaxis = @(x,L) pi*x/L;
x = linspace(1,3*L);
ubound = ones(1,100)*.7;
lbound = ones(1,100)*-.7;

plot(xaxis(x,L),v2rhog(v(1),L,xaxis(x,L),A),...
     xaxis(x,L),v2rhog(v(2),L,xaxis(x,L),A),...
     xaxis(x,L),v2rhog(v(3),L,xaxis(x,L),A),...
     xaxis(x,L),v2rhog(v(4),L,xaxis(x,L),A),...
     xaxis(x,L),ubound,'k',... % graphing the upper bound
     xaxis(x,L),lbound,'k' )   % graphing the lower bound

legend('40 km/hr','80 km/hr','120 km/hr','160 km/hr','abs(.7*g)')
xlabel('pi*x/L')
ylabel('v^2/(rho*g)')

% syms x
% solve(v2rhog(40,L,xaxis(x,40),A)-.7 == 0)

xceed = zeros(6,3);
for i = 1:3
    [xceed(1:4,i),yi] = polyxpoly(xaxis(x,L),v2rhog(v(i+1),L,xaxis(x,L),A),xaxis(x,L),ubound);
    [xi,yi] = polyxpoly(xaxis(x,L),v2rhog(v(i+1),L,xaxis(x,L),A),xaxis(x,L),lbound);
    xceed(:,i) = [ xceed(1:2,i);xi;xceed(3:4,i) ] ; % single purpose code
end
xceed   % first column is the x-values where the lateral acceleration 
        % exceeds .7g when v = 80 km/hr (because at 40 km/hr it doesn't
        % exceed .7g), second column is 120 km/hr, and last is 160 km/hr
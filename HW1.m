%% Carlin Liao - ME 104 Spring 16 - HW 1

%% Problem 6

%solving the system of equations via MATLAB
syms v t

% solving for the minimum v0
min_eq1 = 3.5 == v*cosd(30)*t; % x(t) = 3.5 m
min_eq2 = -.1 == -9.81/2*t^2+v*sind(30)*t; % y(t) = -.1 m
min_v0s = solve([min_eq1, min_eq2], [v,t]);
vmin = double(min_v0s.v);

% solving for the maximum v0
max_eq1 = 4.1 == v*cosd(30)*t; % x(t) = 4.1 m
max_eq2 = -.1 == -9.81/2*t^2+v*sind(30)*t; % y(t) = -.1 m
max_v0s = solve([max_eq1, max_eq2], [v,t]);
vmax = double(max_v0s.v);

% graphing x(t), y(t), and y(x)

close all
clear all
v0 = [6.146, 6.4, 6.675]; % m/s, middle v0 chosen arbitrarily
T = [.6575, .6823, .70902]; % s
xt = @(v0,t) v0*cosd(30)*t; % formula for x(t)
yt = @(v0,t) -9.81/2*t.^2+v0*sind(30)*t; % for y(t)
yx = @(v0,x) x*tand(30)-9.81*x.^2/(2*v0^2*cosd(30)^2); % for y(x)
tvals = linspace(0,max(T),100);
xvals = linspace(0,xt(max(v0),max(T)),100);

figure(1) % x(t)
for i = 1:3
    plot(tvals,xt(v0(i),tvals))
    hold on
end
xlabel('Time (s)')
ylabel('X displacement (m)')

figure(2) % y(t)
for i = 1:3
    plot(tvals,yt(v0(i),tvals))
    hold on
end
xlabel('Time (s)')
ylabel('Y displacement (m)')

figure(3) % y(x)
for i = 1:3
    plot(xvals,yx(v0(i),xvals))
    hold on
end
rectangle('Position',[3.5 -.3 .6 .2]);
xlabel('X displacement (m)')
ylabel('Y displacement (m)')

%% Problem 7

% should've gone to office hours

%% Problem 8

close all
clear all
v0 = 1; % m/s, fairly representative
theta = 45; % degrees, also fairly representative
k = linspace(0.01,1,5);
xt = @(v0,t,theta,k) v0*cosd(theta)*(1-exp(-k*t)); % formula for x(t)
yt = @(v0,t,theta,k) 1/k*(v0*sind(theta)+9.81/k)*(1-exp(-k*t))-9.81*t/k;
    % for y(t)
    % doesn't appear to work correctly as y(t>0) should not be negative
yx = @(v0,x,theta,k) 1/k*(v0*sind(theta)+9.81/k)*(x/(v0*cosd(theta)))-9.81/k^2*log(v0*cosd(theta)./(v0*cosd(theta)-x));
    % for y(x), also graphing incorrectly
tvals = linspace(0,40);
xvals = linspace(0,100);

figure(1) % x(t)
for i = 1:5
    plot(tvals,xt(v0,tvals,theta,k(i)))
    hold on
end
legend
xlabel('Time (s)')
ylabel('X displacement (m)')

figure(2) % y(t)
for i = 1:5
    plot(tvals,yt(v0,tvals,theta,k(i)))
    hold on
end
xlabel('Time (s)')
ylabel('Y displacement (m)')

figure(3) % y(x)
for i = 1:5
    plot(xvals,yx(v0,tvals,theta,k(i)))
    hold on
end
xlabel('X displacement (m)')
ylabel('Y displacement (m)')

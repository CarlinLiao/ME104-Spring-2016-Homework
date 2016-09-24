%% Carlin Liao - ME 104 Spring 16 - HW 6

%% Problem 5

t1 = linspace(0,2.019);
v1 = @(t) 0*t; % t from 0 to 2.019s (when mass moves) and at greater than 3.691s
t2 = linspace(2.019,3);
v2 = @(t) (1/2*50*(t.^2-2.019^2)*(cosd(30)+.4*sind(30))-.4*20*9.81*...
    (t-2.019)) / 20; % t from 2.019s to 3s (when P goes to 0)
t3 = linspace(3,3.691);
v3 = @(t) -.4*9.81*(t-3)+2.711; % t from 3s to 3.691s (when mass stops)

plot(t1,v1(t1),t2,v2(t2),t3,v3(t3))
xlabel('Time (s)')
ylabel('Velocity in E_x direction (m/s)')
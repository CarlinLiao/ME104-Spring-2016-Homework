%% Carlin Liao - ME 104 Spring 16 - HW 4

%% Problem 7

r0 = .1;    %m
L  =  1;    %m
w0 =  1;    %rad/s

t = linspace(0,3.1); % from start time 0 to just after when the particle
                     % exits the tube
                     
xt = r0.*cosh(w0.*t).*cos(w0.*t);
yt = r0.*cosh(w0.*t).*sin(w0.*t);
rt = r0.*cosh(w0.*t);
thetat = w0.*t;

figure(1)
plot(xt,yt)
xlabel('x (m)')
ylabel('y (m)')
title('y(x)')

figure(2)
plot(t,xt,t,yt,t,rt,t,thetat)
xlabel('Time (s)')
ylabel('Distance (m or radians)')
legend('x(t)','y(t)','r(t)','theta(t)','Location','Northwest')
%% Carlin Liao - ME 104 Spring 16 - HW 12 - Problem 6 - 6/60

g = 9.81; %m/s^2
b = 1; %m, placeholder value as length b is not given

% function dydt = odefcn(t,tht,g,b)
% dydt = zeros(2,1);
% dydt(1) = tht(2);
% dydt(2) = -3/10*g/b*(sin(tht(1))-cos(tht(1)));
% end

tspan = [0 5];
tht0 = [0 0];
[t,tht] = ode45(@(t,tht) odefcn(t,tht,g,b), tspan, tht0);
figure(1)
plot(t,tht(:,1),'-o',t,tht(:,2),'-.')
legend('theta(t)','omega(t)','Location','SouthEast')
xlabel('Time (s)')
ylabel('Radians | Radians/second')

Eovermgb = 5/16*b/g*tht(:,2) + sin(tht(:,1))/4 + 3*cos(tht(:,1))/4;
figure(2)
plot(t,Eovermgb)
xlabel('Time (s)')
ylabel('E/(mgb)')

tht = [tht -3/10*g/b*(sin(tht(:,1))-cos(tht(:,1)))];
Rx = ((-b./4.*tht(:,2).^2-3.*b./4.*tht(:,3)).*cos(tht(:,1))...
     -(b./4.*tht(:,2).^2-3.*b./4.*tht(:,3)).*sin(tht(:,1)))./g;
Ry = ((-b./4.*tht(:,2).^2-3.*b./4.*tht(:,3)).*sin(tht(:,1)) ...
     +(b./4.*tht(:,2).^2-3.*b./4.*tht(:,3)).*cos(tht(:,1)))./g;
R = sqrt(Rx.^2 + Ry.^2)./g;
figure(3)
plot(t,Rx,t,Ry,t,R)
xlabel('Time (s)')
ylabel('R/mg')
legend('Rx', 'Ry', 'R','Location','Best')
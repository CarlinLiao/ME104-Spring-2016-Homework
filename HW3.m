%% Carlin Liao - ME 104 Spring 16 - HW 3

%% Problem 7

mu_s = .3;

% b is the angle beta in radians
% not including .* (m1 + m2)*g
P_lower = @(b,mu) (sin(b)-mu_s*cos(b)) ./ (cos(b)+mu*sin(b));
P_upper = @(b,mu) (sin(b)+mu_s*cos(b)) ./ (cos(b)-mu*sin(b)); 

b = linspace(0,pi/2);

plot(b,P_lower(b,mu_s),b,P_upper(b,mu_s))
ylabel('P / (m1 + m2)*g')
xlabel('angle beta (radians)')
legend('F_f = -mu_s * N_2','F_f = mu_s * N_2','Location','SouthWest')


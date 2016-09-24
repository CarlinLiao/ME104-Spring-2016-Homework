%% Carlin Liao - ME 104 Spring 16 - HW 10

h = .1; %m
L = .2; %m
r_a = .08; %m
tht_w = 9; %rad/s

syms a_b     % acceleration of point b
syms phi     % angle of AB from horizontal
syms phi_w   % angular velocity of AB
syms phi_a   % angular acceleration of AB

%% 5/138

tht = 0; %rad
tht_a = 0; %rad/s^2

S = solve(...
[-a_b == r_a*(tht_a*sin(tht)+tht_w^2*cos(tht)) + L*(phi_a*sin(phi)+phi_w^2*cos(phi)),...
0 == r_a*(tht_a*cos(tht)-tht_w^2*sin(tht)) + L*(phi_a*cos(phi)-phi_w^2*sin(phi)),...
phi == asin((h+r_a*sin(-tht))/L),...
phi_w == -tht_w*cos(tht)*r_a / (cos(phi)*L)],...
[a_b,phi,phi_w,phi_a]);

sol5_138 = double(S.phi_a) % solution for 5/138 in rad/s^2

%% 5/139

tht = degtorad(-30); %rad
tht_a = -5; %rad/s^2

S = solve(...
[-a_b == r_a*(tht_a*sin(tht)+tht_w^2*cos(tht)) + L*(phi_a*sin(phi)+phi_w^2*cos(phi)),...
0 == r_a*(tht_a*cos(tht)-tht_w^2*sin(tht)) + L*(phi_a*cos(phi)-phi_w^2*sin(phi)),...
phi == asin((h+r_a*sin(-tht))/L),...
phi_w == -tht_w*cos(tht)*r_a / (cos(phi)*L)],...
[a_b,phi,phi_w,phi_a]);

sol5_139 = double(S.phi_a) % solution for 5/139 in rad/s^2

%% 5/130

L = .4;
tht1 = deg2rad(-15);
tht2 = deg2rad(120);
vb = .5;
ab = -.3;

syms w a va aa

S = solve(...
    [ vb*cos(tht1) == -w*L*sin(tht2),...
    vb*sin(tht1)-va == w*L*cos(tht2),...
    ab*cos(tht1) == -a*L*sin(tht2) + w*(vb*sin(tht1)-va),...
    ab*sin(tht1)-aa == a*L*cos(tht2) - w*(vb*cos(tht1))],...
    [w a va aa]);

double(S.a) % this is negative for some reason
double(S.aa)
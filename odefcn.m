function dydt = odefcn(t,tht,g,b)
dydt = zeros(2,1);
dydt(1) = tht(2);
dydt(2) = -3/10*g/b*(sin(tht(1))-cos(tht(1)));
end
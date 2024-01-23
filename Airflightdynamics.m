clc;
clear all;
m = 72000;
v = 230;
cl = 0.595;
cd = 0.039;
c = 0.000017;
q = 0.5*0.4125*(v^2);
A = 122.6;
cd0 = 0.025;
k = 0.775;
k1 = -c*9.81*q*A*cd0;
k2 = -(c*9.81*k)/(q*A);
beta = m*sqrt(k2/k1);
syms mf(t)
eqn diff(mf, 1) == (c*q*A*cd0)*(((1+beta^2) *(1+(tan(c*9.81*sqrt(cd0*k)*t))^2))/ ... ((1+beta*tan(c*9.81*sqrt(cd0*k)*t))^2)); ...
cond = mf(0)==19000;
sol = dsolve(eqn,cond);
fplot(sol, [0,10000]);
xlabel("Time (s)");
ylabel("Fuel (kg)");
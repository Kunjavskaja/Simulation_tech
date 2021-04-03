close all

%Variablen
m1 = 25;
m2 = 250;
c1 = 9*10^4;
c2 = 3*10^4;
d2 = 750;
ud = 0.1;
wmax = 70;

sim('ueb1_2');
c = load('wegxy');

plot(c.ans(1,:), c.ans(2,:), c.ans(1,:), c.ans(3,:));

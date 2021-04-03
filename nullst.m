%function xp=nullst(x)
function xp=nullst(t,x)
global alpha beta;
xp(1)=x(2)-alpha*x(1);
xp(2)=beta*(1-x(1)^2)*x(2)-x(1);
xp=[xp(1);xp(2)];
end
%% 3.2 b) Nullstellenberechnung %%

global alpha beta;
alpha=0.1;
beta=-1;
x0=[-3.3,-0.33];
xs1=fsolve(@nullst,x0);
disp(xs1);

x0=[0,0];
xs2=fsolve(@nullst,x0);
disp(xs2);

x0=[3.3,0.33];
xs3=fsolve(@nullst,x0);
disp(xs3);

%% 3.2 c)
%syms x1 x2 alpha beta;
A1=[-alpha 1;-2*beta*xs1(1)*xs1(2)-1 beta*(1-(xs1(1))^2)];
ew=eig(A1)
A2=[-alpha 1;-2*beta*xs2(1)*xs2(2)-1 beta*(1-(xs2(1))^2)];
ew=eig(A2)
A3=[-alpha 1;-2*beta*xs3(1)*xs3(2)-1 beta*(1-(xs3(1))^2)];
ew=eig(A3)
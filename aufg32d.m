alpha=0;
bvek=linspace(-10,10,100);
x=[0 0];
for ii=1:length(bvek)
    beta=bvek(ii);
    A=[-alpha 1;-2*beta*x(1)*x(2)-1 beta*(1-(x(1))^2)];
    lam(:,ii)=eig(A);
end
plot(real(lam(1,:)),imag(lam(1,:)),'*',real(lam(2,:)),imag(lam(2,:)),'*');

figure('Name','Integration DGL');
global alpha beta;
alpha=0.1;
beta=-1;

x0=[-3 -0.3;-2 -0.2;-1 -0.1;0 0;1 0.1;2 0.2;3 0.3];

for i=1:length(x0)
    [t,kurve]=ode45(@nullst,[1 10],x0(i,:));
    %[t,kurve]=ode45(@nullst,x0(i,:));
    plot(kurve(:,1),kurve(:,2));
    hold on;
end

% beta=-1;
% for i=1:3
%     [t,kurve]=ode45(@nullst,[1 10],x0(i,:));
%     plot(t,kurve(:,1));
%     hold on;
% end
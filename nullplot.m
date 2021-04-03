alpha=0.1;
beta=-1;
x1s=linspace(-5,5,200);
x2s=alpha*x1s;
x2p=beta*(1-x1s.^2).*x2s-x1s;
plot(x1s,x2p,'r',x1s,0*x1s,'--','linewidth',2);
grid on
xlabel('Ruhelage x_{1,s3}');
ylabel('xs_2');
%--------------------------------------------------------------------
%- Biegelinie mit Hilfe der Matlab-Routine bvp4c                    -
%--------------------------------------------------------------------
  clear all
  close all
%
  global alpha a b l u_quer
% Parameter einlesen
  balken_parameters
%
% Berechnung der analytischen Loesung
  disp(' Analytische Loesung ... ')
  N_analytisch = 5;
  z = linspace(0,l,N_analytisch);
  [x,x1,x2,x3] = balken_analytisch(z);
%
% Biegelinie mit Hilfe von bvp4c
  disp(' Biegelinie mit bvp4c ... ')
  solinit = bvpinit(z,zeros(4,1))
  sol     = bvp4c(@balken_dgl,@balken_bc,solinit);
  xint = deval(sol,z);
%
% Grafik
  subplot(2,2,1)
  plot(z,x)
  hold on
  plot(z,xint(1,:),'r--')
  set(gca,'YDir','reverse')
  xlabel(' z [m] ')
  ylabel(' Durchbiegung x [m] ')
  title(' Biegelinie ')

  subplot(2,2,2)
  plot(z,x1)
  hold on
  plot(z,xint(2,:),'r--')
  xlabel(' z [m] ')
  ylabel(' dx / dz  [-] ')
  title(' Neigung der Biegelinie ')

  subplot(2,2,3)
  plot(z,x2)
  hold on
  plot(z,xint(3,:),'r--')
  xlabel(' z [m] ')
  ylabel(' d^2x / dz^2 [1/m] ')
  title(' Biegemoment ')

  subplot(2,2,4)
  plot(z,x3)
  hold on
  plot(z,xint(4,:),'r--')
  xlabel(' z [m] ')
  ylabel(' d^3x / dz^3 [1/m^2] ')
  title(' Querkraft ')
%
%--------------------------------------------------------------------

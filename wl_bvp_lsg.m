%--------------------------------------------------------------------
%- Berechnung des Temperaturprofils mit Hilfe der                   -
%- Matlab-Routine bvp4c                                             -
%--------------------------------------------------------------------

  global a b dz gamma l q N Tu

% Parameter einlesen
  wl_parameters_lsg
% Initial Guess
  solinit = bvpinit(linspace(0,l,10),[2500;-q/gamma]);
% Berechnung des Temperaturprofils mit bvp4c
  sol     = bvp4c(@waermeleiter_lsg,@waermeleiter_bc_lsg,solinit);
  xint    = linspace(0,l,10);
  Sint    = deval(sol,xint);
% Grafik
  figure(1)
  plot(xint,Sint(1,:), xint, wl_analytisch_lsg(xint), 'r--')
  grid on
axis tight
xlabel(' Ortskoordinate z [m] ')
ylabel(' Temperatur T  [K] ')
title(' Stationaeres Temperaturprofil ')

%--------------------------------------------------------------------
%- Differenzenverfahren zur Berechnung des Temperaturprofils        -
%--------------------------------------------------------------------
%

clear all
close all
%
global a b dz gamma l q N Tu
%
% Parameter einlesen
  wl_parameters_lsg
%
% Anzahl der Ortspunkte
  N = 10;
  dz = l/(N-1);
%
% Startwert
  z = linspace(0,l,N);
  T_start = wl_analytisch_lsg(z);
%
% Differenzenverfahren
  T = fsolve('waermeleiter_diff_lsg',T_start');
%
% Grafik
figure(3)
w = plot(z,T)
hold on
x = plot(z,T_start,'r--')
grid on
axis tight
xlabel(' Ortskoordinate z [m] ')
ylabel(' Temperatur T  [K] ')
title(' Stationaeres Temperaturprofil ')
legend([w x],'Differenzenverfahren','Analytisch')
%
%--------------------------------------------------------------------

%--------------------------------------------------------------------
%- Schiessverfahren zur Berechnung des Temperaturprofils            -
%--------------------------------------------------------------------
%
  clear all
  close all
% Globale Variablen
  global a b gamma q l Tu
% Parameter einlesen 
  wl_parameters_lsg
% Startwert bzw. Anfangswerte fuer die Simulation 
  s0 = 2607;
  x20 = -q/gamma;
% Inkrement zur Approximation der Ableitung
  ds = 1;
% Genauigkeit (Abbruchkriterium) 
  epsilon2 = 0.0001;
  s = s0;
  salt = 1.0e6;
% Iterationsindex
  i = 1;
% Maximale Anzahl der Iterationen
  Imax = 20;
% Integrationsparameter fuer das Integrationsverfahren ode15s
  z_sim  = 1;
  z_span = [0 z_sim];
  hmax = 0.005;
  options = odeset('MaxStep',hmax);
%
% Schiessverfahren
%
while ((abs(s - salt) > epsilon2) & (i <= Imax)),
%
% Anfangswerte
    xs0 = [s,x20];
% 1. Integration
    [zs,xs] = ode15s('waermeleiter_lsg',z_span,xs0,options);
% Ermittlung von dT/dz = x2 an z = l
    [row col] = size(xs);
    xs_l = xs(row,2);
%
% Anfangswerte
    xs0 = [s + ds,x20];
% 2. Integration
    [zs_ds,xs_ds] = ode15s('waermeleiter_lsg',z_span,xs0,options);
    [row col] = size(xs_ds);
% Ermittlung von dT/dz = x2 an z = l
    xs_ds_l = xs_ds(row,2);
%
% Newton-Verfahren
%
    salt = s;
    dRds=(xs_ds_l-xs_l)/ds;
    delta_s=-xs_l/dRds;
    s = salt + delta_s;
    i = i + 1
% Temperaturprofile des Iterationsprozesses
    figure(1)
    plot(zs,xs(:,1))
    hold on
    grid on
    axis tight
    xlabel(' Ortskoordinate z [m] ')
    ylabel(' Temperatur T  [K] ')
    title(' Temperaturprofile des Iterationsprozesses ')
end

figure(2)
f= plot(zs,xs(:,1))
hold on
u= plot(zs,wl_analytisch_lsg(zs),'r--')
grid on
axis tight
xlabel(' Ortskoordinate z [m] ')
ylabel(' Temperatur T  [K] ')
title(' Stationaeres Temperaturprofil ')
legend([f u],'Schiessverfahren','Analytisch')
%--------------------------------------------------------------------

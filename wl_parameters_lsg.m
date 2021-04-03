%--------------------------------------------------------------------  
%- Skriptfile parameters.m zur einmaligen Eingabe der               -
%- Modellparameter des Waermeleiters und zum Einlesen in            -
%- wl_schiessverfahren.m, wl_differenzen.m und wl_bvp.m             -
%--------------------------------------------------------------------

% Laenge [m]
  l       = 1;
% Radius [m]
  R       = 0.2;
% Waermeuebergangszahl [W / (m^2 K)]
  alpha   = 274;
% Waermeleitfaehigkeit [W / (mK)]
  gamma   = 197; 
% Stefan-Boltzmann-Konstante [W / (m^2 K)]
  sigma   = 5.67e-8;
% Strahlungsaustauschzahl [-]
  epsilon = 0.95;
% Stationaere Waermestomdichte [W / m^2]
  q       = 1.84e6;
% Umgebungstemperatur [K]
  Tu      = 100;
% Konstanten
  a = sqrt(2*alpha/(R*gamma));
  b = epsilon*2*pi*R*sigma/gamma;

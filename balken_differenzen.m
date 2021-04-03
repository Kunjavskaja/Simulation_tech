%--------------------------------------------------------------------
%- Biegelinie mit Hilfe des Differenzenverfahrens                   -
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
  N_analytisch = 10;
  z = linspace(0,l,N_analytisch);
  [x,x1,x2,x3] = balken_analytisch(z);
%
% Biegelinie mit dem Differenzenverfahren
  disp(' Differenzenverfahren ... ')
% Anzahl der Ortspunkte
  N  = 100;
  dz = l/(N-1);
  z_diff = linspace(0,l,N);
% Streckenlast
  u = streckenlast(z_diff)';
%
% Belegung der Matrix
% Hinweis: Verwenden Sie die Befehle diag(.) und ones(.) oder spdiags()!
%  Beispiel: >> M = diag(ones(3,1)) + diag(ones(2,1),-1) 
%        ergibt M = [ 1 0 0
%                     1 1 0
%                     0 1 1 ]
%
  H = spdiags(ones(N,1)*[1 -4 6 -4 1],-2:2,N,N);
  H(1,1:3)=[1 0 0];
  H(N,(N-2):N)=[0 0 1];
  H(2,1:2)=[-2 5];
  H(N-1,(N-1):N)=[5 -2];
  % Loesung des linearen Gleichungssystems
% Hinweis: Verwenden Sie den Befehl x=A\b zur Loesung von Ax=b
  x_diff = H\(u*(dz^4/alpha));
%
% Grafik
  subplot(2,1,1)
  plot(z,x)
  set(gca,'YDir','reverse')
  hold on
  plot(z_diff,x_diff,'r--')
  xlabel(' Ortskoordinate z [m] ')
  ylabel(' Durchbiegung x [m] ')
  title(' Biegelinie ')

  subplot(2,1,2)
  plot(z_diff,u)
  hold on
  xlabel(' Ortskoordinate z [m] ')
  ylabel(' Streckenlast u [N/m] ')
%
%--------------------------------------------------------------------

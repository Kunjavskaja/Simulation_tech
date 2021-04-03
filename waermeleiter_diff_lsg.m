function Res = waermeleiter_diff_lsg(T)
% Nichtlineares Gleichungssystem fuer die Temperaturen T(z_j)
% in Residuenform

global a b dz gamma q N Tu

%
% Tridiagonalmatrix
% Hinweis: Verwenden Sie die Befehle diag(.) und ones(.)!
%  Beispiel: >> M = diag(ones(3,1)) + diag(ones(2,1),-1) 
%        ergibt M = [ 1 0 0
%                     1 1 0
%                     0 1 1 ]
%Diskretisierungspunkte

  H = diag(ones(N,1)*(-2))+diag(ones(N-1,1),-1)+diag(ones(N-1,1),1);
  H(1,2)=2;
  H(N,N-1)=2;
  
% Nichtlineares Gleichungssystem in Residuenform
% Hinweis: Verwenden Sie den Befehl ones(.)!
%  Beispiel: >> v = [1, 0*ones(2,1)']
%        ergibt v = [1 0 0]
%        Mit ' wird ein Vektor oder eine Matrix transponiert.
%
  w_leitung   = (1/dz^2)*H*T+[2*q/dz/gamma;zeros(N-1,1)];
  w_austausch = a^2*(Tu*ones(N,1)-T);
  w_strahlung = b*(Tu^4*ones(N,1)-T.^4);
  
Res = w_leitung + w_austausch + w_strahlung;

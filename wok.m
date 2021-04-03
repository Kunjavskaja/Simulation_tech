%************************************************************
%*  File wok.m                                              *
%*                                                          *
%*  Berechnung und grafische Darstellung von                *
%*  Wurzelortskurven                                        *
%************************************************************
disp('**********************************************');
disp('*   Bestimmung der Wurzelortskurven          *');
disp('**********************************************');
disp('');
% Alle Variablen aus Workspace loeschen
clear
% Deklaration der Konstanten
om0  = 1.0;
dmin = input('min. Daempfung = ');
dmax = input('max. Daempfung = ');
nstep = input('Schrittweite fuer Daempfung = ');
% Die Werte der Daempfung D werden in den Vektor dvek
% geschrieben. dvek ist ein Zeilenvektor.
dvek = dmin:nstep:dmax;

% Eigenwerte fuer verschiedene Werte von delta
% werden in Matrix Wurzeln geschrieben
%**********************************************************
% Hier Schleife ueber alle Elemente von dvek ergaenzen.
for i=1:length(dvek)
    A=[0,1;-om0^2,-2*dvek(i)*om0];
    Wurzeln(i,:)=eig(A);
end
%**********************************************************
% Das Tupel der Eigenwerte wird in die Matrix Wurzeln uebernommen.
% Ende der Schleife
Lam1 = Wurzeln(:,1);
Lam2 = Wurzeln(:,2);
Re_lam=[real(Lam1);real(Lam2)];
Im_lam=[imag(Lam1);imag(Lam2)];
% Werte plotten
plot(real(Lam1),imag(Lam1),'b--',real(Lam2),imag(Lam2),'r');
% Hier Skalierung eintragen
axis([min(Re_lam)-1,max(Re_lam)+1,min(Im_lam)-1,max(Im_lam)+1]);
title('Eigenwerte der Schwingungsdgl.');
xlabel('Real(\lambda)');
ylabel('Imag(\lambda)');
% Gitter unterlegen
grid; 
clear Wurzeln dvek Lam1 Lam2;
% Ende von wok.m
%*********************************************************************

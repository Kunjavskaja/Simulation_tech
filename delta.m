%*********************************************************
%*  File delta.m                                         *
%*  Berechnung der Loesung der Schwingungsdgl.           *
%*********************************************************
disp('**********************************************');
disp('* Berechnung der Loesung der Schwingungsdgl. *');
disp('**********************************************');
disp('');
% Loeschen der Grafik
clf;
% Falls Variablen bisher nicht global deklariert (warning vermeiden):
clear daempfung om0;
% Variablen daempfung und om0 als global deklarieren
global daempfung om0;
% Konstanten festlegen
om0 = 1.0;
t0  = 0;
y0  = [1;0];        % Spaltenvektor!
% Setzen bestimmter Integratoroptionen, Genauigkeit, Aufwand...
%  options = odeset('RelTol',1e-4,'AbsTol',[1e-6 1e-6]);
% Eingabedaten einlesen
tsim  = input('Simulationszeit  = ');
%ymin  = input('Minimaler y-Wert = ');
%ymax  = input('Maximaler y-Wert = ');
Titel = input('Ueberschrift: ', 's');
% Daempfungen
dvek = input('Geben Sie die Daempfungen als Zeilenvektor ([d1,d2,...]) ein: ');
% ******************************************************************
% ********* Ab hier muss das Programm modifiziert werden ***********
% ******************************************************************
for i=1:length(dvek)
    daempfung=dvek(i);
    [t,Kurve]=ode45(@System,[t0 tsim],y0);
    plot(t,Kurve(:,1));
    hold on
end
% Dgl. mit Runge-Kutta-Verfahren integrieren
    % Rechte Seite der Dgl. steht im File 'System.m'.
    [t,Kurve] = ode45(@System,[t0 tsim],y0);
    plot(t,Kurve(:,1));
% Achsenskalierung
%axis([0,tsim,ymin,ymax]);
title(Titel);
xlabel('Zeit t');
ylabel('Loesung y(t)');
% Grafik freigeben
hold off;
% Ende von delta.m
%*********************************************************

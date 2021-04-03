%*********************************************************
% System.m                                               *                                              
% Rechte Seite der Schwingungsdgl.                       *
% fuer numerische Integration mit ODE45                  *
%*********************************************************
%
% Achtung: system.m ist built-in function!
%         ===
%
% deshalb: System.m
%         ===
function  xdot = System(t,x);
%
global daempfung om0;
% Hier muss die rechte Seite der Dgl. noch vervollstaendigt
% werden
xdot = [x(2); -om0^2*x(1)-2*daempfung*om0*x(2)];
% Ende von System.m
%*********************************************************

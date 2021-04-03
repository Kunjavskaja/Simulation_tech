function [x,x1,x2,x3] = balken_analytisch(z)
%--------------------------------------------------------------------
%- Funktion zur Berechnung der Biegelinie eines Balkens             -
%- bei konstant verteilter Streckenlast                             -
%--------------------------------------------------------------------

global alpha a b l u_quer

% Klammerfunktion
term1 = max(z-a, 0.0);
term2 = max(z-b, 0.0);
% Integrationskonstanten
c1 = u_quer/(2*l*alpha) * ( (l-b)^2 - (l-a)^2 );
c2 = 0;
c3 = u_quer/(24*l*alpha) * ( (l-b)^4 - (l-a)^4 ) - (u_quer*l)/(12*alpha) * ( (l-b)^2 - (l-a)^2 );
c4 = 0;
% Querkraft
x3 = u_quer/alpha * ( term1 - term2 ) + c1;
% Biegemoment
x2 = u_quer/alpha * 1/2*(term1.^2-term2.^2) + c1*z + c2;
% Neigung der Biegelinie
x1 = u_quer/alpha * 1/6*(term1.^3-term2.^3) + c1/2*z.^2 + c2*z + c3;
% Biegelinie
x  = u_quer/alpha * 1/24*(term1.^4-term2.^4) + c1/6*z.^3 + c2/2*z.^2 + c3*z + c4;


function u = streckenlast(z)
%--------------------------------------------------------------------
%- Funktion zur Berechnung einer konstant verteilten Streckenlast   -
%- ueber [a,b]                                                      -
%--------------------------------------------------------------------

global a b u_quer

u = zeros(size(z));
u( (z>a) & (z<b) ) = u_quer;
u( (z==a) | (z==b) ) = u_quer/2.0; % Festlegung Numerik 

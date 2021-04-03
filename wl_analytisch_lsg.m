function T = wl_analytisch_lsg(z)

global a gamma q l Tu

for i = 1:length(z),
  T(i) = q*cosh(a*(l-z(i)))/(a*gamma*sinh(a*l))+Tu;
end

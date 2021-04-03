function dxdz = waermeleiter_lsg(z,x)

global a b Tu

dxdz = [ x(2);
        a^2*(x(1)-Tu)+b*(x(1)^4-Tu^4)];

function res = waermeleiter_bc_lsg(xa,xb)

global gamma q

res  = [ xa(2)+q/gamma;
         xb(2) ];
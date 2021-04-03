function dxdz = balken_dgl(z,x)

global alpha a b u_quer

if ( z >= a ),
  if ( z <= b ),
    u = u_quer;
  else
    u = 0;
  end
else
 u = 0;
end

dxdz = [ x(2);
         x(3);
         x(4);
         u/alpha];

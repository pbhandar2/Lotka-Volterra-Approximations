function yprf =yprf(t,y, flag, a, b, c, d)
 yprf(1) = a*y(1) - b*y(1)*y(2);
 yprf(2) = -d*y(2) + c*y(1)*y(2);
 yprf = [yprf(1) yprf(2)]'; 
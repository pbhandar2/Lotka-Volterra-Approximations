
% y=midpointstep(f,0,1,0.1);

function y = midpointstep(f,t,x,h)
mid = h/2;
add = x + mid * f(t,x);
y = x + h * f(t+mid,add);
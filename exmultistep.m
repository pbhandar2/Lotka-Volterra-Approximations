
function prey = exmultistep(inter,ic,h,s)

n = round((inter(2)-inter(1))/h);

% Start-up phase
prey(1,:)=ic;
pred(1, :) = ic;
t(1)=inter(1);

for i=1:s-1               
  t(i+1)=t(i)+h;
  prey(i+1,:)=trapstep(pred(i), prey(i,:), h);
  f(i,:)=ydot(t(i),prey(i,:));
end

for i=s:n+2                 % multistep method loop
  t(i+1)=t(i)+h;
  f(i,:)=ydot(t(i),prey(i,:));
  prey(i+1,:)=ab2step(t(i),i,prey,f,h);
end


function y=trapstep(t,x,h)
%one step of the Trapezoid Method from section 6.2

z1=ydot(t,x); 

g=x+h*z1;

z2=ydot(t+h,g); 

y=x+h*(z1+z2)/2;

function y=trapstep1(x,t,h)
%one step of the Trapezoid Method from section 6.2
z1=ydot(t,x); 
g=x+h*z1; 
z2=ydot(t+h,g); 
y=x+h*(z1+z2)/2;

function z=ab2step(t,i,y,f,h)
%one step of the Adams-Bashforth 2-step method
z=y(i,:)+h*(3*f(i,:)/2-f(i-1,:)/2);

function z=unstable2step(t,i,y,f,h)
%one step of an unstable 2-step method
z=-y(i,:)+2*y(i-1,:)+h*(5*f(i,:)/2+f(i-1,:)/2);

function z=weaklystable2step(t,i,y,f,h)
%one step of a  weakly-stable 2-step method
z=y(i-1,:)+h*2*f(i,:);


function z=ydot(x,y) % Predator 
a = 0.8; 
b = 0.8; 
z = a*x - b*x*y;


function z=ydot1(x, y) % Prey
c = 0.4; 
d = 1.2; 
z = c*x*y - d*y;

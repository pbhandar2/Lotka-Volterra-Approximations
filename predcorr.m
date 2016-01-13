% Program 6.8 Adams-Bashforth-Moulton second-order p-c
% Inputs: time interval inter,
% ic=[y0] initial condition
% number of steps n, number of (multi)steps s for explicit method
% Output: time steps t, solution y
% Calls multistep methods such as ab2step.m and am1step.m
% Example usage: [t,y]=predcorr([0 1],[1 1],20,2)

function predcorr(inter,ic,n,s)

%step-size
h=(inter(2)-inter(1))/n;

% Initial Condition
y1(1,:) = ic(1);
y2(2, :) = ic(2);

% Initial Time
t(1)=inter(1);

for i=1:s-1 % start-up phase, using one-step method
    t(i+1)=t(i)+h;
    y1(i+1,:) = trapstep(t(i),y1(i,:), y2(i,:),h);
    y2(i+1,:) = trapstep1(t(i),y1(i, :), y2(i,:),h);
    f1(i, :) = ydot(t(i),y1(i,:), y2(i, :));
    f2(i, :) = ydot1(t(i), y1(i,:), y2(i,:));
end

for i=s:n % multistep method loop
    t(i+1)=t(i)+h;
    f1(i, :) = ydot(t(i),y1(i,:), y2(i, :));
    f2(i, :) = ydot1(t(i), y1(i,:), y2(i,:));-
    y1(i+1,:)=ab2step(t(i),i,y1,f1,h); % predict
    y2(i+1,:)=ab2step(t(i),i,y2,f2,h); % predict
    f1(i+1,:)=ydot(t(i+1),y1(i+1,:), y2(i+1,:));
    f2(i+1,:)=ydot(t(i+1), y2(i+1, :), y2(i+1,:));
    y1(i+1,:)=am1step(t(i),i,y1,f1,h); % correct
    y2(i+1,:)=am1step(t(i),i,y2,f2,h);
end

plot(y1,y2)

function y=trapstep(t,x, y, h)
%one step of the Trapezoid Method from section 6.2
z1=ydot(t,x, y);
g=x+h*z1; 
z2=ydot(t+h,g, y);
y1=x+h*(z1+z2)/2;

function y=trapstep1(t,x, y, h)
%one step of the Trapezoid Method from section 6.2
z1=ydot1(t,x, y);
g = y+h*z1;
z2=ydot1(g,x, t+h);
y1=y+h*(z1+z2)/2;

function z=ab2step(t,i,y1,f1,h)
%one step of the Adams-Bashforth 2-step method
z=y1(i,:)+h*(3*f1(i,:)-f1(i-1,:))/2;

function z=am1step(t,i,y1,f1,h)
%one step of the Adams-Moulton 1-step method
z=y1(i,:)+h*(f1(i+1,:)+f1(i,:))/2;

function prey = f(pred_pop,prey_pop)
a = 0.8; 
b = 0.8; 
prey = a*prey_pop - b*prey_pop*pred_pop;


function pred = g(prey_pop,pred_pop)
c = 0.4; 
d = 1.2; 
pred = c*prey_pop*pred_pop - d*pred_pop;



% Title: Mathematical Model of Lokta-Volterra using Runge Kutta's Method
%
% Author: Pranav Bhandari
%
% Input: 
%   h: the step-size
%   a: prey growth rate
%   b: rate of predation
%   c: rate of transfer of energy
%   d: predator mortality rate
%   initial_prey: the initial population of the prey
%   initial_pred: the initial population of the predator
%
% Output:
%   t: an array containing the time taken for each cycle
%   err: an array contatining the error at each cycle
%   prey_pop: an array containing the prey population at each iteration
%   pred_pop: an array contatining the predator population at each
%             iteration
%

function [time_cycle, err, prey_pop, pred_pop] = rungekutta_lv(h, a,b,c,d,initial_prey, initial_pred, total_time)

% Time-Interval
time = 0:h:total_time;
    
% Number of iterations
iteration = ceil(total_time/h);

% The current cycle
cycle_num = 1;

% The initial conditions
prey_pop(1) = initial_prey;
pred_pop(1) = initial_pred;

% Initializing the array that will contain the error after each cycle
err(1) = 0;

% Initializing the array that will contain the time taken for each cycle
time_cycle(1) = 0;

% Starting the clock to see the time it takes for the first cycle
tic

for i=1:iteration
        
    k1(2) = h*g(prey_pop(i), pred_pop(i));
    k1(1) = h*f(pred_pop(i), prey_pop(i));
    
    k2(2) = h*g(prey_pop(i)+k1(1)/2, pred_pop(i)+k1(2)/2);
    k2(1) = h*f(pred_pop(i)+k1(2)/2, prey_pop(i)+k1(1)/2);
    
    k3(2) = h*g(prey_pop(i)+k1(1)/2, pred_pop(i)+k2(2)/2);
    k3(1) = h*f(pred_pop(i)+k2(2)/2, prey_pop(i)+k2(1)/2);
    
    k4(2) = h*g(prey_pop(i)+k3(1), pred_pop(i)+k3(2));
    k4(1) = h*f(pred_pop(i)+k3(2), prey_pop(i)+k3(1));
    
    pred_pop(i + 1) = pred_pop(i) + (k1(2)+2*k2(2)+2*k3(2)+k4(2))/6;
    prey_pop(i + 1) = prey_pop(i) + (k1(1)+2*k2(1)+2*k3(1)+k4(1))/6;
   
        
    % Checking if a cycle is completed
    if (pred_pop(i)>pred_pop(1) && pred_pop(i+1)<pred_pop(1))
        index(cycle_num) = i+1;
        time_cycle(cycle_num)= toc;
        err(cycle_num) = (prey_pop(i+1) - 1)^2+(pred_pop(i+1) - 1)^2; 
        tic;
        cycle_num = cycle_num + 1;
    end
    
end

function prey = f(y,x)
a = 0.8; 
b = 0.8; 
prey = a*x - b*x*y;
end

function pred = g(x,y)
c = 0.4; 
d = 1.2; 
pred = c*x*y - d*y;
end

% % Ploting the predator population and prey population against time
plotter_population(prey_pop, pred_pop, time);
% 
% % Ploting the predator population against the prey population
plotter_model(prey_pop, pred_pop, index);
% 
% error_plotter(err, total_cycle);

end
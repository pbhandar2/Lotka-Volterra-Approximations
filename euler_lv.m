% Title: Approximation of a mathematical model using Euler's method
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
%   time_cycle: an array containing the time taken for each cycle
%   err: an array contatining the error at each cycle
%   prey_pop: an array containing the prey population at each iteration
%   pred_pop: an array contatining the predator population at each
%             iteration
%

function [time_cycle, err,prey_pop,pred_pop] = euler_lv(h, a, b, c, d, initial_prey, initial_pred, total_time)
   
% Time-Interval
time = 0:h:total_time;
    
% Number of iterations
iteration = ceil(total_time/h);

% The current cycle
cycle_num = 1;

% The initial conditions
prey_pop = zeros(1, iteration+1);
pred_pop = zeros(1, iteration+1);
prey_pop(1) = initial_prey;
pred_pop(1) = initial_pred;

% Starting the clock to see the time it takes for the first cycle
tic

% Performing the iterations
for i = 1:iteration
   
    % Euler's MethodA
    
        output=lv(prey_pop(i),pred(i),a,b,c,d);
        prey_pop(i+1)=prey(i)+h*output(1);
        pred(i+1)=pred(i)+h*output(2);
    
    % Checking if a cycle is completed
    if (pred_pop(i)>pred_pop(1) && pred_pop(i+1)<pred_pop(1))
        x = [pred_pop(i) pred_pop(i+1)];
        y = [prey_pop(i) prey_pop(i+1)];
        yi = LagrangeInter(x,y,1);
        err(cycle_num) = abs(prey_pop(1) - yi);
        time_cycle(cycle_num) = toc;
        index(cycle_num) = i+1;
        cycle_num = cycle_num + 1;
        tic;
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
% % plotter_population(prey_pop, pred_pop, time);
% 
% % Ploting the predator population against the prey population
 plotter_model(prey_pop, pred_pop,index);
% 
% error_plotter(err, total_cycle);
     
    
end
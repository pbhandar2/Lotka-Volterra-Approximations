% Title: Mathematical Model of Lokta-Volterra using Adams-Bashforth's 2-step Method
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

function [time_cycle, err, prey_pop, pred_pop] = adamsBashforth_lv(h, a, b, c, d, initial_prey, initial_pred, total_time)

% The time it takes for a single cycle
period = 7.00152;

% The number of iterations it takes for each cycle
period_steps = floor(period/h) - 1;

% The variable that checks if a cycle has been completed. Resets after each
% cycle.
count = 1;


% Time-Interval
time = 0:h:total_time;
    
% Number of iterations
iteration = ceil(total_time/h);

% The current cycle
cycle_num = 1;

% Number of cycles
total_cycle = floor(iteration/period_steps);

% The initial conditions
prey_pop(1) = initial_prey;
pred_pop(1) = initial_pred;

% Initializing the array that will contain the error after each cycle
err(1) = 0;

% Initializing the array that will contain the time taken for each cycle
time_cycle(1) = 0;

% Calculating the next predator and prey population using trapezoid method
prey_pop(2) = prey_pop(1) + prey_eq(c,d,prey_pop(1), pred_pop(1))*h;
pred_pop(2) = pred_pop(1) + pred_eq(a,b,prey_pop(1), pred_pop(1))*h;
prey_pop(2) = prey_pop(1) + (h/2)* (prey_eq(c,d,prey_pop(1), pred_pop(1)) + prey_eq(c,d,prey_pop(2), pred_pop(2)));
pred_pop(2) = pred_pop(1) + (h/2) * (pred_eq(a,b,prey_pop(1), pred_pop(1)) + pred_eq(a,b,prey_pop(2), pred_pop(2)));


% Starting the clock to see the time it takes for the first cycle
tic

% Starting the clock to see the time it takes for the first cycle
tic

% Performing the iterations
for i = 3:iteration+1
    
    % Adams-Bashforth two-step method
    pred_pop(i) = pred_pop(i-1) + (h/2)*(3*(pred_eq(c,d,pred_pop(i-1), prey_pop(i-1))) - (pred_eq(c,d,pred_pop(i-2), prey_pop(i-2))));
    prey_pop(i) = prey_pop(i-1) + (h/2)*(3*(prey_eq(a,b,pred_pop(i-1), prey_pop(i-1))) - (prey_eq(a,b,pred_pop(i-2), prey_pop(i-2))));
    
    % Checking if a cycle is completed
    if (count == period_steps)    
        index(cycle_num) = i;
        time_cycle(cycle_num)= toc;
        err(cycle_num) = (prey_pop(i) - 1)^2+(pred_pop(i) - 1)^2; 
        count = 0;
        tic;
        cycle_num = cycle_num + 1;
    end

    count = count + 1;
end

% % Ploting the predator population and prey population against time
% plotter_population(prey_pop, pred_pop, time);
% 
% % Ploting the predator population against the prey population
 plotter_model(prey_pop, pred_pop, index);
% 
% error_plotter(err, total_cycle);

end

    
    
   
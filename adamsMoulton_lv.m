% Title: Mathematical Model of Lokta-Volterra using Adams-Moulton's Predictor-Corrector Method
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

function [time_cycle, err, prey_pop, pred_pop] = adamsMoulton_lv(h, a, b, c, d, initial_prey, initial_pred, total_time)

% Time-Interval
time = 0:h:total_time;
    
% Number of iterations
iteration = ceil(total_time/h);

% The current cycle
cycle_num = 1;

% The initial conditions
prey_pop(1) = initial_prey;
pred_pop(1) = initial_pred;

% Calculating the next predator and prey population using trapezoid method
prey_pop(2) = prey_pop(1) + f(a,b,pred_pop(1), prey_pop(1))*h;
pred_pop(2) = pred_pop(1) + g(c,d,prey_pop(1), pred_pop(1))*h;
prey_pop(2) = prey_pop(1) + (h/2)* (g(c,d,prey_pop(1), pred_pop(1)) + g(c,d,prey_pop(2), pred_pop(2)));
pred_pop(2) = pred_pop(1) + (h/2) * (f(a,b,prey_pop(1), pred_pop(1)) + f(a,b,prey_pop(2), pred_pop(2)));


% Starting the clock to see the time it takes for the first cycle
tic

% Performing the iterations
for i = 2:iteration
    pred_temp = pred_pop(i) + (h/2)*(3*(g(c,d,prey_pop(i), pred_pop(i))) - (g(c,d,prey_pop(i-1), pred_pop(i-1))));
    prey_temp = prey_pop(i) + (h/2)*(3*(f(a,b,pred_pop(i), prey_pop(i))) - (f(a,b,pred_pop(i-1), prey_pop(i-1))));
    prey_pop(i + 1) = prey_pop(i) + (h/12) * (5*prey_temp + 8*f(a,b,pred_pop(i), prey_pop(i)) - f(a,b,pred_pop(i-1), prey_pop(i-1)));
    pred_pop(i + 1) = pred_pop(i) + (h/12) * (5*pred_temp + 8*g(c,d,prey_pop(i), pred_pop(i)) - g(c,d,prey_pop(i-1), pred_pop(i-1)));
    
                   
    
    % Checking if a cycle is completed
    if (pred_pop(i)>pred_pop(1) && pred_pop(i+1)<pred_pop(1))
        x = [pred_pop(i) pred_pop(i+1)];
        y = [prey_pop(i) prey_pop(i+1)];
        yi = LagrangeInter(x,y,initial_prey);
        err(cycle_num) = abs(prey_pop(1) - yi);
        time_cycle(cycle_num) = toc;
        index(cycle_num) = i+1;
        cycle_num = cycle_num + 1;
        tic;
    end
end

% % Ploting the predator population and prey population against time
% plotter_population(prey_pop, pred_pop, time);
% 
% % Ploting the predator population against the prey population
plotter_model(prey_pop, pred_pop, index);
% 
% error_plotter(err, total_cycle);

end

    
    
   
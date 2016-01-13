% Master file that runs the methods that approximate Lokta-Voltera
%
% Methods:
%   Euler: master_Lok('euler')
%   Runge-Kutta: master_Lok('runge')
%   Adams-Bashforth Two Step: master_Lok('adams')
%   Modified-Euler: master_Lok('modeuler')
%
% Output: A table containing the time period for 4 iterations and its
%         respective errors.
%

function master_lv(char)


    format long;
    
    % Constants
    a = 0.8; 
    b = 0.8; 
    c = 0.4; 
    d = 1.2;
    
    %total time and period
    total_time = 50;
    period = 7.00152;
    
    % Initial Population
    initial_prey = 1;
    initial_pred = 1;
    
    % Number of different step size we are checking for
    max_cycle = 4;
    h_max = 10^(-max_cycle);
    iteration = ceil(total_time/h_max);
    period_steps = floor(period/h_max) - 1;
    array_size = floor(iteration/period_steps);
    
    % Initializing the array to store error and tiem for each cycle
    t11 = zeros(array_size, max_cycle);
    err11 = zeros(array_size, max_cycle);
    

    % Euler's Method
    if (strcmp(char, 'euler') == 1)  
          
        for i = 1:max_cycle
            h(i) = 10 ^ (-i);
            [t11(:,i), err11(:,i), ~, ~] = euler_lv(h(i), a, b, c, d, initial_prey, initial_pred, total_time);
%             i
%             t11(:,i)
%             err11(:,i)
        end
    end
    
    % Runge-Kutta Method
    if (strcmp(char, 'runge') == 1)
        
        for i = 1:max_cycle
            h(i) = 10 ^ (-i);
            [t11(:,i), err11(:,i), ~, ~] = rungekutta_lv(h(i), a, b, c, d, initial_prey, initial_pred, total_time);
%             i
%             t11(:,i)
%             err11(:,i)
        end
    end
    
    % Adam's Bashforth Method
    if (strcmp(char, 'adams') == 1)
        
        for i = 1:max_cycle
            h(i) = 10 ^ (-i);
            [t11(:,i), err11(:,i), ~, ~] = adamsBashforth_lv(h(i), a, b, c, d, initial_prey, initial_pred, total_time);
        end
    end
    
    % Modified Euler Method
    if (strcmp(char, 'modeuler') == 1)
        h = [0.1; 0.0001; 0.00001; 0.000001];
        for i = 1:max_cycle
            [t11(:,i), err11(i,:), ~, ~] = modeuler_lv(h(i), a, b, c, d, initial_prey, initial_pred, total_time);
            i
            t11(:,i)
            err11(i,:)
        end
    end
    
    
     h = num2cell(h);   
     h
     t11
     err11
%      table(h', t11(1,:)', t11(2,:)', t11(3,:)', t11(4,:)')
     table(h', t11(1,:)',err11(1,:)',t11(2,:)',err11(2,:)', t11(3,:)', err11(3,:)', t11(4,:)', err11(4,:)',...
     'VariableNames', {'stepsize' 'Time1' 'Error1' 'Time2' 'Error2' 'Time3' 'Error3' 'Time4' 'Error4'})

    


    



end
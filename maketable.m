
function [h, total_time] = maketable()

    format long;
    
    % Constants
    a = 0.8; 
    b = 0.8; 
    c = 0.4; 
    d = 1.2;
    x = 0;
    y = 0;
    
    % Initial Population
    initial_prey = 1;
    initial_pred = 1;
    
    % Step-Size
    num_steps = 4;
    max_cycle = 1000;
  
    % Total-Time
    total_time = 7100;
    
    % Time and Error Array
    time_array = zeros(max_cycle, num_steps);
    error_array = zeros(max_cycle, num_steps);
    
    for i = 1:num_steps
        h(i) = (10)^(-i);
        [x, y, prey, pred] = adamsBashforth(h(i), a, b, c, d, initial_prey, initial_pred, total_time);
        time_array(:, i) = x(:, 1:max_cycle);
        error_array(:, i) = y(:, 1:max_cycle);
    end
    
    
    T = table(h', time_array(1,:)',error_array(1,:)',time_array(10,:)',error_array(10,:)', time_array(100,:)', error_array(100,:)', time_array(1000,:)', error_array(1000,:)',...
    'VariableNames', {'stepsize' 'Time1' 'Error1' 'Time2' 'Error2' 'Time3' 'Error3' 'Time4' 'Error4'});

    
    for i = 1:4
        display([num2str(h(i)) '&' num2str(time_array(1,i)) '&' num2str(error_array(1,i))])
        display([num2str(h(i)) '&' num2str(time_array(10,i)) '&' num2str(error_array(10,i))])
        display([num2str(h(i)) '&' num2str(time_array(100,i)) '&' num2str(error_array(100,i))])
        display([num2str(h(i)) '&' num2str(time_array(1000,i)) '&' num2str(error_array(1000,i))])
    end
    
    
    
   


end
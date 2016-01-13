function ode_caller
    
    num_values = 4;
    max_cycle = 1000;
    a = 0.8;
    b = 0.8;
    c = 0.4;
    d = 1.2;
    error_array = zeros(max_cycle, num_values);
    time = zeros(1,num_values);
    
    
    for i = 1:num_values
        tol(i) = 10^(-(i+2));     
    end
    
    [err time(1) prey1 pred1] = ode45_lv(a,b,c,d,tol(1));
    error_array(:, 1) = err(:, 1:max_cycle);
    [err time(2) prey2 pred2] = ode45_lv(a,b,c,d,tol(2));
    error_array(:, 2) = err(:, 1:max_cycle);
    [err time(3) prey3 pred3] = ode45_lv(a,b,c,d,tol(3));
    error_array(:, 3) = err(:, 1:max_cycle);
    [err time(4) prey4 pred4] = ode45_lv(a,b,c,d,tol(4));
    error_array(:, 4) = err(:, 1:max_cycle);
    
    for i = 1:num_values
            
        display('\hline');
        display([num2str(tol(i)) ' & ' num2str(error_array(1,i)) ' & ' num2str(error_array(10,i)) ' & ' num2str(error_array(100,i)) ' & ' num2str(error_array(1000,i)) '&' num2str(time(i))]);

        
        
    end

    
    
    subplot(2,2,1);
    plot(prey1, pred1);
    hold on;
    xlabel('prey');
    ylabel('pred');
    title(' tol = 1e-3 ' );
    subplot(2,2,2);
    plot(prey2, pred2);
    xlabel('prey');
    ylabel('pred');
    title(' tol = 1e-4 ');
    subplot(2,2,3);
    plot(prey3, pred3);
    xlabel('prey');
    ylabel('pred');
    title(' tol = 1e-4 ');
    subplot(2,2,4);
    plot(prey4, pred4);
    xlabel('prey');
    ylabel('pred');
    title(' tol = 1e-5 ' );

    
end
% Purpose: Plots the predator population against prey population to see the
% cyclic behavior of Lokta-Volterra
%
% Input:
%   prey_pop: the population of prey
%   pred_pop: the population of predator
%
% Output:
%   A graph with predator and prey population against time
%

function plotter_model(prey_pop, pred_pop, index)
    figure()
    plot(prey_pop(1), pred_pop(1), 'gx');
    hold on
    for i = 1:length(index)
        plot(prey_pop(index(i)), pred_pop(index(i)), 'rx');
    end
%     plot(prey_pop(1),pred_pop(1),'rx')
%     plot(prey_pop(index(1)),pred_pop(index(1)),'rx')
%     plot(prey_pop(index(2)),pred_pop(index(2)),'rx')
    % plot 'x' at the end of every cycle
    hold on;
    plot(prey_pop, pred_pop, '--k');
    xlabel('prey population');
    ylabel('predator population');
    title('System Dynamics of Lokta-Volterra');
end
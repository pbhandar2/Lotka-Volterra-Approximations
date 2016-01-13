% Purpose: Plots the predator population and prey population against time
%          in a graph
%
% Input:
%   prey_pop: the population of prey
%   pred_pop: the population of predator
%   time: the array with time-intervals
%
% Output:
%   A graph with predator and prey population against time
%

function plotter_population(prey_pop, pred_pop, time)
    figure()
    plot(time, prey_pop, '-r', time, pred_pop, '-g');
    title('Population of prey and predator against time');
    legend('Prey', 'Predator');
    xlabel('Time');
    ylabel('Population of prey and predator');
end
function [error t] = error_calculator(prey_pop, pred_pop, time)

error = (prey_pop - 1)^2+(pred_pop - 1)^2; 
t = time;


end
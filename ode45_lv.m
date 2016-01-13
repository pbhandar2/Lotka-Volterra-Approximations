function [err time prey_pop pred_pop] = ode45_lv(a, b, c, d, toler)
%your name, your student number, lesson number

to = 0;
tf = 790;
yo = [1 1];
tic;
cycle_num = 1;

options = odeset('RelTol',toler,'AbsTol',[toler, toler]);
[t y] = ode45('yprf',[to tf],yo, options, a,b,c,d);
time = toc;
prey_pop = y(:,1);
pred_pop = y(:,2);
length(prey_pop);
for i = 1:length(prey_pop) - 1
        % Checking if a cycle is completed
    if (pred_pop(i)<pred_pop(1) && pred_pop(i+1)>pred_pop(1))
        x = [pred_pop(i) pred_pop(i+1)];
        y = [prey_pop(i) prey_pop(i+1)];
        yi = LagrangeInter(x,y,yo(1));
        err(cycle_num) = abs(prey_pop(1) - yi);
        index(cycle_num) = i+1;
        cycle_num = cycle_num + 1;
    end
end
% plot(prey_pop, pred_pop);

plotter_model(prey_pop, pred_pop, index);
%length(err)
time

end

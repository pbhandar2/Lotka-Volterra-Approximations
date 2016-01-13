function error_plotter(err, cycle)
    t = 1:1:cycle;
    figure();
    
    plot(t, err);
    title('Error vs Cycle');
    xlabel('Number of Cycles');
    ylabel('Error');
    figure();
    
    semilogx(t,err);
    title('SemiLog: Error vs Cycle');
    xlabel('Number of Cycles');
    ylabel('Error');
    
    figure();
    loglog(t,err);
    title('Log: Error vs Cycle');
    xlabel('Number of Cycles');
    ylabel('Error');
    
    
end
# Lotka-Volterra-Approximations

The research is about analysis of numerical methods used for approximating equations that model a prey-predator ecosystem under different conditions. We approximate the Lotka-Volterra equations using various numerical methods: Euler, Runge-Kutta, Adams-Bashforth, Adams-Moulton, ODE-45 and Modified-Euler. The goal is to find the most efficient numerical method to approximate the Lotka-Volterra under different conditions. We use three different version of Lotka-Volterra equation each stiffer than the other. All the methods are run on these different equations. Each method requires parameters: the initial population of prey and predator, number of loops to run and the step-size. The step-size determines the intervals at which the equations will be approximated. We use all the methods to approximate the Lotka-Volterra with unique step-sizes for each method such that the running time and number of cycles completed are the same for each method. We do this in order to compare the error of each method. Our results show that modified-euler is consistently good among problems of all sizes while Runge-Kutta and Adams-Bashforth gets worse as the equations get stiffer.  

Each numerical methods has its own file. The instructions to use the file is provided in the file. Please be sure to downlaod all the files in order to try the code. However, if you wish to see the ocde for particular methods here are the file names:

Euler: euler_lv.m  
Runge: rungekutta_lv.m  
Adams-Bashforth: adamsBashforth_lv.m  
Adams-Moulton: adamsMoulton_lv.m  
ODE-45: ode45_lv.m  
Modified-Euler: modeuler_lv.m  



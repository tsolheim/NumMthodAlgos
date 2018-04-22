function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%Coding developed by Turner Solheim on 2/17/18 for Mech 105
%Uses the False Position Method to find the root location zeros of a given
%function
%Must describe a function as f = @(x)"function" in command window
%Then write falsePosition(f,lower bound, upper bound)
%You can change the es or maxiter or default them by leaving them out
%Type: falsePosition(func,xl,xu,es,maxiter)
%INPUTS
%  func    = name of the function
%  xl      = lower guess of function
%  xu      = upper guess of function
%  es      = desired relative error (will default to 0.0001%)
%  maxiter = maximum iterations (will default to 200)
%OUTPUTS
%  root    = the estimated root location
%  fx      = the function value at the root
%  ea      = the approximate relative error (in %)
%  iter    = the number of iterations preformed

%FORMAT
format long

%VARIABLES
iter = 0;                       %Sets starting iterations to zero
ea = 100;                       %Sets current error to 100%
fl=feval(func,xl);              %function with xl in place of x
fu=feval(func,xu);              %function with xu in place of x
xr = xl;                        %Starts off the iterations with the first root guess being the lower x input

%NARGIN STATEMENTS
if nargin < 3 || nargin > 5
    error('Need at 3 to 5 inputs');%Error if have under 3 or over 5 inputs
end
if nargin < 4 || isempty(es)
    es = 0.0001;                %Desired Relative Error default to 0.0001%
end
if nargin < 5 || isempty(maxiter)
    maxiter = 200;              %Maximum Iterations default to 200
end

%TEST CREATION
test = fl*fu;             %multiplies the lover and upper guess functions
if test > 0               %If positive, no sign change over the interval
    disp('No Sign Change Over Interval');
end

%ITERATIONS
while(1)                            %While (True)
    xo = xr;                          %old x is x root
    xr = xu-((fu*(xl-xu))/(fl-fu));   %False position Function
    iter = iter + 1;                  %add 1 to iteration count
    ea = abs((xr-xo)/xr)*100;         %Calculate error with values
    test = fl*func(xr);               %Calculate new function with new xr
    if test < 0                       
        xu = xr;   %Set xr to x upper if functions multiplied are negative
    elseif test > 0
        xl = xr;   %Set xr to x lower if functions multiplied are positive
    end
    if ea <= es || iter >= maxiter    %If reach desired error or maximum iterations
        break                         %Stop the while loop
    end
end

%GET ROOT AND FX VALUES
root = xr;                  %Set the root value to the last xr
fx = func(xr);              %Find the value of function at last xr (should be close to zero)

%DISPLAY
if test > 0
    formatSpec_root = 'The Root is %f\n';
    fprintf(formatSpec_root,root)
    formatSpec_fx = 'The Value of the Function at %f is %f\n';
    fprintf(formatSpec_fx,root,fx)
    formatSpec_ea = 'Approximate Relative Error = %f precent \n';
    fprintf(formatSpec_ea,ea)    
    formatSpec_iter = 'Iterations used = %.0f\n';
    fprintf(formatSpec_iter,iter)  
elseif test < 0
    fprintf('The equation did not corrpond with the False Position Method, see "help falsePosition" for details');
end
end

%TESTING PURPOSES ONLY
%Type... f = @(x)(((0.55*25*9.81)/(cosd(x)+(0.55*sind(x))))-150) ...into
%command window
%Type... falsePosition(f,0,90) ...into command window afterwards
%Looking for 66.85 roughly for test
%We get 66.81759,so very close to the expected value
function [I] = Simpson(x,y)
%The Simpson function inputs a table of x  and y values that are evenly
%spaced between each other and gives out the approximation of the summation
%of its points given a combination of Simspon's 1/3rd rule and the
%Trapezoidal Rule if necessary.
%DEFINITIONS
%x --> List of x values on table (should be in increasing order)
%y --> List of y values on table (should correlate to respective x values)

%---------------DEFINITIONS----------------------------------------------%
n = length(x);              %n = # of x data points
m = length(y);              %m = # of y data points

int = n-1;                  %int = # of intervals

I1 = 0;                     %Interval 1 - For even x intervals
I2 = 0;                     %Interval 2 - For odd x intervals
TrapArea = 0;               %Tapezoidal - For if total intervals are odd, add the last interval with trap rule

a = x(1);                   %First x value
b = x(n);                   %Last x value

trap = 0;                   %Value of if using trap rule is true or not

%---------------CHECKS AND WARNINGS--------------------------------------%
%Check if there are an odd number of intervals
if mod(n,2) == 0            %If # of points are even = # of intervals are odd
    trap = 1;               %Set the trap useage to true
    warning('The Trapezoidal Rule will be used for the last interval'); %Warn user of needing to use trap rule
end

%Check if the inputs are the same length
if n ~=m                    %If # of x points does not equal # of y points
    error('The number of inputs in x does not equal the number of inputs in y');    %Display error that inputs do not equal
end

%Check if the inputs are equally spaced
space = diff(x);            %Create matrix of differences between x values
if sum(space) ~= space(1)*length(space) %If sum does not equal the length times the first value
    error('Values of x are not equally spaced apart');  %Display error that values are not equally spaced for x
end

%---------------SIMPSON'S 1/3RD RULE-------------------------------------%
%Even Interval
for i = 2:2:int                         %If the x interval is even
    I1 = I1 + 4*y(i);                   %Add the even y values times 4
end

%Odd Interval
for i = 3:2:int-1                       %If the x interval is odd
    I2 = I2 + 2*y(i);                   %Add all other odd y values times 2
end

%---------------TRAPEZOIDAL RULE-----------------------------------------%
if trap == 1                            %If at end and trap rule applies
    TrapArea = ((x(n)-x(n-1))*(y(n)+y(n-1)))/2;  %Run the trap rule for the last part
end

%---------------FINAL INTEGRAL SUM---------------------------------------%
I = ((b-a)*(y(1)+I1+I2+y(n-1)))/(3*(n-1)) + TrapArea;   %Somposite Simpson's Rule with Trap Rule added at the end if necessary

end
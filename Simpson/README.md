# Simpson's Algorithm

## Definition
Simpson's Algorithm takes an input of x and y values that are evenly spaced apart along the x values.  

The MatLab function takes these values and utilizes a combination of a repetative Simpson's Composite Rule and Trapezoidal Rule in order to estimate the integral of the function.

The Trapezoidal Rule is only utilized if there are an odd number of intervals.

## Code

function [I] = Simpson(x,y)

## Inputs
Simpson(x,y)
* x = [*list of x values with commas between*]
* y = [*list of y values with commas between*]

## Outputs
* I = Estimated integral or the amount the y values ave changed over the span of the x values

## Limitations
X values must be evenly spaced.

Does not correlate to 3 dimensions.

Is only an estimate of Analytical Integration.

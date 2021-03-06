# False Position Function

## Definition

The False Position function takes in a function, a set of parameters, a desired relative error, and a maximum set of iterations in order to estimate the root of a function.

The function is able to find the estimated root location, the function value at said location, the approximate error between the value and zero, and the number of iterations it took to reach said value.

## Code

function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)

## Inputs
falsePosition(func,xl,xu,es,maxiter)
* func    = name of the function
* xl      = lower guess of function
* xu      = upper guess of function
* es      = desired relative error (will default to 0.0001%)
* maxiter = maximum iterations (will default to 200)

## Outputs
* root    = the estimated root location
* fx      = the function value at the root
* ea      = the approximate relative error (in %)
* iter    = the number of iterations preformed

## Limitations
The function must be described before in the command window by typing func = @(x) "*type function here*".

Necessary iterations may exceed reasonable MatLab capabilities.

Is only an estimate of analytical root finding methods.

# LU Factorization Function

## Definition
The LU Factorization Matrix takes in a square matrix of any size and returns the lower, upper, and pivot matrix created during the LU Factorization process.

This process includes partial pivoting.

The code also displays wether the numbers have a noticabe roundoff error (i.e. off to within 4 decimal places).

## Code
function [L,U,P] = luFactor(A)

## Inputs
luFactor(A)
* A = The square matrix to be entered (also called the coefficient matrix)

## Outputs
* L = The Lower Triangular Matrix of A
* U = The Upper Triangular Matrix of A
* P = The Pivot Matrix of A

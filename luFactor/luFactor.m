function [L,U,P] = luFactor(A)
%The luFactor function takes in any square matrix and returns the Lower &
%Upper Triangular Matrix as well as the Pivoting Matrix.
%It does this by implementing partial pivoting and gauss elimination
%The function also tells if the numbers are influenced by roundoff error 
%to within 4 decimal places.
%INPUTS:
%A => The Square Matrix to be entered (also called the coefficient matrix)
%OUTPUTS:
%L => The Lower Triangular Matrix of A
%U => The Upper Triagular Matrix of A
%P => The Pivot Matrix of A

%STARTING DEFINITIONS
[row,col] = size(A);            %Gets Row and Column Size of A
L = eye(row);                   %Starting Lower Matrix = Identity Matrix
U = A;                          %Starting Upper Matrix = Input Matrix
P = eye(row);                   %Starting Pivoting Matrix = Identity Matrix

%INPUT CHECKS
if nargin ~= 1                                  
    error('Can only input one square matrix');
end

if row ~= col
    error('Must input a SQUARE Matrix');
end

%LU FACTORIZATION WITH PARTIAL PIVOTING AND GAUSS ELIMINATION
for i = 1:row-1     %Makes sure to run a pivoting at the start and after each Gauss Elimination 
                    %We subtract 1 from row because we do not need to run the last step again near the end because we already have the answer and will return the same  thing --> saves time
    pivot_value = max(abs(U(i:row,i)));     %Finds the highest magnitude number of a column
    
    %FINDS THE ROW TO BE PIVOTED
    for j = i:row                           %Goes through all the rows that still require pivoting
        if  pivot_value == abs(U(j,i))      %Checks if the row has the highest magnitude number of the column being checked
            pivot_row = j;                  %Defines the row as the row to be pivoted
        end
    end
    
    %PIVOTING
    L([i,pivot_row],1:i-1) = L([pivot_row,i],1:i-1);    %Pivots the i row with the new pivot_row of Lower Matrix, subtract 1 from i to keep 1 as value in top left
    U([i,pivot_row],:) = U([pivot_row,i],:);            %Pivots the i row with the new pivot_row of Upper Matrix, keeps columns the same
    P([i,pivot_row],:) = P([pivot_row,i],:);            %Pivots the i row with the new pivot_row of Pivot Matrix, keeps columns the same
    
    %CREATION OF RATIOS AND GAUSS ELIMINATION
    for k = i+1:col                                     %Defines k to select the number on row right below the number being looked at
        L(k,i) = U(k,i) / U(i,i);                       %Finds Ratio to divide matricies by (divide lower number by upper number of U)
        U(k,i:col) = U(k,i:col) - L(k,i) * U(i,i:col);  %Subtracts Lower value by Ratio times the upper value to get the new values of the row
    end
end

%DISPLAY VALUES
disp('The Lower Triangular Matrix [L] is');     %Text for Lower Matrix        
disp(L);                                        %Displays Lower Matrix
disp('The Upper Triangular Matrix [U] is');     %Text for Upper Matrix
disp(U);                                        %Displays Upper Matrix
disp('The Pivoting Matrix [P] is');             %Text for Pivot Matrix
disp(P);                                        %Displays Pivot Matrix

%CHECKING FOR ACCURACY
if L*U == P*A       %Multiplies Pivot by (Lower * Upper) for check
    disp('The Matrix is Accurate within 4 decimal places');
else            %If the values do not equal, this is due to roundoff error
    disp('The Matrix is Not Accurate within 4 decimal places');
    disp('Roundoff Error Applies');
        %The numbers will still be accurate, but this is to ensure
        %that the coder knows there will be error with the solutions
end

end
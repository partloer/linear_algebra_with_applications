%{
Use MATLAB to generate random 4 x 4 matrices A and B. For each of the 
following compute A1, A2, A3, A4 as indicated and determine which of the 
matrices are equal. You can use MATLAB to test whether two matrices are 
equal by computing their difference.  
%}

% Using the following randi() command MATLAB generated the following
% matrices.
% A = randi([0 10], 4, 4);
% B = randi([0 10], 4, 4);
A = [2 2 9 9; 8 2 6 6; 4 1 6 3; 10 1 1 5];
B = [4 2 9 3; 0 2 10 9; 2 4 5 4; 1 0 5 1];
display(A);
display(B);

% (a)
A1 = A * B;
display(A1);
A2 = B * A;
display(A2);
A3 = (A' * B')';
display(A3);
A4 = (B' * A')';
display(A4)

% (b)
A1 = A' * B';
display(A1);
A2 = (A * B)';
display(A2);
A3 = B' * A';
display(A3);
A4 = (B * A)';
display(A4);

% (c)
A1 = inv(A * B);
display(A1);
A2 = (A * B)';
display(A2);
A3 = inv(B * A);
display(A3)
A4 = inv(B) * inv(A);
display(A4);

% (d)
A1 = inv(A * B);
display(A1);
A2 = inv(A' * B');
display(A2);
A3 = inv(A') * inv(B');
display(A3);
A4 = (inv(A) * inv(B))';
display(A4);
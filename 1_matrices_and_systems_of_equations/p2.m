% Set n = 200 and generate an n x n matrix and two vectors in R^n, both
% having integer entries, by setting
n1 = 200;
A1 = floor(10 * rand(n1)); 
b1 = sum(A1')'; 
z1 = ones(n1, 1);
% (Since the matrix and vectors are large, we use semicolons to suppress the
% printout.)

% (a) The exact solution to the system Ax = b should be the vector z. Why?
% Explain. One could compute the solution in MATLAB using the "\" operation
% or by computing A^-1 and then multiply A^-1 times b. Let us compare these
% two comutational methods for both speed and accuracy. We will use
% MATLAB's tic and toc commands to measure the elapsed time for each
% comutation. Do this using the following commands:
tic
x1 = A1*exp(-1)*b1;
toc

tic
y1 = inv(A1)*b1;
toc

% Which method is faster?
% To compare the accuracy of the two methods we can measure how close the
% computed solutions x and y are to the exact solution z. Do this using the
% commands
max(abs(x1 - y1))
max(abs(y1 - z1))

% Which method produces the most accurate solution?
% (b) Repeat part (a) using n = 500 and n = 1000.
n2 = 500;
A2 = floor(10 * rand(n2)); 
b2 = sum(A2')'; 
z2 = ones(n2, 1);

tic
x2 = A2*exp(-1)*b2;
toc

tic
y2 = inv(A2)*b2;
toc

% n = 1000
n3 = 1000;
A3 = floor(10 * rand(n3)); 
b3 = sum(A3')'; 
z3 = ones(n3, 1);

tic
x3 = A3*exp(-1)*b3;
toc

tic
y3 = inv(A3)*b3;
toc

# MATLAB EXERCISES #
## Visualizing Eigenvalues ##
MATLAB has a utility for visualizing the actions of linear operations that map the plane unto itself. The utility is invoked using the command eigshow. This command opens a figure window that shows a unit vector x and also Ax, the image of x under A. The matrix A can be specified as an input argument of the eigshow command or selected from the menu at the top of the figure window. To see the effect of the operator A on other unit vectors, point your mouse to the tip of the vector x and use it to drag the vector x around the unit circle in a counterclockwise direction. As x moves you will see how its image Ax changes. In this exercise we will use the eigshow utility to investigate the Eigenvalues and Eigenvectors of the matrices in the eigshow menu.

1. The top matrix on the menu is the diagonal matrix

A = [5/4 0, 0 3/4]

Initially, when you select this matrix, the vector x and Ax should both be aligned along the positive x axis. What information about an eigenvalue-eigenvector pair is apparent from the initial figure positions? Explain. Rotate x counterclockwise until x and Ax are parallel, that is, until they both lie along the same line through the origin. What can you conclude about the second eigenvalue-eigenvector pair? Repeat this experiment with the second matrix. How can you determine the Eigenvalues and Eigenvectors of a 2 x 2 diagonal matrix by inspection without doing any computations? Does this also work for 3 x 3 diagonal matrices? Explain.

2. The third matrix on the menu is just the identity matrix I. How do x and Ix compare geometrically as you rotate x around the unit circle? What can you conclude about the Eigenvalues and Eigenvectors in this case?

3. The fourth matrix has 0's on the diagonal and 1's in the off-diagonal positions. Rotate the vector x around the unit circle and note when x and Ax are parallel. Based on these observations, determine the Eigenvalues and the corresponding unit Eigenvectors. Check your answers by multiplying the matrix times the Eigenvectors to verify that Ax = deltax.

4. The next matrix in the eigshow menu looks the same as the previous except the (2, 1) entry has been changed to -1. Rotate the vector x completely around the unit circle. Are x and Ax ever parallel? Does A have any real Eigenvectors? What can you conclude about the nature of the Eigenvalues and Eigenvectors of this matrix?

5. investigate the next three matrices on the menu (the sixth, seventh, and eighth). In each case, try to estimate geometrically the Eigenvalues consistent with the trace of the matrix. Use MATLAB to compute the Eigenvectors of the sixth matrix by setting

[X, D] = eig([0.25, 0.75; 1, 0.50])

The column vectors of X are the Eigenvectors of the matrix and the diagonal entries of D are the Eigenvalues. Check the Eigenvalues and Eigenvectors of the other two matrices in the same way.

6. Investigate the ninth matrix on the menu. What can you conclude about the nature of its Eigenvalues and Eigenvectors? Check your conclusions by computing the Eigenvalues and Eigenvectors using the eig command.

7. Investigate the next three matrices on the menu. You should note that for the last two of these matrices the two Eigenvalues are equal. For each matrix, how are the Eigenvectors related? Use MATLAB to compute the Eigenvalues and Eigenvectors of these matrices.

8. The last item on the eigshow menu will generate a random 2 x 2 matrix each time that it is invoked. Try using the random matrix 10 times and in each case determine whether the Eigenvalues are real. What percentage of the 10 random matrices had real Eigenvalues? What is the likelihood that two real Eigenvalues of a random matrix will turn out to be exactly equal? Explain.

## Critical Loads for a Beam ##
9. Consider the application relating to critical loads for a beam from Section 1. For simplicity, we will assume that the beam has length 1 and that its flexural rigidity is also 1. Following the method described in the application, if the interval [0, 1] is partitioned into n subintervals; then the problem can be translated into a matrix equation Ay = deltay. The critical load for the beam can be approximated by setting P = sn^2, where s is the smallest Eigenvalue of A. For n = 100, 200, 400, form the coefficient matrix by setting
```
A = 2 * eye(n) - diag(ones(n - 1, 1), 1) - diag(ones(n - 1, 1), -1)
```
In each case, determine the smallest Eigenvalue of A by setting
```
s = min(eig(A))
```
and then compute the corresponding approximation to the critical load.

## Diagonalizable and Defective Matrices ##
10. Construct a symmetric matrix A by setting  
```
A = round(5 * rand(6)); A = A + A^T
```
Compute Eigenvalues of A by setting e = eig(A).  
(a) The trace of A can be computed using the MATLAB command trace(A), and the sum of the Eigenvalues of A can be computed using the command sum(e). Compute both of these quantities and compare the results. Use the command prod(e) to compute the product of the Eigenvalues of A and compute the result to det(A).  
(b) Compute the Eigenvectors of A by setting [X, D] = eig(A). Use MATLAB to compute X^(-1)AX and compare the result to D. Compute also A^-1 and XD^(-1)X^(-1) and compare the results.  

11. Set
```
A = ones(10) + eye(10)
```
(a) What is the rank of A - I? Why must &lambda; = 1 be en Eigenvalue of multiplicity 9? Compute the trace of A using MATLAB function trace. The remaining Eigenvalue &lambda;<sub>10</sub> must equal 11. Why? Explain. Compute the Eigenvalue of A by setting e = eig(A). Examine the Eigenvalues using format long. How many digits of accuracy are there in the computed Eigenvalues?
(b) The MATLAB routine for computing Eigenvalues is based on the QR algorithm described in Section 6 of Chapter 7. We can also compute the Eigenvalues of A by computing the roots of its characteristic polynomial of A, set p = poly(A). The characteristic polynomial of A should have integer coefficients. Why? Explain. If we set p = round(p), we should end up with the exact coefficients of the characteristic polynomial of A. Compute the roots of p by setting
```
r = roots(p)
```
and display the results using format long. How many digits of accuracy are there in the computed results? Which method of computing Eigenvalues is more accurate, using the eig function or computing the roots of the characteristic polynomial?

12. Consider the matrices
```
A = [5 -3, 3, -5] and B = [5 -3, 3, 5]
```
Note that the two matrices are the same except for the (2, 2) entries.
(a) Use MATLAB to compute the Eigenvalues of A and B. Do they have the same type of Eigenvalues? The Eigenvalues of the matrices are the root of their characteristic polynomials. Use the following MATLAB commands to form the polynomials and plot their graphs on the same axis system
```
p = poly(A); q = poly(B);
x = -8 : 0.1 : 8; z = zeros(size(x));
y = polyval(p, x); w = polyval(q, x);
plot(x, y, x, w, x, z) hold on
```
The hold on command is used so that subsequent plots in part (b) will be added to the current figure. How can you use the graph to estimate the Eigenvalues of A? What does the graph tell you about the Eigenvalues of B? Explain.
(b) To see how the Eigenvalues change as the (2, 2) entry changes, let us construct a matrix C with a variable (2, 2) entry. Set
```
t = sym('t') C = [5, -3; 3, t-5]
```
As t goes from 0 to 10, the (2, 2) entries of these matrices go from -5 to 5. Use the following MATLAB commands to plot the graphs of the characteristic polynomials for the intermediate matrices corresponding to t = 1, 2,...,9.
```
p = poly(C)
for j = 1:9
  s = subs(p, t, j);
  ezplots(s, [-10, 10])
  axis([-10, 10, -20, 220])
  pause(2)
end
```
Which of these intermediate matrices have real Eigenvalues and which have complex Eigenvalues? The characteristic polynomial of the symbolic matrix C is a quadratic polynomial whose coefficients are functions of t. To find exactly where the Eigenvalues change from real to complex, write the discriminant of the quadratic as a function of t and then find its roots. One root should be in the interval (0, 10). Plug the values of t back into the matrix C and determine the Eigenvalues of the matrix. Explain how these results correspond to your graph. Solve for the Eigenvalues by hand. Is the matrix diagonalizable?

13. Set
```
B = toeplitz(0 : -1 : -3, 0 : 3)
```
The matrix B is not symmetric and hence it is not guaranteed to be diagonalizable. Use MATLAB to verify that the rank of B equals 2. Explain why 0 must be an Eigenvalue of B and the corresponding Eigenspace must have dimension 2. Set [X, D] = eig(B). Compute X<sup>-1</sup>BX and compare the result to D. Compute also XD<sup>5</sup>X<sup>-1</sup> and compare the result to B<sup>5</sup>.

14. Set
```
C = triu(ones(4), 1) + diag([1, -1], -2)
[X, D] = eig(c)
```
Compute X<sup>-1</sup>CX and compare the result of D. Is C diagonalizable? Compute the rank of X and the condition number of X. If the condition number of X is large, the computed values for the Eigenvalues may not be accurate. Compute the reduced row echelon form of C. Explain why 0 must be an Eigenvalue of C and the corresponding Eigenspace must have dimension 1 Use MATLAB to compute C<sup>4</sup>. It should equal the zero matrix. Given that C<sup>4</sup> = O, what can you conclude about the actual values of the other three Eigenvalues of C? Explain. Is C defective? Explain.

15. Construct a defective matrix by setting
```
A = ones(6); A = A - tril(A) - triu(A, 2)
```
It is easily seen that &lambda; = 0 is the only Eigenvalue of A and its Eigenspace is spanned by e<sub>1</sub>. Verify this by using MATLAB to compute the Eigenvalues and Eigenvectors of A. Examine the Eigenvectors using format long. Are the computed Eigenvectors multiples of e<sub>1</sub>? Now perform a similarity transformation on A. Set
```
Q = orth(rand(6)); and B = Q' * A * Q
```
If the computations had been done in exact arithmetic, the matrix B would be similar to A and hence defective. Use MATLAB to compute the Eigenvalues of B and a matrix X consisting of the Eigenvectors of B. Determine the rank of X. Is the computed matrix B defective? Because of roundoff error, a more reasonable question to ask is whether the computed matrix B is close to being defective (i.e., are the column vectors of X close to being linearly dependent?). To answer this, use MATLAB to compute rcond(X), the reciprocal of the condition number of X. A value of rcond close to zero indicates that X is nearly rank deficient.

16. Generate a matrix A by setting
```
B = [-1, -1; 1, 1], A = [zeros(2), eye(2); eye(2), B]
```
(a) The matrix A should have Eigenvalues &lambda;<sub>1</sub> and &lambda;<sub>2</sub> = -1. Use MATLAB to verify this by computing the reduced row echelon forms of A - I and A + I. What are the dimensions of the Eigenspace of &lambda;<sub>1</sub> and &lambda;<sub>2</sub>?
(b) It is easily seen that trace(A) = 0 and det(A) = 1. Verify these results using MATLAB. Use the values of the trace and determinant to prove that 1 and -1 are actually both double Eigenvalues. Is A defective? Explain.
(c) Set e = eig(A) and examine the Eigenvalues using format long. How many digits of accuracy are there in the computed Eigenvalues? Set [X, D] = eig(A) and compute the condition number of X. The log of the condition number gives an estimate of how many digits of accuracy are lost in the computation of the Eigenvalues of A.
(d) Compute the rank of X. Are the computed Eigenvectors linearly independent? Use MATLAB to compute X<sup>-1</sup>AX. Does the computed matrix X diagonalize A?

## Application: Sex-Linked Genes ##
17. 

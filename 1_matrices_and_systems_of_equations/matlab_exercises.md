# MATLAB EXERCISES #
The following exercises are to be solved computationally using the software package MATLAB, which  is described in the appendix of this book. The exercises also contain questions that should be answered relating to the underlying mathematical principles illustrated in the computations. Save a record of your session in a file. After editing and printing out the file, the answers to the questions can then be filled in directly on the print out.  
MATLAB has a help facility that explains all its operations and commands. For example, to obtain information on the MATLAB command rand, you need only type: help rand. The commands used for the MATLAB exercises for this chapter are inv, floor, rand, tic, toc, rref, abs, max, round, sum, eye, triu, ones, zeros, and magic. The operations introduced are +, -, \*\, \'\, /. The + and - represent the usual addition and subtraction operations for both scalars and matrices. The * corresponds to multiplication of either scalars, or matrices. For matrices whose entries are all real numbers and ' operation corresponds to the transpose operation. If A is a nonsingular n x n matrix and B is any n x r matrix, the operation A/B is equivalent to computing A<sup>-1</sup>B.  

1. Use MATLAB to generate random 4 x 4 matrices A and B. For each of the following compute A1, A2, A3, A4 as indicated and determine which of the matrices are equal. You can use MATLAB to test whether two matrices are equal by computing their difference.  
  (a) A1 = A * B, A2 = B * A, A3 = (A' * B')', A4 = (B' * A')'  
  (b) A1 = A' * B', A2 = (A * B)', A3 = B' * A', A4 = (B * A)'  
  (c) A1 = inv(A * B), A2 = inv(A) * inv(B), A3 = inv(B * A), A4 = inv(B) * inv(A)  
  (d) A1 = inv((A * B)'), A2 = inv(A' * B'), A3 = inv(A') * inv(B'), A4 = (inv(A) * inv(B))'  

2. Set n = 200 and generate an n x n matrix and two vectors in R<sup>n</sup>, both having integer entries, by setting  
```
A = floor(10 * rand(n)); b = sum(A')'; z = ones(n, 1)  
```
(Since the matrix and vectors are large, we use semicolons to suppress the printout.)  
  (a) The exact solution to the system Ax = b should be the vector z. Why? Explain. One could compute the solution in MATLAB using the * operation or by computing A<sup>-1</sup> and then multiply A<sup>-1</sup> times b. Let us compare these two computational methods for both speed and accuracy. We will use MATLAB's tic and toc commands to measure the elapsed time for each computation. Do this using the following commands:  
```
tic, x = A/b; toc  
tic, y = inv(A) * b; toc  
```
Which method is faster?  
To compare the accuracy of the two methods we can measure how close the computed solutions x and y are to the exact solution z. Do this using the commands:  
```
max(abs(x - z))
max(abs(y - z))
```
Which method produces the most accurate solution?  
  (b) Repeat part (a) using n = 500 and n = 1000.  

3. Set A = floor(10 * rand(6)). By construction, the matrix A will have integer entries. Let us change the sixth column of A so as to make the matrix singular. Set  
```
B = A', A(:,6) = -sum(B(1:5,:))'
```
  (a) Set x = ones(6, 1) and use MATLAB to computer Ax. Why do we know that A must be singular? Explain. Check that A is singular by computing its reduced row echelon form.  
  (b) Set
```  
B = x * [1:6]
```  
The product AB should equal the zero matrix. Why explain. Verify that this is so by computing AB using the MATLAB operation \*\.  
  (c) Set
```
C = floor(10 * rand(6)) and D = B + C  
```
Although C != D, the products AC and AD should be equal. Why? Explain. Compute A * C and A * D and verify that they are indeed equal.  

4. Construct a matrix as follows. Set  
```
B = eye(10) - triu(ones(10), 1)  
```
Why do we know that B must be nonsingular? Set  
```
C = inv(B) and x = C(:, 10)  
```
Now change B slightly by setting B(10, 1) = -1/256. Use MATLAB to compute the product Bx. From the result of this computation, what can you conclude about the new matrix B? Is it nonsingular? Explain. Use MATLAB to compute its reduced now echelon form.  

5. Generate a matrix A by setting  
```
A = floor(10 * rand(6))  
```
and generate a vector b by setting  
```
b = floor(20 * rand(6, 1)) - 10  
```
  (a) Since A was generated randomly, we would expect to be nonsingular. The system Ax = b should have a unique solution. Find the solution using the "\\" operation. Use MATLAB to compute the reduced row echelon form U of [A b]. How does the last column of U compare with the solution x? In exact arithmetic they should be the same. Why? Explain. To compare the two, compute the difference U(:, 7) - x or examine both using format long.  

  (b) Let us now change A so as to make it singular. Set  
```
A(:, 3) = A(:, 1 : 2) * [4 3]'  
```
Use MATLAB to compute rref([A b]). How many solutions will the system Ax = b have? Explain.  

  (c) Set  
```
y = floor(20 * rand(6, 1)) - 10 and c = A * y  
```
Why do we know the system Ax = c must be consistent? Explain. Compute the reduced row echelong form U of [A c]. How many solutions does the system Ax = c have? Explain.  

  (d) The free variable determined by the echelon form should be x<sub>3</sub>. By examining the system corresponding to the matrix U, you should be able to determine the solution corresponding to x<sub>3</sub> = 0. Enter this solution in MATLAB as a column vector w. To check that Aw = c, compute the residual vector c - Aw.  

  (e) Set U(:, 7) = zeros(6, 1). The matrix U should now correspond to the reduced row echelon form of (A | 0). Use U to determine  the solution to the homogeneous system when the free variable x3 = 1 (do this by hand) and enter the result as a vector z. Check your answer by computing A * z.  

  (f) Set v = w + 3 * z. The vector v should be a solution to the system Ax = c. Why? Explain. Verify that v is a solution by using MATLAB to compute the residual vector c - Av. What is the value of the free variable x3 for this solution? How could we determine all possible solutions to the system in terms of the vectors w and z? Explain.  

6. Consider the graph  

![Figure 1](https://www.github.com/partloer/linear_algebra_with_applications/1_matrices_and_systems_of_equations/figure1.jpg)

  (a) Determine the adjacency matrix A for the graph and enter it in MATLAB.  

  (b) Compute A<sup>2</sup> and determine the number of walks of length 2 from (i) V<sub>1</sub> to V<sub>7</sub>, (ii) V<sub>4</sub> to V<sub>8</sub> (iii) V<sub>5</sub> to V<sub>6</sub>, (iv) V<sub>8</sub> to V<sub>3</sub>.  

  (c) Compute A<sup>4</sup>, A<sup>6</sup>, A<sup>8</sup> and answer the questions to part (b) for walks of length 4, 6, and 8. Make a conjecture as to when there will be no walks of even length from vertex V<sub>i</sub> to vertex V<sub>j</sub>.  

  (d) Compute A<sup>3</sup>, A<sup>5</sup>, A<sup>7</sup> and answer the questions from part (b) for walks of length 3, 5, and 7. Does your conjecture from part (c) hold for walk of odd length? Explain. Make a conjecture as to whether there are any walks of length k from V<sub>i</sub> to V<sub>j</sub> based on whether i + j + k is odd or even.  

  (e) If we add the edges {V3, V6}, {V5, V8} to the graph, the adjacency matrix B for the new graph can be generated by setting B = A and then setting  
```
B(3, 6) = 1, B(6, 3) = 1, B(5, 8) = 1, B(8, 5) = 1  
```
Compute B<sup>k</sup>, for k = 2, 3, 4, 5. Is your conjecture from part (d) still valid for the new graph?  

  (f) Add the edge {V<sub>6</sub>, V<sup>8</sub>} to the figure and construct the adjacency matrix C for the resulting graph. Compute powers of C to determine whether your conjecture from part (d) will still hold for this new graph.  

7. In Application 2 of section 3, the number of married and single women after 1 and 2 years were determined by computing the products AX and A<sup>2</sup>X for the given matrices A and X. Use format long and enter these matrices in MATLAB. Compute A<sup>k</sup> and A<sup>k</sup>X for k = 5, 10, 15, 20. What is happening to A<sup>k</sup> as k gets large? What is the long-run distribution of married and single women in the town?  

8. The following table describes a seven-stage model for the life cycle of the loggerhead turtle.  

**Table 1 Seven-Stage Model for Loggerhead Turtle Demographics**  

Stage Number | Description (age in years) | Annual Survivorship | Eggs Laid per Year  
---------- | --------- | --------- | ---------  
1 | Eggs, hatchlings (<1) | 0.6747 | 0  
2 | Small juveniles (1-7) | 0.7857 | 0  
3 | Large juveniles (8 - 15) | 0.7857 | 0  
4 | Subadults (16-21) | 0.7425 | 0  
5 | Novice breeders (22) | 0.8091 | 127  
6 | First-year emigrants (23) | 0.8091 | 4  
7 | Mature breeders (24-54) | 0.8091 | 80  

The corresponding Leslie matrix is given by  

L = [[0, 0, 0, 0, 127, 4, 80], [0.6747, 0.7370, 0, 0, 0, 0, 0], [0, 0.0486, 0.6610, 0, 0, 0, 0], [0, 0, 0.0147, 0.6907, 0, 0, 0], [0, 0, 0, 0.0518, 0, 0, 0], [0, 0, 0, 0, 0.8091, 0, 0], [0, 0, 0, 0, 0, 0.8091, 0.8089] ]  

Suppose that the number of turtles in each stage of the initial turtle population is described by the vector x0 = (200, 000 130, 000 100, 000 70, 000 500 400 1100)<sup>T</sup>  

  (a) Enter L in MATLAB and then set x0 = (200000, 130000, 100000, 70000, 500, 400, 1100)'  

Use the command x50 = round(L<sup>50</sup>\*\x0)  

to compute x50. Compute also the values of x100, x150, x200, x250, and x300.  

  (b) Loggerhead turtles lay their eggs on land. Suppose that conservationists take special measures to protect these eggs and as a result the survival rate for eggs and hatchlings increases to 77 percent. To incorporate this change into our model, we need only change (2, 1) entry of L to 0.77. Make this modification to the matrix L and repeat part (a). Has the survival potential of the loggerhead turtle improved significantly?  

  (c) Suppose that instead of improving the survival rate for eggs and hatchlings we could devise a means of protecting the small juveniles so that their survival rate increases to 88 percent. Use equations (7) and (8) fro Application 3 of Section 3 to determine the proportion of small juveniles that survive and remain in the same stage and the proportion that survive and grow to the next stage. Modify your original matrix L accordingly and repeat part (a) using the new matrix. Has the survival potential of the loggerhead turtle improved significantly?  

9. Set  
```
b = [ 8 -8 -8 8 8 -8 -8 8]';  
```
and consider the system Ax = b. This system should be consistent. Verify that it is by computing U = rref([A b]). We should be able to find a solution for any choice of the five free variables. Indeed, set x<sub>2</sub> = floor(10 * rand(5, 1)). If x<sub>2</sub> represents the last five coordinates of a solution to the system, then we should be able to determine x<sub>1</sub> = (x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>)<sup>T</sup> in terms of x<sub>2</sub>. To do this, set U = rref([A b]). The nonzero rows of U correspond to a linear system with block form  

(I V)(x1)
     (x2) = c

To solve equation, set V = U(1: 3, 4: 8), c = U(1 : 3, 9)  

and use MATLAB to compute x<sub>1</sub> in terms of x<sub>2</sub>, c, and V. Set x  [x<sub>1</sub>; x<sub>2</sub>] and verify that x is a solution to the system.  

10. Set  
```
B = [-1, -1; 1, 1] and A = [zeros(2), eye(2); eye(2), B]  
```
and verify that B<sup>2</sup> = O.  

  (a) Use MATLAB to compute A<sup>2</sup>, A<sup>4</sup>, A<sup>6</sup>, and A<sup>8</sup>. To make a conjecture as to what the block form of A<sup>2k</sup> will be in terms of the submatrices I, O, and B. Use mathematical induction to prove that your conjecture is true for any positive integer k.  

  (b) Use MATLAB to compute A<sup>3</sup>, A<sup>5</sup>, A<sup>7</sup>, and A<sup>9</sup>. Make a conjecture as to what the block form of A<sup>2k-1</sup> will be in terms of the submatrices I, O, and B. Prove your conjecture.  

11. (a) The MATLAB commands  
```
A = floor(10 * rand(6)), B = A' * A  
```
will result in the symmetric matrix with integer entries. Why? Explain. Compute B in this way and verify these claims. Next, partition B into four 3 X 3 submatrices. To determine the submatrices in MATLAB, set  
```
B11 = B(1:3, 1:3), B12 = B(1:3, 4:6)  
```
and define B21 and B22 in a similar manner using rows 4 through 6 of B.  

  (b) Set C = inv(B11). It should be the case that C<sup>T</sup> = C and B21<sup>T</sup> = B12. Why? Explain. Use the MATLAB operation ' to compute the transpose and verify these claims. Next, set  
```
E = B21 * C and F = B22 - B21 * C * B21'  
```
and use the MATLAB functions eye and zeros to construction  
```
L = (I O, E I), D = (B11 O, O F)  
```
Compute H = L * D * L' and compare it to B by computing H - B. Prove that if all computations had been done in exact arithmetic LDL<sup>T</sup> would equal B exactly.  

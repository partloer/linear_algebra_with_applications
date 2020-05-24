# MATLAB EXERCISES #
1. (Change of Basis) Set

U = round(20 * rand(4)) - 10,  V = round(10 * rand(4))

and set b = (4, 1)

(a) We can use MATLAB function rank to determine whether the column vectors of the matrix are linearly independent. What should the rank be if the column vectors of U are linearly independent? Compute the rank of U and verify that its column vectors are linearly independent and hence form the basis for R^4. Compute the rank of V and verify that its column vectors also form a basis for R^4.

(b) Use MATLAB to compute the transition matrix from the standard basis for R^4 to the ordered  basis E = [u1, u2, u3, u4]. [Note that in MATLAB the notation for the jth column vector uj is U(:, j).] Use this transition matrix to compute the coordinate vector c of b with respect to E. Verify that

b = c1u1 + c2u2 + c3u3 + c4u4 = Uc

(c) Use MATLAB to compute the transition matrix from the standard basis to the basis F = [v1, v2, v3, v4], and use the transition matrix to find the coordinate vector d of b with respect to F. Verify that

b = d1v1 + d2v2 + d3v3 + d4v4 = Vd

(d) Use MATLAB to compute the transition matrix S from E to F and the transition matrix T from F to E. How are S and T related? Verify that Sc = d and Td = c.

2. (Rank-Deficient Matrices) In this exercise we consider how to generate matrices with specified ranks using MATLAB.

(a) In general, if A is an m x n matrix with rank r, then r <= min(m, n). Why? Explain. If the entries of A are random numbers, we would expect that r = min(m, n). Why? Explain. Check this out in MATLAB by generating random 6 x 6, 8 x 6, 5 x 8 matrices and checking their ranks using MATLAB command rank. Whenever the rank of an m x n matrix equals min(m, n), we say that the matrix has full rank. Otherwise, we say that the matrix is rank deficient.

(b) MATLAB's rand and round commands can be used to generate random m x n matrices with integer entries in a given range [a, b]. This can be done with a command of the form

A = round((b - a) * rand(m, n)) + a

For example, the command

A = round(4 * rand(6, 8)) + 3

will generate a 6 x 8 matrix whose entries are random integers in the range from 3 to 7. Using the range [1, 10], create random integer 10 x 7, 8 x 12, and 10 x 15 matrices and in each case check the rank of the matrix. Do these integer matrices all have full rank?

(c) Suppose that we want to generate matrices with less than full rank using MATLAB. It is easy to generate rank 1 matrices. If x and y are nonzero vectors in R^m and R^n, respectively, then A = xy^T will be an m x n matrix with rank 1. Why? Explain. Verify this using MATLAB by setting

x = round(9 * rand(8, 1)) + 1,  y = round(9 * rand(6, 1)) + 1

and using these vectors to construct an 8 x 6 matrix A. Check the rank of A using the MATLAB command rank.

(d) In general,
(1) rank(A, B) <= min(rank(A), rank(B))

If A and B are non-integer random matrices, the relation (1) should be an equality. Generate an 8 x 6 matrix A by setting

X = rand(8, 2),  Y = rand(6, 2),  A = X * Y'

What would you expect the rank of A to be? Explain. Test the rank of A using MATLAB.

(e) Use MATLAB to generate matrices A, B, C such that
(i) A is 8 x 8 with rank 3.
(ii) B is 6 x 9 with rank 4.
(iii) C is 10 x 7 with rank 5.

3. (Column Space and Reduced Row Echelon Form) Set B = round(10 * rand(8, 4)), X = round(10 * rand(4, 3)), C = B * X, and A = [B C].
(a) How are the column spaces of B and C related? (See Exercise 22 in Section 6.) What would you expect the rank of A to be? Explain. Use MATLAB to check your answer.

(b) Which column vectors of A should form a basis for its column space? Explain. If U is the reduced row echelon form of A, what would you expect its first four columns to be? Explain. What would you expect its last four rows to be? Explain. Use MATLAB to verify your answers by computing U.

(c) Use MATLAB to construct another matrix D = (E EY), where E is a random 6 x 4 matrix and Y is random 4 x 2 matrix. What would you expect the reduced row echelon form of D to be? Compute it using MATLAB. Show that, in general, if B is an m x n matrix of rank n and X is an n x k matrix, the reduced row echelon form of (B BX) will have block structure

(I X) if m = n or (I X, O O) if m > n

4. (Rank 1 Updates of Linear Systems)
(a) Set A = round(10 * rand(8)), b = round(10 * rand(8, 1)), and M = inv(A). Use the matrix M to solve the system Ay = b for y.

(b) Consider now a new system Cx = b, where the C is constructed as follows:
u = round(10 * rand(8))  v = round(10 * rand(8, 1))
E = u * v'  C = A + E
The matrices C and A differ by the rank 1 matrix E. Use MATLAB to verify that the rank of E is 1. Solve the system Cx = b using MATLAB's "\"" operation and then compute the residual vector r = b - Cx.

(c) Let us now solve Cx = b by a new method that takes advantage of the fact that A and C differ by a rank 1 matrix. This new procedure is called a rank 1 update method. Set

z = M * u,  c = v' * y,  d = v' * z,  e = c / (1 + d)

and then compute the solution x by

x = y - e * z

Compute the residual vector b - Cx and compare it to the residual vector in part (b). This new method may seem more complicated, but it actually is much more computationally efficient.

(d) To see why the rank 1 update method works, use MATLAB to compute and compare

Cy and b + cu

Prove that if all computations had been carried out in exact arithmetic these two vectors would be equal. Also compute

Cz and (1 + d)u

Prove that if all computations had been carried out in exact arithmetic these two vectors would be equal. Use these identities to prove that Cx = b. Assuming that A is nonsingular, will the rank 1 update method always work? Under what conditions could it fail? Explain.

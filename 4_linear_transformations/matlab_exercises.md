# MATLAB EXERCISES #
1. Use MATLAB to generate a matrix W and a vector x by setting

W = triu(ones(5)) and x = [1:5]'

The columns of W can be used to form an ordered basis

F = [w1, w2, w3, w4, w5]

Let L: R^5 -> R^5 be a linear operator such that

L(w1) = w2, L(w2) = w3, L(w3) = w4

and

L(w4) = 4w1 + 3w2 + 2w3 + w4
L(w5) = w1 + w2 + w3 + w4 + w5

(a) Determine the matrix A represents L with respect to F and enter it in MATLAB.
(b) Use MATLAB to compute the coordinate vector y = W^(-1)x of x with respect to F.
(c) Use A to compute the coordinate vector z of L(x) with respect to F.
(d) W is the transition matrix from F to the standard basis for R^5. Use W to compute the coordinate vector of L(x) with respect to the standard basis.

2. Set A = triu(ones(5)) * tril(ones(5)). If L denotes the linear operator defined by L(x) = Ax for all x in R^n, then A is the matrix representing L with respect to the standard basis for R^5. Construct a 5 x 5 matrix U by setting

U = hankel(ones(5, 1), 1:5)

Use MATLAB function rank to verify that the column vectors of U are linearly independent. Thus E = [u1, u2, u3, u4, u5] is an ordered basis for R^5. The matrix U is the transition matrix from E to the standard basis

(a) Use MATLAB to compute the matrix B representing L with respect to E. (The matrix B should be computed in terms of A, U, and U^-1.)
(b) Generate another matrix by setting

V = toeplitz([1, 0, 1, 1, 1])

Use MATLAB to check that V is nonsingular. It follows that the column vectors of V are linearly independent and hence form an ordered basis F for R^5. Use MATLAB to compute the matrix C, which represents L with respect to F. (The matrix C should be computed in terms of A, V, and V^-1.)

(c) The matrices B and C from parts (a) and (b) should be similar. Why? Explain. Use MATLAB to compute the transition matrix S from F to E. Compute the matrix C in terms of B, S, and S^-1. Compare your result with the result from part (b).

3. Let

A = toeplitz(1:7), S = compan(ones(8, 1))

and set B = S^-1 * A * S. The matrices A and B are similar. Use MATLAB to verify that the following properties hold for these two matrices.
(a) det(B) = det(A)
(b) B^T = S^T A^T (S^T)^-1
(c) B^-1 = S^-1 A^-1 S
(d) B^9 = S^-1 A^9 S
(e) B - 31 = S^-1 (A - 3I)S
(f) det(B - 31) = det(A - 3I)
(g) tr(B) = tr(A) (Note that the trace of a matrix A can be computed using the MATLAB command trace.)

These properties will hold in general for any pair of similar matrices. See Exercises 11-15 of section 3.

# MATLAB EXERCISES #
The first four exercises involve matrices and illustrate some of the properties of determinants that were covered in this chapter. The last two exercises illustrate some of the differences that may arise when we work with determinants in floating-point arithmetic.
In theory, the value of the determinant should tell us whether the matrix is nonsingular. However, if the matrix is singular and its determinant is computed using finite precision arithmetic, then, because of roundoff errors, the computed value of the determinant may not equal zero. A computed value near zero does not necessarily mean that the matrix is singular or even close to being singular. Furthermore, a matrix may be singular and have a determinant that is not even close to zero.

1. Generate random 5 x 5 matrices with integer entries by setting

A = round(10 * rand(5)) and B = round (20 * rand(5)) - 10

Use MATLAB to compute each of the following pairs of numbers. In each case check whether the first is equal to the second.

(a) det(A)  det(A^T)
(b) det(A + B)  det(A) + det(B)
(c) det(AB)  det(A)det(B)
(d) det(A^TB^T)  det(A^T)det(B^T)
(e) det(A^-1)  1/det(A)
(f) det(AB^-1)  det(A)/det(B)

2. Are n x n magic squares nonsingular? Use MATLAB to compute det(magic(n)) in the cases n = 3, 4, ..., 10. What seems to be happening? Check the cases n = 24 and 25 to see if the pattern still holds.

3. Set A = round(10 * rand(6)). In each of the following, use MATLAB to compute a second matrix as indicated. State how the second matrix is related to A and compute the determinants of both matrices. How are determinants relatd?

(a) B = A;  B(2,:) = A(1,:); B(1,:) = A(2,:)
(b) C = A;  C(3,:) = 4 * A(3,:)
(c) D = A;  D(5,:) = A(5,:) + 2 * A(4,:)

4. We can generate a random 6 x 6 matrix A whose entries consist entirely of zeros and ones by setting

A = round(rand(6))

(a) What percentage of these random 0-1 matrices are singular? You can estimate the percentage using MATLAB by setting

y = zeros(1, 100);

and then generating 100 test matrices and setting y(j) = 1 if the jth matrix is singular and 0 otherwise. The easy way to do this in MATLAB is to use a for loop.
Generate the loop as follows:

for j = 1:100
A = round(rand(6))
y(j) = (det(A) == );
end

(b) For any positive integer n, we can generate a random 6 x 6 matrix A whose entries are integers from 0 to n by setting
A = floor((n + 1) * rand(6))
What percentage of random integer matrices generated in this manner will be singular if n = 3? If n = 6? If n = 10? We can estimate te answers to these questions using MATLAB. In each case, generate 100 test matrices and determine how many of the matrices are singular.

5. If a matrix is sensitive to round off errors, the computed value of its determinant may differ drastically from the exact value. For an example of this, setting

U = round(100 * rand(10)); U = triu(U, 1) + 0.1 * eye(10)

In theory,

det(U) = det(U^T) = 10^-10

and

det(UU^T) = det(U)det(U) = 10^-20

Compute det(U), det(U'), and det(U * U') using MATLAB. Do the computed values match the theoretical values?

6. Use MATLAB to construct a matrix A by setting

A = vander(1:6); A = A - diag(sum(A'))

(a) By construction, the entries in each row of A should all add up to zero. To check this, set x = ones(6, 1) and use MATLAB to compute the product Ax. The matrix A should be singular. Why? Explain. Use the MATLAB functions det and inv to compute the values of det(A) and A^-1. Which MATLAB function is a move reliable indicator of singularity?

(b) Use MATLAB to compute det(A^T). Are the computed values of det(A) and det(A^T) equal? Another way to check if a matrix is singular is to compute its reduced row echelon form. Use MATLAB to compute the reduced row echelon forms of A and A^T.

(c) To see what is going wrong, it helps to know how MATLAB computes determinants. The MATLAB routine for determinants first computes a form of the LU factorization of the matrix. The determinant of the matrix L is +-1 depending on the whether an even or odd number of row interchanges were used in the computation. The computed value of the determinant of A is the product of the diagonal entries of U multiplied by det(L) = +-1. In the special case that the original matrix has integer entries, the exact determinant should take on an integer value. So in this case MATLAB will round its decimal answer to the nearest integer. To see what is happening for our original matrix, use the following commands to compute and display the factor U.

format short e
[L, U] = lu(A); U

In exact arithmetic U should be singular. Is the computed matrix U singular? If not, what goes wrong? Use the following commands to see the rest of the computation of d = det(A).

format short
d = prod(diag(U))
d = round(d)

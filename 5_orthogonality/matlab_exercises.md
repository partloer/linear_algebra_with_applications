# MATLAB EXERCISES #
1. Set

x = [0:4, 4, -4, 1, 1]'  and y = ones(9, 1)

(a) Use the MATLAB function norm to compute the values of ||X||, ||y||, ||x + y|| and to verify that the triangle inequality holds. Use MATLAB also to verify that the parallelogram law

||x + y||^2 + ||x - y||^2 = 2(||x||^2 + ||y||^2)

is satisfied.

(b) If

t = x^T y / ||x|| ||y||

then why do we know that |t| must be less than or equal to 1? Use MATLAB to compute the value of t and use the MATLAB function acos to compute the angle between x and y. Convert the angle to degrees by multiplying by 180/pi. (Note that the number pi is given by pi in MATLAB.)

(c) Use MATLAB to compute  the vector projection p of x onto y. Set z = x - p and verify that z is orthogonal to p by computing the scalar product of the two vectors. Compute ||x||^2 and ||z||^2 + ||p||^2 and verify that the Pythagorean Law is satisfied.

2. (Least Squares Fit to a Data Set by a Linear Function) The following table of x and y values was given in Section 4 of this chapter (see Figure 5.4.2).

x | -1.0 | 0.0 | 2.1 | 2.3 | 2.4 | 5.3 | 6.0 | 6.5 | 8.0
y | -1.02 | -0.52 | 0.55 | 0.70 | 0.70 | 2.13 | 2.52 | 2.82 | 3.54

The nine data points are nearly linear and hence the data can be approximated by a linear function z = c1x + c2. Enter the x and y coordinates of the data points as column vectors x and y respectively. Set V = [x, ones(size(x))] and use the MATLAB "\"" operation to compute the coefficients c1 and c2 as the least squares solution to the 9 x 2 linear system Vc = y. To see the results graphically, set

w = -1:0.1:8 and z = c(1) * w + c(2) * ones(size(w))

and plot the original data points and the least squares linear fit using the MATLAB commands

plot(x, y, 'x', w, z)

3. (construction of Temperature Profiles by Least Squares Polynomials) Among the important inputs in weather forecasting models are data sets consisting of temperature values at various parts of the atmosphere. These are either measured directly using weather balloons or inferred from remote sounding taken by weather satellites. A typical set of ROAB (weather balloon) data is given next. The temperature T in kelvins may be considered as a function of p, the atmospheric pressure measured in decibars.  Pressures in the range from 1 to 3 decibars correspond to the top of the atmosphere, and those in the range from 9 to 10 decibars correspond to the lower part of the atomophere.

p | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10
T | 222 | 227 | 223 | 233 | 244 | 253 | 260 | 266 | 270 | 266

(a) Enter the pressure values as a column vector p by setting p = [1:10]', and enter the temperature values as a column vector T. To find the best least squares fit to the data by a linear function c1x + c2, set up an overdetermined system Vc = T. The coefficient matrix V can be generated in MATLAB by setting

V = [p, ones(10, 1)]

or alternatively by setting

A = vander(p); V = A(:, 9 : 10)

Note For any vector x = (x1, x2, ..., Xn+1)^T, the MATLAB command vander(x) generates a full Vandermonde matrix of the form

![Figure1](https://www.github.com/partloer/linear_algebra_with_applications/5_orthogonality/figure1.jpg)

For a linear fit, only the last two columns of the full Vandermonde matrix are used. More information on the vander function can be obtained by typing help vander. Once V has been constructed, the least squares solution c to the system can then be calculated using the MATLAB "\"" operation.

(b) To see how well the linear function fits the data, define a range of pressure values by setting

q = 1 : 0.1 : 10;

The corresponding function values can be determined by setting

z = polyval(c, q);

We can plot the function and the data points using the command

plot(q, z, p, T, 'x')

(c) Let us now try to obtain a better fit using a cubic polynomial approximation. Again we can calculate the coefficients of the cubic polynoial

c1x^3 + c2x^2 + c3x + c4

that gives the best least squares fit to the data by finding the least squares solution to an overdetermined system Vc = T. The coefficient matrix V is determined by taking the last four columns of the matrix A = vander(p). To see the results graphically, again set

z = polyval(c, q)

and plot the cubic function and data points using the same plot command as before. Where do you get the better fit, at the top or bottom of the atmosphere?

(d) To obtain a good fit at both the top and bottom of the atmosphere, try using a sixth-degree polynomial. Determine the coefficients as before using the last seven columns of A. Set z = polyval(c, q) and plot the results.

4. (Least Squares Circles) The parametric equations for a circle with center (3, 1) and radius 2 are

x = 3 + 2 cos t  y = 1 + 2 sin - [ ]

Set t = 0: .5 : 6 and use MATLAB to generate vectors of x and y coordinates for the corresponding points on the circle. Next add some noise to your points by setting x = x + 0.1 * rand(1, 13) and y = y + 0.1 * rand(1, 13)

Use MATLAB to determine the center c and radius r of the circle that gives the best least squares fit to the points. Set

t1 = 0 : 0.1 : 6.3  x1 = c(1) + r * cos(t1)  y1 = c(2) + r * sin(t1)

and use the command

plot(x1, y1, x, y, 'x')

to plot the circle and data points.

5. (Fundamental Subspaces: Orthonormal Bases) The vector spaces N(A), R(A), N(A^T), R(A^T) are the four fundamental subspaces associated with a matrix A. We can use MATLAB to construct orthonormal bases for each of the fundamental subspaces assocated with a given matrix. We can then construct projection matrices corresponding to each subspace.

(a) Set

A = rand(5, 2) * rand(2, 5)

What would you expect the rank and nullity of A to be? Explain. Use MATLAB to check your answer by computing rank(A) and Z = null(A). The columns of Z form an orthonormal basis for N(A).

(b) Next set

Q = orth(A), W = null(A'), S = [Q W]

The matrix S should be orthogonal. Why? Explain. Compute S * S' and compare your result to eye(5). In theory, A^T W and W^T A should both consist entirely of zeros. Why? Explain. Use MATLAB to compute A^T W and W^T A.

(c) Prove that if Q and W had been computed in exact arithmetic then we would have I - WW^T = QQ^T and QQ^T A = A
[Hint: Write SS^T in terms of Q and W.] Use MATLAB to verify these identities.

(d) Prove that if Q had been calculated in exact arithmetic then we would have QQ^T b = b for all b in R(A). Use MATLAB to verify this by setting b = A * rand(5, 1) and then computing Q * Q' * b and comparing it to b.

(e) Since the column vectors of Q form an orthonormal basis for R(A), it follows that QQ^T is the projection matrix corresponding to R(A). Thus, for any c in R^5, the vector q = QQ^T c is the projection of c onto R(A). Set c = rand(5, 1) and compute the projection vector q. The vector r = c - q should be in N(A^T). Why? Explain. Use MATLAB to compute A' * r.

(f) The matrix WW^T is the projection matrix corresponding to N(A^T). Use MATLAB to compute the projection w = WW^T c of c onto N(A^T) and compare the result to r.

(g) Set Y = orth(A') and use it to compute the projection matrix U corresponding to R(A^T). Let b = rand(5, 1) and compute the projection vector y = U * b of b onto R(A^T). Compute also U * y and compare it to y. The vectors s = b - y should be in N(A). Why? Explain. Use MATLAB to compute A * s.

(h) Use the matrix Z = null(A) to compute the projection matrix V corresponding to N(A). Compute V * b and compare it to s.

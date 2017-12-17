from cvxopt import matrix, solvers, spmatrix, spdiag
import numpy as np

X1 = matrix([x for x in range(10)])
X2 = X1**2

X1 = matrix(np.random.randn(10))
X2 = matrix(np.random.randn(10))

d = 2

X = matrix([[X1], [X2]])
beta = matrix([2, 3])
eps = matrix(np.random.randn(10))
Y = X*beta + eps

P = X.T * X
q = - X.T * Y
G = spdiag([-1.0] * d)
h = matrix([0.0] * d)

sol=solvers.qp(P, q, G, h)

print(sol['x'])
from scipy.optimize import nnls

nnls(np.array(X), np.array(Y.T)[0])

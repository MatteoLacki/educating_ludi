library("genlasso")

b0 = 10
b1 = 15
b2 = 30
X = matrix(1:100, 100, 1)

Y0 = X * b0 + rnorm(100)
Y1 = X * b1 + rnorm(100)
Y2 = X * b2 + rnorm(100)

lm(Y0 ~ -1 + X)
lm(Y1 ~ -1 + X)
lm(Y2 ~ -1 + X)

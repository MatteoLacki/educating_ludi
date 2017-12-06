library("glmnet")

b1 = 0
b2 = 3
b3 = 3
b4 = 5

X = data.matrix(matrix( c(rnorm(10000, mean=rnorm(10000, sd=10), sd=.1),
                          rnorm(10000, mean=1:10000, sd=.1)), 
                        10000, 2))

Y0 = X[,1] * b1 + X[,2] * b2 + rnorm(10000)
Y1 = X[,1] * b1 + X[,2] * b3 + rnorm(10000)
# Y2 = X[,1] * b1 + X[,2] * b4 + rnorm(100)
big_Y = c(Y0, Y1)
# big_Y = c(Y0, Y1, Y2)

zeros = matrix(0, nrow(X), ncol(X))
big_X = rbind(cbind(X, zeros),
              cbind(zeros, X))
              # cbind(zeros, zeros, X))

cor(big_X)
dim(big_X)
D = rbind(diag(1,nrow=4, ncol=4),
          matrix(c(100,0,-100,0, 100,0,0,-100), ncol=4, byrow = T))

out = genlasso(big_Y, big_X, D)
summary(out)
coef(out)

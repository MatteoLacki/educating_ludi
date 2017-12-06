library("glmnet")

b1 = 0
b2 = 3
b3 = 3
b4 = 5

X = data.matrix(matrix( c(rnorm(100, mean=(1:100)^2, sd=.1),
                          rnorm(100, mean=1:100, sd=.1)), 
                        100, 2))

Y0 = X[,1] * b1 + X[,2] * b2 + rnorm(100)
Y1 = X[,1] * b1 + X[,2] * b3 + rnorm(100)
Y2 = X[,1] * b1 + X[,2] * b4 + rnorm(100)

lm(Y0 ~ X - 1)
lm(Y1 ~ X - 1)
lm(Y2 ~ X - 1)

out = glmnet(X, Y2, family='gaussian', intercept = F, lambda=1)
out = glmnet(X, Y1, family='gaussian', intercept = F, lambda=1)
summary(out)
coef(out)

big_Y = c(Y0, Y1, Y2)

zeros = matrix(0, nrow(X), ncol(X))
big_X = rbind(cbind(X, zeros, zeros),
              cbind(zeros, X, zeros),
              cbind(zeros, zeros, X))

lm(big_Y ~ big_X - 1)
out = glmnet(big_X, big_Y, 
             alpha = 1.0,
             family='gaussian',
             intercept = F,
             lambda = 1)
res = coef(out)
# plot(out$lambda, res[5,], type='l')


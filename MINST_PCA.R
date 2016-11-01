install.packages("devtools")
devtools::install_github("jlmelville/mnist")
library(mnist)


# fetch dataset from the MNIST website
mnist <- download_mnist()

# first 60,000 instances are the training set
mnist_train <- head(mnist, 60000)
# the remaining 10,000 are the test set
mnist_test <- tail(mnist, 10000)

pca <- prcomp(mnist_train[, 1:784], retx = TRUE)
# plot the scores of the first two components
plot(pca$x[, 1:2], type = 'n')
text(pca$x[, 1:2], labels = mnist_train$Label, cex = 0.5,
  col = rainbow(length(levels(mnist_train$Label)))[mnist_train$Label])

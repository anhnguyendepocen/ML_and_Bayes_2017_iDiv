xy <- read.csv("https://raw.githubusercontent.com/petrkeil/ML_and_Bayes_2017_iDiv/master/Manual_ML_regression/xy_data.csv")

xy

library(manipulate)

myplot <- function(xy, a, b, sigma)
{
  
  x <-xy$x
  mean.y <- a + b*x
  low.y  <- qnorm(0.025, mean.y, sigma)
  up.y <- qnorm(0.975, mean.y, sigma)
  
  neg.LL <- - sum(dnorm(xy$y, mean=mean.y, sd=sigma, log=TRUE))
  neg.LL <- round(neg.LL, 3)
  
  plot(xy, main=paste("Neg. LL (a.k.a. deviance) =", neg.LL))
  
  lines(x, mean.y, col="red")
  lines(x, low.y, lty=2, col="red")
  lines(x, up.y, lty=2, col="red")
}

manipulate(
myplot(xy, a, b, sigma),
a = slider(min=-5, max=5, step=0.01, initial=3),
b = slider(min=-5, max=5, step=0.01, initial=4),
sigma = slider(min=0, max=3, step=0.01, initial=0.1)
)

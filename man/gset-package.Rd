\name{gset-package}
\alias{gset-package}
\alias{gset}
\docType{package}

\title{
group sequentail design of equivalenc studies based on exact bivariate t statistics
}

\description{
gset computes the critical values in the sequential testing of  an equivalence hypothesis. The package calculates the exact equivalence boundaries and futility boundaries (binding or nonbinding) using  the exact sequential test based on the bivariate non-central $t$ statistics. It also produces the boundaries plots; and examines the operating characteristics of a given sequential design via the calculation of empirical Type I error rate, empirical power, expected sample size, and the probability of stopping at interim look due to equivalence or futility.}

\details{
\tabular{ll}{
Package: \tab gset\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-05-14\cr
License: \tab GLP (>=2) \cr
}
The package contains 8 functions: 4 functions can be used to compute the equivalence and futilities boundaries (equivonly, nonbinding, binding, nminmax); 1 function to compute the sample size of an equivalence study in the traditional nonsequential setting (nfix); 1 function to compute the sample size of an equivalence study in the sequential setting (nminmax); 2 functions for generating the boundary plots (figureE, figureEF); and 1 function to examine the the operating characteristics of a given sequential design.
}

\author{
Fang Liu (fang.liu.131@nd.edu)
}

\references{
Liu, F. and Li, Q. (2014), Sequential Equivalence Testing based on the Exact Distribution of Bivariate Noncentral $t$-statistics, Computational Statistics and Data Analysis  (doi: 10.1016/j.csda.2014.02.007)
}

\keyword{ package }
\keyword{ group sequential design }
\keyword{ equivalence hypothesis }
\keyword{ equivalence boundary }
\keyword{ futility boundary }


\examples{
 \dontrun{ 
  L <- -0.2
  U <- 0.2
  theta <- 0
  sigma <- 0.4  
  alpha <- 0.05
  beta  <- 0.2
  K <- 4
  r <- 1 
  
  # non-sequential
  n.fix <- nfix(r, L,U,theta,sigma,alpha,beta)

  # sequential without futility
  bound1<- equivonly(L, U,  sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)  
  # figureE (bound1, K)
  
  # sequential with nonbinding futility
  bound2  <- nonbinding(L,U,theta,sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha,beta) 

  # sequential with binding futility
  bound3  <- binding(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta) 
   
  # finding nminmax with nonbinding futility
  bound4  <- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)
  figureEF(bound4, K)

  # finding nminmax with binding futility
  bound5  <- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)
  figureEF(bound5, K)


  # operating characteristics under H0
  theta <- L 
  oc1 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound1, futility=FALSE)
  oc2 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound2, futility=TRUE)  
  oc3 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound3, futility=TRUE, binding=TRUE)  
  oc4 <- oc(L, U, theta, sigma, K, bound4$n1minmax, bound4$n2minmax, bound4, futility=TRUE)  
  oc5 <- oc(L, U, theta, sigma, K, bound5$n1minmax, bound5$n2minmax, bound5, 
  futility=TRUE, binding=TRUE)  


  # operating characteristics under H1
  theta <- 0
  oc6 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound1, futility=FALSE)
  oc7 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound2, futility=TRUE)  
  oc8 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound3, futility=TRUE, binding=TRUE)  
  oc9 <- oc(L, U, theta, sigma, K, bound4$n1minmax, bound4$n2minmax, bound4, futility=TRUE)  
  oc10<- oc(L, U, theta, sigma, K, bound5$n1minmax, bound5$n2minmax, bound5, 
  futility=TRUE, binding=TRUE)  
 }
}

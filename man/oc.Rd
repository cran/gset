\name{oc}
\alias{oc}

\title{
examination of the operating characteristics of a group sequential design for equivalence studies
}
\description{
empirical examination of the operating characteristics of a group sequential design via the Monte Carlo simulation approach. users need to supply the design, including the lower and upper bounds of the equivalence hypothesis, the true difference between 2 groups, and the corresponding variance parameter, and the number of looks (including the final look), the group sizes, and the equivalence and futility boundaries. It outputs empirical type I or type II error rates, expected sample sizes in the 2 groups, and the probability of stopping at each stage due to either equivalence or futility
}
\usage{
oc(l, u, theta, sigma, K, n1, n2, boundaries, 
futility = TRUE, binding = FALSE, n.sim = 10000)
}

\arguments{
  \item{l}{lower equivalence bound as given in the equivalence hypothesis
}
  \item{u}{upper equivalence bound as given in the equivalence hypothesis
}
  \item{theta}{true mean difference between 2 groups
}
  \item{sigma}{between-subject standard deviaton of the response variables for two indepedent groups; within subject standard deviaton of the response variables for paired groups
}
  \item{K}{number of looks/stages
}
  \item{n1}{size (number of subjects) in group 1 in the actual study
}
  \item{n2}{size (number of subjects) in group 2 in the actual study
}
  \item{boundaries}{a list that contains four vectors that correspond to the stagewise lower equivalence boundaries c(L), upper equivalence boundaries c(U), lower futility boundaries d(L), and upper futility  boundaries d(U), respectively. the boundaries can be obtained using functions binding(), nonbinding(), and nminmax().
}
  \item{futility}{whether the stop will stop for futility; default = TRUE
}
  \item{binding}{whether hte futility boundaries are binding; default = FALSE
}
  \item{n.sim}{number of randomly simulated studies for the empirical examination of the operating characteristics of a group sequential design via the Monte Carlo simulation approach. Default n.sim=1e4
}
}


\value{
  \item{reject.rate}{rate of rejection of H0 (non-equivalence). If H0 is true, then reject.rate is the empirical type I error rate; if H1 is true, then reject.rate is the empirical power}
  \item{En1}{sample size that is expected to spend in group 1; smaller than n1.minmax due to early stopping}
  \item{En2}{sample size that is expected to spend in group 2; smaller than n2.minmax due to early stopping}
  \item{prob.stop}{probability of stopping at each stage due to either equivalence or futility}
  \item{prob.stopE}{probability of stopping at each stage due to equivalence}
  \item{prob.stopF}{probability of stopping at each stage due to futility}
}

\references{
Liu, F. and Li, Q. (2014), Sequential Equivalence Testing based on the Exact Distribution of Bivariate Noncentral $t$-statistics, Computational Statistics and Data Analysis, 77:14-24

Liu, F. (2014), gset:  an R package for exact sequential test of equivalence hypothesis based on bivariate non-central $t$-statistics, the R Journal (to appear)
}

\author{
Fang Liu (fang.liu.131@nd.edu)
}

\seealso{
\code{\link{nonbinding}},\code{\link{binding}},\code{\link{equivonly}},\code{\link{nminmax}},\code{\link{nfix}},\code{\link{figureE}},\code{\link{figureEF}}
}

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
  n.fix <- nfix(r, L,U,theta,sigma,alpha,beta)
  
  bound1 <- nonbinding(L,U,theta,sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha,beta, plot=FALSE) 
  bound2<- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)
  
  theta <- L 
  oc1 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound1, futility=TRUE)
  oc2 <- oc(L, U, theta, sigma, K, bound2$n1minmax, bound2$n2minmax, bound2, futility=TRUE)
  
  theta <- 0 
  oc3 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound1, futility=TRUE)
  oc4 <- oc(L, U, theta, sigma, K, bound2$n1minmax, bound2$n2minmax, bound2, futility=TRUE)
  }

}

\keyword{ group sequential design }
\keyword{ equivalence hypothesis }
\keyword{ equivalence boundary }
\keyword{ futility boundary }

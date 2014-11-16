\name{nminmax}
\alias{nminmax}

\title{
sample size calculation for group sequential equivalence studies
}
\description{
calculates sample size for group sequential designs in equivalence studies that can stop for equivalence, or for either equivalence or futility (binding or non-binding). The calculated samples size is referred to as n.minmax, "min" in the sense that the calculcated n is the minimunm required sample size to reach a given power level, "max" in the sense that it would the max spent sample size which only happens if the study stop in the last stage
}

\usage{
nminmax(l, u, theta, sigma, n1.lower, n2.lower, t.vec, type1, type2, 
gamma = rep(-4, 2), binding = FALSE, n1.upper = ceiling(2 * n1.lower), 
n2.upper = ceiling(2 * n2.lower), n.sim = 10000, seed = NULL)
}

\arguments{
  \item{l}{lower equivalence bound as given in the equivalence hypothesis
}
  \item{u}{upper equivalence bound as given in the equivalence hypothesis
}
  \item{theta}{true mean difference between 2 groups
}
  \item{sigma}{between-subject standard deviation of the response variable for two independent groups; within subject standard deviation of the response variable for paired groups
}
  \item{n1.lower}{the lower bound of the interval from which n.minmax in group 1 will be solved using a bisection method
}
  \item{n2.lower}{the lower bound of the interval from which n.minmax in group 2 will be solved using a bisection method
}
  \item{t.vec}{cumulative time points for the interim looks assuming a constant accrual rate. For example, if a study has equally spaced  4 looks including the final look, then t.vec=1:4/4. It can any vector as long as it is increasing and the last element is 1.
}
  \item{type1}{overall Type I error rate 
}
  \item{type2}{overall Type II error rate 
}
  \item{gamma}{The gamma parameter  in the gamma cumulative error spending function (Hwang, Shih, and DeCani 1990). Error spending given a t.vec is = total error rate*(1-exp(-gamma*t.vec))/(1-exp(-gamma)). gamma= 1 produces Pocock-type error spending function; gamma = -4 produces O'Brien-Fleming type error spending function. Default gamma = -4
}
  \item{binding}{whether the futility boundaries are binding; default = FALSE
}
  \item{n1.upper}{the upper bound of the interval from which n.minmax in group 1 will be solved using a bisection method; default = 2*n1.lower
}
  \item{n2.upper}{the upper bound of the interval from which n.minmax in group 2 will be solved using a bisection method; default = 2*n2.lower
}
  \item{n.sim}{number of randomly simulated samples in computation of n.minmax via the Monte Carlo simulation approach. Default n.sim=1e4
}
  \item{seed}{seed used in the Monte Carlo computation. If non-specified, the seed is set randomly.
}
}

\value{
  \item{n1minmax}{n.minmax in group 1}
  \item{n2minmax}{n.minmax in group 2} 
  \item{typeI}{vector of cumulative stage Type I error rate}
  \item{typeII}{vector of cumulative stage Type II error rate}
  \item{equivL}{vector of the equivalence boundary c(L) at each stage}
  \item{equivU}{vector of the equivalence boundary c(U) at each stage}
  \item{futilL}{vector of the futility boundary d(L) at each stage}
  \item{futilU}{vector of the futility boundary d(U) at each stage}
}
    
 
\references{
Liu, F. and Li, Q. (2014), Sequential Equivalence Testing based on the Exact Distribution of Bivariate Noncentral $t$-statistics, Computational Statistics and Data Analysis, 77:14-24

Liu, F. (2014), gset:  an R package for exact sequential test of equivalence hypothesis based on bivariate non-central $t$-statistics, the R Journal (to appear)
}

\author{
Fang Liu (fang.liu.131@nd.edu)
}

\seealso{\code{\link{nonbinding}},\code{\link{binding}},\code{\link{equivonly}}, \code{\link{nfix}}, \code{\link{oc}},\code{\link{figureE}},\code{\link{figureEF}}
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
  
  # the sample size per group with a traditional nonsequential design
  n.fix <- nfix(r, L,U,theta,sigma,alpha,beta)
  
  # nminmax with nonbinding futility
  bound1  <- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)
  figureEF(bound1, K)

  # nminmax with binding futility
  bound2  <- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta, binding=TRUE)
  figureEF(bound2, K)
  }
}

\keyword{ group sequential design }
\keyword{ equivalence hypothesis }
\keyword{ equivalence boundary }
\keyword{ futility boundary }


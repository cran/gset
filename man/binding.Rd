\name{binding}
\alias{binding}

\title{
equivalence and binding futility boundaries in group sequential equivalence studies
}
\description{
Computation of equivalence and binding futility boundaries for group sequential designs in studies with equivalence hypothesis via Monte Carlo simulations
}
\usage{
binding(l, u, theta, sigma, n1, n2, t.vec, type1, type2, gamma = rep(-4, 2), 
crange = c(-10, 10), drange = c(-10, 10), force = TRUE, plot = TRUE, 
ll = 3, ul = 6, n.sim = 10000)
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
  \item{n1}{size (number of subjects) in group 1 
}
  \item{n2}{size (number of subjects) in group 2 
}
  \item{t.vec}{cumulative time points for the interim looks assuming a constant accrual rate. For example, if a study has equally spaced  4 looks including the final look, then t.vec=1:4/4. It can any vector as long as it is increasing and the last element is 1.
}
  \item{type1}{pverall Type I error rate 
}
  \item{type2}{overall Type II error rate 
}
  \item{gamma}{The gamma parameter  in the gamma cumulative error spending function (Hwang, Shih, and DeCani 1990). Error spending given a t.vec is = total error rate*(1-exp(-gamma*t.vec))/(1-exp(-gamma)). gamma= 1 produces Pocock-type error spending function; gamma = -4 produces O'Brien-Fleming type error spending function. Default gamma = -4
}
  \item{crange}{a 2-dimensional vector containing the end-points of the interval from which the critical values for claiming equivalence  will be solved. Default crange = c(-10,10)
}
  \item{drange}{a 2-dimensional vector containing the end-points of the interval from which the critical values for claiming fultility will be solved. Default drange = c(-10,10)
}
  \item{force}{Whether to force the futlitity boundaries to equal to the equilvence boundaries in the last look. Default force = TRUE
}
  \item{plot}{Whether to generate the boundaries plot. Default force = TRUE
}
  \item{ll}{a parameter in the boundary plot; the short arm of the t(L) and t(U) axes
}
  \item{ul}{a parameter in the boundary plot; the long arm of the t(L) and t(U) axes
}
  \item{n.sim}{number of randomly simulated samples in computation of the boundaries via the Monte Carlo simulation approach. Default n.sim=1e4
}
}


\value{
  \item{typeI}{vector of cumulative stage Type I error rate}
  \item{typeII}{vector of cumulative stage Type II error rate}
  \item{equivL}{vector of the equivalence boundary c(L) at each stage}
  \item{equivU}{vector of the equivalence boundary c(U) at each stage}
  \item{futilL}{vector of the futility boundary d(L) at each stage}
  \item{futilU}{vector of the futility boundary d(U) at each stage}
  \item{boundary plots}{if plot=TRUE, a series of bounary plots will be produced, one for look}
}
    
 

\references{
Liu, F. and Li, Q. (2014), Sequential Equivalence Testing based on the Exact Distribution of Bivariate Noncentral $t$-statistics, Computational Statistics and Data Analysis  (doi: 10.1016/j.csda.2014.02.007)
}

\author{
Fang Liu (fang.liu.131@nd.edu)
}

\seealso{ \code{\link{nonbinding}},\code{\link{equivonly}},\code{\link{nminmax}},\code{\link{nfix}},\code{\link{oc}},\code{\link{figureE}},\code{\link{figureEF}}
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
  
  
  # default 
  # there are two ways to generate the boundary plots
  # 1. specify plot=TRUE (default) in "binding()"
  binding(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)             
  
  # 2. specify plot=FALSE in "binding()" and apply the "figureEF()" command 
  bound  <- binding(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta, plot=FALSE)  
  figureEF(bound, K)

  # obtain nminmax
  bound  <- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta, binding=TRUE)
  bound
  figureEF(bound, K)
  }
}

\keyword{ group sequential design }
\keyword{ equivalence hypothesis }
\keyword{ equivalence boundary }
\keyword{ futility boundary }


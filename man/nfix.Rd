\name{nfix}
\alias{nfix}

\title{
sample size calculation for equivalence studies
}
\description{
calculates sample size for equivalence studies in the traditional non-sequential setting
}
\usage{
nfix(r, l, u, theta, sigma, type1, type2, nrange = c(0, 1000))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{r}{sampling ratio of the two groups. For paired samples (such as in crossover studies), r=1
}
  \item{l}{lower equivalence bound as given in the equivalence hypothesis
}
  \item{u}{upper equivalence bound as given in the equivalence hypothesis
}
  \item{theta}{true mean difference between 2 groups
}
  \item{sigma}{between-subject standard deviation of the response variable for two independent groups; within subject standard deviation of the response variable for paired groups
}
  \item{type1}{overall Type I error rate 
}
  \item{type2}{overall Type II error rate 
}
  \item{nrange}{a 2-dimensional vector containing the end-points of the interval from which  thesample size will be solved. Default crange = c(0,1000)
}
}


\value{
  \item{n1 }{sample size in group 1}
  \item{n2 }{sample size in group 1}
}

\references{
Liu, F. and Li, Q. (2014), Sequential Equivalence Testing based on the Exact Distribution of Bivariate Noncentral $t$-statistics, Computational Statistics and Data Analysis  (doi: 10.1016/j.csda.2014.02.007)
}

\author{
Fang Liu (fang.liu.131@nd.edu)
}

\seealso{
\code{\link{nonbinding}},\code{\link{binding}},\code{\link{equivonly}},\code{\link{nminmax}}, \code{\link{oc}},\code{\link{figureE}},\code{\link{figureEF}}
}

\examples{
 \dontrun{
  L <- -0.2
  U <- 0.2
  theta <- 0
  sigma <- 0.4  
  alpha <- 0.05
  beta  <- 0.2
  r<- 1 
  n.fix <- nfix(r, L,U,theta,sigma,alpha,beta)
  }
}


\keyword{ group sequential design }
\keyword{ equivalence hypothesis }
\keyword{ equivalence boundary }
\keyword{ futility boundary }

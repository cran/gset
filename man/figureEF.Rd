\name{figureEF}
\alias{figureEF}

\title{
equivalence and futility boundary plots in group sequential designs of equivalence studies
}

\description{
produces the 2-dimenisonal equivalence and futility boundary plot for each stage in group sequential designs  of  equivalence studies
}

\usage{
figureEF(boundary, K, sm=3, lg=6)
}

\arguments{
  \item{boundary}{the equivalence boundaries c(L) and c(U) at each stage
}
  \item{K}{number of stages/looks
}
  \item{sm}{the short arm of the t(L) and t(U) axes; default is 3
}
  \item{lg}{the short arm of the t(L) and t(U) axes; default is 6
}
}


\references{
Liu, F. and Li, Q. (2014), Sequential Equivalence Testing based on the Exact Distribution of Bivariate Noncentral $t$-statistics, Computational Statistics and Data Analysis, 77:14-24

Liu, F. (2014), gset:  an R package for exact sequential test of equivalence hypothesis based on bivariate non-central $t$-statistics, the R Journal (to appear)
}

\author{
Fang Liu (fang.liu.131@nd.edu)
}

\seealso{
\code{\link{nonbinding}},\code{\link{binding}},\code{\link{equivonly}},\code{\link{nminmax}},\code{\link{nfix}},\code{\link{oc}},\code{\link{figureE}}
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
  bound  <- binding(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta, plot=FALSE)  
  figureEF(bound, K, 3,6)
  }
}

\keyword{ group sequential design }
\keyword{ equivalence hypothesis }
\keyword{ equivalence boundary }
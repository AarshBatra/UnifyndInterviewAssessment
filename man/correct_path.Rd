% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helperFunctions.R
\name{correct_path}
\alias{correct_path}
\title{converting backward slashes to forward slashes in the path names}
\usage{
correct_path(backward_slash_path)
}
\arguments{
\item{backward_slash_path}{backward slash path}
}
\value{
\code{forward_slash_path} path with forward slashes
}
\description{
When we construct relative path names in R using functions like
\code{normalizePath()}, R outputs path names containing "backslashes", but
we require path names containing forward slashes. \code{correct_path} \
function takes in a path name with backward slashes and converts it into a
path name with forward slashes.
}
\examples{
correct_path(backward_slash_path = "backward slash path")

}

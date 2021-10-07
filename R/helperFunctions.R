## Unifynd Assessment task helper functions------------------------------------

# converting backward slashes to forward slashes in the path names-------------

#' converting backward slashes to forward slashes in the path names
#'
#' When we construct relative path names in R using functions like
#' \code{normalizePath()}, R outputs path names containing "backslashes", but
#' we require path names containing forward slashes. \code{correct_path} \
#' function takes in a path name with backward slashes and converts it into a
#' path name with forward slashes.
#'
#' @importFrom stringr str_replace_all
#' @param backward_slash_path backward slash path
#' @return \code{forward_slash_path} path with forward slashes
#'
#' @examples
#' correct_path(backward_slash_path = "backward slash path")
#'
#' @export
#'

correct_path <- function(backward_slash_path){
  forward_slash_path <- str_replace_all(backward_slash_path, "\\\\", "/")
  forward_slash_path
}

# end of function

#========

# read .xlsx data files into R-------------------------------------------------

#' reading raw .xlsx data into R
#'
#' This functions reads in raw .xlsx data into R (after performing a few
#' sanity checks) and throws an error if for any reason data cannot be read.
#' Note that this function takes in a file name, not file path. A relative file
#' path is automatically constructed in the function.
#'
#' @importFrom readxl read_xlsx
#' @importFrom base file.exists stop
#' @param file_name name of the .xlsx file
#'
#' @return This function returns an R object which contains the raw dataset.
#'
#' @examples
#' read_raw_xlsx_data(file_name = "couponTransactions.xlsx")
#'
#' @export

read_raw_xlsx_data <- function(file_name){

  # construct relative path_to_file from file name
  path_to_file <- file.path(correct_path(normalizePath(".")), "data-raw",
            file_name)

  # Sanity check 1: stop if file name is NOT of type "character"
  if(!is.character(path_to_file)){
    stop("path_to_file should be of type character")
  }

  # Sanity check 2: stop if file does not exist at the given path
  if(!file.exists(path_to_file)){
    stop("file not present in the specified location. Please make sure
         that you point the path to the raw data .xlsx file.")
  } else {
    raw_data <- readxl::read_xlsx(path_to_file)
    raw_data
  }

}

# end of function

#========

coupon_transactions_raw <- read_raw_xlsx_data("couponTransactions.xlsx")

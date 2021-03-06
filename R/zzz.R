#' Generative artwork
#'
#' @param dir Directory to write file to
#' @param version Which version to write? (0 means create all)
#' @param ... Other arguments
#' @name rosemary

utils::globalVariables(c("x", "y", "id", "time", "series", "inside"))

#' @importFrom dplyr %>%
NULL

check_dir <- function(dir) {
  if(is.null(dir)) {
    dir <- getOption("rosemary.images")
  }
  if(is.null(dir)) {
    stop("`dir` must be specified", call. = FALSE)
  }
  dir <- normalizePath(dir)
  return(dir)
}

clean_dir <- function(dir) {
  if(dir.exists(dir)) {unlink(dir, recursive = TRUE)}
  dir.create(dir)
}


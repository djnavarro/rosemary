
# create a list of all
list_pieces <- function() {
  namespace <- readLines(system.file("NAMESPACE", package = "rosemary"))
  namespace <- namespace[grep(pattern = "^export\\(", x = namespace)]
  namespace <- gsub(pattern = "^export\\(", replacement = "", x = namespace)
  namespace <- gsub(pattern = "\\)$", replacement = "", x = namespace)
  namespace <- setdiff(namespace, "build_all")
}

#' Build all pieces
#'
#' @param dir Directory in which to create images
#' @param clean Delete any existing files in directory? (default = FALSE)
#'
#' @export
build_all <- function(dir = NULL, clean = FALSE) {

  # check the directory and clean if necessary
  dir <- check_dir(dir)
  if(clean == TRUE) {clean_dir(dir)}

  # list all the art functions
  artwork <- list_pieces()

  # create all pieces
  purrr::walk(
    .x = list_pieces(),
    .f = function(.x) {do.call(what = .x, args = list(dir = dir))}
  )

  return(invisible(NULL))
}

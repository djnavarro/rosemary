# https://www.flickr.com/photos/stringrbelle/49659617711/

#' @rdname rosemary
#' @export
ilomilo <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "ilomilo.png")

  jasmines::use_seed(5) %>%
    jasmines::entity_heart(5000, size = .5) %>%
    jasmines::unfold_slice(5, .2, output1 = "slice") %>%
    jasmines::unfold_warp(100) %>%
    dplyr::mutate(val = slice*100 + ind) %>%
    jasmines::style_ribbon("base", "val", c(.5, .1)) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

# https://www.flickr.com/photos/stringrbelle/49341356082

#' @rdname rosemary
#' @export
art_032 <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "art_032.png")

  jasmines::use_seed(31) %>%
    jasmines::entity_heart(1000) %>%
    jasmines::unfold_meander() %>%
    jasmines::unfold_inside() %>%
    dplyr::mutate(y = (inside > 0)*y) %>%
    jasmines::style_ribbon("lajolla", "ind", c(.3,.1), "wheat") %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}


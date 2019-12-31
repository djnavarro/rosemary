# https://www.flickr.com/photos/stringrbelle/49258162383

#' @rdname rosemary
#' @export
warped_heart <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "warped_heart.png")
  jasmines::use_seed(126) %>%
  jasmines::entity_heart(1500) %>%
    dplyr::mutate(x = x * 1.5, y = y * 1.5) %>%
    jasmines::unfold_tempest(iterations = 2, scale = .1, scatter = TRUE) %>%
    jasmines::style_ribbon(
      type = "curve",
      alpha = c(.2, 0),
      size = .5,
      palette = grDevices::rainbow
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}


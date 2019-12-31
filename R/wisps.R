# https://www.flickr.com/photos/stringrbelle/49258162383

#' @rdname rosemary
#' @export
wisps <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "wisps.png")

  jasmines::use_seed(127) %>%
    jasmines::scene_bubbles(1, 5000) %>%
    jasmines::unfold_tempest(iterations = 50, scale = .05, scatter = TRUE) %>%
    jasmines::style_ribbon(
      discard = 45,
      type = "curve",
      size = .25,
      alpha = c(.5, .03),
      palette = jasmines::palette_named("roma")
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



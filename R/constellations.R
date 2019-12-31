# https://www.flickr.com/photos/stringrbelle/49258842817

#' @rdname rosemary
#' @export
constellations <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "constellations.png")
  jasmines::use_seed(4) %>%
    jasmines::scene_bubbles(n = 3, grain = 100) %>%
    jasmines::unfold_tempest(iterations = 500, scale = 0.005, scatter = TRUE) %>%
    jasmines::style_ribbon(
      overlay = list(border = "#ffffff55", fill = "#ffffff33"),
      alpha = c(1, .0015),
      burnin = 300,
      palette = jasmines::palette_named("berlin")
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



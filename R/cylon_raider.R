# https://www.flickr.com/photos/stringrbelle/49290904297

#' @rdname rosemary
#' @export
cylon_raider <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "cylon_raider.png")

  jasmines::use_seed(4) %>%
    jasmines::scene_delaunay(8, 100) %>%
    jasmines::unfold_slice(iterations = 10) %>%
    jasmines::unfold_worley(frequency = 5) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("base"),
      alpha = c(.2, .2)
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

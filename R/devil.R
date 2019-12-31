# https://www.flickr.com/photos/stringrbelle/49258842337

#' @rdname rosemary
#' @export
devil <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "devil.png")

  jasmines::use_seed(129) %>%
  jasmines::scene_sticks(10, 5000) %>%
    jasmines::unfold_tempest(iterations = 5, scale = .05, scatter = TRUE) %>%
    jasmines::style_ribbon(
      discard = 4,
      type = "curve",
      curvature = 1,
      size = .25,
      alpha = c(.2, .03),
      palette = jasmines::palette_named("magma")) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}


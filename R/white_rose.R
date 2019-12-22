#' @rdname rosemary
#' @export
white_rose <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "white_rose.png")
  set.seed(1)

  jasmines::scene_bubbles(20, 400) %>%
    jasmines::unfold_slice(iterations = 20, scale = .02, seed = c(100, 101)) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("grayC"),
      alpha_init = .5,
      alpha_decay = .05
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



#' @rdname rosemary
#' @export
wisps <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "wisps.png")
  set.seed(127)

  jasmines::scene_bubbles(1, 5000) %>%
    jasmines::unfold_tempest(iterations = 50, scale = .05) %>%
    jasmines::style_ribbon(
      burnin = 45,
      type = "curve",
      size = .25,
      alpha_init = .5,
      alpha_decay = .03,
      palette = jasmines::palette_named("roma")
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



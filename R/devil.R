#' @rdname rosemary
#' @export
devil <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "devil.png")
  set.seed(129)

  jasmines::scene_sticks(10, 5000) %>%
    jasmines::unfold_tempest(iterations = 5, scale = .05) %>%
    jasmines::style_ribbon(
      burnin = 4,
      type = "curve",
      curvature = 1,
      size = .25,
      alpha_init = .2,
      alpha_decay = .03,
      palette = jasmines::palette_named("magma")) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}


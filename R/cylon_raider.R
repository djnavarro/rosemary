#' @rdname rosemary
#' @export
cylon_raider <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "cylon_raider.png")

  set.seed(4)
  jasmines::scene_delaunay(8, 100) %>%
    jasmines::unfold_slice(seed = 4, iterations = 10) %>%
    jasmines::unfold_worley(seed = 4, frequency = 5) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("base"),
      alpha_init = .2,
      alpha_decay = .2
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

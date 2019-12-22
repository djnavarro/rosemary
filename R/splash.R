#' @rdname rosemary
#' @export
splash <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "splash.png")
  set.seed(2)

  jasmines::scene_delaunay(5, grain = 200) %>%
    dplyr::mutate(x = x * 15, y = y * 15) %>%
    jasmines::unfold_loop(points = 200, radius = 2) %>%
    dplyr::mutate(id = time) %>%
    dplyr::select(-time) %>%
    jasmines::unfold_tempest(
      scale = .2,
      iterations = 5,
      seed = 23
    ) %>%
    dplyr::mutate(order = id) %>%
    jasmines::style_ribbon(
      seed_col = "#00000011",
      burnin = 4,
      type = "curve",
      alpha_init = .05,
      palette = grDevices::rainbow,
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

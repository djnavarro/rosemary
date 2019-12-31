# https://www.flickr.com/photos/stringrbelle/49258650801

#' @rdname rosemary
#' @export
splash <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "splash.png")

  jasmines::use_seed(2) %>%
    jasmines::scene_delaunay(5, grain = 200) %>%
    dplyr::mutate(x = x * 15, y = y * 15) %>%
    jasmines::unfold_loop(points = 200, radius = 2) %>%
    dplyr::mutate(id = time, seed = 23) %>%
    dplyr::select(-time) %>%
    jasmines::unfold_tempest(
      scale = .2,
      iterations = 5
    ) %>%
    dplyr::mutate(order = id) %>%
    jasmines::style_ribbon(
      overlay = list(border = "#00000011"),
      burnin = 4,
      type = "curve",
      alpha = c(.05, 0),
      palette = grDevices::rainbow,
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

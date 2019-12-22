#' @rdname rosemary
#' @export
rainbow_prisms <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "rainbow_prisms.png")
  set.seed(1)

  jasmines::scene_delaunay(n = 50, grain = 500) %>%
    dplyr::filter(id %in% 4:20) %>%
    dplyr::mutate(x = x * 5, y = y * 5) %>%
    jasmines::unfold_tempest(
      iterations = 150,
      seed = 4,
      scale = .002
    ) %>%
    dplyr::mutate(order = id) %>%
    jasmines::style_ribbon(
      palette = grDevices::rainbow,
      alpha_init = .1,
      alpha_decay = .01,
      seed_col = "#ffffff33"
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

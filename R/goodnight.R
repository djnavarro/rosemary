# https://www.flickr.com/photos/stringrbelle/49258841782

#' @rdname rosemary
#' @export
goodnight <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "goodnight.png")

  set.seed(1)

  jasmines::scene_delaunay(n = 5, grain = 500) %>%
    dplyr::mutate(x = x * 2, y = y * 2) %>%
    jasmines::unfold_tempest(
      iterations = 500,
      seed = 4,
      scale = .001
    ) %>%
    dplyr::mutate(order = time) %>%
    jasmines::style_ribbon(
      background = "#333333",
      palette = jasmines::palette_manual("white"),
      seed_col = "#ffffff88",
      seed_fill = "#00000088",
      alpha_init = .5,
      alpha_decay = .01
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

# https://www.flickr.com/photos/stringrbelle/49258166143

#' @rdname rosemary
#' @export
crow_rings <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "crow_rings.png")

  jasmines::use_seed(43) %>%
    jasmines::scene_discs(points = 2000, rings = 2) %>%
    dplyr::mutate(
      x = x * 15,
      y = y * 15,
      id = 1:2000
    ) %>%
    jasmines::unfold_tempest(
      iterations = 500,
      scale = .005
    ) %>%
    dplyr::mutate(order = time) %>%
    jasmines::style_ribbon(
      alpha = c(.15, 0),
      size = 1,
      palette = jasmines::palette_manual(
        "red", "black", "black", "black", "white"
      )
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}


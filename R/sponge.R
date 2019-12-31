# https://www.flickr.com/photos/stringrbelle/49258650466

#' @rdname rosemary
#' @export
sponge <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "sponge.png")

  darken <- function(palette, scale = .5) {
    function(n = 50, alpha = 1) {
      rgbvec <- purrr::lift_dv(grDevices::rgb)
      cols <- palette(n, alpha)
      cols <- grDevices::col2rgb(cols)
      cols <- cols * scale / 256
      cols <- as.data.frame(cols)
      cols <- purrr::map_chr(cols, rgbvec)
      return(unname(cols))
    }
  }

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
      background = "darkslategray",
      discard = 4,
      type = "curve",
      alpha = c(.05, 0),
      size = 2,
      palette = darken(jasmines::palette_named("cork"), .5),
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

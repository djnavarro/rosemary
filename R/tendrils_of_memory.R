# https://www.flickr.com/photos/stringrbelle/49340684123

#' @rdname rosemary
#' @export
tendrils_of_memory <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "tendrils_of_memory.png")

  bg <- "white"
  out <- grDevices::adjustcolor(bg, .1,.9,.9,.9)

  jasmines::use_seed(10) %>%
    jasmines::scene_bubbles(n = 3, grain = 5000) %>%
    dplyr::mutate(x = x * 5, y = y * 5) %>%
    jasmines::unfold_tempest(100, .005) %>%
    jasmines::unfold_inside() %>%
    dplyr::mutate(order = 1 + time*(inside > 0)) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_adjust("grayC", out),
      alpha = .5,
      background = bg
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

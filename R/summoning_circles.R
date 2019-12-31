# https://www.flickr.com/photos/stringrbelle/49258839692

#' @rdname rosemary
#' @export
summoning_circles <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "summoning_circles.png")

  dat <- jasmines::use_seed(3) %>%
    jasmines::scene_bubbles(n = 2, grain = 50) %>%
    dplyr::mutate(x = x * 25, y = y * 25) %>%
    jasmines::unfold_meander(iterations = 100) %>%
    dplyr::select(-id) %>%
    dplyr::mutate(id = series)

  dat %>% jasmines::style_ribbon(
    alpha = c(1, 0),
    palette = jasmines::palette_named("bilbao")
  ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

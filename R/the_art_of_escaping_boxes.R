# https://www.flickr.com/photos/stringrbelle/49258650251

#' @rdname rosemary
#' @export
the_art_of_escaping_boxes <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "the_art_of_escaping_boxes.png")
  jasmines::use_seed(43) %>%
    jasmines::scene_rows(50, 50) %>%
    dplyr::mutate(
      x = x * 6,
      y = y * 6,
      seed = 80
    ) %>%
    jasmines::unfold_tempest(
      iterations = 800,
      scale = .01
    ) %>%
    dplyr::mutate(order = time) %>%
    jasmines::style_ribbon(
      alpha = c(.1, .001),
      size = 1,
      palette = jasmines::palette_named("bilbao")
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

#' @rdname rosemary
#' @export
the_art_of_escaping_boxes <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "the_art_of_escaping_boxes.png")
  set.seed(43)
  jasmines::scene_rows(50, 50) %>%
    dplyr::mutate(
      x = x * 6,
      y = y * 6
    ) %>%
    jasmines::unfold_tempest(
      iterations = 800,
      scale = .01,
      seed = 80
    ) %>%
    dplyr::mutate(order = time) %>%
    jasmines::style_ribbon(
      alpha_init = .1,
      alpha_decay = .001,
      size = 1,
      palette = jasmines::palette_named("bilbao")
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

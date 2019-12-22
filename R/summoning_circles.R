#' @rdname rosemary
#' @export
summoning_circles <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "summoning_circles.png")

  set.seed(3)

  dat <- jasmines::scene_bubbles(n = 2, grain = 50) %>%
    dplyr::mutate(x = x * 25, y = y * 25) %>%
    jasmines::unfold_meander(iterations = 100) %>%
    dplyr::select(-id) %>%
    dplyr::mutate(id = series)

  dat %>% jasmines::style_ribbon(
    alpha_init = 1,
    palette = jasmines::palette_named("bilbao")
  ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

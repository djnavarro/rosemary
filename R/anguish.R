# https://www.flickr.com/photos/stringrbelle/49341135571

#' @rdname rosemary
#' @export
anguish <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "anguish.png")

  jasmines::use_seed(1) %>%
    jasmines::scene_grid(entity = "heart", grain = 1000, size = .5) %>%
    jasmines::unfold_slice(scatter = TRUE) %>%
    jasmines::unfold_inside() %>%
    dplyr::mutate(order = 1 + ind*(inside > 0)) %>%
    jasmines::style_ribbon(jasmines::palette_adjust("blood", "wheat"), background = "wheat") %>%
    jasmines::export_image(file,  xlim = c(0,.9), ylim = c(0,.9))

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



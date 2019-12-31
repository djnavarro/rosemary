# https://www.flickr.com/photos/stringrbelle/49258840572

#' @rdname rosemary
#' @export
press_play <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "press_play.png")

  jasmines::use_seed(1) %>%
    jasmines::scene_rows(3,3,vertical = TRUE) %>%
    dplyr::mutate(
      x = (x * 2 + .2)*.75,
      y = (y + .75)*.75,
      id = 1:9
    ) %>%
    jasmines::unfold_loop(points = 600, radius = .15) %>%
    dplyr::mutate(id = ceiling(id*3 + time/200), seed = 2) %>%
    dplyr::select(-time) %>%
    jasmines::unfold_tempest(
      iterations = 100,
      scale = .001
    ) %>%
    dplyr::mutate(order = id) %>%
    jasmines::style_ribbon(
      palette = grDevices::rainbow,
      alpha = c(.2, .02)
    ) %>%
    jasmines::style_overlay(fill = "#ffffff44") %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



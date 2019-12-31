# https://www.flickr.com/photos/stringrbelle/49295974637

#' @rdname rosemary
#' @export
a_square_of_balls<- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "a_square_of_balls.png")

  jasmines::use_seed(181) %>%
    jasmines::scene_mix(n = 100, xpos = 1:40, ypos = 1:40,
            entity = "circle", grain = 200, size = 3) %>%
    jasmines::unfold_slice(iterations = 50) %>%
    dplyr::mutate(order = id) %>%
    jasmines::style_ribbon(
      palette = "base",
      background = "#ffffff",
      alpha = c(.8, .05),
    ) %>%
    jasmines::style_overlay(fill = "#ffffff33") %>%
    jasmines::export_image(
      filename = file,
      xlim = c(.2,.8),
      ylim = c(.2, .8)
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

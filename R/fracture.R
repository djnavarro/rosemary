# https://www.flickr.com/photos/stringrbelle/49297357231

#' @rdname rosemary
#' @export
fracture <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "fracture.png")

  pic <- jasmines::use_seed(181) %>%
    jasmines::scene_mix(n = 100, xpos = (1:20)*.5, ypos = (1:20)*.5,
                             entity = "line", grain = 200, size = 3) %>%
    jasmines::unfold_slice(iterations = 20) %>%
    dplyr::mutate(order = id) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("lajolla"),
      background = "black",
      alpha = c(.2, .15)
    ) %>%
    jasmines::export_image(file, xlim = c(.2,.8), ylim = c(.2,.8))

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

# https://www.flickr.com/photos/stringrbelle/49599332032/

#' @rdname rosemary
#' @export
gridlight <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "gridlight.png")

  jasmines::use_seed(242) %>%
    jasmines::scene_bubbles(
      n = 10, grain = 5000
    ) %>%
    dplyr::mutate(x = x * 5, y = y * 5) %>%
    jasmines::unfold_warp(
      iterations = 200,
      scale = .05
    ) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("base"),
      colour = "id",
      alpha = c(.2, .01),
      background = "hotpink4"
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

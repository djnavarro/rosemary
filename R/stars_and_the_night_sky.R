# https://www.flickr.com/photos/stringrbelle/49598528453/

#' @rdname rosemary
#' @export
stars_and_the_night_sky <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "stars_and_the_night_sky.png")

  jasmines::use_seed(1) %>%
    jasmines::scene_bubbles(n = 6, grain = 5000) %>%
    jasmines::unfold_warp(
      iterations = 100,
      scale = .01
    ) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("magma"),
      colour = "id",
      alpha = c(.2, .01),
      background = "wheat"
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

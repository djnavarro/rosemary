# https://www.flickr.com/photos/stringrbelle/49598642373/

#' @rdname rosemary
#' @export
wright_blue <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "wright_blue.png")

  jasmines::use_seed(241) %>%
    jasmines::scene_sticks(
      grain = 5000,
    ) %>%
    dplyr::mutate(x = x * 20, y = 5 + y * 10) %>%
    jasmines::unfold_warp(
      iterations = 200,
      scale = .03
    ) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("berlin"),
      colour = "ind",
      alpha = c(.2, .01),
      background = "cornsilk3"
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

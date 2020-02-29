# https://www.flickr.com/photos/stringrbelle/49598560473/

#' @rdname rosemary
#' @export
sometime_angry <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "sometime_angry.png")

  jasmines::use_seed(241) %>%
    jasmines::scene_sticks(
      grain = 1000,
    ) %>%
    jasmines::unfold_warp(
      iterations = 200,
      scale = .003
    ) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("lajolla"),
      colour = "ind",
      alpha = c(.1, .01),
      background = "violetred4"
    ) %>%
    jasmines::export_image(filename = file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

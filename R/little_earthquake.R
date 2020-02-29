# https://www.flickr.com/photos/stringrbelle/49599105256/

#' @rdname rosemary
#' @export
little_earthquake <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "little_earthquake.png")

  jasmines::use_seed(1) %>%
    jasmines::scene_discs(
      rings = 3, points = 10000, size = 5
    ) %>%
    dplyr::mutate(ind = 1:dplyr::n()) %>%
    jasmines::unfold_warp(
      iterations = 1,
      scale = .5,
      output = "layer"
    ) %>%
    jasmines::unfold_slice(
      iterations = 50,
      scale = .01
    ) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("vik"),
      colour = "ind",
      alpha = c(.1,.1),
      background = "oldlace"
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

# https://www.flickr.com/photos/stringrbelle/49657134547/

#' @rdname rosemary
#' @export
imprint <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "imprint.png")

  dat <- jasmines::use_seed(251) %>%
    jasmines::scene_discs(
      points = 5000,
      rings = 5,
      size = 10
    ) %>%
    jasmines::unfold_slice() %>%
    jasmines::unfold_warp(
      iterations = 20,
      scale = .1
    ) %>%
    dplyr::mutate(val = round(x) + round(y) + id)

  p <- jasmines::palette_adjust("lajolla", prefix = NULL, offset = .1*c(1,1,1,0))

  dat %>%
    jasmines::style_ribbon(
      palette = p,
      colour = "val",
      alpha = c(.2,.015),
      background = "#110000",
      type = "point",
      size = .1
    ) %>%
  jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

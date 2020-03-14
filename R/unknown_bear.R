# https://www.flickr.com/photos/stringrbelle/49656291913

#' @rdname rosemary
#' @export
unknown_bear <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "unknown_bear.png")

  jasmines::use_seed(249) %>%
    jasmines::scene_bubbles(
      n = 6,
      grain = 1000
    ) %>%
    dplyr::mutate(
      x = x*.4,
      y = y*.4
    ) %>%
    jasmines::unfold_warp(
      iterations = 500,
      scale = .01
    ) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_manual(
        "#FF0018", "#FFA52C", "#FFFF41",
        "#008018", "#0000F9", "#86007D"
      ),
      colour = "id",
      alpha = c(.2,.015),
      background = "black"
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

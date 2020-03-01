# https://www.flickr.com/photos/stringrbelle/49603229101/

#' @rdname rosemary
#' @export
paper_cuts <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "paper_cuts.png")

  jasmines::use_seed(1) %>%
    jasmines::scene_bubbles(
      n = 5,
      grain = 1000
    ) %>%
    dplyr::mutate(
      x = x*.6,
      y = y*.6
    ) %>%
    jasmines::unfold_warp(
      iterations = 500,
      scale = .01
    ) %>%
    jasmines::style_ribbon(
      palette = "blood",
      colour = "id",
      alpha = c(.5,.1),
      background = "ghostwhite"
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

# https://www.flickr.com/photos/stringrbelle/49258652176

#' @rdname rosemary
#' @export
incantations <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "incantations.png")

  jasmines::use_seed(125) %>%
  jasmines::scene_rows(
    n = 6,
    grain = 500,
    vertical = TRUE
  ) %>%
    dplyr::mutate(
      x = x * 35,
      y = y * 35
    ) %>%
    jasmines::unfold_tempest(
      iterations = 1000,
      scale = .0075
    ) %>%
    dplyr::mutate(order = time) %>%
    jasmines::style_ribbon(
      alpha = c(.125, .01),
      size = 1,
      palette = jasmines::palette_manual("red")
    ) %>%
    jasmines::style_overlay (fill = "#000000cc") %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



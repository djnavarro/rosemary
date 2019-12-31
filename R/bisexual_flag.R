# URL: https://www.flickr.com/photos/stringrbelle/49258653886

#' @rdname rosemary
#' @export
bisexual_flag <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "bisexual_flag.png")

  nrow <- 100
  ncol <- 150

  jasmines::use_seed(43) %>%
    jasmines::scene_rows(n = nrow, grain = ncol) %>%
    dplyr::mutate(
      x = x * 24,
      y = (y * 16) + 4,
      id = 1:(nrow*ncol)
    ) %>%
    jasmines::unfold_tempest(
      iterations = 50,
      scale = .005
    ) %>%
    dplyr::mutate(order = id) %>%
    jasmines::style_ribbon(
      alpha = c(.4, .01),
      size = 1,
      palette = jasmines::palette_manual(
        "#0038a8", "#0038a8", "#9b4f96", "#d60270", "#d60270"
      ),
      background = "white"
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



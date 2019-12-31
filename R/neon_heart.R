# https://www.flickr.com/photos/stringrbelle/49258840992

#' @rdname rosemary
#' @export
neon_heart <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "neon_heart.png")

  pal <- function(n, alpha = 1) {
    grDevices::rainbow(n, alpha, start = .5, end = .8)
  }

  dat <- jasmines::use_seed(2) %>%
    jasmines::entity_heart(1000) %>%
    dplyr::mutate(x = x * 8, y = y * 8, seed = 1002) %>%
    jasmines::unfold_tempest(
      iterations = 300,
      scale = .01
    ) %>%
    dplyr::mutate(order = time)

  dat %>%
    jasmines::style_ribbon(
      size = 1,
      palette = pal,
      alpha = c(.5, .01)
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



# https://www.flickr.com/photos/stringrbelle/49656416238/

#' @rdname rosemary
#' @export
social_distance_03 <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "social_distance_03.png")

  dat <- jasmines::use_seed(256) %>%
    jasmines::scene_mix(
      n = 200, xpos = 1:80, ypos = 1:80,
      grain = 200, size = 3, entity = "circle"
    ) %>%
    dplyr::mutate(x = x/5, y = y/5) %>%
    jasmines::unfold_warp(iterations = 30) %>%
    dplyr::mutate(sigh = id + ind) %>%
    dplyr::filter(time > 10) %>%
    dplyr::mutate(time = time - 10)

  pal <- jasmines::palette_adjust(
    name = "magma",
    prefix = NULL,
    red.f = .5,
    blue.f = .8,
    green.f = .8
  )

  dat %>%
    jasmines::style_ribbon(
      colour = "sigh",
      palette = pal,
      background = "ghostwhite",
      alpha = c(.1, .1)
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

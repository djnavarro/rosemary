# https://www.flickr.com/photos/stringrbelle/49657212597/


#' @rdname rosemary
#' @export
social_distance_01 <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "social_distance_01.png")

  dat <- jasmines::use_seed(255) %>%
    jasmines::scene_mix(
      n = 200, xpos = 1:80, ypos = 1:80,
      grain = 10, size = 1, entity = "circle"
    ) %>%
    jasmines::unfold_tempest(iterations = 50) %>%
    dplyr::mutate(x = x/10, y = y/10) %>%
    jasmines::unfold_warp(iterations = 30) %>%
    dplyr::mutate(sigh = id + ind)

  pal <- jasmines::palette_adjust(
    name = "rainbow",
    prefix = NULL,
    red.f = .5,
    blue.f = .8,
    green.f = .8
  )

  dat %>%
    jasmines::style_ribbon(
      colour = "sigh",
      palette = pal,
      alpha = c(.1, .1)
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

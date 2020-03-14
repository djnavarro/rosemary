# https://www.flickr.com/photos/stringrbelle/49657289171/

#' @rdname rosemary
#' @export
robot_heart <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "robot_heart.png")

  dat <- jasmines::use_seed(256) %>%
    jasmines::entity_heart(grain = 1000, size = 5) %>%
    jasmines::unfold_warp(iterations = 100) %>%
    jasmines::unfold_tempest(iterations = 50) %>%
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
      background = "#e2e8d5",
      alpha = c(1, .1)
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

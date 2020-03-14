# https://www.flickr.com/photos/stringrbelle/49656428933/

#' @rdname rosemary
#' @export
social_distance_04 <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "social_distance_04.png")

  dat <- jasmines::use_seed(256) %>%
    jasmines::scene_rows(vertical=TRUE, grain = 1000) %>%
    dplyr::mutate(ind = 1:dplyr::n(), x = x * 8, y = y * 8) %>%
    jasmines::unfold_warp(iterations = 100) %>%
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
      background = "#f2f0f7",
      alpha = c(1, .15)
    ) %>%
    jasmines::export_image(
      filename = file,
      xlim = c(.1,.9),
      ylim = c(.1, .9)
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

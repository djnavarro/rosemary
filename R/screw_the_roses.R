# https://www.flickr.com/photos/stringrbelle/49258840392

#' @rdname rosemary
#' @export
screw_the_roses <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "screw_the_roses.png")

  pal <- jasmines::palette_manual(
    "#7c0a02", "#92000a", "#880000", "#8a0303", "#8a0303"
  )

  dat <- jasmines::use_seed(2) %>%
    jasmines::scene_sticks(n = 10, grain = 200) %>%
    dplyr::mutate(x = x * 20, y = y * 20, seed = 100) %>%
    jasmines::unfold_meander(iterations = 5, output1 = "space") %>%
    jasmines::unfold_tempest(
      iterations = 40,
      scale = .0075
    )

  dat <- dat %>%
    dplyr::mutate(time = id) %>%
    dplyr::mutate(order = time)

  dat %>%
    jasmines::style_ribbon(
      type = "point",
      size = 1,
      palette = pal,
      background = "#ffe0bd",
      alpha = c(.01, 0)
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

# https://www.flickr.com/photos/stringrbelle/49261220528/

#' @rdname rosemary
#' @export
light_blades <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "light_blades.png")

  jasmines::use_seed(1) %>%
  jasmines::scene_grid(
    xpos = c(-1, 1) * 4,
    ypos = c(-1, 1) * 4,
    entity = "gaussian",
    grain = 2000
  ) %>%
    jasmines::unfold_slice(iterations=15) %>%
    dplyr::mutate(order = dplyr::case_when(
      id == 4 ~ (16 - order),
      id == 1 ~ 1,
      TRUE ~ (order + 5)
    )) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("acton"),
      background = "lightblue",
      alpha = c(.5, .1),
      size = .75
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

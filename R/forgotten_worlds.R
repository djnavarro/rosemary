#' @rdname rosemary
#' @export
forgotten_worlds <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "forgotten_worlds.png")
  set.seed(46)

  # return a whitened version of the palette
  whiten <- function(palette, scale = .5) {
    function(n = 50, alpha = 1) {
      rgbvec <- purrr::lift_dv(grDevices::rgb)
      cols <- palette(n, alpha)
      cols <- grDevices::col2rgb(cols)
      cols <- scale + cols * (1-scale) / 256
      cols <- as.data.frame(cols)
      cols <- purrr::map_chr(cols, rgbvec)
      return(unname(cols))
    }
  }

  pal <- whiten(jasmines::palette_named("berlin"), scale = .1)

  dat <- jasmines::scene_sticks(3, 30) %>%
    jasmines::unfold_meander(output1 = "space", output2 = "order") %>%
    dplyr::mutate(
      base_x = x,
      base_y = y,
      len = sqrt(x^2 + y^2) * .4
    ) %>%
    jasmines::unfold_tempest(
      output1 = "time",
      output2 = "junk",
      iterations = 1
    )

  dat <- dat %>%
    dplyr::mutate(
      x = dplyr::case_when(
        time == 1 ~ base_x,
        time == 2 ~ base_x + len * x
      ),
      y = dplyr::case_when(
        time == 1 ~ base_y,
        time == 2 ~ base_y + len * y
      )
    )

  dat %>% jasmines::style_ribbon(
    alpha_init = .3,
    size = .75,
    palette = pal
  ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

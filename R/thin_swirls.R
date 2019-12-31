# https://www.flickr.com/photos/stringrbelle/49258162748

#' @rdname rosemary
#' @export
thin_swirls <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "thin_swirls.png")

  dat <- jasmines::use_seed(46) %>%
    jasmines::scene_sticks(3, 30) %>%
    jasmines::unfold_meander(
      output1 = "space",
      output2 = "order"
    ) %>%
    dplyr::mutate(
      base_x = x,
      base_y = y,
      len = sqrt(x^2 + y^2) * .8
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
        time == 2 ~ (1-len) * base_x + len * x
      ),
      y = dplyr::case_when(
        time == 1 ~ base_y,
        time == 2 ~ (1-len) * base_y + len * y
      )
    )

  dat %>% jasmines::style_ribbon(
    alpha = c(.8, 0),
    size = .5,
    palette = jasmines::palette_named("magma")
  ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

# https://www.flickr.com/photos/stringrbelle/49258652216

#' @rdname rosemary
#' @export
ice_queen <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "ice_queen.png")

  dat <- jasmines::use_seed(123) %>%
    jasmines::entity_heart(grain = 100) %>%
    dplyr::mutate(x = x * 100, y = y * 100) %>%
    jasmines::unfold_meander(
      iterations = 300,
      output1 = "space",
      output2 = "order"
    ) %>%
    dplyr::mutate(
      base_x = x,
      base_y = y,
      len = sqrt(x^2 + y^2) * 3
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

  dat %>%
    jasmines::style_ribbon(
      alpha = c(.1, 0),
      size = .25,
      palette = jasmines::palette_manual("#ffffff33")
    ) %>%
    jasmines::style_overlay(border = "#ffffff88") %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



#' @rdname rosemary
#' @export
ice_queen <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "ice_queen.png")

  set.seed(123)

  dat <- jasmines::entity_heart(grain = 100) %>%
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

  dat %>% jasmines::style_ribbon(
    alpha_init = .1,
    size = .25,
    seed_col = "#ffffff88",
    palette = jasmines::palette_manual("#ffffff33")
  ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



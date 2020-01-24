
#' @rdname rosemary
#' @export
regret <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "regret.png")

  jasmines::use_seed(197) %>%
    jasmines::scene_delaunay(n = 35, grain = 500) %>%
    dplyr::filter(id %in% sample(max(.data$id), 20)) %>%
    dplyr::mutate(x = x * 5, y = y * 5) %>%
    jasmines::unfold_tempest(iterations = 50, scale = .015) %>%
    dplyr::mutate(order = id + time) %>%
    jasmines::style_ribbon(
      alpha = c(.3, .025),
      background = "grey40",
      palette = "grayC"
    ) %>%
    jasmines::export_image(file, xlim = c(.2,.8), ylim =c(.2, .8))

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

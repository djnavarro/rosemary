# https://www.flickr.com/photos/stringrbelle/49258165293

#' @rdname rosemary
#' @export
electric_princess <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "electric_princess.png")

  set.seed(125)
  jasmines::entity_heart(10000) %>%
    dplyr::mutate(
      x = x * 35,
      y = y * 35
    ) %>%
    jasmines::unfold_tempest(
      iterations = 150,
      scale = .1,
      seed = 125
    ) %>%
    dplyr::mutate(order = time) %>%
    jasmines::style_ribbon(
      alpha_init = .1,
      alpha_decay = .02,
      seed_fill = "#000000cc",
      size = 1,
      palette = jasmines::palette_manual("pink")
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

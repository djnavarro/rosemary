# https://www.flickr.com/photos/stringrbelle/49258651086

#' @rdname rosemary
#' @export
rainbow_prisms <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "rainbow_prisms.png")
  local_style <- old_style_ribbon()

  jasmines::use_seed(1) %>%
  jasmines::scene_delaunay(n = 50, grain = 500) %>%
    dplyr::filter(id %in% 4:20) %>%
    dplyr::mutate(x = x * 5, y = y * 5, seed = 4) %>%
    jasmines::unfold_tempest(
      iterations = 150,
      scale = .002
    ) %>%
    dplyr::mutate(order = id) %>%
    local_style(
      palette = grDevices::rainbow,
      alpha = c(.1, .01),
    ) %>%
    jasmines::style_overlay(border = "#ffffff33") %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

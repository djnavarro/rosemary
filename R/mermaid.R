# https://www.flickr.com/photos/stringrbelle/49258651951

#' @rdname rosemary
#' @export
mermaid <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "mermaid.png")

  jasmines::use_seed(1) %>%
  jasmines::scene_delaunay(6, 500) %>%
    jasmines::unfold_slice(scatter = TRUE) %>%
    jasmines::style_ribbon(
      palette = grDevices::gray.colors,
      alpha = c(.1, 0),
      background = "white"
    ) %>%
    jasmines::style_overlay(border = "#ffffffaa") %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



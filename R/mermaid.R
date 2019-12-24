# https://www.flickr.com/photos/stringrbelle/49258651951

#' @rdname rosemary
#' @export
mermaid <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "mermaid.png")

  set.seed(1)
  jasmines::scene_delaunay(6, 500) %>%
    jasmines::unfold_slice() %>%
    jasmines::style_ribbon(
      palette = grDevices::gray.colors,
      seed_col = "#ffffffaa",
      alpha_init = .1,
      background = "white"
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



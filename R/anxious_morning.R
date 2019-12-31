# URL: https://www.flickr.com/photos/stringrbelle/49258843602/

#' @rdname rosemary
#' @export
anxious_morning <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "anxious_morning.png")

  jasmines::use_seed(167) %>%
    jasmines::scene_delaunay(50, 50) %>%
    dplyr::mutate(x = x * 3, y = y * 3) %>%
    jasmines::unfold_tempest(iterations = 20, scale = .01) %>%
    jasmines::style_ribbon(
      background = "ghostwhite",
      palette = jasmines::palette_manual(
        "grey","grey","black","black", "white"
      )
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

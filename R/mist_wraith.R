# https://www.flickr.com/photos/stringrbelle/49258841377

#' @rdname rosemary
#' @export
mist_wraith <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "mist_wraith.png")

  jasmines::use_seed(169) %>%
  jasmines::scene_delaunay(50, 500) %>%
    dplyr::mutate(x = x * 3, y = y * 3) %>%
    jasmines::unfold_tempest(
      iterations = 20,
      scale = .005) %>%
    dplyr::mutate(order = time) %>%
    jasmines::style_ribbon(
      background = "ghostwhite",
      alpha = c(.05, .01),
      palette = jasmines::palette_manual(
        "white","white","black","grey", "grey"
      )
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



# https://www.flickr.com/photos/stringrbelle/49258162383 (bright)
# https://www.flickr.com/photos/stringrbelle/49258162383 (flat)

#' @rdname rosemary
#' @export
wispy_heart <- function(dir = NULL, version = 0, ...) {

  dir <- check_dir(dir)

  wsp_hrt <- function(palette, file) {

    jasmines::use_seed(100) %>%
      jasmines::entity_heart(200) %>%
      dplyr::mutate(x = x * 5, y = y * 5) %>%
      jasmines::unfold_meander(iterations = 20, output1 = "space") %>%
      jasmines::unfold_tempest(
        iterations = 300,
        scale = .001
      ) %>%
      dplyr::mutate(order = time) %>%
      jasmines::style_ribbon(
        palette = palette,
        alpha = c(.8, .015)
      ) %>%
      jasmines::export_image(file)

    cat("image written to:", file, "\n")
  }

  if(version %in% c(0, 1)) {
    wsp_hrt(
      palette = grDevices::rainbow,
      file = file.path(dir, "wispy_heart_bright.png")
    )
  }

  if(version %in% c(0, 2)) {
    wsp_hrt(
      palette = jasmines::palette_manual("white"),
      file = file.path(dir, "wispy_heart_flat.png")
    )
  }

  return(invisible(NULL))
}



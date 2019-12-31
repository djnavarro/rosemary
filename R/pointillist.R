# https://www.flickr.com/photos/stringrbelle/49258840772/

#' @rdname rosemary
#' @export
pointillist <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "pointillist.png")


  jasmines::use_seed(1) %>%
    jasmines::scene_rows(2, 2) %>%
    dplyr::mutate(
      x = (x + .25)/2,
      y = (y - .25)/2
    ) %>%
    jasmines::unfold_meander(
      iterations = 500,
      output1 = "space",
      output2 = "id"
    ) %>%
    jasmines::unfold_tempest(
      iterations = 50,
      scale = .01,
      scatter = TRUE
    ) %>%
    jasmines::style_ribbon(
      type = "point",
      alpha = c(.3, .1),
      size = .25,
      palette = jasmines::palette_named("lajolla")
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



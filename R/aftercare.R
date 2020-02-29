# https://www.flickr.com/photos/stringrbelle/49599373472/

#' @rdname rosemary
#' @export
aftercare <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "aftercare.png")

  jasmines::use_seed(1) %>%
    jasmines::entity_heart(5000, size = 3) %>%
    dplyr::mutate(ind = 1:dplyr::n()) %>%
    jasmines::unfold_warp(
      iterations = 2,
      scale = .5,
      output = "layer"
    ) %>%
    jasmines::unfold_slice(
      iterations = 50,
      scale = .01
    ) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("vik"),
      colour = "ind",
      alpha = c(.1,.1),
      background = "oldlace"
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

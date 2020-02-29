# https://www.flickr.com/photos/stringrbelle/49598499858/

#' @rdname rosemary
#' @export
purple_heart <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "purple_heart.png")

  jasmines::use_seed(224) %>%
    jasmines::entity_heart(10000) %>%
    jasmines::unfold_tempest(iterations = 200, scale = .005) %>%
    jasmines::unfold_inside() %>%
    jasmines::unfold_worley() %>%
    dplyr::mutate(order = 1 + order(order) * (inside > 0)) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_manual(
        "#000000FF", "#181818", "#D3D3D3", "#88398A",
        "#FFFFFF", "#562457"),
      background = "white"
    ) %>%
    jasmines::export_image(
      filename = file,
      xlim = c(.25,.8),
      ylim = c(.25,.8)
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

# https://www.flickr.com/photos/stringrbelle/49598996471

#' @rdname rosemary
#' @export
bloody_valentine <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "bloody_valentine.png")

  jasmines::use_seed(224) %>%
    jasmines::entity_heart(10000) %>%
    jasmines::unfold_tempest(iterations = 200, scale = .005) %>%
    jasmines::unfold_inside() %>%
    jasmines::unfold_worley() %>%
    dplyr::mutate(order = 1 + order(order) * (inside > 0)) %>%
    jasmines::style_ribbon(
      palette = "blood",
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

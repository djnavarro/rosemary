# URL: https://www.flickr.com/photos/stringrbelle/49258843412

#' @rdname rosemary
#' @export
arrival_in_montreal <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "arrival_in_montreal.png")

  base <- jasmines::use_seed(4) %>%
    jasmines::entity_heart(7000) %>%
    jasmines::unfold_tempest(iterations = 5, scale = .1, scatter = TRUE) %>%
    jasmines::style_ribbon(
      type = "curve",
      curvature = 1,
      size = .25,
      alpha= c(.2, .03),
      background = "black",
      palette = jasmines::palette_manual("grey")  # blue: "#3d85c6"
    )  %>%
    jasmines::style_overlay(border = "#ffffff88", fill = "#22222288") %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

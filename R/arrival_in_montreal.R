# URL: https://www.flickr.com/photos/stringrbelle/49258843412

#' @rdname rosemary
#' @export
arrival_in_montreal <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "arrival_in_montreal.png")

  set.seed(4)

  base <- jasmines::entity_heart(7000) %>%
    jasmines::unfold_tempest(iterations = 5, scale = .1) %>%
    jasmines::style_ribbon(
      burnin = 1,
      type = "curve",
      curvature = 1,
      size = .25,
      alpha_init = .2,
      alpha_decay = .03,
      background = "black",
      seed_col = "#ffffff88",
      seed_fill = "#22222288",  # blue version: "#3d85c699",
      palette = jasmines::palette_manual("grey")  # blue: "#3d85c6"
    )  %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

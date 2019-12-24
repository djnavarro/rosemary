# https://www.flickr.com/photos/stringrbelle/49258842217

#' @rdname rosemary
#' @export
eclipse <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "eclipse.png")

  set.seed(460)

  jasmines::entity_circle(grain = 1000) %>%
    jasmines::unfold_tempest(iterations = 2000, scale = 0.005) %>%
    jasmines::style_ribbon(
      seed_fill = "black",
      alpha_decay = .001,
      burnin = 600,
      palette = jasmines::palette_named("lajolla")
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}


# https://www.flickr.com/photos/stringrbelle/49258164093

#' @rdname rosemary
#' @export
orange_tear <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "orange_tear.png")

  jasmines::use_seed(3) %>%
    jasmines::entity_droplet(grain = 1000) %>%
    jasmines::unfold_tempest(
      iterations = 300,
      scale = .002
    ) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_manual("#ff6000"),
      alpha = c(.5, .015),
    ) %>%
    jasmines::style_overlay(border = "#ff600066", fill = "#00000088") %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



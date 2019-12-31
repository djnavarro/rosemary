# https://www.flickr.com/photos/stringrbelle/49290214163

#' @rdname rosemary
#' @export
sea_snakes <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "sea_snakes.png")

  jasmines::use_seed(1) %>%
    jasmines::entity_gaussian(5000) %>%
    jasmines::unfold_tempest() %>%
    jasmines::unfold_worley(frequency = 4) %>%
    jasmines::style_ribbon(palette = jasmines::palette_named("hawaii")) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

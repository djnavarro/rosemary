#' @rdname rosemary
#' @export
sea_snakes <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "sea_snakes.png")

  set.seed(1)
  jasmines::entity_gaussian(5000) %>%
    jasmines::unfold_tempest(seed = 1) %>%
    jasmines::unfold_worley(seed = 1, frequency = 4) %>%
    jasmines::style_ribbon(palette = jasmines::palette_named("hawaii")) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

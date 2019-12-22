#' @rdname rosemary
#' @export
constellations <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "constellations.png")
  set.seed(4)

  jasmines::scene_bubbles(n = 3, grain = 100) %>%
    jasmines::unfold_tempest(iterations = 500,  scale = 0.005) %>%
    jasmines::style_ribbon(
      seed_fill = "#ffffff33",
      seed_col = "#ffffff55",
      alpha_init = 1,
      alpha_decay = .0015,
      burnin = 300,
      palette = jasmines::palette_named("berlin")
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



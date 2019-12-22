#' @rdname rosemary
#' @export
orange_tear <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "orange_tear.png")

  jasmines::entity_droplet(grain = 1000) %>%
    jasmines::unfold_tempest(
      seed = 3,
      iterations = 300,
      scale = .002
    ) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_manual("#ff6000"),
      alpha_init = .5,
      alpha_decay = .015,
      seed_col = "#ff600066",
      seed_fill = "#00000088"
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



#' @rdname rosemary
#' @export
heart_sketch <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "heart_sketch.png")

  set.seed(169)

  jasmines::entity_heart(1000) %>%
    dplyr::mutate(x = x * .5, y = y * .5) %>%
    jasmines::unfold_tempest(
      seed = 169,
      iterations = 1000,
      scale = .001) %>%
    jasmines::style_ribbon(
      background = "ghostwhite",
      alpha_init = 1,
      seed_col = "#f8f8ff",
      seed_linewidth = 1,
      seed_fill = "#f8f8ffcc",
      alpha_decay = 0,
      palette = jasmines::palette_manual(
        "grey10", "grey10", "grey10", "grey10",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "grey10", "grey10", "grey10", "grey10",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "grey10", "grey10", "grey10", "grey10",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
        "grey10", "grey10", "grey10", "grey10"
      )
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

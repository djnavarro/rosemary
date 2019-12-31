# https://www.flickr.com/photos/stringrbelle/49258652296

#' @rdname rosemary
#' @export
heart_sketch <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "heart_sketch.png")

  jasmines::use_seed(169) %>%
  jasmines::entity_heart(1000) %>%
    dplyr::mutate(x = x * .5, y = y * .5) %>%
    jasmines::unfold_tempest(
      iterations = 1000,
      scale = .001) %>%
    jasmines::style_ribbon(
      background = "ghostwhite",
      alpha = c(1, 0),
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
    ) %>%
    jasmines::style_overlay(border = "#f8f8ff", fill = "#f8f8ffcc", linewidth = 1) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

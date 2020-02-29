# https://www.flickr.com/photos/stringrbelle/49598560398/

#' @rdname rosemary
#' @export
sometime_anxious <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "sometime_anxious.png")

  jasmines::use_seed(240) %>%
    jasmines::scene_grid(
      x = c(-.5,2.5),
      y = c(-.5,2.5),
      grain = 10000,
      entity = "heart"
    ) %>%
    jasmines::unfold_warp(
      iterations = 200,
      scale = .003
    ) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("viridis"),
      colour = "ind",
      alpha = c(.1, .01),
      background = "whitesmoke"
    ) %>%
    jasmines::export_image(filename = file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

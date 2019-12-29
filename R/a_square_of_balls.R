
#' @rdname rosemary
#' @export
a_square_of_balls<- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "a_square_of_balls.png")

  set.seed(181)
  jasmines::scene_mix(n = 100, xpos = 1:40, ypos = 1:40,
            entity = "circle", grain = 500, size = 3) %>%
    jasmines::unfold_slice(seed = 181, iterations = 50) %>%
    dplyr::mutate(order = id) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("base"),
      seed_fill = "#00000033",
      background = "white",
      alpha_decay = .1
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

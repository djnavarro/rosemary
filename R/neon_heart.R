#' @rdname rosemary
#' @export
neon_heart <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "neon_heart.png")

  set.seed(2)

  pal <- function(n, alpha = 1) {
    grDevices::rainbow(n, alpha, start = .5, end = .8)
  }

  dat <- jasmines::entity_heart(1000) %>%
    dplyr::mutate(x = x * 8, y = y * 8) %>%
    jasmines::unfold_tempest(
      seed = 1002,
      iterations = 300,
      scale = .01
    ) %>%
    dplyr::mutate(order = time)

  dat %>%
    jasmines::style_ribbon(
      size = 1,
      palette = pal,
      alpha_init = .5,
      alpha_decay = .01,
    ) %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



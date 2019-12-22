#' @rdname rosemary
#' @export
bisexual_flag <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "bisexual_flag.png")
  set.seed(43)

  nrow <- 100
  ncol <- 150

  dat <- jasmines::scene_rows(n = nrow, grain = ncol) %>%
    dplyr::mutate(
      x = x * 24,
      y = (y * 16) + 4,
      id = 1:(nrow*ncol)
    ) %>%
    jasmines::unfold_tempest(
      iterations = 50,
      scale = .005,
      seed = 43
    ) %>%
    dplyr::mutate(order = id)

  pic <- dat %>%
    jasmines::style_ribbon(
      alpha_init = .4,
      alpha_decay = .01,
      size = 1,
      palette = jasmines::palette_manual(
        "#0038a8", "#0038a8", "#9b4f96", "#d60270", "#d60270"
      ),
      background = "white"
    )

  pic %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



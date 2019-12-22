#' @rdname rosemary
#' @export
transgender_flag <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "transgender_flag.png")

set.seed(43)

dat <- jasmines::scene_rows(n = 4, grain = 500) %>%
  dplyr::mutate(
    x = x * 3,
    y = y * 3,
    id = 1:2000
  ) %>%
  jasmines::unfold_tempest(
    iterations = 500,
    scale = .001,
    seed = 43
  ) %>%
  dplyr::mutate(order = time)

pic <- dat %>%
  jasmines::style_ribbon(
    alpha_init = .2,
    alpha_decay = 0,
    size = 1,
    palette = jasmines::palette_manual(
      "white", "black", "black", "black", "#f7a8b8",
      "black", "black", "black", "#55cdfc"
    )
  )

pic %>% jasmines::export_image(file)

cat("image written to:", file, "\n")
return(invisible(NULL))
}


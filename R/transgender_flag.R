# https://www.flickr.com/photos/stringrbelle/49258839297

#' @rdname rosemary
#' @export
transgender_flag <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "transgender_flag.png")

dat <- jasmines::use_seed(43) %>%
  jasmines::scene_rows(n = 4, grain = 500) %>%
  dplyr::mutate(
    x = x * 3,
    y = y * 3,
    id = 1:2000
  ) %>%
  jasmines::unfold_tempest(
    iterations = 500,
    scale = .001
  ) %>%
  dplyr::mutate(order = time)

pic <- dat %>%
  jasmines::style_ribbon(
    alpha = c(.2, 0),
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


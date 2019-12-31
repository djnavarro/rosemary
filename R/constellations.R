# https://www.flickr.com/photos/stringrbelle/49258842817

#' @rdname rosemary
#' @export
constellations <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "constellations.png")
  dat <- jasmines::use_seed(4) %>%
    jasmines::scene_bubbles(n = 3, grain = 100) %>%
    jasmines::unfold_tempest(iterations = 500, scale = 0.005, scatter = TRUE)

  seed <- extract_seed(dat)

  pic <- dat %>%
    jasmines::style_ribbon(
      discard = 300,
      alpha = c(1, .0015),
      palette = jasmines::palette_named("berlin")
    ) %>%
    jasmines::style_overlay(
      data = seed,
      border = "#ffffff55",
      fill = "#ffffff33"
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

extract_seed <- function(dat) {
  seed <- dat %>% dplyr::filter(time == 1)

  # min, max
  xmin <- min(dat$x)
  xmax <- max(dat$x)
  ymin <- min(dat$y)
  ymax <- max(dat$y)

  # force to the same scale
  xmin <- min(xmin, ymin)
  xmax <- max(xmax, ymax)
  ymin <- xmin
  ymax <- xmax

  # normalise
  seed <- seed %>% dplyr::mutate(
    x = (x - xmin) / (xmax - xmin),
    y = (y - ymin) / (ymax - ymin)
  )
  return(seed)
}




# https://www.flickr.com/photos/stringrbelle/49258651741 (grey)
# https://www.flickr.com/photos/stringrbelle/49258164563 (rainbow)
# https://www.flickr.com/photos/stringrbelle/49258841042 (shuffled)

#' @rdname rosemary
#' @export
molten_heart <- function(dir = NULL, version = 0, ...) {

  dir <- check_dir(dir)

  molten_heart <- function(palette, shuffle, file) {

    dat <- jasmines::entity_heart(1000) %>%
      dplyr::mutate(
        x = x * 2,
        y = y * 2
      ) %>%
      jasmines::unfold_tempest(
        iterations = 40,
        scale = .01,
        seed = 125
      )

    if(shuffle == FALSE) {
      dat <- dat %>% dplyr::mutate(order = time)
    }

    dat %>%
      jasmines::style_ribbon(
        alpha_init = .8,
        alpha_decay = .1,
        size = 1,
        palette = palette
      ) %>%
      jasmines::export_image(file)

    cat("image written to:", file, "\n")
  }

  if(version %in% c(0,1)) {

    set.seed(125)
    molten_heart(
      palette = jasmines::palette_named("berlin"),
      shuffle = TRUE,
      file = file.path(dir, "molten_heart_shuffled.png")
    )
  }

  if(version %in% c(0,2)) {
    set.seed(125)
    molten_heart(
      palette = jasmines::palette_manual("grey"),
      shuffle = FALSE,
      file = file.path(dir, "molten_heart_grey.png")
    )
  }

  if(version %in% c(0,3)) {
    set.seed(125)
    molten_heart(
      palette = grDevices::rainbow,
      shuffle = FALSE,
      file = file.path(dir, "molten_heart_rainbow.png")
    )
  }

  return(invisible(NULL))
}



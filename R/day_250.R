# https://www.flickr.com/photos/stringrbelle/49657192312/

#' @rdname rosemary
#' @export
day_250 <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "day_250.png")

  base <- jasmines::use_seed(250) %>%
    jasmines::entity_heart(1000)

  #bck <- "#e6e6fa"
  bck <- "white"

  dat <- base %>%
    jasmines::unfold_tempest(iterations = 50, scale = .01, output1 = "tempest") %>%
    jasmines::unfold_warp(iterations = 20, scale = .1, output = "warp") %>%
    dplyr::mutate(time = (tempest - 1)*21 + warp) %>%
    dplyr::arrange(time)

  dat %>%
    jasmines::style_ribbon(
      palette = "viridis",
      background = bck,
      colour = "warp",
      alpha = c(.1, .01)
    ) %>%
    jasmines::export_image(
      filename = file
    )

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}

library(jasmines)

#' @rdname rosemary
#' @export
one_art_please <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "one_art_please.png")


  pal <- function(n, alpha = 1, ...) {
    f <- jasmines::palette_named("base")
    c("#00000088", f(n = n-1, alpha = alpha))
  }

  pic <- jasmines::use_seed(1) %>%
    jasmines::scene_grid(1:10, 1:10, grain = 200) %>%
    jasmines::unfold_slice() %>%
    jasmines::unfold_inside() %>%
    dplyr::mutate(order = 1 + (inside > 0) * id) %>%
    jasmines::style_ribbon(palette = pal) %>%
    jasmines::export_image(file, xlim = c(.125,.875), ylim = c(.125,.875))

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}



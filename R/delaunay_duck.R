# https://www.flickr.com/photos/stringrbelle/49258842457

#' @rdname rosemary
#' @export
delaunay_duck <- function(dir = NULL, ...) {

   dir <- check_dir(dir)
   file <- file.path(dir, "delaunay_duck.png")

   dat <- jasmines::use_seed(4) %>%
      jasmines::scene_delaunay(n = 20, grain = 1000) %>%
      dplyr::filter(id %in% sample(max(id), ceiling(max(id)*.4))) %>%
      dplyr::mutate(x = x * 5, y = y * 5, seed = 43) %>%
      jasmines::unfold_tempest(iterations = 100, scale = .0075) %>%
      dplyr::mutate(order = time)

   pic <- dat %>%
      jasmines::style_ribbon(
         palette = jasmines::palette_named("ropensci", type = "whitened"),
         alpha = c(1, .03),
         background = "ghostwhite"
      ) %>%
      jasmines::style_overlay(border = "#407070cc", fill = "#8BD3DA66", linewidth = 1) %>%
      jasmines::export_image(file)

   cat("image written to:", file, "\n")
   return(invisible(NULL))
}


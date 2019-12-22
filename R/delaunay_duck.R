#' @rdname rosemary
#' @export
delaunay_duck <- function(dir = NULL, ...) {

   dir <- check_dir(dir)
   file <- file.path(dir, "delaunay_duck.png")

   set.seed(4)
   dat <- jasmines::scene_delaunay(n = 20, grain = 1000) %>%
      dplyr::filter(id %in% sample(max(id), ceiling(max(id)*.4))) %>%
      dplyr::mutate(x = x * 5, y = y * 5) %>%
      jasmines::unfold_tempest(iterations = 100, seed = 43, scale = .0075) %>%
      dplyr::mutate(order = time)

   pic <- dat %>%
      jasmines::style_ribbon(
         palette = jasmines::palette_named("ropensci", type = "whitened"),
         alpha_decay = .03,
         alpha_init = 1,
         background = "ghostwhite",
         seed_fill = "#8BD3DA66",
         seed_col = "#407070cc",
         seed_linewidth = 1
      ) %>%  jasmines::export_image(file)

   cat("image written to:", file, "\n")
   return(invisible(NULL))
}


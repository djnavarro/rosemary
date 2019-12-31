# https://www.flickr.com/photos/stringrbelle/49258166008 (light)
# https://www.flickr.com/photos/stringrbelle/49258653196 (rainbow)

#' @rdname rosemary
#' @export
cubismic <- function(dir = NULL, version = 0, ...) {

  dir <- check_dir(dir)
  local_style <- old_style_ribbon()

  if(version %in% c(0,1)) {

    file <- file.path(dir, "cubismic_light.png")
    jasmines::use_seed(435) %>%
      jasmines::scene_delaunay(6, 500) %>%
      jasmines::unfold_slice(scatter = TRUE) %>%
      local_style(
        palette = jasmines::palette_named("bilbao"),
        alpha= c(.1, 0),
        background = "grey10"
      ) %>%
      jasmines::style_overlay(border = "#ffffffaa") %>%
      jasmines::export_image(file)
    cat("image written to:", file, "\n")

  }

  if(version %in% c(0,2)) {

    file <- file.path(dir, "cubismic_rainbow.png")
    jasmines::use_seed(435) %>%
      jasmines::scene_delaunay(6, 500) %>%
      jasmines::unfold_slice(scatter = TRUE) %>%
      local_style(
        palette = grDevices::rainbow,
        alpha= c(.1, 0),
        background = "#444466"
      ) %>%
      jasmines::style_overlay(border = "#ffffffaa") %>%
      jasmines::export_image(file)
    cat("image written to:", file, "\n")

  }

  return(invisible(NULL))
}





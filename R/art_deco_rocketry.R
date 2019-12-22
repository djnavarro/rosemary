#' @rdname rosemary
#' @export
art_deco_rocketry <- function(dir = NULL, version = 0, ...) {

  dir <- check_dir(dir)

  set.seed(1)

  rocketry <- function(palette, background, file) {

    jasmines::entity_circle(grain = 2000) %>%
      jasmines::unfold_slice(
        iterations = 50,
        scale = .125,
        seed = 1,
        output1 = "time",
        output2 = "order") %>%
      jasmines::style_ribbon(
        background = background,
        alpha_init = .5,
        alpha_decay = .05,
        palette = palette
      ) %>%
      jasmines::export_image(file)

  }

  if(version %in% c(0,1)) {
    file <- file.path(dir, "art_deco_rocketry_light.png")
    rocketry(
      palette = jasmines::palette_manual(
        "grey40", "ghostwhite", "ghostwhite",
        "grey20", "ghostwhite"),
      background = "ghostwhite",
      file = file
    )
    cat("image written to:", file, "\n")
  }

  if(version %in% c(0,2)) {
    file <- file.path(dir, "art_deco_rocketry_dark.png")
    rocketry(
      palette = jasmines::palette_manual(
        "grey", "black", "black",
        "grey80", "black"),
      background = "black",
      file = file
    )
    cat("image written to:", file, "\n")
  }

  return(invisible(NULL))
}




#' @rdname rosemary
#' @export
nine_hearts <- function(dir = NULL, ...) {

 dir <- check_dir(dir)
 file <- file.path(dir, "nine_hearts.png")

 jasmines::use_seed(201) %>%
   jasmines::scene_grid((1:3)*2, (1:3)*2, entity = "heart", grain = 5000) %>%
   jasmines::unfold_tempest(iterations = 20) %>%
   jasmines::unfold_worley() %>%
   jasmines::unfold_inside() %>%
   dplyr::mutate(order = 1 + (inside > 0)*order(order)) %>%
   jasmines::style_ribbon(jasmines::palette_adjust("rainbow", "#22222222")) %>%
   jasmines::style_overlay(fill = "#eeeeee22") %>%
   jasmines::export_image(file, xlim = c(.1,.9), ylim = c(.1,.9))
  cat("image written to:", file, "\n")
  return(invisible(NULL))
}

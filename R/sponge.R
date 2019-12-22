library(jasmines)
library(dplyr)
set.seed(2)

# return a darkened version of the palette
darken <- function(palette, scale = .5) {
  function(n = 50, alpha = 1) {
    rgbvec <- purrr::lift_dv(rgb)
    cols <- palette(n, alpha)
    cols <- col2rgb(cols)
    cols <- cols * scale / 256
    cols <- as.data.frame(cols)
    cols <- purrr::map_chr(cols, rgbvec)
    return(unname(cols))
  }
}

scene_delaunay(5, grain = 200) %>%
#  filter(id %in% 1:4) %>%
  mutate(x = x * 15, y = y * 15) %>%
  unfold_loop(points = 200, radius = 2) %>%
  mutate(id = time) %>%
  select(-time) %>%
  unfold_tempest(
    scale = .2,
    iterations = 5,
    seed = 23
  ) %>%
  mutate(order = id) %>%
  style_ribbon(
    #seed_col = "#00000011",
    background = "darkslategray",
    burnin = 4,
    type = "curve",
    alpha_init = .05,
    size = 2,
    palette = darken(palette_scico(palette="cork"), .5),
  ) %>%
  export_image(here::here("temp","sponge.png"))
  #export_image("~/Desktop/sponge.png")

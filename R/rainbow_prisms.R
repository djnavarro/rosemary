library(jasmines)
library(dplyr)
set.seed(1)

scene_delaunay(n = 50, grain = 500) %>%
  filter(id %in% 4:20) %>%
  mutate(x = x * 5, y = y * 5) %>%
  unfold_tempest(
    iterations = 150,
    seed = 4,
    scale = .002
  ) %>%
  mutate(order = id) %>%
  style_ribbon(
    palette = rainbow,
    alpha_init = .1,
    alpha_decay = .01,
    seed_col = "#ffffff33"
  ) %>%
  export_image(here::here("temp","rainbow_prisms.png"))
  #export_image("~/Desktop/rainbow_prisms.png")

library(jasmines)
library(dplyr)
set.seed(2)

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
    seed_col = "#00000011",
    burnin = 4,
    type = "curve",
    alpha_init = .05,
    palette = rainbow,
  ) %>%
  export_image(here::here("temp","splash.png"))
  #export_image("~/Desktop/splash.png")

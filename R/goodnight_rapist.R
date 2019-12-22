library(jasmines)
library(dplyr)
set.seed(1)

scene_delaunay(n = 5, grain = 500) %>%
  mutate(x = x * 2, y = y * 2) %>%
  unfold_tempest(
    iterations = 500,
    seed = 4,
    scale = .001
  ) %>%
  mutate(order = time) %>%
  style_ribbon(
    background = "#333333",
    palette = palette_manual("white"),
    seed_col = "#ffffff88",
    seed_fill = "#00000088",
    alpha_init = .5,
    alpha_decay = .01
  ) %>%
  export_image(here::here("temp","goodnight_rapist.png"))  
  #export_image("~/Desktop/goodnight_rapist.png")

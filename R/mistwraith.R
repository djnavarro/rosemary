library(jasmines)
library(dplyr)
set.seed(169)

scene_delaunay(50, 500) %>%
  mutate(x = x * 3, y = y * 3) %>%
  unfold_tempest(
    seed = 169,
    iterations = 20,
    scale = .005) %>%
  mutate(order = time) %>%
  style_ribbon(
    background = "ghostwhite",
    alpha_init = .05,
    alpha_decay = .01,
    palette = palette_manual(
      "white","white","black","grey", "grey"
    )
  ) %>%
  export_image(here::here("temp","mistwraith.png"))  
  #export_image("~/Desktop/mistwraith.png")

library(jasmines)
library(dplyr)
set.seed(167)

scene_delaunay(50, 50) %>%
  mutate(x = x * 3, y = y * 3) %>%
  unfold_tempest(
    seed = 167,
    iterations = 20,
    scale = .01) %>%
  style_ribbon(
    background = "ghostwhite",
    palette = palette_manual(
      "grey","grey","black","black", "white"
    )
  ) %>%
  export_image(here::here("temp","anxious_morning.png"))

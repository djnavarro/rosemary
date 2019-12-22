library(jasmines)
library(dplyr)
set.seed(43)

dat <- scene_discs(points = 2000, rings = 2) %>%
  mutate(
    x = x * 15,
    y = y * 15,
    id = 1:2000
  ) %>%
  unfold_tempest(
    iterations = 500,
    scale = .005,
    seed = 43
  ) %>%
  mutate(order = time)

pic <- dat %>%
  style_ribbon(
    alpha_init = .15,
    alpha_decay = 0,
    size = 1,
    palette = palette_manual(
      "red", "black", "black", "black", "white"
    )
  )

pic %>% export_image(here::here("temp","crow_rings.png"))



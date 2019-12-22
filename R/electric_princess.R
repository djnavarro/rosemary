library(jasmines)
library(dplyr)
set.seed(125)
entity_heart(10000) %>%
  mutate(
    x = x * 35,
    y = y * 35
  ) %>%
  unfold_tempest(
    iterations = 150,
    scale = .1,
    seed = 125
  ) %>%
  mutate(order = time) %>%
  style_ribbon(
    alpha_init = .1,
    alpha_decay = .02,
    seed_fill = "#000000cc",
    size = 1,
    palette = palette_manual("pink")
  ) %>%
  export_image(here::here("temp","electric_princess.png"))
  #export_image("~/Desktop/electric_princess.png")


library(jasmines)
library(dplyr)
set.seed(125)
scene_rows(
  n = 6,
  grain = 500,
  vertical = TRUE
) %>%
  mutate(
    x = x * 35,
    y = y * 35
  ) %>%
  unfold_tempest(
    iterations = 1000,
    scale = .0075,
    seed = 125
  ) %>%
  mutate(order = time) %>%
  style_ribbon(
    alpha_init = .125,
    alpha_decay = .01,
    seed_fill = "#000000cc",
    size = 1,
    palette = palette_manual("red")
  ) %>%
  export_image(here::here("temp","incantations.png"))
  #export_image("~/Desktop/incantations.png")

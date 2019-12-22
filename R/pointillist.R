library(jasmines)
library(dplyr)
set.seed(1)

scene_rows(2, 2) %>%
  mutate(
    x = (x + .25)/2,
    y = (y - .25)/2
  ) %>%
  unfold_meander(
    iterations = 500,
    output1 = "space",
    output2 = "id"
  ) %>%
  unfold_tempest(
    iterations = 50,
    scale = .01
  ) %>%
  style_ribbon(
    type = "point",
    alpha_init = .3,
    alpha_decay = .1,
    size = .25,
    palette = palette_scico(palette = "lajolla")
  ) %>%
  export_image(here::here("temp","pointillist.png"))

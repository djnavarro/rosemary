library(jasmines)
library(dplyr)


set.seed(1)
scene_rows(3,3,vertical = TRUE) %>%
  mutate(
    x = (x * 2 + .2)*.75,
    y = (y + .75)*.75,
    id = 1:9
  ) %>%
  unfold_loop(points = 600, radius = .15) %>%
  mutate(id = ceiling(id*3 + time/200)) %>%
  select(-time) %>%
  unfold_tempest(
    seed = 2,
    iterations = 100,
    scale = .001
  ) %>%
  mutate(order = id) %>%
  style_ribbon(
    seed_fill = "#ffffff44",
    palette = rainbow,
    alpha_init = .2,
    alpha_decay = .02,
  ) %>%
  export_image(here::here("temp","press_play.png"))  
  #export_image("~/Desktop/press_play.png")

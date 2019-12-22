library(jasmines)
library(dplyr)
set.seed(126)
entity_heart(1500) %>%
  mutate(x = x * 1.5, y = y * 1.5) %>%
  unfold_tempest(iterations = 2, scale = .1) %>%
  style_ribbon(
    type = "curve",
    alpha_init = .2,
    size = .5,
    palette = rainbow) %>%
  export_image(here::here("temp","warped_heart.png"))  
  #export_image("~/Desktop/warped_heart.png")

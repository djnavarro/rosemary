library(jasmines)
library(dplyr)
set.seed(2)

pal <- function(n, alpha = 1) {
  rainbow(n, alpha, start = .5, end = .8)
}

dat <- scene_bubbles(3, 1000) %>%
  mutate(x = x * 25, y = y * 25) %>%
  unfold_tempest(
    seed = 1001,
    iterations = 300,
    scale = .01
  ) %>%
  mutate(order = time)

dat %>%
  style_ribbon(
    size = 1,
    palette = pal,
    alpha_init = .5,
    alpha_decay = .01,
  ) %>%
  export_image(here::here("temp","neon_lights.png"))  
  #export_image("~/Desktop/neon_lights.png")

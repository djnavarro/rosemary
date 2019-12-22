library(jasmines)
library(dplyr)
set.seed(2)

pal <- function(n, alpha = 1) {
  rainbow(n, alpha, start = .5, end = .8)
}

dat <- entity_heart(1000) %>%
  mutate(x = x * 8, y = y * 8) %>%
  unfold_tempest(
    seed = 1002,
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
  export_image(here::here("temp","neon_heart.png"))  
  #export_image("~/Desktop/neon_heart.png")

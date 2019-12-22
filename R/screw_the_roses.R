library(jasmines)
library(dplyr)
set.seed(100)

dat <- scene_sticks(n = 10, grain = 1000) %>%
  mutate(x = x * 20, y = y * 20) %>%
  unfold_meander(iterations = 5, output1 = "space") %>%
  unfold_tempest(
    seed = 100,
    iterations = 60,
    scale = .0075
  )

dat <- dat %>% mutate(time = id)

dat %>%
  style_ribbon(
    type = "point",
    size = 1,
    palette = rainbow,
    alpha_init = .01,
    alpha_decay = 0,
  ) %>%
  export_image(here::here("temp","screw_the_roses.png"))  

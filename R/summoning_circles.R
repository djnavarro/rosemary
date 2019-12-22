library(jasmines)
library(dplyr)

bilbao <- palette_scico(palette = "bilbao")

# using the original
# set.seed(3)
# d1 <- seed_bubbles(n = 2, grain = 50) %>%
#   mutate(x = x * 25, y = y * 25) %>%
#   time_meander(length = 100)

# using the refactored
set.seed(3)
d2 <- scene_bubbles(n = 2, grain = 50) %>%
  mutate(x = x * 25, y = y * 25) %>%
  unfold_meander(iterations = 100) %>%
  select(-id) %>%
  mutate(id = series)

d2 %>%
  style_ribbon(alpha_init = 1, palette = bilbao) %>%
  export_image(here::here("temp","summoning_circles.png"))
  #export_image(filename = "~/Desktop/summoning_circles.png")

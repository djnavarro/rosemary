library(jasmines)
library(dplyr)
set.seed(43)

dat <- scene_rows(n = 4, grain = 500) %>%
  mutate(
    x = x * 3,
    y = y * 3,
    id = 1:2000
  ) %>%
  unfold_tempest(
    iterations = 500,
    scale = .001,
    seed = 43
  ) %>%
  mutate(order = time)

pic <- dat %>%
  style_ribbon(
    alpha_init = .2,
    alpha_decay = 0,
    size = 1,
    palette = palette_manual(
      "white", "black", "black", "black", "#f7a8b8",
      "black", "black", "black", "#55cdfc"
    )
  )

pic %>% export_image(here::here("temp","trans_flag.png"))

#export_image("~/Desktop/trans_flag.png")



library(jasmines)
library(dplyr)
set.seed(43)

nrow <- 100
ncol <- 150

dat <- scene_rows(n = nrow, grain = ncol) %>%
  mutate(
    x = x * 24,
    y = (y * 16) + 4,
    id = 1:(nrow*ncol)
  ) %>%
  unfold_tempest(
    iterations = 50,
    scale = .005,
    seed = 43
  ) %>%
  mutate(order = id)

pic <- dat %>%
  style_ribbon(
    alpha_init = .4,
    alpha_decay = .01,
    size = 1,
    palette = palette_manual(
      "#0038a8", "#0038a8", "#9b4f96", "#d60270", "#d60270"
    ),
    background = "white"
  )

pic %>% 
  export_image(here::here("temp","bisexual_flag.png"))
  #export_image("~/Desktop/bisexual_flag.png")



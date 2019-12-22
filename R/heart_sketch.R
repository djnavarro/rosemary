library(jasmines)
library(dplyr)
set.seed(169)

entity_heart(1000) %>%
  mutate(x = x * .5, y = y * .5) %>%
  unfold_tempest(
    seed = 169,
    iterations = 1000,
    scale = .001) %>%
#  mutate(order = time) %>%
  style_ribbon(
    background = "ghostwhite",
    alpha_init = 1,
    seed_col = "#f8f8ff",
    seed_linewidth = 1,
    seed_fill = "#f8f8ffcc",
    alpha_decay = 0,
    palette = palette_manual(
      "grey10", "grey10", "grey10", "grey10",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "grey10", "grey10", "grey10", "grey10",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "grey10", "grey10", "grey10", "grey10",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "ghostwhite","ghostwhite", "ghostwhite","ghostwhite",
      "grey10", "grey10", "grey10", "grey10"
    )
  ) %>%
  export_image(here::here("temp","heart_sketch.png"))
  #export_image("~/Desktop/heart_sketch.png")

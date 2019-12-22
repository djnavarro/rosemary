  library(jasmines)
  library(dplyr)
  set.seed(43)
  scene_rows(50, 50) %>%
    mutate(
      x = x * 6,
      y = y * 6
    ) %>%
    unfold_tempest(
      iterations = 800,
      scale = .01,
      seed = 80
    ) %>%
    mutate(order = time) %>%
    style_ribbon(
      alpha_init = .1,
      alpha_decay = .001,
      size = 1,
      palette = palette_scico(palette = "bilbao")
    ) %>%
    export_image(here::here("temp","the_art_of_escaping_boxes.png"))
    #export_image("~/Desktop/the_art_of_escaping_boxes.png")

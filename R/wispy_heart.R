library(jasmines)
library(dplyr)

wispy_heart <- function(palette, suffix) {

  fname <- paste0("wispy_heart_", suffix, ".png")
  fname <- here::here("temp", fname)

  entity_heart(200) %>%
    mutate(x = x * 5, y = y * 5) %>%
    unfold_meander(iterations = 20, output1 = "space") %>%
    unfold_tempest(
      seed = 100,
      iterations = 300,
      scale = .001
    ) %>%
    mutate(order = time) %>%
    style_ribbon(
      palette = palette,
      alpha_init = .8,
      alpha_decay = .015,
    ) %>%
    export_image(fname)

}

wispy_heart(rainbow, "bright")
wispy_heart(palette_manual("white"), "flat")


library(jasmines)
entity_droplet(grain = 1000) %>%
  unfold_tempest(
    seed = 3,
    iterations = 300,
    scale = .002
  ) %>%
  style_ribbon(
    palette = palette_manual("#ff6000"),
    alpha_init = .5,
    alpha_decay = .015,
    seed_col = "#ff600066",
    seed_fill = "#00000088"
  ) %>%
  export_image(here::here("temp","orange_tear.png"))  
  #export_image("~/Desktop/orange_tear.png")

library(jasmines)
set.seed(4)

scene_bubbles(n = 3, grain = 100) %>%
  unfold_tempest(iterations = 500,  scale = 0.005) %>%
  style_ribbon(
    seed_fill = "#ffffff33",
    seed_col = "#ffffff55",
    alpha_init = 1,
    alpha_decay = .0015,
    burnin = 300,
    palette = palette_scico(palette = "berlin")
  ) %>%
  export_image(here::here("temp","constellations.png"))
  #export_image(filename = "~/Desktop/constellations.png")



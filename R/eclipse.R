library(jasmines)
set.seed(460)

entity_circle(grain = 1000) %>%
  unfold_tempest(iterations = 2000, scale = 0.005) %>%
  style_ribbon(
    seed_fill = "black",
    alpha_decay = .001,
    burnin = 600,
    palette = palette_scico(palette = "lajolla")
  ) %>%
  export_image(here::here("temp","eclipse.png"))  
  #export_image("~/Desktop/eclipse.png")



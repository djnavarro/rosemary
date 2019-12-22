library(jasmines)
set.seed(127)

base <- scene_bubbles(1, 5000) %>%
  unfold_tempest(iterations = 50, scale = .05) %>%
  style_ribbon(
    burnin = 45,
    type = "curve",
    size = .25,
    alpha_init = .5,
    alpha_decay = .03,
    palette = palette_scico(palette = "roma")) %>%
  export_image(here::here("temp","wisps.png"))
  #export_image("~/Desktop/wisps.png")

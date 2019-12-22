library(jasmines)
set.seed(129)

base <- scene_sticks(10, 5000) %>%
  unfold_tempest(iterations = 5, scale = .05) %>%
  style_ribbon(
    burnin = 4,
    type = "curve",
    curvature = 1,
    size = .25,
    alpha_init = .2,
    alpha_decay = .03,
    palette = palette_viridis(option = "magma")) %>%
  export_image(here::here("temp","devil.png"))
  #export_image("~/Desktop/devil.png")

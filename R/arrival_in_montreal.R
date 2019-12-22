library(jasmines)
set.seed(4)

base <- entity_heart(7000) %>%
  unfold_tempest(iterations = 5, scale = .1) %>%
  style_ribbon(
    burnin = 1,
    type = "curve",
    curvature = 1,
    size = .25,
    alpha_init = .2,
    alpha_decay = .03,
    background = "black",
    seed_col = "#ffffff88",
    seed_fill = "#22222288",  # blue version: "#3d85c699",
    palette = palette_manual("grey")  # blue: "#3d85c6"
  ) %>%
  export_image(here::here("temp","arrival_in_montreal.png"))
  #export_image("~/Desktop/arrival_in_montreal.png")



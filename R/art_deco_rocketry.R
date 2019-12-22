library(jasmines)
set.seed(1)

rocketry <- function(palette, background, file) {
  
  entity_circle(grain = 2000) %>%
    unfold_slice(
      iterations = 50, 
      scale = .125, 
      seed = 1,
      output1 = "time",
      output2 = "order") %>%
    style_ribbon(
      background = background,
      alpha_init = .5, 
      alpha_decay = .05,
      palette = palette
    ) %>% 
    export_image(file)
  
}

rocketry(
  palette = palette_manual(
    "grey40", "ghostwhite", "ghostwhite",
    "grey20", "ghostwhite"),
  background = "ghostwhite",
  file = here::here(
    "temp", "art_deco_rocketry_light.png")
)

rocketry(
  palette = palette_manual(
    "grey", "black", "black",
    "grey80", "black"),
  background = "black",
  file = here::here(
    "temp", "art_deco_rocketry_dark.png")
)



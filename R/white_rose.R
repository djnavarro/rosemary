library(jasmines)
set.seed(1)

dat <- scene_bubbles(20, 400) %>%
  unfold_slice(iterations = 20, scale = .02, seed = c(100, 101))

pic <- dat %>% style_ribbon(
  palette = palette_scico(palette = "grayC"),
  #seed_col = "#ffffffaa",
  alpha_init = .5,
  alpha_decay = .05
  #background = "ghostwhite"
)

pic %>% export_image(here::here("temp","white_rose.png"))


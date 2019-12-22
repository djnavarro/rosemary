library(jasmines)
set.seed(435)
scene_delaunay(6, 500) %>%
  unfold_slice() %>% 
  style_ribbon(
    palette = palette_scico(palette = "bilbao"),
    seed_col = "#ffffffaa",
    alpha_init = .1,
    background = "grey10"
  ) %>% 
  export_image(here::here("temp","cubist.png"))

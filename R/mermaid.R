library(jasmines)
set.seed(1)
scene_delaunay(6, 500) %>%
  unfold_slice() %>% 
  style_ribbon(
    palette = gray.colors,
    seed_col = "#ffffffaa",
    alpha_init = .1,
    background = "white"
  ) %>% 
  export_image(here::here("temp","mermaid.png"))

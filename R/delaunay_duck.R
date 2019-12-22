library(jasmines)
library(dplyr)
library(ggplot2)

set.seed(4)
dat <- scene_delaunay(n = 20, grain = 1000) %>%
   filter(id %in% sample(max(id), ceiling(max(id)*.4))) %>%
	mutate(x = x * 5, y = y * 5) %>%
   unfold_tempest(iterations = 100, seed = 43, scale = .0075) %>%
   mutate(order = time)

pic <- dat %>%
   style_ribbon(
  	   palette = palette_ropensci("whitened"),
      alpha_decay = .03,
  	   alpha_init = 1,
  	   background = "ghostwhite",
  	   seed_fill = "#8BD3DA66",
  	   seed_col = "#407070cc",
  	   seed_linewidth = 1
   ) %>%
   export_image(here::here("temp","delaunay_duck.png"))
   #export_image("~/Desktop/delaunay_duck.png")

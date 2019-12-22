library(jasmines)
library(dplyr)
set.seed(46)


# return a whitened version of the palette
whiten <- function(palette, scale = .5) {
  function(n = 50, alpha = 1) {
    rgbvec <- purrr::lift_dv(rgb)
    cols <- palette(n, alpha)
    cols <- col2rgb(cols)
    cols <- scale + cols * (1-scale) / 256
    cols <- as.data.frame(cols)
    cols <- purrr::map_chr(cols, rgbvec)
    return(unname(cols))
  }
}

pal <- whiten(palette_scico(palette = "berlin"), scale = .1)

dat <- scene_sticks(3, 30) %>%
  unfold_meander(output1 = "space", output2 = "order") %>%
  mutate(
    base_x = x,
    base_y = y,
    len = sqrt(x^2 + y^2) * .4
  ) %>%
  unfold_tempest(output1 = "time", output2 = "junk", iterations = 1) 

dat <- dat %>% 
  mutate(
    x = case_when(
      time == 1 ~ base_x,
      time == 2 ~ base_x + len * x
    ),
    y = case_when(
      time == 1 ~ base_y,
      time == 2 ~ base_y + len * y
    )
  )

dat %>% style_ribbon(
    alpha_init = .3, 
    size = .75,
    palette = pal
  ) %>%
  export_image(here::here("temp","forgotten_worlds.png"))
  #export_image("~/Desktop/forgotten_worlds.png")


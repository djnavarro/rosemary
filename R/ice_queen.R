library(jasmines)
library(dplyr)
set.seed(123)


# base <- entity_heart(grain = 100) %>%
#   mutate(x = x * 100, y = y * 100) %>%
#   unfold_meander(iterations = 300) %>%
#   coil(scale = .075) %>%
#   mutate(id = time) %>%
#   style_wrap(
#     palette = palette_manual("#ffffff33"),
#     type = "line",
#     size = .25)


dat <- entity_heart(grain = 100) %>%
  mutate(x = x * 100, y = y * 100) %>%
  unfold_meander(iterations = 300, output1 = "space", output2 = "order") %>%
  mutate(
    base_x = x,
    base_y = y,
    len = sqrt(x^2 + y^2) * 3
  ) %>%
  unfold_tempest(output1 = "time", output2 = "junk", iterations = 1) 

dat <- dat %>% 
  mutate(
    x = case_when(
      time == 1 ~ base_x,
      time == 2 ~ (1-len) * base_x + len * x
    ),
    y = case_when(
      time == 1 ~ base_y,
      time == 2 ~ (1-len) * base_y + len * y
    )
  )

dat %>% style_ribbon(
  alpha_init = .1, 
  size = .25,
  seed_col = "#ffffff88",
  palette = palette_manual("#ffffff33")
) %>%
  export_image(here::here("temp","ice_queen.png"))
  #export_image("~/Desktop/ice_queen.png")



library(jasmines)
library(dplyr)

# this was the code before i refactored to remove
# the unnecessary style_wrap and coil functions
#
# set.seed(46)
# 
# scene_sticks(3, 30) %>%
#   unfold_meander(output2 = "id") %>%
#   coil() %>%
#   style_wrap(
#     type = "line",
#     size = .5,
#     palette = palette_viridis(option = "magma")
#   ) %>%
#   export_image("~/Desktop/thin_swirls.png")

set.seed(46)

dat <- scene_sticks(3, 30) %>%
  unfold_meander(output1 = "space", output2 = "order") %>%
  mutate(
    base_x = x,
    base_y = y,
    len = sqrt(x^2 + y^2) * .8
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
    alpha_init = .8, 
    size = .5,
    palette = palette_viridis(option = "magma")
  ) %>%
  export_image(here::here("temp","thin_swirls.png"))  
  #export_image("~/Desktop/thin_swirls.png")


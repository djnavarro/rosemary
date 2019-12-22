library(jasmines)
library(dplyr)
set.seed(125)

molten_heart <- function(palette, shuffle, suffix) {

  dat <- entity_heart(1000) %>%
    mutate(
      x = x * 2,
      y = y * 2
    ) %>%
    unfold_tempest(
      iterations = 40,
      scale = .01,
      seed = 125
    )

  if(shuffle == FALSE) {
    dat <- dat %>% mutate(order = time)
  }

  
  file <- here::here("temp",paste0("molten_heart_", suffix, ".png"))

  dat %>%
    style_ribbon(
      alpha_init = .8,
      alpha_decay = .1,
      size = 1,
      palette = palette
    ) %>%
    export_image(file)

}

molten_heart(
  palette = palette_scico(palette = "berlin"),
  shuffle = TRUE,
  suffix = "shuffled"
)

molten_heart(
  palette = palette_manual("grey"),
  shuffle = FALSE,
  suffix = "grey"
)

molten_heart(
  palette = rainbow,
  shuffle = FALSE,
  suffix = "rainbow"
)




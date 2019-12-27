# returns a slight variant on style_ribbon() that calculates the number of
# colours in the palette the old way (the new version increments the state
# of the random number generator differently)
old_style_ribbon <- function() {

  # old code and new code for the style function
  current_code <- "colours_from(palette, ribbon$order)"
  earlier_code <- "palette(n = max(ribbon$order))"

  # create a local_style function that mirrors style_ribbon but calculates
  # the number of colours via the original algorithm to avoid changing the
  # random number generator state; note that local_style() evaluates in
  # the jasmines namespace
  local_style <- deparse(eval(substitute(jasmines::style_ribbon)))
  local_style <- gsub(current_code, earlier_code, local_style, fixed = TRUE)
  local_style <- paste(local_style, collapse = "\n")
  local_style <- eval(str2expression(local_style), getNamespace("jasmines"))

  return(local_style)
}

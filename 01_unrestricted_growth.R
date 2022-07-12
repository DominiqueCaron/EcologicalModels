background_color <- "#2E2E3A"
data_color <- "#F34213"
text_color <- "white"

my_theme <-
  theme(plot.background = element_rect(fill = background_color), panel.background = element_rect(fill = background_color), text = element_text(size = 15, color = text_color),
        axis.line = element_line(color = text_color, size = 1), panel.grid = element_blank(), axis.text = element_text(color = text_color), axis.ticks = element_line(color = text_color))


# Discrete time unrestricted growth
# R: net per capita growth rate
geometric_growth <- function(N0, R, tmax = 100){
  t <- c(1:(tmax+1))
  return(N0*(R+1)^t)
}

# Continuous time unrestricted growth
# r: instrinsic per capita growth rate
exponential_growth <- function(N0, r, tmax = 100){
  t <- c(1:(tmax+1))
  return(N0*exp(r*t))
}
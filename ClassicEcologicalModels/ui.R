library(shiny)
library(ggplot2)
source("../01_unrestricted_growth.R")

# Define UI for application that draws a histogram
shinyUI(navbarPage("Classic Ecological Models",
                   tabPanel("Introduction"),
                   navbarMenu("Models",
                              tabPanel("Unrestricted growth",
                                       tabsetPanel(
                                         tabPanel("Exponential growth", sidebarLayout(
                                           sidebarPanel(h1("Parameters"),
                                                        radioButtons("m1_nPop", label = "Number of populations:", choices = c(1,2),
                                                                     selected = 1, inline = T),
                                                        sliderInput("m1_N0", label = "Initial population size (N0):", min = 1,
                                                                    max = 100, value = 50, step = 5),
                                                        numericInput("m1_r", label = "Intrinsic growth rate (r):", min = -2,
                                                                     max = 2, value = 0, step = 0.1),
                                                        numericInput("m1_maxt", label = "Length of simulation:", min = 1, max = 100,
                                                                     value = 50, step = 5)
                                           ),
                                           mainPanel(
                                             div(
                                               h1("Theory"),
                                               p("blablabla"),
                                               h1("Plots"),
                                               plotOutput("ExponentialGrowthPlot")
                                             )
                                           )
                                         )),
                                         tabPanel("Geometric growth", sidebarLayout(
                                           sidebarPanel(h1("Parameters"),
                                                        radioButtons("m2_nPop", label = "Number of populations:", choices = c(1,2),
                                                                     selected = 1, inline = T),
                                                        sliderInput("m2_N0", label = "Initial population size (N0):", min = 1,
                                                                    max = 100, value = 50, step = 5),
                                                        numericInput("m2_R", label = "Net per capita growth rate (R):", min = -2,
                                                                     max = 2, value = 0, step = 0.1),
                                                        numericInput("m2_maxt", label = "Length of simulation:", min = 1, max = 100,
                                                                     value = 50, step = 5)
                                           ),
                                           mainPanel(
                                             div(
                                               h1("Theory"),
                                               p("blablabla"),
                                               h1("Plots"),
                                               plotOutput("GeometricGrowthPlot")
                                             )
                                           )
                                         )),
                                         tabPanel("Geometric growth with movement"),
                                         tabPanel("Geometric growth with variation"),
                                         tabPanel("Stage-structuctured growth"))
                              )
                              ,
                              tabPanel("Density dependent growth")
                   ),
                   tabPanel("About")
))
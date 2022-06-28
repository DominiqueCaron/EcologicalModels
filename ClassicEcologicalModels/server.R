shinyServer(function(input, output) {
  
    output$ExponentialGrowthPlot <- renderPlot({
      plot_data <- data.frame(t = 0:input$m1_maxt,
                         N = exponential_growth(input$m1_N0, input$m1_r, input$m1_maxt)
      )
      ggplot(data = plot_data, aes(x = t, y = N)) +
           geom_line(color = data_color, size = 3) +
           geom_text(x = input$m1_maxt/5, y = max(plot_data$N)*0.9, label = paste0("r = ", input$m1_r), size = 5, color = text_color)+
           labs(x = "Time", y = "Population Size") +
        my_theme
    })
    
    output$GeometricGrowthPlot <- renderPlot({
      plot_data <- data.frame(t = 0:input$m2_maxt,
                              N = geometric_growth(input$m2_N0, input$m2_R, input$m2_maxt)
      )
      ggplot(data = plot_data, aes(x = t, y = N)) +
        geom_line(color = data_color, size = 3) +
        geom_text(x = input$m2_maxt/5, y = max(plot_data$N)*0.9, label = paste0("r = ", input$m2_R), size = 5, color = text_color)+
        labs(x = "Time", y = "Population Size") +
        my_theme
    })
})

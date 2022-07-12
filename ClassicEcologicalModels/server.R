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
        geom_text(x = input$m2_maxt/5, y = max(plot_data$N)*0.9, label = paste0("R = ", input$m2_R), size = 5, color = text_color)+
        labs(x = "Time", y = "Population Size") +
        my_theme
    })
    
    output$GeometricWithMovementPlot <- renderImage({
      # A temp file to save the output.
      # This file will be removed later by renderImage
      outfile <- tempfile(fileext='.gif')
      
      plot_data <- reshape2::melt(growth_and_movement2d(input$m3_N0, input$m3_lambda, input$m3_d, input$m3_maxt))
      colnames(plot_data) <- c("x", "y", "t", "N")
      plot_data$t <- plot_data$t-1
      p <- ggplot(plot_data, aes(x=x, y=y, fill = N))+
        geom_tile()+
        labs(title = 'timestep = {frame_time}')+
        theme_minimal() +
        transition_time(t) + 
        ease_aes('linear')
      anim_save("outfile.gif", p)
      list(src = "outfile.gif",
           contentType = 'image/gif'
           # width = 400,
           # height = 300,
           # alt = "This is alternate text"
      )}, deleteFile = TRUE)
    
})

### g2 api experiments

using R6 for an R user interface:
    
    g2$new()$
      add_source(iris)$
      point()$
      position("Sepal.Width", "Sepal.Length")$
      color("Species")$
      render()
    
    #color callback
    g2$new()$
      add_source(iris)$
      point()$
      position("Sepal.Width", "Sepal.Length")$
      color("Species",
            htmlwidgets::JS("function(value){
               if (value === 'setosa') return 'black'
               return 'red'}"))$
      render()
    
    #scales
    g2$new()$
      add_source(iris)$
      point()$
      position("Sepal.Width", "Sepal.Length")$
      color('Species')$
      scale("Sepal.Width", min = 3)$render()
      
    #simple line chart  
    df <- data.frame(
      month = c("Jan", "Feb", "Mar", "Apr"),
      France = sample(50, 4),
      Ireland = sample(50, 4)
    )
    df <- reshape2::melt(df, id = "month")
    
    g2$new()$add_source(df)$
      line()$
      position('month', 'value')$
      color('variable')$
      render()
    
    #compared to
    library(ggplot2)
    ggplot(k, aes(month, value, group = variable)) + geom_line()


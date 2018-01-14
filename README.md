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

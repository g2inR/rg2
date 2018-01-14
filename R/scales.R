
#' @include g2.R
g2$set("public", "scale", function(type, 
                                    range = NULL,
                                    formatter = NULL,
                                    min = NULL,
                                    max = NULL,
                                    alias = NULL,
                                    tickCount = NULL,
                                    ticks = NULL){
  scale <- list(type = type, 
       opts = list(
        range = range,
        formatter = formatter, 
        min = min,
        max = max,
        alias = alias, 
        tickCount = tickCount,
        ticks = ticks)
  )
  scale$opts <- scale$opts[!sapply(scale$opts, is.null)]
  self$chart$scales[[length(self$chart$scales) + 1]] <- scale
  invisible(self)
})


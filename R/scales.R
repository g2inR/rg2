
#' @include g2.R
g2$set("public", "scale", function(field,
                                    type = NULL,
                                    range = NULL,
                                    formatter = NULL,
                                    min = NULL,
                                    max = NULL,
                                    alias = NULL,
                                    tickCount = NULL,
                                    ticks = NULL,
                                    sync = NULL){
  scale <- list(
    type = type,
    range = range,
    formatter = formatter,
    min = min,
    max = max,
    alias = alias,
    tickCount = tickCount,
    ticks = ticks,
    sync = sync
  )
  scale <- scale[!sapply(scale, is.null)]
  self$chart$options$scales[[field]] <- scale
  invisible(self)
})






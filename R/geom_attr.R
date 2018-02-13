#geom_attr
#' @include g2.R
g2$set("private", "add_attr", function(type, attr){
  self$chart$options$geoms[[length(self$chart$options$geoms)]][[type]] <- attr
  invisible(self)
})

g2$set("public", "position", function(x, y) {
  if (private$nse){
    x <- as.character(substitute(x))
    y <- as.character(substitute(y))
  }
  private$add_attr("position", paste(x, y, sep = "*"))
  invisible(self)
})

g2$set("public", "color", function(field, colors = NULL){
  if (private$nse) field <- as.character(substitute(field))
  color <- list(field = field, colors = colors)
  private$add_attr("color", color)
  invisible(self)
})

g2$set("public", "shape", function(field, shapes = NULL){
  if (private$nse) field <- as.character(substitute(field))
  shape <- list(field = field, shapes = shapes)
  private$add_attr("shape", shape)
  invisible(self)
})

g2$set("public", "adjust", function(type, marginRatio = NULL, dodgeBy = NULL){
  adjust <- list(type = type,
                 marginRatio = marginRatio,
                 dodgeBy = dodgeBy)
  private$add_attr("adjust", adjust)
  invisible(self)
})

g2$set("public", "opacity", function(field, callBack = NULL){
  if (private$nse){
    if (!is.numeric(eval(quote(substitute(fields)))))
      field <- as.character(substitute(field))
  }
  opacity <- list(field = field,
                  callBack = callBack)
  private$add_attr("opacity", opacity)
  invisible(self)
})



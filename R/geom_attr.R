#geom_attr
#' @include g2.R
g2$set("private", "add_attr", function(type, attr){
  self$chart$options$geoms[[length(self$chart$options$geoms)]][[type]] <- attr
  invisible(self)
})

g2$set("public", "position", function(x, y) {
  private$add_attr("position", paste(x, y, sep = "*"))
  invisible(self)
})

g2$set("public", "color", function(field, colors = NULL){
  #field <- deparse(substitute(field))
  color <- list(field = field, colors = colors)
  color <- color[!sapply(color, is.null)]
  private$add_attr("color", color)
  invisible(self)
})

g2$set("public", "shape", function(field, shapes = NULL){
  shape <- list(fields = field, shapes = shapes)
  private$add_attr("shape", shape)
  invisible(self)
})



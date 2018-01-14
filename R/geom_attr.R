#geom_attr
#' @include g2.R
g2$set("private", "add_attr", function(type, attr){
  self$chart$geom[[length(self$chart$geom)]][[type]] <- attr
  invisible(self)
})

g2$set("public", "position", function(x, y) {
  p <- paste0(x, "*", y)
  private$add_attr("position", list(p))
  invisible(self)
})

g2$set("public", "color", function(field, colors = NULL){
  color <- list(field, colors)
  private$add_attr("color", color)
  invisible(self)
})

g2$set("public", "shape", function(field, shapes = NULL){
  shape <- list(field, shapes)
  private$add_attr("shape", shape)
  invisible(self)
})




#' @include g2.R
g2$set("private", "add_geom", function(type){
  self$chart$geom[[length(self$chart$geom) + 1]] <- list(type = type)
})

g2$set("public", "interval", function() {
  private$add_geom("interval")
  invisible(self)
})

g2$set("public", "line", function() {
  private$add_geom("line")
  invisible(self)
})

g2$set("public", "point", function() {
  private$add_geom("point")
  invisible(self)
})

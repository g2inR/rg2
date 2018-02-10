
#' source
#' @include g2.R
g2$set("public", "source", function(data) {
  self$chart$data <- data
  invisible(self)
})









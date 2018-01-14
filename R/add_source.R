
#' add_source
#' @include g2.R
g2$set("public", "add_source", function(data) {
  if (class(data) == "data.frame") data <- jsonlite::toJSON(data)
  self$chart$source <- data
  invisible(self)
})







#' @include g2.R
g2$set("public", "fold", function(fields, key, value){
  self$chart$transform <- list(
    type = "fold",
    fields = fields,
    key = key,
    value = value
    )
  invisible(self)
})

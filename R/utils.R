#' @importFrom htmlwidgets JS
#' @export
htmlwidgets::`JS`

rm_null <- function(l){
  l <- l[!sapply(l, is.null)]
  lapply(l, function(d){
    if (is.list(d)) rm_null(d)
    else d
  })
}


#' @export
g2_config <- function(width = NULL,
                      height = NULL,
                      padding = NULL,
                      background = NULL,
                      plotBackground = NULL,
                      forceFit = TRUE,
                      animate = TRUE,
                      pixelRatio = NULL) {
  as.list(environment())
}


#' @export
g2 <- function(data, code, config = NULL, ...) {
  if (is.null(config)) config <- g2_config()
  params <- list(config = config, data = data)
  if (file.exists(code)) code <- paste(readLines(code), collapse = "\n")
  code <- gsub("//.*?\n|/\\*.*?\\*/", "", code)
  if (grepl("new G2.Chart", code)) stop('use g2_config to set up chart configuration', call. = FALSE)
  if (!grepl("function\\(chart,data\\)", gsub(" ", "", code))) {
    code <- paste("function(chart, data){", code, "}")
  }
  params$g2Script <- htmlwidgets::JS(code)
  params <- rm_null(params)
  rg2(params, ...)
}


rm_null <- function(l){
  l <- l[!sapply(l, is.null)]
  lapply(l, function(d){
    if (is.list(d)) rm_null(d)
    else d
  })
}


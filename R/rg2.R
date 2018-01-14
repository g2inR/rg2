#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
rg2 <- function(params, width = NULL, height = NULL, elementId = NULL) {

  # create widget
  htmlwidgets::createWidget(
    name = 'rg2',
    params,
    width = width,
    height = height,
    package = 'rg2',
    elementId = elementId
  )
}

#' Shiny bindings for rg2
#'
#' Output and render functions for using rg2 within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a rg2
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name rg2-shiny
#'
#' @export
rg2Output <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'rg2', width, height, package = 'rg2')
}

#' @rdname rg2-shiny
#' @export
renderRg2 <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, rg2Output, env, quoted = TRUE)
}

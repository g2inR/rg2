
#' @import R6
#' @export
g2 <- R6::R6Class("g2",
            public = list(
              chart = list(
               padding = NULL,
               background = NULL,
               plotBackground = NULL,
               width = NULL,
               height = NULL,
               data = NULL,
               options = list(),
               facet = NULL
              ),
              render = function() {
                private$check_facet()
                self$chart <- rm_null(self$chart)
                rg2(self$chart)
              },
              print = function() {
                print(self$chart)
                invisible(self)
              }
            )

)




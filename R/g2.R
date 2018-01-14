
#' @import R6
#' @export
g2 <- R6Class("g2",
              public = list(
                chart = list(
                  config = list(),
                  source = NULL,
                  transform = list(),
                  geom = list(),
                  scales = list(),
                  coord = "cartesian",
                  facet = list(),
                  global_attr = list()
                ),
                render = function(){
                  self$chart <- self$chart[!sapply(self$chart, is.null)]
                  rg2(self$chart)
                },
                print = function(){
                  print(self$chart)
                  invisible(self)
                }
              )
            )



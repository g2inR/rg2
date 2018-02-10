#facets
#by default set sync:true for all active variables

g2$set("private", "active_fields", function(){
  fields <- colnames(self$chart$data)
  active_geoms <- fields[sapply(fields, grepl, self$chart$options$geoms)]
  active_facet <- fields[fields %in% unlist(self$chart$facet)]
  active_view <- list()
  if (!is.null(self$chart$facet$opts$eachView)){
    cb <- sapply(fields, grepl, self$chart$facet$opts$eachView)
    active_view <- fields[cb]
  }
  active <- unique(unlist(c(active_geoms, active_facet, active_view)))
  active
})


g2$set("private", "check_facet", function(){
  if (is.null(self$chart$facet)) return(self$chart)
  fields <- private$active_fields()
  sapply(fields, function(d){
    if (is.null(self$chart$options$scales[[d]]$sync)){
      self$chart$options$scales[[d]]$sync <- TRUE
    }
  })
  self$chart$facet$geoms <- self$chart$options$geoms
  self$chart$options$geoms <- NULL
  invisible(self)
})



#' @include g2.R
g2$set("public", "facet", function(fields,
                                   type = "rect",
                                   cols = NULL,
                                   showTitle = TRUE,
                                   autoSetAxis = TRUE,
                                   padding = NULL,
                                   eachView = NULL,
                                   colTitle = NULL,
                                   rowTitle = NULL
){
  if (!is.null(eachView) && class(eachView) != "JS_EVAL") stop("use `JS` here")
  if (length(fields) == 1) fields <- list(fields)
  facet <- list(type = type,
                opts = list(
                  fields = fields,
                  cols = cols,
                  showTitle = showTitle,
                  autoSetAxis = autoSetAxis,
                  padding = padding,
                  eachView = eachView,
                  colTitle = colTitle,
                  rowTitle = rowTitle
                )
  )
  facet$opts <- facet$opts[!sapply(facet$opts, is.null)]
  self$chart$facet <- facet
  invisible(self)
})


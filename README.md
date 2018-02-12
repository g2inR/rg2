### using R6 for g2 R interface:

```r
library(rg2)

g2$new()$
  source(iris)$
  point()$
  position("Sepal.Width", "Sepal.Length")$
  color("Species")$
  render()
```
![](man/charts/iris_point.png)


#### facets
```r
g <- g2$new()
g$source(iris)
g$point()$
  position("Sepal.Length", "Sepal.Width")$
  color("Species")
g$facet("Species")
g$render()

```
![](man/charts/rect_facet.png)

```r
g <- g2$new()
g$source(iris)
g$point()$position("Sepal.Length", "Sepal.Width")$color("Species")
g$facet("Species", "tree")
g$render()
```
![](man/charts/tree_facet.png)

#### nse ?

```r
g <- g2$new()
g$source(ggplot2::diamonds)
g$point()$
  position(carat, price)$
  color(cut)$
  opacity(0.6)
g$facet(clarity~cut)
g$render()
```
![](man/charts/diamonds_facet.png)

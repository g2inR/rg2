## g2 

#### lite:

```r
rg2::g2(data = iris,
"
  chart
    .point()
    .position('Sepal.Width*Sepal.Length')
    .color('Species');
"
)
```
![](man/charts/irislite.png)

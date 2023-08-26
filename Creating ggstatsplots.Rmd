# DATA VISUALIZATION USING THE `ggstatsplot` PACKAGE

## **LOAD LIBRARIES**

```{r}
library(ggstatsplot)
library(reshape2)
```

## **ATTACH DATA**

```{r}
df <- datasets::iris
attach(df)
View(df)
?iris
```

## **BOXPLOTS**

```{r}
ggbetweenstats(data=df, x=Species, y=Sepal.Length, type="parametric", pairwise.comparisons=T, pairwise.display="all", p.adjust.method="holm", effsize.type="omega")
```

## RESHAPE DATA

```{r}
df1 <- melt(data=df, id.vars="Species", measure.vars=c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"))
View(df1)
```

## GROUPED BOXPLOTS

```{r}
grouped_ggbetweenstats(data=df1, x=Species, y=value, grouping.var=variable, pairwise.comparisons=T, pairwise.display="all", p.adjust.method="holm", effsize.type="omega", plot.type="box")
```

## SIMPLE LINEAR REGRESSION FOR SEPAL LENGTH

```{r}
fit <- lm(data=df, Sepal.Length ~ Species)
```

## REGRESSION COEFFICIENTS/FOREST PLOT

```{r}
ggcoefstats(fit)
```

## SCATTERPLOTS

```{r}
ggscatterstats(data=df, x=Sepal.Length, y=Sepal.Width)
ggscatterstats(data=df, x=Petal.Length, y=Petal.Width)
```

## CORRELATION MATRIX

```{r}
ggcorrmat(data=df, cor.vars=c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"))
```

## GROUPED SCATTERPLOTS

```{r}
grouped_ggscatterstats(data=df, x=Sepal.Length, y=Sepal.Width, grouping.var=Species)
grouped_ggscatterstats(data=df, x=Petal.Length, y=Petal.Width, grouping.var=Species)
```

## GROUPED CORRELATION MATRICES

```{r}
grouped_ggcorrmat(data=df, cor.vars=c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"), grouping.var=Species)
```

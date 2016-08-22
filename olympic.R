library(treemap)
library(stringr)
library(dplyr)

data <- read.csv("d:/R/ch.csv", header = T, sep = ",")
treemap(data,
       index = c("sports"),
       vSize = "gold",
       vColor = "china",
       type = "value",
       title = '中国金牌分布',
       fontsize.labels = 15,
       lowerbound.cex.labels = 0,
       palette = "RdYlGn")

rio <- read.csv("d:/R/rio.csv", header = T, sep = ",")
rio$country <- str_replace_all(rio$country, "[?]", "")
rio_selected <- select(rio, gold, silver, bronze)
d <- dist(rio_selected, method = "euclidean")
pfit <- hclust(d, method = "ward.D")
plot(pfit, labels = rio$country)
rect.hclust(pfit, k = 10)

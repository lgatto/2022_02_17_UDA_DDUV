x <- data.frame(black = c(10, 11, 0, 123, 2),
                yellow = c(12, 11, 23, 1, 1),
                purple = c(5, 0, 1, 0, 25),
                steelblue = c(3, 0, 3, 2, 23))
rownames(x) <- c("main", "pince", "tete",
                 "jambes", "corps")
xfr <- x
colnames(xfr) <- c("noir", "jaune", "mauve", "bleu")

png("pca1.png")
pairs(t(x), col = colnames(x), pch = 19, cex = 3)
dev.off()

pca <- prcomp(t(x), scale = TRUE, center = TRUE)


library(factoextra)

cls <- colnames(x)
names(cls) <- colnames(x)

png("pca2.png")
fviz_pca_ind(pca, habillage = colnames(x),
             pointsize = 5,
             geom = "point") +
    scale_colour_manual(
        values = cls) +
    scale_shape_manual(values = rep(19, 4)) +
    theme(legend.position = "none")
dev.off()

library(dendextend)

knitr::kable(as.matrix(dist(t(xfr))))

png("hc.png")
hc <- hclust(dist(t(xfr)))
hc <- as.dendrogram(hc) |>
    set("labels_colors", colnames(x)) |>
    set("branches_lwd", 1) |>
    set("labels_cex", 2)
plot(hc)
dev.off()

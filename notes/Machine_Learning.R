## Unsupervised learning ####
## Principal Components Analysis

head(salary_data)

## remove any non-numeric variables
salary_num <- select(salary_data, -Job.Title, -Education.Level, -Gender)
salary_num


## do PCA
pcas <- prcomp(salary_num, scale. = T)
summary(pcas)
pcas$rotation

pcas$rotation^2

# get the x values of PCAs and make it a data frame
pca_vals <- as.data.frame(pcas$x)
pca_vals
pca_vals$Job.Title <- iris$Job.Title

ggplot(pca_vals, aes(PC1, PC2, color = PC3)) +
  geom_point() +
  theme_minimal()





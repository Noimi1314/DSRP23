library(dplyr)
library(parsnip)

## Step 1: Collect Data ####
mm <- read.csv("data/mxmh_survey_results.csv")
View(mm)

## Step 2: Clean and Process Data ####
newmm <- select(mm, Age, While.working, Hours.per.day)
filter(newmm, !is.na(Age), !is.na(While.working), !is.na(Hours.per.day))
slice_head(newmm, n=2)


## do PCA
pcas <- prcomp(mmNum, scale. = T)
summary(pcas)
pcas$rotation
?prcomp()
pcas$rotation^2

## get the x values of PCAs and make it a data frame
pca_vals <- as.data.frame(pcas$x)
pca_vals$Species <- iris$Species

ggplot(pca_vals, aes(PC1, PC2, color = Species)) + 
  geom_point() +
  theme_minimal()


## Step 3: Visualize Data ####
library(reshape2)
library(ggplot2)

## Correlations
mmCorrelation <- cor(mmNum) %>% 
  melt() %>% 
  as.data.frame()
mmCorrelation
mmCorrelation
ggplot(mmCorrelation, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "darkred", mid = "white", high = "darkblue", midpoint = 0) +
  theme_minimal()

ggplot(mmNum, aes(x=Hours.per.day, y = While.working)) +
  geom_point() +
  theme_minimal()
## Step 5: Separate Data into Testing and Training Sets ####
library(rsample)
set.seed(479)

#75% in training set
data_reg_split <- initial_split(mmNum, prop = 0.75)

#data frames for the two sets
train_reg_data <- training(data_reg_split)
test_reg_data <- testing(data_reg_split)

## Step 7: Train Model on Training Set ####
linreg_fit <- linear_reg() %>% 
  set_engine("lm") %>% 
  set_mode("regression") %>% 
  fit(While.working ~ ., data = train_reg_data)
summary(linreg_fit$fit)

## Boosting Decision Tree
boost_tree_fit <- boost_tree() %>% 
  set_engine("xgboost") %>% 
  set_mode("regression") %>% 
  fit(While.working ~ ., data = train_reg_data)
boost_tree_fit$fit

## Random Forest
rand_forest_fit <- rand_forest() %>% 
  set_engine("ranger") %>% 
  set_mode("regression") %>% 
  fit(While.working ~ ., data = train_reg_data)
rand_forest_fit$fit

## Step 8: Evaluate Performance on Test Dataset ####


# Calculate error for regression
library(yardstick)
#lm_fit, boost_reg_fit, forest_reg_fit
reg_results <- test_reg_data

reg_results$lm_pred <- predict(linreg_fit, test_reg_data)$.pred
reg_results$boost_pred <- predict(boost_tree_fit, test_reg_data)$.pred
reg_results$forest_pred <- predict(rand_forest_fit, test_reg_data)$.pred


yardstick::mae(reg_results, While.working, lm_pred)
yardstick::mae(reg_results, While.working, boost_pred)
yardstick::mae(reg_results, While.working, forest_pred)

yardstick::rmse(reg_results, While.working, lm_pred)
yardstick::rmse(reg_results, While.working, boost_pred)
yardstick::rmse(reg_results, While.working, forest_pred)

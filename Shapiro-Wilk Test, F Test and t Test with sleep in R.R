# Shapiro-Wilk Test, F Test and t Test with sleep in R

# Our aim in this study is to answer the following question:

# “There is a significant difference in the mean sleep of the 2 groups of patients, that is,
# Is there a significant difference between the two drugs that help with the sleep disorder?”

# Let's apply the t Test and answer the question.

# packages
if(!require(car)) install.packages("car")
library(car)
library(tidyverse)

view(sleep)
?sleep

# To apply the t Test first we need to validate the 5 test assumptions.

# 1- Data are random and representative of the population.
# 2- The dependent variable is continuous.
# 3- Both groups are independent (i.e. exhaustive and exclusionary groups).
# 4- The residuals of the model are normally distributed.
# 5- The residual variance is homogeneous (principle of homoscedasticity).

# For our example in this case study, we will assume as true the
# assumptions 1 to 3 and we will validate assumptions 4 and 5. For assumption 4 we will use
# the Shapiro-Wilk Test and for assumption 5 we will use the F Test.

# Let's extract data from one of the groups
group_two <- sleep$group == 2

# Validating Assumption 4 with qqPlot
?qqPlot
qqPlot(sleep$extra[group_two])
qqPlot(sleep$extra[! group_two])

# Analysis: The "extra" variable data points are within the confidence area,
# indicating that the data follow a normal distribution.

# Validating Assumption 4 with normality test shapiro.test()
# To say that a distribution is normal, the p-value needs to be greater than 0.05.
# H0 = Data follows a normal distribution.
?shapiro.test
shapiro.test(sleep$extra[group_two]) # p-value = 0.3511 > 0.05
shapiro.test(sleep$extra[! group_two]) # p-value = 0.4079 > 0.05

# The test p-value of each group is greater than 0.05 and so we fail to reject H0.
# We can assume that the data follows a normal distribution.

# Validating Assumption 5 with Test F

# First we check for missing values
colSums(is.na(sleep))

# Let's see a statistical summary of the dataset
sleep %>% 
  group_by(group) %>%
  summarize(
    count = n(),
    mean = mean(extra, na.rm = TRUE),
    sd = sd(extra, na.rm = TRUE))

# To reject the null hypothesis that the group means are equal, we need a high F-value.
# H0 = Means of data extracted from a normally distributed population have the same variance.
?var.test
result_test_f <- var.test(extra ~ group, data = sleep)
result_test_f

# The p-value is 0.7427, so greater than 0.05. We failed to reject H0.
# There is no significant difference between the variances of the 2 groups.

# Validated assumptions. Now we can apply the t Test.

# We apply the t Test to answer the question:
# H0 (Null Hypothesis) – There is no significant difference between the means of the 2 groups
?t.test
t_test_result <- t.test(extra ~ group, data = sleep, var.equal = TRUE)
t_test_result

# Final analises:

# The p-value of the test is 0.07919, so greater than 0.05. We failed to reject H0.
# We can conclude that the 2 groups have no significant difference.
# There is no significant difference between the drugs applied to treat sleep disorders.
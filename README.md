# Shapiro-Wilk Test, F Test and t Test with sleep in R
[Script](https://github.com/Caio-Felice-Cunha/Shapiro-Wilk-Test_F-Test_and_t-Test_with_sleep_in_R/blob/main/Shapiro-Wilk%20Test%2C%20F%20Test%20and%20t%20Test%20with%20sleep%20in%20R.R)<br>
[Report](https://github.com/Caio-Felice-Cunha/Shapiro-Wilk-Test_F-Test_and_t-Test_with_sleep_in_R/blob/main/Shapiro-Wilk%20Test%2C%20F%20Test%20and%20t%20Test%20with%20sleep%20in%20R.pdf)

![image](https://user-images.githubusercontent.com/111542025/236589427-4a96f197-d589-4432-8e12-8087662b4ea7.png)
<br>

## This is the 1st version

## Business Problem
> Data source: sleep dataset in R package<br>

Our aim in this study is to answer the following question:<br>
* “Is there a significant difference in the mean sleep of the 2 groups of patients, that is, is there a significant difference between the two drugs that 
help with the sleep disorder?

Since we have two samples (two groups), we can apply the t Test to answer the question. But to apply the t Test, we first need to validate its assumptions (explained in the previous item) and for that we need the Shapiro-Wilke Test of the F Test.<bR>

We define the hypotheses for our test as follows:
* H0 (Null Hypothesis) =There is no significant difference between the means of the 2 groups.
* There is (Alternative Hypothesis) =There is a significant difference between the means of the 2 groups.

The interpretation of the t-Test result will help define whether or not we should reject H0 and answer the business question of this case study.

## Solution Strategy
To apply the t Test first we need to validate the 5 test assumptions:
1. Data are random and representative of the population.
2. The dependent variable is continuous.
3. Both groups are independent (i.e. exhaustive and exclusionary groups).
4. The residuals of the model are normally distributed.
5. The residual variance is homogeneous (principle of homoscedasticity).

For our example in this case study, we will assume as true the assumptions 1 to 3 and we will validate assumptions 4 and 5. For assumption 4 we will use the Shapiro-Wilk Test and for assumption 5 we will use the F Test.


## Conclusion
The p-value of the test is 0.07919, so greater than 0.05. We failed to reject H0.<br> 
We can conclude that the 2 groups have no significant difference.<br>
There is no significant difference between the drugs applied to treat sleep disorders.


## Disclaimer 
A good part of this project was largely done in the Data Science Academy, Big Data Analytics with R and Microsoft Azure Machine Learning course (part of the Data Scientist training)

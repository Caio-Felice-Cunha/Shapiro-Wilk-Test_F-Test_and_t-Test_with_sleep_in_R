# Shapiro-Wilk Test, F Test and t Test with sleep in R
[Script](https://github.com/Caio-Felice-Cunha/Shapiro-Wilk-Test_F-Test_and_t-Test_with_sleep_in_R/blob/main/Shapiro-Wilk%20Test%2C%20F%20Test%20and%20t%20Test%20with%20sleep%20in%20R.R)<br>
[Report](https://github.com/Caio-Felice-Cunha/Shapiro-Wilk-Test_F-Test_and_t-Test_with_sleep_in_R/blob/main/Shapiro-Wilk%20Test%2C%20F%20Test%20and%20t%20Test%20with%20sleep%20in%20R.pdf)

![image](https://user-images.githubusercontent.com/111542025/236589427-4a96f197-d589-4432-8e12-8087662b4ea7.png)
<br>

## Business Problem
> Data source: sleep dataset in R package<br>

Our aim in this study is to answer the following question:<br>
* “Is there a significant difference in the mean sleep of the 2 groups of patients, that is, is there a significant difference between the two drugs that 
help with the sleep disorder?

Since we have two samples (two groups), we can apply the t Test to answer the question. But to apply the t Test, we first need to validate its assumptions and for that we need the Shapiro-Wilk Test and the F Test.<br>

We define the hypotheses for our test as follows:
* H0 (Null Hypothesis): There is no significant difference between the means of the 2 groups.
* H1 (Alternative Hypothesis): There is a significant difference between the means of the 2 groups.

The interpretation of the t-Test result will help define whether or not we should reject H0 and answer the business question of this case study.

## Solution Strategy
To apply the t Test first we need to validate the 5 test assumptions:
1. Data are random and representative of the population.
2. The dependent variable is continuous.
3. Both groups are independent (i.e. exhaustive and exclusionary groups).
4. The residuals of the model are normally distributed.
5. The residual variance is homogeneous (principle of homoscedasticity).

For our example in this case study, we will assume as true the assumptions 1 to 3 and we will validate assumptions 4 and 5. For assumption 4 we will use the Shapiro-Wilk Test and for assumption 5 we will use the F Test.


## Results
All numbers below are the actual outputs of the script, as recorded in the knitted PDF report.

| Step | Test | Result | Reading |
| --- | --- | --- | --- |
| Group summary | descriptive | group 1: n=10, mean extra sleep = 0.75 h, sd = 1.79; group 2: n=10, mean = 2.33 h, sd = 2.00 | group 2 has the higher sample mean |
| Missing values | colSums(is.na) | extra 0, group 0, ID 0 | no missing data (the ID column flags the paired design) |
| Normality, group 1 | Shapiro-Wilk | W = 0.92581, p = 0.4079 | normality not rejected |
| Normality, group 2 | Shapiro-Wilk | W = 0.9193, p = 0.3511 | normality not rejected |
| Equal variances | F test | F = 0.79834, df 9 and 9, p = 0.7427, ratio 0.798 (95% CI 0.198 to 3.214) | equal variances not rejected |
| Means | two-sample t-test (unpaired, var.equal=TRUE) | t = -1.8608, df = 18, p = 0.07919, 95% CI -3.364 to 0.204 | fail to reject H0 at alpha = 0.05 |

## Conclusion
For the unpaired two-sample t-test the p-value is 0.07919, greater than 0.05, so we fail to reject H0. At the 5% level the data do not provide sufficient evidence of a difference in mean extra sleep between the two groups. Failing to reject H0 is not the same as proving the drugs are equivalent. It only means the evidence for a difference is not strong enough at this threshold.

### Note on test design
R's `sleep` dataset is a **paired** design. The same 10 patients each received both drugs, which is why the data carry an ID column (1 to 10 repeated in each group; see `?sleep` and the `colSums` output). The unpaired two-sample t-test reported above ignores that pairing. The methodologically correct test pairs the observations by patient with `t.test(extra ~ group, data = sleep, paired = TRUE)`, which removes between-patient variability and increases power. The script now runs both versions side by side so the unpaired and paired p-values can be compared directly. The paired figures are produced when you run the script in R and are intentionally not pre-printed here, since this machine has no R installation to re-knit the report.

## How to run
1. Install R (version 4.x or newer). RStudio is optional but convenient.
2. Install the required packages:
   ```r
   install.packages(c("car", "tidyverse"))
   ```
3. Run the analysis from R or RStudio (open and source the file), or from a terminal:
   ```bash
   Rscript "Shapiro-Wilk Test, F Test and t Test with sleep in R.R"
   ```
   The filename contains spaces, so keep the quotes when calling it from the command line. The `qqPlot` calls open plot windows in an interactive session; under `Rscript` they are written to the default graphics device.

## Disclaimer 
A good part of this project was largely done in the Data Science Academy, Big Data Analytics with R and Microsoft Azure Machine Learning course (part of the Data Scientist training)

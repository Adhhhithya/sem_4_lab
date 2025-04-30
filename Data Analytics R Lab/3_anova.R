# Create the data frame
data <- data.frame(
  Department = factor(c("Sales", "HR", "IT", "Marketing", "Sales", "HR", "IT", "Marketing", "Sales", "HR",
                        "IT", "Marketing", "Sales", "HR", "IT", "Marketing", "Sales", "HR", "IT", "Marketing")),
  Performance = c(78, 82, 90, 75, 85, 78, 91, 80, 88, 85,
                  76, 83, 92, 79, 86, 81, 89, 84, 94, 82)
)

# Check the structure of the data
str(data)

# Perform ANOVA to test for differences between departments
anova_result <- aov(Performance ~ Department, data = data)

# Summarize the ANOVA results
anova_summary <- summary(anova_result)
print(anova_summary)

# Check normality of residuals using a Q-Q plot
qqnorm(residuals(anova_result))
qqline(residuals(anova_result), col = "red")

# Check homogeneity of variances using Levene's Test
if(!require(car)) install.packages("car", dependencies = TRUE)
library(car)
leveneTest(Performance ~ Department, data = data)

# If ANOVA is significant, perform post-hoc Tukey's HSD test
if (anova_summary[[1]]$`Pr(>F)`[1] < 0.05) {
  tukey_result <- TukeyHSD(anova_result)
  print(summary(tukey_result))
} else {
  print("No significant differences found, no need for post-hoc tests.")
}

# Create a boxplot to visualize performance across departments
boxplot(Performance ~ Department, data = data,
        main = "Performance Comparison Across Departments",
        xlab = "Department",
        ylab = "Performance",
        col = c("lightblue", "lightgreen", "lightpink", "lightyellow"))


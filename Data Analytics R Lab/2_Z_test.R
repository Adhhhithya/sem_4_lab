group_A <- c(1,1,0,1,0,1,1,0,1,0)
group_B <- c(1,1,1,1,0,1,0,1,0,1)

prop_A <- mean(group_A)
prop_B <- mean(group_B)

n_A <- length(group_A)
n_B <- length(group_B)

p_pool <- (sum(group_A)+sum(group_B))/(n_A + n_B)
se <- sqrt(p_pool*(1-p_pool)*(1/n_A + 1/n_B))
z_stat <- (prop_A - prop_B)/se
p_value <- 2*pnorm(-abs(z_stat))

cat("Proportion of satisfied customers in Group A :",prop_A,"\n")
cat("Proportion of satisfied customers in Group B :",prop_B,"\n")
cat("Z-statistic:",z_stat,"\n")
cat("P-value:",p_value,"\n")
if(p_value <0.05)
  cat("Reject the Null Hypothesis : There is a significant difference between the proportions.\n")
else
  cat("Fail to reject the Null Hypothesis: There is no significant difference between the proportions.\n")

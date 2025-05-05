group1_scores <- c(85, 90, 88, 92, 87, 84, 86, 91, 89, 93) 
group2_scores <- c(78, 82, 80, 79, 76, 75, 74, 77, 81, 79) 

t_test_result <- t.test(group1_scores, group2_scores) 

cat("T-test Results:\n") 
print(t_test_result) 
cat("\nInterpretation:\n") 
if (t_test_result$p.value < 0.05)  
{ 
  cat("Reject the null hypothesis: There is a significant difference between the two groups' test 
scores.\n")
}else {
  cat("Fail to reject the null hypothesis: There is no significant difference between the two groups' 
test scores.\n")
} 
cat("\nAdditional Information:\n") 
cat("95% Confidence Interval for the difference in means: ", 
    t_test_result$conf.int[1], " to ", t_test_result$conf.int[2], "\n") 
cat("Mean of Group 1: ", mean(group1_scores), "\n") 
cat("Mean of Group 2: ", mean(group2_scores), "\n")
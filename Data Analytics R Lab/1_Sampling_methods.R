install.packages("dplyr")
library(dplyr)
set.seed(123)

population_size <- 100
mydata <- data.frame(
  id = 1:population_size,value=rnorm(population_size),
  group=sample(c("Male","Female"),population_size,replace = TRUE)
)

sample_size_simple <- 10 
simple_random_sample <- sample(mydata$id,sample_size_simple,replace = FALSE)
cat("\nSimple Random Sample (10 observations):\n")
print(mydata[mydata$id%in%simple_random_sample,])

sample_size_systematic <- 10
k <- floor(population_size/sample_size_systematic)
first_element <- sample(1:k,1)
systematic_sample<-mydata$id[seq(first_element,population_size,by=k)]
cat("\nSystematic Random Sample (10 observations):\n")
print(mydata[mydata$id%in%systematic_sample,])

sample_size_stratified <- 3
stratified_sample <- mydata %>%
  group_by(group) %>%
  slice_sample(n = sample_size_stratified, replace = TRUE)
cat("\nStratified Random Sample (3 observations from each group):\n")
print(stratified_sample)

remove.packages("dplyr")
install.packages("dplyr")
library(dplyr)

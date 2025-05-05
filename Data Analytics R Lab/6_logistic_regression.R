library(ggplot2)
library(dplyr)
library(caTools)
set.seed(123)

customer_data <- data.frame(
  age = sample(18:70,1000,replace = TRUE),
  income = sample(20000:100000,1000,replace = TRUE),
  marital_status = sample(c("Single","Married","Divorced"),1000,replace = TRUE),
  product_purchased = sample(c(0,1),1000,replace = TRUE)
)

str(customer_data)

customer_data$marital_status <- as.factor(customer_data$marital_status)
customer_data$product_purchased <- as.factor(customer_data$product_purchased)

set.seed(123)

split=sample.split(customer_data$product_purchased,SplitRatio = 0.7)
train_data <- subset(customer_data,split==TRUE)
test_data <- subset(customer_data,split==FALSE)

logit_model <- glm(product_purchased ~ age+income+marital_status, data =train_data, family = binomial)
summary(logit_model)

predictions_prob <- predict(logit_model,newdata = test_data,type = "response")
predictions <- ifelse(predictions_prob >0.5 ,1,0)
conf_matrix <- table(Predicted = predictions,Actual = test_data$product_purchased)
print(conf_matrix)

accuracy<- sum(predictions==test_data$product_purchased)/nrow(test_data)
cat("Accuracy of Logistic Regression Model :",accuracy,"\n")

ggplot(test_data,aes(x=age,y = predictions_prob))+
  geom_point(aes(color=as.factor(product_purchased)),aplha=0.6)+
  labs(title = "Predicted Probability of Product Purchased vs Age",x="Age",y="Predicted Probability")+
  scale_color_manual(values = c("red","green"),name="Product Purchased",labels=c("No","Yes"))
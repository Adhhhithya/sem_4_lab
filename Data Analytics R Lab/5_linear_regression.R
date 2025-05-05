install.packages("ggplot2") 
install.packages("dplyr")
library(ggplot2) 
library(dplyr)
# Sample dataset
house_data <- data.frame(
  price = c(200000, 250000, 300000, 350000, 400000, 450000, 500000, 550000, 600000, 650000),
  size = c(1200, 1500, 1800, 2000, 2500, 2800, 3200, 3500, 4000, 4500),
  location = factor(c("A", "B", "C", "A", "B", "C", "A", "B", "C", "A")),
  age = c(10, 5, 15, 7, 20, 25, 8, 6, 30, 12)
)

# Check structure
str(house_data)

# One-hot encode 'location' manually
house_data <- house_data %>%
  mutate(location = as.factor(location))

house_data <- cbind(house_data, model.matrix(~ location - 1, data = house_data))

# View the first few rows
head(house_data)

# Build the linear regression model
model <- lm(price ~ size + age + locationA + locationB, data = house_data)

# Model summary
summary(model)

# Plot model diagnostics
par(mfrow = c(2, 2))
plot(model)

# Predict on new data
new_data <- data.frame(
  size = c(1600, 2200, 3500),
  locationA = c(1, 0, 0),
  locationB = c(0, 1, 0),
  age = c(5, 10, 15)
)

predictions <- predict(model, new_data)
print(predictions)

# Visualization
ggplot(house_data, aes(x = size, y = price)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  ggtitle("Relationship Between Size and Price")

ggplot(house_data, aes(x = age, y = price)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  ggtitle("Relationship Between Age and Price")

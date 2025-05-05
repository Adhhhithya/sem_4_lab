install.packages("forecast")
install.packages("ggplot2")
install.packages("tseries")
install.packages("dplyr")
install.packages("caTools")

library(forecast)
library(ggplot2)
library(tseries)
set.seed(123)

sales_data <- ts(rnorm(120,mean = 100,sd = 20),frequency = 12,start = c(2020,1))
plot(sales_data,main = "Monthly Sales Data",ylab="Sales",xlab="Time",col="blue")

sales_decomposed <- decompose(sales_data)
plot(sales_decomposed)

adf_test <- adf.test(sales_data)
print(adf_test)

arima_model <- auto.arima(sales_data)
summary(arima_model)
forecast_arima <- forecast(arima_model,h = 12)
plot(forecast_arima,main = "ARIMA Forecast for Monthly Sales",xlab="Time",ylab="Sales")

ets_model <- ets(sales_data)
summary(ets_model)
forecast_ets <- forecast(ets_model,h = 12)
plot(forecast_ets,main = "ETS Forecast for Monthly Sales",xlab="Time",ylab = "Sales")

accuracy_arima <- accuracy(forecast_arima) 
accuracy_ets <- accuracy(forecast_ets) 
print("ARIMA Model Accuracy:") 
print(accuracy_arima) 
print("ETS Model Accuracy:") 
print(accuracy_ets) 

checkresiduals(arima_model) 
checkresiduals(ets_model) 

write.csv(forecast_arima, "arima_forecast.csv") 
write.csv(forecast_ets, "ets_forecast.csv") 
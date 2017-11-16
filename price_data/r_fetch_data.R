rm(list = ls())
install.packages("quantmod")

library(quantmod)
insetwd("./work/python/cqa/price_data/")


temp <- read.csv("Tickers.csv", header = T)
tickers <- as.vector(temp$Ticker)

# Stock Price Daily
StockPriceDaily <- function(symbol){
  data <- new.env()
  start_date <- as.Date('2015-01-01')  # Changing your Start Date
  end_date <- as.Date('2017-11-09') # Changing your End Date   
  getSymbols(symbol,env = data, from = start_date, to = end_date,src = "yahoo")
  temp <- get(symbol,envir = data)
  price <- as.data.frame(temp)
  colnames(price) <- c("Open","High","Low","Close","Volume","Adjusted")
  write.csv(price,paste(symbol,".csv",sep=""))
}

for (i in seq(1:length(tickers)))
{StockPriceDaily(tickers[i])}

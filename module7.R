# Download any type of data (from the web or use datasets package) or create your own set. 

library("data.table")
options(scipen = 999)
df <- fread("/Users/dre/Downloads/gemini_ETHUSD_2020_1min.csv", integer64 = "character")


#Then, on the second step, determine if generic function as discussed in this module can be assigned to your data set, and if not, why? (Example, here is list of data set in R)
#data("mtcars")
#head (mtcars, 6)
#list(mtcars, 6)

# example generic functions
head (df, 6)
tail(df, 6)
list(df, 6)
str(df)
summary(df)




#In third and last step, explore if S3 and S4 can be assigned to your data set.

df_s3_function = function(d, s, v) {
	eth = list(date = d, symbol = s, volume = v)
	class(eth) <- "eth_price"
	eth
}

print.eth_s3 <- function(eth) {
	cat("Date: ", eth$date, "\n")
	cat("Symbol: ", eth$symbol, "\n")
	cat("Volume: ", eth$volume, "\n")
}

setClass("eth_s4",
	representation(
		date="character",
		symbol="character",
		volume="numeric")
)

setMethod("show", "eth_s4",
	function(object) {
		cat("Date: ", object@date, "\n")
		cat("Symbol: ", object@symbol, "\n")
		cat("Volume: ", object@volume, "\n")
	}
)


df_s3 <- list(Date = "2021-02-27 08:01:00", symbol = "eth", volume = 3.5) 
df_s3
df_s4 <- new("eth_s4", date="2021-02-27 08:01:00", symbol="bitcoin", volume=40)
df_s4


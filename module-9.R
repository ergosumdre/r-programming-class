library("ggthemes")
library("data.table")
library("ggplot2")
library("dplyr")

airlines <- fread("/Users/dre/Downloads/Airline.csv")
airlines <- airlines %>% mutate(airline = as.factor(airline))
ggplot(airlines) +
  geom_line(aes(x = year, y = cost, color = airline)) +
  geom_point(aes(x = year, y = cost, color = airline)) +
  labs(title = "Cost of each Airliner since 2006",
       x = "Year", 
       y = "Cost",
       color = "Airliner") +
  theme_fivethirtyeight() +
  theme(axis.title = element_text())
ggplot(airlines) +
  geom_line(aes(x = year, y = output, color = airline)) +
  geom_point(aes(x = year, y = output, color = airline)) +
  labs(title = "Relative Revenue for each Airliner since 2006",
       x = "Year", 
       y = "Revenue",
       color = "Airliner")
ggplot(airlines, aes(x=cost, y=output, fill=airline)) +
  geom_violin(trim=FALSE) +
  labs(title = "Cost to Revenue of each Airliner",
       x = "Cost", 
       y = "Relative Revenue",
       color = "Airliner")
       ggplot(airlines) +
  geom_histogram(aes(x = lf, fill = ..x..),position="identity", bins=15) +
  labs(title = "Histogram of Load Factor", 
       x = "Load Factor (Impact of Weight)",
       y = "Freq") +
  scale_fill_gradient("Legend",low = "green", high = "blue")

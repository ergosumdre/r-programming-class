library("data.table")
library("plyr")
library("ISLR")
library("boot")


df <- read.table("/Users/dre/Downloads/Assignment 6 Dataset-1.txt", 
                                   header = TRUE,
                                   sep = ",")
df <- df %>% dplyr::rename(Student = "Name")
df <- ddply(df, "Sex", transform, Grade.Average = mean(Grade))
df_sex <- df %>% select(Sex)
mean(df_sex)



i_students <- subset(df, grepl("i", df$Student, ignore.case=T))
write.csv(i_students, "i_students.csv")

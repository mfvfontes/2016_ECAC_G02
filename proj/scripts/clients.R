df_clients <- read.csv("data/client.csv", sep = ";")

get_gender <- function(m) {
  
  if(m > 50) {
    return ("f")
  } else {
    return ("m")
  }
  
}

df_clients$birth_number <- as.character(df_clients$birth_number)

year <- substr(df_clients$birth_number, 1, 2)
month <- substr(df_clients$birth_number, 3, 4)
day <- substr(df_clients$birth_number, 5, 6)
gender <- sapply(month, get_gender)

df_clients$gender <- gender

counts_gender <- table(df_clients$gender)

names(counts_gender) <- c("Female", "Male")
bp_gender <- barplot(counts_gender, ylab = "Frequency", main = "Frequency of Gender")
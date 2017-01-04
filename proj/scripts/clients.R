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
cols <- colorRampPalette(c("darkblue", "red"))(2)
bp_gender <- barplot(counts_gender, ylab = "Frequency", main = "Frequency of Gender", col = cols)

names(df_districts)[names(df_districts)=="code"] <- "district_id"
df_clients_merged <- merge(df_clients, df_districts, by="district_id")

counts_region <- table(df_clients_merged$region)
cols <- colorRampPalette(c("darkblue", "red"))(8)

names(counts_region) <- c("C.Bohemia", "E.Bohemia", "N.Bohemia", "N.Moravia", "Prague", "S.Bohemia", "S.Moravia", "W.Bohemia")
bp_region <- barplot(counts_region, ylab = "Frequecy", main = "Frequency of Regions", ylim = c(0,1e3), col = cols)

summary(clients_per_region$Freq)
df_clients <- read.csv("data/client.csv", sep = ";")

get_age <- function(y) {
  return (2016-y)
}

get_gender <- function(m) {
  
  if(m > 50) {
    return ("f")
  } else {
    return ("m")
  }
  
}

discrete_gender <- function(g) {
  if(g == "m") {
    return (0)
  }
  else {
    return (1)
  }
}

discrete_card <- function(t) {
  if(t == "classic") {
    return (0)
  } else if(t == "gold") {
    return (1)
  } else {
    return (2)
  }
}

df_clients$birth_number <- as.character(df_clients$birth_number)

year <- paste0("19", substr(df_clients$birth_number, 1, 2))
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

df_clients$year <- year
year_2016 <- rep(2016, length(df_clients$client_id))
df_clients$year <- as.numeric(df_clients$year)
df_clients$age <- sapply(df_clients$year, get_age)

df_clients <- merge(df_clients, df_disp, by = "client_id")
df_clients <- merge(df_clients, df_cards, by = "disp_id")

df_clients_cluster <- df_clients[, c("age", "gender", "type.y")]
df_clients_cluster$gender <- sapply(df_clients_cluster$gender, discrete_gender)
df_clients_cluster$type.y <- sapply(df_clients_cluster$type.y, discrete_card)

df_clients_cluster$age <- scale(df_clients_cluster$age)

fit <- kmeans(df_clients_cluster, 5)

clusplot(df_clients_cluster, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0, main = "Client vs. Card Clusters")
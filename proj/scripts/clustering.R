df_clients <- read.csv("data/client.csv", sep = ";")
df_districts <- read.csv("data/district.csv", sep = ";")

get_age <- function(y) {
  return (2016-y)
}

df_clients$birth_number <- as.character(df_clients$birth_number)

year <- paste0("19", substr(df_clients$birth_number, 1, 2))

df_clients$year <- year
year_2016 <- rep(2016, length(df_clients$client_id))
df_clients$year <- as.numeric(df_clients$year)
df_clients$age <- sapply(df_clients$year, get_age)

colnames(df_districts)[1] <- c("district_id")
df_clients <- merge(df_clients, df_districts, by = "district_id")

df_clients_cluster <- df_clients[, c("age", "no..of.inhabitants", "no..of.municipalities.with.inhabitants...499", 
                             "no..of.municipalities.with.inhabitants.500.1999", "no..of.municipalities.with.inhabitants.2000.9999",
                             "no..of.municipalities.with.inhabitants..10000", "no..of.cities",
                             "ratio.of.urban.inhabitants", "average.salary",
                             "unemploymant.rate..96", "no..of.enterpreneurs.per.1000.inhabitants",
                             "no..of.commited.crimes..96")]

df_clients_cluster <- scale(df_clients_cluster)

fit <- kmeans(df_clients_cluster, 4)

clusplot(df_clients_cluster, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0, main = "Client vs. Demography Clusters")
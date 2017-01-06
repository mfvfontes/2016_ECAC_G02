df_clients <- read.csv("data/client.csv", sep = ";")
df_disp <- read.csv("data/disp.csv", sep = ";")
df_districts <- read.csv("data/district.csv", sep = ";")
df_transactions <- read.csv("data/trans_train.csv", sep = ";")

colnames(df_districts)[1] <- c("district_id")
df_clients <- merge(df_clients, df_districts, by = "district_id")
df_clients <- merge(df_clients, df_disp, by = "client_id")
df_clients <- merge(df_clients, df_transactions, by = "account_id")
df_clients <- subset(df_clients, df_clients$k_symbol == "insurrance payment")

df_clients_cluster <- df_clients[, c("amount", "no..of.inhabitants", "ratio.of.urban.inhabitants",
                                     "average.salary", "unemploymant.rate..96", 
                                     "no..of.enterpreneurs.per.1000.inhabitants", "no..of.commited.crimes..96")]

df_clients_cluster <- scale(df_clients_cluster)

fit <- kmeans(df_clients_cluster, 4)

clusplot(df_clients_cluster, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0, main = "Client vs. Insurances Clusters")
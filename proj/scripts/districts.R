df_accounts <- read.csv("files/account.csv", sep = ";")

attach(df_accounts)

names <- sort(unique(district_id))

length(unique(district_id))

counts <- table(district_id)

counts

hist(district_id, length(unique(district_id)), main = "Frequency of Districts", xlab = "District ID", labels = TRUE, col = "grey")
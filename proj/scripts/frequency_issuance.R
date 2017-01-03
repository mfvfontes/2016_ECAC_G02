df_accounts <- read.csv("data/account.csv", sep = ";")

counts <- table(df_accounts$frequency)

bp <- barplot(counts, ylab = "Frequency", main = "Frequency of Issuance")
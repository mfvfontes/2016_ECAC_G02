df_disp <- read.csv("data/disp.csv", sep = ";")
df_transactions <- read.csv("data/trans_train.csv", sep = ";")
df_cards <- read.csv("data/card_train.csv", sep = ";")

df_disp_cards <- merge(df_disp, df_cards, by = "disp_id")
df_transactions_cards <- merge(df_disp_cards, df_transactions, by = "account_id")
df_sanctions <- subset(df_transactions_cards, df_transactions_cards$k_symbol == "sanction interest if negative balance" & df_transactions_cards$balance < 0)
df_sanctions <- df_sanctions[-4, ]
df_sanctions <- df_sanctions[, c(1, 2, 3, 5, 6, 7, 9)]
colnames(df_sanctions)[5] <- c("type")

write.table(df_sanctions, file = "sanctions.csv", row.names = TRUE, sep = ";")
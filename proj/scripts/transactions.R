df_transactions <- read.csv("data/trans_train.csv", sep = ";")
df_accounts <- read.csv("data/account.csv", sep = ";")
df_loans <- read.csv("data/loan_train.csv", sep = ";")

df_payment_orders <- subset(df_transactions, df_transactions$type == "withdrawal" & df_transactions$bank != "")

df_payment_orders <- merge(df_payment_orders, df_accounts, by = "account_id")
df_payment_orders <- merge(df_payment_orders, df_loans, by = "account_id")

df_payment_orders <- df_payment_orders[, c("account_id", "date.x", "bank", "account", "amount.x", "k_symbol")]

order_ids <- c(1:length(df_payment_orders$account_id))

colnames(df_payment_orders)[5] <- c("amount")
colnames(df_payment_orders)[2] <- c("date")
colnames(df_payment_orders)[1] <- c("account_src")
colnames(df_payment_orders)[4] <- c("account_dst")
df_payment_orders$order_id <- order_ids
df_payment_orders <- df_payment_orders[, c(7, 1, 2, 3, 4, 5, 6)]
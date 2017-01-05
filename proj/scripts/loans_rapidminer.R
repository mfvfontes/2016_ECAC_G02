df_accounts <- read.csv("data/account.csv", sep = ";")
df_districts <- read.csv("data/district.csv", sep = ";")
df_loans <- read.csv("data/loan_train.csv", sep = ";")

colnames(df_districts)[1] <- c("district_id")

df_accounts_districts <- merge(df_accounts, df_districts, by = "district_id")

df_accounts_districts <- merge(df_accounts_districts, df_loans, by = "account_id")
df_accounts_districts <- df_accounts_districts[, c("average.salary", "duration", "amount", "status")]

write.table(df_accounts_districts, file = "df_loans_salaries.csv", row.names = TRUE, sep = ";")
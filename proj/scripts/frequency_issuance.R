df_accounts <- read.csv("data/account.csv", sep = ";")

counts <- table(df_accounts$frequency)

cols <- colorRampPalette(c("blue", "red"))(3)
bp <- barplot(counts, ylab = "Frequency", main = "Frequency of Issuance", col = cols)
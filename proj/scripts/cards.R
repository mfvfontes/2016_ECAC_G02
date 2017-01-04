df_cards <- read.csv("data/card_train.csv", sep = ";")

counts_cards <- table(df_cards$type)

df_counts_cards <- as.data.frame(counts_cards)

# Pie Chart with Percentages
slices <- df_counts_cards$Freq
lbls <- c("Classic", "Gold", "Junior")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls, "%", sep="") # ad % to labels 
cols <- c("darkblue", "darkgreen", "red")
pie(slices, labels = lbls, col = cols, main="Card Type")
df_loans <- read.csv("data/loan_train.csv", sep = ";")

loan_color <- function(color) {
  
  return (color)
  
}

counts_status <- table(df_loans$status)

names(counts_status) <- c("Failure", "Success")
cols <- colorRampPalette(c("red", "darkblue"))(2)
barplot(counts_status, ylab = "Frequency", main = "Frequency of Loans", col = cols)

df_loans_success <- subset(df_loans, df_loans$status == 1)
df_loans_failure <- subset(df_loans, df_loans$status == -1)

counts <- table(df_loans$status, df_loans$duration)

barplot(counts, col=c("red", "darkblue"), xlab = "Duration", ylab = "Frequency", main = "Loan duration")
legend("topright", legend = c("Success", "Failure"), cex = 0.5, col = c("darkblue", "red"), ncol = 2, fill = 1:2)
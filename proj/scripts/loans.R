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

options(scipen=999)

layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))

df_loans_success <- df_loans_success[order(df_loans_success$amount), ]
df_loans_failure <- df_loans_failure[order(df_loans_failure$amount), ]

y_success = pnorm(df_loans_success$amount, mean = mean(df_loans_success$amount), sd = sd(df_loans_success$amount))
y_failure = pnorm(df_loans_failure$amount, mean = mean(df_loans_failure$amount), sd = sd(df_loans_failure$amount))
plot(x = df_loans_success$amount, y = y_success, type = "l", xlab = "Loan Amount", ylab = "F(x)", main = "Loan Amount CDF", col = "darkblue")
lines(x = df_loans_failure$amount, y = y_failure, type = "l", xlab = "Loan Amount", ylab = "F(x)", col = "red", add = TRUE)
legend(x = 400000, y = 0.9, legend = c("Success", "Failure"), cex = 0.5, col = c("darkblue", "red"), ncol = 2, fill = 1:2)

boxplot(df_loans_success$amount, main = "Loan Amount (Success)", ylab = "Amount", col = "darkblue", boxwex = 0.4)
boxplot(df_loans_failure$amount, main = "Loan Amount (Failure)", ylab = "Amount", col = "red", boxwex = 0.4)

par(mfrow = c(1,1))

plot(x = df_loans_success$amount, y = y_success, type = "l", xlab = "Loan Amount", ylab = "F(x)", main = "Loan Amount CDF", col = "darkblue")
lines(x = df_loans_failure$amount, y = y_failure, type = "l", xlab = "Loan Amount", ylab = "F(x)", col = "red", add = TRUE)
legend(x = 400000, y = 0.9, legend = c("Success", "Failure"), cex = 0.5, col = c("darkblue", "red"), ncol = 2, fill = 1:2)

df_districts <- read.csv("data/district.csv", sep = ";")

color_increase <- function(value) {
  
  if(value > 1) {
    return ("red")
  } else {
    return ("green")
  }
  
}

# Unemployment 95-96

df_districts$unemploymant.rate..95 <- as.numeric(as.character(df_districts$unemploymant.rate..95))
df_districts$unemploymant.rate..96 <- as.numeric(as.character(df_districts$unemploymant.rate..96))

attach(df_districts)

unemployment_rate_increase <- unemploymant.rate..96[-69]/unemploymant.rate..95[-69]

cols <- sapply(unemployment_rate_increase, color_increase)

plot(x = df_districts$unemploymant.rate..95[-69], y = df_districts$unemploymant.rate..96[-69], xlab = "Unemployment Rate (1995)", ylab = "Unemployment Rate (1996)", main = "Unemployment Rate 95-96", xlim = c(0,8), ylim = c(0,10), col = cols)
lines(x = c(0,10), y = c(0,10), col = "darkblue")

# Crimes 95-96

df_districts$no..of.commited.crimes..95 <- as.numeric(as.character(df_districts$no..of.commited.crimes..95))
df_districts$no..of.commited.crimes..96 <- as.numeric(as.character(df_districts$no..of.commited.crimes..96))

crime_rate_increase <- df_districts$no..of.commited.crimes..96[-69]/df_districts$no..of.commited.crimes..95[-69]

cols <- sapply(crime_rate_increase, color_increase)

plot(x = df_districts$no..of.commited.crimes..95[-69], y = df_districts$no..of.commited.crimes..96[-69], xlab = "Crimes (1995)", ylab = "Crimes (1996)", main = "Crimes between 95-96", xlim = c(0, 7000), ylim = c(0, 8000), col = cols)
lines(x = c(0,100000), y = c(0,100000), col = "darkblue")

# Unemployment vs. Crimes

unemployment_vs_crimes <- data.frame(df_districts$code[-69], df_districts$average.salary[-69], unemployment_rate_increase, crime_rate_increase)

both_increasing <- subset(unemployment_vs_crimes, unemployment_vs_crimes$unemployment_rate_increase >= 1.0 & unemployment_vs_crimes$crime_rate_increase >= 1.0)

percentage_both_increasing <- (length(both_increasing$df_districts.code) / length(unemployment_vs_crimes$df_districts.code[-69]))*100

print(percentage_both_increasing)

plot(x = df_districts$code, y = df_districts$average.salary, ylim = c(7000, 14000), xlab = "District ID", ylab = "Average Salary", main = "Average Salary per District", col = "red")

detach(df_districts)
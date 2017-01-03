df_districts <- read.csv("data/district.csv", sep = ";")

# Unemployment 95-96

df_districts$unemploymant.rate..95 <- as.numeric(as.character(df_districts$unemploymant.rate..95))
df_districts$unemploymant.rate..96 <- as.numeric(as.character(df_districts$unemploymant.rate..96))

attach(df_districts)

unemployment_rate_increase <- unemploymant.rate..96/unemploymant.rate..95

plot(x = df_districts$unemploymant.rate..95, y = df_districts$unemploymant.rate..96, xlab = "Unemployment Rate (1995)", ylab = "Unemployment Rate (1996)", main = "Unemployment Rate 95-96", xlim = c(0,8), ylim = c(0,10))
lines(x = c(0,100), y = c(0,100), col = "red")

# Crimes 95-96

df_districts$no..of.commited.crimes..95 <- as.numeric(as.character(df_districts$no..of.commited.crimes..95))
df_districts$no..of.commited.crimes..96 <- as.numeric(as.character(df_districts$no..of.commited.crimes..96))

crime_rate_increase <- df_districts$no..of.commited.crimes..96/df_districts$no..of.commited.crimes..95

plot(x = df_districts$no..of.commited.crimes..95, y = df_districts$no..of.commited.crimes..96, xlab = "Crimes (1995)", ylab = "Crimes (1996)", main = "Crimes between 95-96", xlim = c(0, 7000), ylim = c(0, 8000))
lines(x = c(0,100000), y = c(0,100000), col = "red")

# Unemployment vs. Crimes

unemployment_vs_crimes <- data.frame(df_districts$code, df_districts$average.salary, df_districts$no..of.enterpreneurs.per.1000.inhabitants, unemployment_rate_increase, crime_rate_increase)

unemployment_vs_crimes <- unemployment_vs_crimes[-c(69), ]

both_increasing <- subset(unemployment_vs_crimes, unemployment_vs_crimes$unemployment_rate_increase >= 1.0 & unemployment_vs_crimes$crime_rate_increase >= 1.0)

percentage_both_increasing <- (length(both_increasing$df_districts.code) / length(unemployment_vs_crimes$df_districts.code))*100

print(percentage_both_increasing)

detach(df_districts)
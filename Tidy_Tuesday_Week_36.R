cafe <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2026/2026-09-08/cafe.csv')
cappuccino_index <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2026/2026-09-08/cappuccino_index.csv')

cappuccino_index$time_seconds <- 60*cappuccino_index$minutes + cappuccino_index$seconds
hist(cappuccino_index$time_seconds)

grep('USA', cappuccino_index$country)

abline(v = cappuccino_index$time_seconds[16], col=2)

country_var <- summarize(cafe, variability = sd(price_gpb), .by = (country))

boxplot(country_var$variablity)
idx <- which(country_var$variability >= sort(country_var$variability), decreasing = TRUE[2])

text(x=1,y=country_var$variability[idx])

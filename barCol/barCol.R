## ggplot2 -- Bar(y=count) and column plot

library(ggplot2)

# Bar plot of different race.
ggplot(data=nhanes) +
  # y is the count of each race, 
  # and group by gender showing in different color margin.
  geom_bar(mapping=aes(x=race_ethc, color=gender))

ggplot(data=nhanes) +
  # Use fill= option to show count of different gender in each race.
  geom_bar(mapping=aes(x=race_ethc, fill=gender))

# Calculate mean BMXBMI in each race_ethc group
mean_bmi <- tapply(nhanes$BMXBMI, nhanes$race_ethc, mean, na.rm = T)
# Create tibble with race and corresponding mean BMXBMI
tibble(race = names(mean_bmi), meanBMI = mean_bmi) %>%
  ggplot() +
  # Column plot: y is mean BMXBMI and x is each race group
  geom_col(mapping=aes(x=race, y=meanBMI))



# Data preprocessing

library(tidyverse)

data <- read.csv('nhanes_processed.csv')

# A basic summary about type, statistics and NAs.
summary(data)

# Convert character to numeric, convert categorical variable from character to factor.
nhanes <- data %>%
  mutate(BPXDI1=as.numeric(BPXDI1), BPXDI2=as.numeric(BPXDI2),
         race_ethc=as.factor(race_ethc), gender=as.factor(gender),
         BMXBMI=as.numeric(BMXBMI))
summary(nhanes)

# Save processed file.
# write.csv(nhanes, 'nhanes_processed.csv')

summary(nhanes)

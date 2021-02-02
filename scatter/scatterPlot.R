## ggplot2 -- Scatter plot

library(ggplot2)

# Read data into environment.
nhanes <- read.csv('nhanes_processed.csv')

# Scatter plot of DR1TFOLA vs BMXBMI

# ggplot() to initialize. 
# We use only one dataset nhanes for this plot, so we put data=nhanes inside ggplot().

ggplot(data=nhanes) +
  # We group points by gender and plot them with different shape.
  geom_point(mapping = aes(x=BMXBMI, y=DR1TFOLA, shape=gender))

ggplot(data=nhanes) +
  # We group points by gender and plot them with different color.
  geom_point(mapping = aes(x=BMXBMI, y=DR1TFOLA, color=gender))

ggplot(data=nhanes) +
  # We group points by gender and race_ethc, 
  # and plot them with different color for each gender,
  # with different size for each race_ethc.
  geom_point(mapping = aes(x=BMXBMI, y=DR1TFOLA, color=gender,
                           size=race_ethc))

ggplot(data=nhanes) +
  # Points are overlapping, so we change alpha (transparency) to 0.5
  geom_point(mapping = aes(x=BMXBMI, y=DR1TFOLA, color=gender,
                           size=race_ethc), alpha=1/2)

## ggplot2 -- Line plot

library(ggplot2)

# Read data into environment.
nhanes <- read.csv('nhanes_processed.csv')

# Line plot of DR1TFOLA vs BMXBMI
ggplot(data=nhanes) +
  # We group data points by gender and plot line with different color.
  geom_line(mapping = aes(x=BMXBMI, y=DR1TFOLA, color=gender)) +
  # We could also add points on the figure.
  geom_point(mapping = aes(x=BMXBMI, y=DR1TFOLA, color=gender))

# We could move the parameters into ggplot(), 
# since the parameters are the same in geom_line() and geom_point()
ggplot(data=nhanes, mapping=aes(x=BMXBMI, y=DR1TFOLA, color=gender)) +
  geom_line() + 
  geom_point()

# In addition we could add some other parameters respectively.
ggplot(data=nhanes, mapping=aes(x=BMXBMI, y=DR1TFOLA, color=gender)) +
  # smooth line, default method: loess; 
  # se=F means don't display confidence interval around smooth.
  geom_smooth(se=FALSE) + 
  geom_point(alpha=1/10)
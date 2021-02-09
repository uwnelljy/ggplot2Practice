## ggplot2 -- Predefined themes

library(ggthemes)
ggplot(data=nhanes, mapping=aes(x=BMXBMI, y=DR1TFOLA, color=gender)) +
  geom_point(alpha=5/10) +
  # some beautiful themes
  theme_wsj()

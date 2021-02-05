## ggplot2 -- boxplot

library(ggplot2)

ggplot(data=nhanes)+
  geom_jitter(mapping=aes(x=gender, y=BMXBMI))

ggplot(data=nhanes)+
  geom_boxplot(mapping=aes(x=race_ethc, y=BMXBMI, color=gender))

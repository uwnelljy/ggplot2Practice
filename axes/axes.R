## ggplot2 -- theme: change x and y axes

ggplot(data=nhanes) +
  geom_bar(mapping=aes(x=race_ethc, fill=gender))+
  theme(plot.background=element_blank())+
  theme(panel.background=element_blank())+
  # change the name of y axes
  ylab('number of people') +
  # change x axes
  xlab('races') +
  # set the limit of y axis as 0-500
  ylim(0, 500)

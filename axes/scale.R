## ggplot2 -- change scale: axes, limits, colors

ggplot(data=nhanes) +
  geom_bar(mapping=aes(x=race_ethc, fill=gender))+
  theme(plot.background=element_blank())+
  theme(panel.background=element_blank())+
  # change the major grid to grey solid line
  theme(panel.grid.major=element_line(color='grey', linetype = 1)) +
  # change the minor grid to grey dash line
  theme(panel.grid.minor = element_line(color='grey', linetype = 2)) +
  # scale: change the attributes of axis including name, limits
  scale_x_discrete(name='races') +
  scale_y_continuous(name='number of people', limits = c(0, 800)) +
  # change 'fill' in geom_bar, change color of each gender using values
  scale_fill_manual(values = c('orange', 'chocolate'))

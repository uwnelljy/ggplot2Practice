## ggplot2 -- change scale: legend

ggplot(data=nhanes) +
  geom_bar(mapping=aes(x=race_ethc, fill=gender))+
  theme(plot.background=element_blank())+
  theme(panel.background=element_blank())+
  theme(panel.grid.major=element_line(color='grey', linetype = 1)) +
  theme(panel.grid.minor = element_line(color='grey', linetype = 2)) +
  scale_x_discrete(name='races') +
  scale_y_continuous(name='number of people', limits = c(0, 800)) +
  
  # change 'fill' in geom_bar: gender
  # values: change color
  scale_fill_manual(values = c('orange', 'chocolate'),
                    # guide: change legend
                    guide = guide_legend(title='gender type', #change legend name
                                         nrow = 1, # how to display legend. nrow=1 or ncol=1 or...
                                         label.position = 'bottom', # the position of 'Female' and 'Male'
                                         keywidth = 1)) +
  # the position of legend
  theme(legend.position = 'top')

## ggplot2 -- theme: change background and legend position

library(ggplot2)

# f1
ggplot(data=nhanes) +
  geom_bar(mapping=aes(x=race_ethc, fill=gender)) + 
  # change the canvas background to color grey
  theme(plot.background = element_rect(fill='grey'))

# f2
ggplot(data=nhanes) +
  geom_bar(mapping=aes(x=race_ethc, fill=gender)) +
  # change the panel background to color grey
  theme(panel.background=element_rect(fill='grey'))

# f3
ggplot(data=nhanes) +
  geom_bar(mapping=aes(x=race_ethc, fill=gender))+
  # change both canvas and panel background to blank
  theme(plot.background=element_blank())+
  theme(panel.background=element_blank())

# f4
ggplot(data=nhanes) +
  geom_bar(mapping=aes(x=race_ethc, fill=gender)) +
  theme(panel.background=element_blank()) +
  theme(panel.background=element_blank()) +
  # change the color of major panel grid to grey
  theme(panel.grid.major=element_line(color='grey'))

# f5
ggplot(data=nhanes) +
  geom_bar(mapping=aes(x=race_ethc, fill=gender)) +
  theme(panel.background=element_blank()) +
  theme(panel.background=element_blank()) +
  # change the color of major panel grid on y axis to grey
  theme(panel.grid.major.y=element_line(color='grey'))

## ggplot2 -- Annotation functions

ggplot(data=nhanes, mapping=aes(x=BMXBMI, y=DR1TFOLA, color=gender)) +
  geom_point(alpha=5/10) +
  
  # add annotation at each position with label
  annotate('text', label='both high', x = 52, y = 1300) +
  
  # add horizontal line with yintercept
  geom_hline(yintercept=mean(nhanes$DR1TFOLA)) + # horizontal line
  annotate('text', label='mean dr1tfola', x = 52, y = 500) +
  
  # add vertical line with xintercept
  geom_vline(xintercept=mean(nhanes$BMXBMI, na.rm=T)) +
  annotate('text', label='mean BMXBMI', x = 35, y = 1600) +
  
  # change the background of legend key ('Female' and 'Male') to blank
  theme(legend.key = element_blank()) +
  
  # without fill in geom, scale_color_discrete is used to change legend name
  scale_color_discrete(name='gender type') + 
  # add title and subtitle
  ggtitle('this is a title', subtitle = 'this is a sub')

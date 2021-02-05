## ggplot2 -- histgram

library(ggplot2)

ggplot(data=nhanes) +
  # we only need x. y is count.
  geom_histogram(mapping=aes(x=BMXBMI))

ggplot(data=nhanes) +
  # boundary=0: the figure displays from BMXBMI=0
  geom_histogram(mapping=aes(x=BMXBMI), boundary=0) # start from 0

ggplot(data=nhanes) +
  # binwidth: the width of each bin
  geom_histogram(mapping=aes(x=BMXBMI), binwidth=3, boundary=0)

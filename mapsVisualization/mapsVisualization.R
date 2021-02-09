## ggplot2 -- Use map visualization for data analysis 

states <- map_data('state')

# plot a blank map with state region
ggplot(data = states, mapping = aes(x=long, y=lat, group=group)) +
  # use polygon to plot state region
  geom_polygon() +
  theme(panel.background = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank())

# data preprocessing
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state),
         region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control),
         gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate),
         tuition=as.numeric(tuition))

# summarize the mean tuition of each state
college_summary <- group_by(college, state) %>%
  summarise_each(list(mean_tuition = mean), tuition)

# add a feature named region with state names corresponding to state, which is abbrivation
college_summary <- college_summary %>%
  mutate(region=setNames(str_to_lower(state.name),
                         state.abb)[as.character(state)])

# DC to district of columbia, which is not shown in state.abb
college_summary <- college_summary %>%
  mutate(region=ifelse(as.character(state)=='DC', 
                       'district of columbia', region))

# merge states(with lon and lat) and college_summary by region
mapdata <- merge(states, college_summary, by='region')

# group by region, and fill by mean tuition with different color
ggplot(data = mapdata, mapping = aes(x=long, y=lat, group=region,
                                     fill=mean_tuition)) +
  geom_polygon() +
  theme(panel.background = element_blank(),
        # change information of axis in theme
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank()) +
  # change color gradient
  scale_fill_gradient(low='beige', high='red')

# plot each college on the map
ggplot(data = states) +
  # here fill is outside the aes, so fill plot the whole map into beige
  geom_polygon(mapping = aes(x=long, y=lat, group=region), 
               color='grey', fill='beige') +
  theme(panel.background = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        plot.background = element_blank()) +
  geom_point(mapping = aes(x=lon, y=lat), data = college)

# filter colleges in AK and HI
college <- college %>%
  filter(state!='AK' & state!='HI')

ggplot(data = states) +
  geom_polygon(mapping = aes(x=long, y=lat, group=region), 
               color='grey', fill='beige') +
  theme(panel.background = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        plot.background = element_blank()) +
  # each control is ploted in a color, and the size of the point is based on the undergrads populations
  geom_point(mapping = aes(x=lon, y=lat, color=control, size=undergrads), data = college)

# If we only want to see california
california <- map_data(map='county', region='california')

california_college <- college %>%
  filter(state=='CA')

# change data to california
ggplot(data = california) +
  geom_polygon(mapping = aes(x=long, y=lat, group=group), 
               color='grey', fill='beige') +
  theme(panel.background = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        plot.background = element_blank()) +
  # use another data california_college to plot colleges
  geom_point(mapping = aes(x=lon, y=lat, color=control, size=undergrads), data = california_college, alpha=0.5)

# add major city names on the plot
city_names <- c('Los Angeles', 'San Diego', 'San Francisco', 'San Jose', 'Fresno', 'Sacramento')
# get locations for each city
locations <- geocode(city_names)
# form a tibble with name, lat and lon of each city
cities <- tibble(name=city_names, lat=locations$lat, lon=locations$lon)

ggplot(data = california) +
  geom_polygon(mapping = aes(x=long, y=lat, group=group), 
               color='grey', fill='beige') +
  theme(panel.background = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        plot.background = element_blank()) +
  geom_point(mapping = aes(x=lon, y=lat, color=control, size=undergrads), data = california_college, alpha=0.5) +
  # use geom_text to add text on map with label=name
  geom_text(data = cities, mapping = aes(x=lon, y=lat, label=name)) +
  # change the name of legend with different size
  scale_size_continuous(name='undergraduate population') +
  # change the name of legend with different color
  scale_color_discrete(name='institutional control') +
  theme(legend.key = element_blank())

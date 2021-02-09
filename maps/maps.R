## ggplot2 -- Maps

library(ggmap)

# get your own key from google
# register_google(key='*******************') 

# p1: plot a quick map for New York with zoom=10
qmap('New York, NY', zoom=10)

# or you can get the information of a region and use ggmap to plot it
nyc_map <- get_map('New York, NY', zoom = 15)
# p2
ggmap(nyc_map)

# geocode: get latitude and longitude
nyc <- geocode('New York, NY')
lynda <- geocode('Lynda.com') # company
whitehouse <- geocode('white house') # place

# feed geo_code into get_map and then plot it
lynda_map <- get_map(lynda, zoom = 18)
# p3
ggmap(lynda_map)

# get_map has option: maptype, which is used for plotting different types of map
# p4
ggmap(get_map(nyc, maptype = 'roadmap'))
# p5
ggmap(get_map(nyc, maptype = 'hybrid'))
# p6
ggmap(get_map(nyc, maptype = 'toner'))
# p7
ggmap(get_map(nyc, maptype = 'watercolor'))

# add point on the map
ggmap(get_map('United States', zoom = 4)) +
  geom_point(mapping=aes(x=lon, y=lat), color='red', data=nyc)

placenames <- c('New York, NY', 'White House', 'Lynda.com',
                'Mt. Rushmore', 'The Alamo',
                'University of Washington')
locations <- geocode(placenames)
# create a new tibble with names(label)
locations_name <- tibble(name=placenames, 
                         lat=locations$lat, lon=locations$lon)
# p8
ggmap(get_map('United States', zoom = 4, maptype = 'watercolor')) +
  geom_point(mapping = aes(x=lon, y=lat), 
             color='red', data=locations_name) +
  geom_text(mapping = aes(x=lon, y=lat, label=name),
            color='red', data=locations_name, nudge_y=1)


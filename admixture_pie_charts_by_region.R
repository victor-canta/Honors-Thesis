#Making gradient maps for California and Oregon based on their sample numbers
library(ggplot2)
library(ggmap)

# Get the map data for California and Oregon
us <- map_data("state")
ca_or <- subset(us, region %in% c("california", "oregon"))

# Create a new dataframe for the points to be plotted
points_df <- admix[c("Lat", "Long", "Num")]

# Create the plot for California
p_california <- ggplot() +
  geom_polygon(data = ca_or, aes(x = long, y = lat, group = group), fill = "dark grey", color = "black") +
  geom_point(data = points_df, aes(x = Long, y = Lat, color = Num)) +
  scale_color_gradient(low = "yellow", high = "red") +
  coord_fixed(1.3) +
  theme_void()

# Create the plot for Oregon
p_oregon <- ggplot() +
  geom_polygon(data = ca_or, aes(x = long, y = lat, group = group), fill = "dark grey", color = "black") +
  geom_point(data = points_df, aes(x = Long, y = Lat, color = Num)) +
  scale_color_gradient(low = "yellow", high = "red") +
  labs(color = "Samples") +  # Modify the legend label
  coord_fixed(1.3) +
  theme_void()

# Display the separate figures
p_california
p_oregon 


Making hollow pie charts for each GPS point
library(ggplot2)
library(ggmap)


# Get the map data for California and Oregon
us <- map_data("state")
ca_or <- subset(us, region %in% c("california", "oregon"))

# Plot the map
map_plot <- ggplot() +
  geom_map(data = ca_or, map = ca_or,
           aes(x = long, y = lat, map_id = region),
           fill = "dark grey", color = "black", size = 0.2) +
  expand_limits(x = ca_or$long, y = ca_or$lat) +
  coord_map() +
  theme_void()


# Add pie charts for K1, K2, and K3
pie_plots <- map_plot +
  geom_arc_bar(data = admix, aes(x0 = Long, y0 = Lat, r0 = 0.5, r = 0.7,
                                 start = 0, end = K1 * 2 * pi,
                                 amount = "K1", fill="green")) +
  geom_arc_bar(data = admix, aes(x0 = Long, y0 = Lat, r0 = 0.5, r = 0.7,
                                 start = K1 * 2 * pi, end = (K1 + K2) * 2 * pi,
                                 amount = "K2", fill="red")) +
  geom_arc_bar(data = admix, aes(x0 = Long, y0 = Lat, r0 = 0.5, r = 0.7,
                                 start = (K1 + K2) * 2 * pi, end = (K1 + K2 + K3) * 2 * pi,
                                 amount = "K3", fill="blue")) +   theme(legend.position = "none")


# Print the combined plot
print(pie_plots)

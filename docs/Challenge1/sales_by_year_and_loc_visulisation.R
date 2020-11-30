# Step 2 - Visualize sales by year and location
sales_by_year_loc_tbl %>%
  
  # Set up x, y, fill
  ggplot(aes(x = year, y = sales, fill = state)) +
  
  # Geometries
  geom_col() + # Run up to here to get a stacked bar plot
  
  # Facet
  facet_wrap(~ state) +
  
  # Formatting
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
  scale_y_continuous(labels = scales::dollar_format(big.mark = ".", 
                                                    decimal.mark = ",", 
                                                    prefix = "", 
                                                    suffix = " €")) +
  labs(
    title = "Revenue by year and location",
    subtitle = "Each state has an upward trend",
    fill = "Location" # Changes the legend name
  )
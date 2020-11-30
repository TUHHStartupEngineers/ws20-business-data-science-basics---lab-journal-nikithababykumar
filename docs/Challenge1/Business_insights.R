# 6.0 Business Insights ----
# 6.1 Sales by location ----

library(lubridate)
# Step 1 - Manipulate
sales_by_location_tbl <- bike_orderlines_wrangled_tbl %>%
  
  # Select columns
  select(state, total_price) %>%
  
  # Add year column
  #mutate(year = year(order_date)) %>%
  
  # Grouping by state and summarizing sales
  group_by(state) %>% 
  summarize(sales = sum(total_price)) %>%
  
  # Optional: Add a column that turns the numbers into a currency format 
  # (makes it in the plot optically more appealing)
  # mutate(sales_text = scales::dollar(sales)) <- Works for dollar values
  mutate(sales_text = scales::dollar(sales, big.mark = ".", 
                                     decimal.mark = ",", 
                                     prefix = "", 
                                     suffix = " €"))

sales_by_location_tbl
## # A tibble: 5 x 3
##    year    sales sales_text  
##   <dbl>    <dbl> <chr>       
## 1  2015  9930282 9.930.282 € 
## 2  2016 10730507 10.730.507 €
## 3  2017 14510291 14.510.291 €
## 4  2018 12241853 12.241.853 €
## 5  2019 15017875 15.017.875 €
# 6.2 Sales by Year and location ----
# Step 1 - Manipulate
sales_by_year_loc_tbl <- bike_orderlines_wrangled_tbl %>%
  
  # Select columns and add a year
  select(order_date, total_price, state) %>%
  mutate(year = year(order_date)) %>%
  
  # Group by and summarize year and main catgegory
  group_by(year, state) %>%
  summarise(sales = sum(total_price)) %>%
  ungroup() %>%
  
  # Format $ Text
  mutate(sales_text = scales::dollar(sales, big.mark = ".", 
                                     decimal.mark = ",", 
                                     prefix = "", 
                                     suffix = " €"))

sales_by_year_loc_tbl  
## # A tibble: 25 x 4
##     year category_1      sales sales_text 
##    <dbl> <chr>           <dbl> <chr>      
##  1  2015 E-Bikes       1599048 1.599.048 €
##  2  2015 Gravel         663025 663.025 €  
##  3  2015 Hybrid / City  502512 502.512 €  
##  4  2015 Mountain      3254289 3.254.289 €
##  5  2015 Road          3911408 3.911.408 €
##  6  2016 E-Bikes       1916469 1.916.469 €
##  7  2016 Gravel         768794 768.794 €  
##  8  2016 Hybrid / City  512346 512.346 €  
##  9  2016 Mountain      3288733 3.288.733 €
## 10  2016 Road          4244165 4.244.165 €
## # … with 15 more rows
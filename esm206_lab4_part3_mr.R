# ------------------------------
# ESM 203 Lab 4 - Part 3
# Minnie 
# ------------------------------

# ------------------------------
# Attach packages

library(tidyverse)
library(here)
library(janitor)

# ------------------------------
# Read in data

db <- read_csv(here::here("data","disease_burden.csv")) %>% 
  clean_names() %>% 
  rename(deaths_per_100k = death_rate_per_100_000)


# Create data subset

db_sub <- db %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>% 
  filter(age_group == "0-6 days", sex == "Both")
  

# -----------------------------
# Graph:

ggplot(data = db_sub, aes(x = year, y = deaths_per_100k)) +
  geom_line(aes(color = country_name))

# Now save this in a subfolder
ggsave(here::here("final_graphs", "disease_graph.png"))

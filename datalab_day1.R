#######################################################
# Datalab Day 1 -- afternoon session on PACKAGES, PIPE & LEAFLET
#######################################################

# in the next line i will add 3 + 3
x <- 3 + 3 # i just added 3 + 3
x # show me what x is

# Quick review
# Boolean == TRUE / FALSE
# Characters have quotes
# Strings are characters
# Object = any value we've given to in R
# Variable / object are interchangeable


round(100/3, digits=3)

#########################################
# Packages enhance your R experience

# First: install your package
# install.packages("dplyr") # you only install once
install.packages("ggplot2")
install.packages("readr")
install.packages("gsheet")
install.packages("leaflet")

# Library every day (no quotes)
library(dplyr)
library(ggplot2)
library(readr)
library(gsheet)
library(leaflet)

#############################################
# The pipe: %>%  (think of the word: THEN)

c(1, 4, 6, 8) %>% mean
1:10
1:100

# Lets get a mean of a vector of numbers
100:70 %>% mean

# Shortcut for the pipe: Command + Shift + m

# Get random numbers
rnorm(100)
x <- rnorm(100)

# Make a histogram of those
rnorm(100) %>% hist
x %>% hist

# This code will do the exact same thing in a diff way
hist(rnorm(100))

# Exact same result, different approach
sqrt(mean(1:100006))
1:100006 %>% mean %>% sqrt

########################################
# Now we're gonna play with LEAFLET

library(leaflet)
library(gsheet)

# This is the URL of the Google Sheet
url <- 'https://docs.google.com/spreadsheets/d/1xoecVY2roNzS2gpt8UnvhGhCxrocXjJMpji9eUgiDMw/edit?usp=sharing'

# Check it out
url

# Read it in
gsheet2tbl(url)

# This time actually save it as an object
df <- gsheet2tbl(url)

df

# Let's make a map
leaflet() # this line gets us started but not all the way

leaflet() %>% addTiles() # this is an actual map

leaflet() %>% addTiles() %>% addMarkers(data=df)

# Sometimes order doesn't matter
leaflet() %>% addMarkers(data=df) %>% addTiles()

# A list of other tile options
providers

leaflet() %>%
  addProviderTiles(providers$Stamen.Toner) %>%
  addCircleMarkers(data=df,
                   color = 'red',
                   radius = 10)


# Random intern selector ====================

# Datalab interns
team <- c('monae', 'shelby', 'don','kenedi', 'lauren',
          'hamza', 'temi', 'alan', 'ellie',
          'carter', 'sam', 'michael', 'jacob', 'hallie', 'harrison',
          'elizabeth', 'jarely', 'delana', 'tilina', 'jenna', 'jordan',
          'nika', 'feza') #FF

# Randomly sample 1 person from the class
sample(team, size=1)

# Random team selector ========================
team_id <- sample(1:4, size = length(team), replace=TRUE)
teams <- data.frame(person = team, team = team_id)
teams

# =====================================


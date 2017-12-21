setwd("D:/GitHub/dc/writing-functions")

my_fun <- function(arg1, arg2) {
  body
}

df <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

# Initialize output vector
output <- vector("double", ncol(df))

# Fill in the body of the for loop
for (i in seq_along(df)) {            
  output[[i]] <- median(df[[i]], na.rm=TRUE)
}

# View the result
output


# Turn this code into col_median()
col_median <- function(df) {
  output <- vector("double", ncol(df))
  for (i in seq_along(df)) {
    output[[i]] <- median(df[[i]])      
  }
  output
}

col_median(df)

#
# Create col_mean() function to find column means
col_mean <- function(df) {
  output <- numeric(length(df))
  for (i in seq_along(df)) {
    output[[i]] <- mean(df[[i]])
  }
  output
}

col_median(df)
col_mean(df)

col_sd <- function(df) {
  output <- numeric(length(df))
  for (i in seq_along(df)) {
    output[[i]] <- sd(df[[i]])
  }
  output
}

col_sd(df)


# Add a second argument called power
f <- function(x, power) {
  # Edit the body to return absolute deviations raised to power
  abs(x - mean(x))^power
}


#
# Find the column medians using col_median() and col_summary()
col_median(df)


# Find the column means using col_mean() and col_summary()
col_mean(df)


library(purrr)


# Find the column IQRs using col_summary()

# Load the purrr package
library(purrr)

# Use map_dbl() to find column means
map_dbl(df, mean)

# Use map_dbl() to column medians
map_dbl(df, median)

# Use map_dbl() to find column standard deviations
map_dbl(df, sd)

#
#
# Find the mean of each column


# Find the mean of each column, excluding missing values


# Find the 5th percentile of each column, excluding missing values


#
# Examine the structure of cyl
str(cyl)

# Extract the first element into four_cyls
four_cyls <- cyl[[1]]

# Fit a linear regression of mpg on wt using four_cyls
lm(mpg ~ wt, four_cyls)

#
# Rewrite to call an anonymous function
map(cyl, function(df) lm(mpg ~ wt, data = df))


#
#
# Rewrite to use the formula shortcut instead
# map(cyl, function(df) lm(mpg ~ wt, data = df))
map(cyl, ~ lm(mpg ~ wt, data = .))

cyl <- split(mtcars, mtcars$cyl) 
map(cyl, ~ lm(mpg ~ wt, data = .))

# Define models (don't change)
models <- mtcars %>% 
  split(mtcars$cyl) %>%
  map(~ lm(mpg ~ wt, data = .))

# Rewrite to be a single command using pipes 
models %>% map(summary) %>% map_dbl("r.squared")



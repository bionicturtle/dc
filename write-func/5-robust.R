setwd("D:/GitHub/dc/writing-functions")

library(purrr)

my_fun <- function(arg1, arg2) {
  body
}

X <- 1:10
is.character(x)
stopifnot(is.character(x))

#
# Define troublesome x and y
x <- c(NA, NA, NA)
y <- c( 1, NA, NA, NA)

both_na <- function(x, y) {
  # Add stopifnot() to check length of x and y
  stopifnot(length(x) == length(y))
  sum(is.na(x) & is.na(y))
}

# Call both_na() on x and y
both_na(x, y)

#
# Define troublesome x and y
x <- c(NA, NA, NA)
y <- c( 1, NA, NA, NA)

both_na <- function(x, y) {
  # Replace condition with logical
  if (!(length(x) == length(y))) {
    # Replace "Error" with better message
    stop("x and y must have the same length", call. = FALSE)
  }  
  
  sum(is.na(x) & is.na(y))
}

# Call both_na() 
both_na(x, y)


#
show_missings <- function(x) {
  n <- sum(is.na(x))
  cat("Missing values: ", n, "\n", sep = "")
  x
}

replace_missings <- function(x, replacement) {
  x[is.na(x)] <- replacement
  x
}

plot_missings <- function(x) {
  plot(seq_along(x), is.na(x))
  x
}

exclude_missings <- function() {
  options(na.action = "na.exclude")
}


#
df <- data.frame(z = 1:3, y = 2:4)
# returns dataframe
str(df[1, ])
str(df[1])

df <- data.frame(z = 1:3)
# returns vector
str(df[1, ])


df <- data.frame(
  a = 1L,
  b = 1.5,
  y = Sys.time(),
  z = ordered(1)
)

A <- sapply(df[1:4], class) 
B <- sapply(df[3:4], class)


#
# sapply calls
A <- sapply(df[1:4], class) 
B <- sapply(df[3:4], class)
C <- sapply(df[1:2], class) 

# Demonstrate type inconsistency
str(A) # class(A) = list
str(B) # class(B) = matrix
str(C) # class(C) = character

# Use map() to define X, Y and Z
X <- map(df[1:4], class)
Y <- map(df[3:4], class)
Z <- map(df[1:2], class) 

# Use str() to check type consistency
str(X)
str(Y)
str(Z)


#
#
col_classes <- function(df) {
  # Assign list output to class_list
  class_list <- map(df, class)
  
  # Use map_chr() to extract first element in class_list
  map_chr(class_list, 1)
  
}

# Check that our new function is type consistent
df %>% col_classes() %>% str()
df[3:4] %>% col_classes() %>% str()
df[1:2] %>% col_classes() %>% str()


#
#
col_classes <- function(df) {
  class_list <- map(df, class)
  
  # Add a check that no element of class_list has length > 1
  if (condition) {
    stop("Some columns have more than one class", call. = FALSE)
  }
  
  # Use flatten_chr() to return a character vector
  flatten_chr(class_list)
}

# Check that our new function is type consistent
df %>% col_classes() %>% str()
df[3:4] %>% col_classes() %>% str()
df[1:2] %>% col_classes() %>% str()


col_classes <- function(df) {
  map_chr(df, class)
}

df %>% col_classes() %>% str()


#
#
col_classes <- function(df) {
  class_list <- map(df, class)
  
  # Add a check that no element of class_list has length > 1
  # any(map_dbl(class_list, length)>1)
  if (any(map_dbl(class_list, length)>1)) {
    stop("Some columns have more than one class", call. = FALSE)
  }
  
  # Use flatten_chr() to return a character vector
  flatten_chr(class_list)
}

# Check that our new function is type consistent
df %>% col_classes() %>% str()
df[3:4] %>% col_classes() %>% str()
df[1:2] %>% col_classes() %>% str()

big_x <- function(df, threshold) {
  dplyr::filter(df, x > threshold)
}

# Use big_x() to find rows in diamonds_sub where x > 7
big_x(diamonds_sub, 7)


big_x <- function(df, threshold) {
  # Write a check for x not being in df
  if (!"x" %in% names(df)) { 
    stop("df must contain variable called x", call. = FALSE)
  }
  
  # Write a check for threshold being in df
  if ("threshold" %in% names(df)) {
    stop("df must not contain variable called threshold", call. = FALSE)
  }
  
  dplyr::filter(df, x > threshold)
}

options()
getOption("digits") 
# options(digits = 5)

#
# Read in the swimming_pools.csv to pools
pools <- read.csv("swimming_pools.csv")

# Examine the structure of pools
str(pools)

# Change the global stringsAsFactor option to FALSE
options(stringsAsFactors = FALSE)

# Read in the swimming_pools.csv to pools2
pools2 <- read.csv("swimming_pools.csv")

# Examine the structure of pools2
str(pools2)


#
# Fit a regression model
fit <- lm(mpg ~ wt, data = mtcars)

# Look at the summary of the model
summary(fit)

# Set the global digits option to 2
options(digits = 2)

# Take another look at the summary
summary(fit)

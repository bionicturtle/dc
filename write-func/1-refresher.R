setwd("D:/GitHub/dc/writing-functions")

add <- function(x, y=1) {
  x+y
}

environment(add)

#
# Writing a function
# Define ratio() function
ratio <- function(x, y) {
  x/y
}

ratio(3,4)


#
# Arguments
# Rewrite the call to follow best practices
mean(0.1,x=c(1:9, NA),TRUE)
mean(x = c(1:9, NA), trim = 0.1, na.rm = TRUE)
mean(c(1:9, NA), trim = 0.1, na.rm = TRUE)

f <- function(x) {
  if (TRUE) {
    return(x + 1)
  }
  x
}

y <- 10
f <- function(x) {
  print(environment(y))
  x + y
}
environment(f)
environment(y)
f(10)
# Correct! Because y is not passed in as an argument to the function, R looks outside of the function environment.

y <- 10
f <- function(x) {
  y <- 5
  x + y
}


df <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df <- data.frame()
1:ncol(df)

for (i in 1:ncol(df)) {
  print(median(df[[i]]))
}


# Replace the 1:ncol(df) sequence
for (i  in seq_along(df)) {
  print(median(df[[i]]))
}

# Change the value of df
df <- data.frame()

# Repeat for loop to verify there is no error
for (i in seq_along(df)) {
  print(median(df[[i]]))
}

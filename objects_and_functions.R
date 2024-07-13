# Color pallete
color_pallete <- c("#055806", "#082762", "#820A16", "#FED134", "#B7B7AF", "#C9B593", "#4E4E4E")

# Theme settings
qa_dark <- theme(
  axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1, color = "white"),
  axis.text.y = element_text(color = "white"),
  axis.title.x = element_text(color = "white"),
  axis.title.y = element_text(color = "white"),
  legend.position = "bottom",
  plot.title = element_text(hjust = 0.5, color = "white"),
  plot.background = element_rect(fill = "black"),
  legend.background = element_blank(),
  legend.key = element_blank(),
  legend.text = element_text(color = "white"),
  legend.title = element_text(color = "white"),
  panel.background = element_rect(fill = NA),
  strip.background = element_rect(fill = "black")
)

# Calculate the moving average
moving_avg <- function(X, lag) {
  
  if (lag <= 1) {
    stop("Lag must be greater than 1.")
  }
  
  n <- length(X)
  ma <- c(rep(NA, (lag - 1)))
  for (i in lag:n) {
    ma[i] <- mean(X[(i + 1 - lag):i])
  }
  return(ma)
}

# Create dummy to capture 0 variance
dummy_of_variance_0 <- function(X, lag) {
  
  if (lag <= 1) {
    stop("Lag must be greater than 1.")
  }
  
  n <- length(X)
  d <- c(rep(NA, (lag - 1)))
  for (i in lag:n) {
    d[i] <- ifelse(var(X[(i + 1 - lag):i]) == 0, 1, 0)
  }
  return(d)
}

r_squared <- function(y, y_hat) {
  
  # Mean of y
  y_b <- mean(y)
  
  # Residuals
  res <- y_hat - y
  
  # Sum of squared error of residuals
  ssr <- sum(res ^ 2)
  
  # Sum of squared error of mean
  sst <- sum((y - y_b) ^ 2)
  
  # Not explained variance ratio
  nvr <- ssr / sst
  
  # Return the explaind variance ratio
  return(1 - nvr)
  
}

adjusted_r_squared <- function(y, y_hat, k) {
  
  # Mean of y
  y_b <- mean(y)
  
  # Residuals
  res <- y_hat - y
  
  # Sum of squared error of residuals
  ssr <- sum(res ^ 2)
  
  # Sum of squared error of mean
  sst <- sum((y - y_b) ^ 2)
  
  # Not explained variance ratio
  nvr <- ssr / sst
  
  # Number of observations
  n_obs <- length(y)

  # Total penalty
  penalty <- (n_obs - 1) / (n_obs - k - 1)

  
  # Return the explaind variance ratio
  return(1 - (nvr * penalty))
  
}

rmse <- function(y, y_hat) {
  sqrt(mean((y_hat - y) ^ 2))
}





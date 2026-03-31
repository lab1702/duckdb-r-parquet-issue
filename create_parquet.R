library(arrow)

n <- 100

df <- data.frame(test_value = sample(1:1000, n, replace = TRUE))
df$test_date <- seq_along(df$test_value) + Sys.Date() - 100
df$test_datetime <- as.POSIXct(df$test_date) + sample(0:86400, n, replace = TRUE)

write_parquet(df, "test_data.parquet")
cat("Wrote", nrow(df), "rows to test_data.parquet\n")

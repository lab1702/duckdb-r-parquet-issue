library(duckdb)

con <- dbConnect(duckdb())

df1 <- try(
  dbGetQuery(
    con,
    "FROM 'test_data.parquet' WHERE test_date > today() - INTERVAL 7 DAY;"
  )
)

df2 <- try(
  dbGetQuery(
    con,
    "SELECT * FROM 'test_data.parquet' WHERE test_date > today() - INTERVAL 7 DAY;"
  )
)

dbDisconnect(con)

print(df1)
print(df2)

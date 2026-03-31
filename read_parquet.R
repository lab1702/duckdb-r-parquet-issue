library(duckdb)


query <- "FROM 'test_data.parquet' WHERE test_date > today() - INTERVAL 7 DAY;"

con <- dbConnect(duckdb())

df1 <- try(dbGetQuery(con, query))
df2 <- try(dbGetQuery(con, query))

dbDisconnect(con)

print(df1)
print(df2)

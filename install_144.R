options(repos = c(CRAN = sprintf("https://p3m.dev/cran/2026-03-13/bin/linux/noble-%s/%s", R.version["arch"], substr(getRversion(), 1, 3))))

install.packages(c("duckdb", "arrow"))

library(duckdb)

con <- dbConnect(duckdb())

dbExecute(
  con,
  "INSTALL icu;"
)

dbDisconnect(con)

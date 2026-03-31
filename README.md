# DuckDB issue with parquet files after version 1.4.4

When using a query like this:

```sql
FROM 'test_data.parquet' WHERE test_date > today() - INTERVAL 7 DAY;
```

in the R duckdb package, the first attempt fails, but then the second attempt works.

## To Replicate

This will work and shows the two result sets:

    Rscript install_144.R
    Rscript create_parquet.R
    Rscript read_parquet.R

This will not work and will only show the second result set:

    Rscript install_latest.R
    Rscript create_parquet.R
    Rscript read_parquet.R

If you have the latest DuckDB CLI installed, this will work despite it being latest version:

    duckdb -c "FROM 'test_data.parquet' WHERE test_date > today() - INTERVAL 7 DAY;"

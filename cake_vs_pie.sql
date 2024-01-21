WITH ProductSales AS (
  SELECT
    date_sold,
    SUM(CASE WHEN product = 'Cake' THEN amount_sold ELSE 0 END) AS cake_sold,
    SUM(CASE WHEN product = 'Pie' THEN amount_sold ELSE 0 END) AS pie_sold
  FROM
    desserts
  GROUP BY
    date_sold
)

SELECT
  date_sold,
  ABS(cake_sold - pie_sold) AS difference,
  CASE 
    WHEN cake_sold > pie_sold THEN 'Cake'
    ELSE 'Pie'
  END AS sold_more
FROM
  ProductSales
ORDER BY
  date_sold;

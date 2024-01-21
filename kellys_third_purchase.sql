SELECT customer_id, transaction_id, amount, amount * 0.67 AS discounted_amount
FROM (
    SELECT customer_id, transaction_id, amount, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_id) AS rn
    FROM purchases
) t
WHERE rn = 3
ORDER BY customer_id ASC;
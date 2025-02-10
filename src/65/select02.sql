-- p268 製品の対象年齢の範囲　その２
SELECT product_id
 FROM PriceByAge
 GROUP BY product_id
Having SUM(high_age - low_age + 1) = 150;
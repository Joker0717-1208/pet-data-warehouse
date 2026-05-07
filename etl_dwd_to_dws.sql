INSERT INTO pet_db.dws_inventory_summary (category, total_quantity, variety_count, stat_date)
SELECT 
    category,
    SUM(quantity),
    COUNT(DISTINCT product_name),
    CURDATE()
FROM pet_db.dwd_food_inventory
GROUP BY category;

INSERT INTO pet_db.dws_expiration_alert (product_name, category, expiration_date, quantity, alert_level)
SELECT 
    product_name,
    category,
    expiration_date,
    quantity,
    CASE 
        WHEN STR_TO_DATE(expiration_date, '%Y.%m.%d') < DATE_ADD(CURDATE(), INTERVAL 30 DAY) THEN '紧急'
        WHEN STR_TO_DATE(expiration_date, '%Y.%m.%d') < DATE_ADD(CURDATE(), INTERVAL 90 DAY) THEN '注意'
        ELSE '正常'
    END
FROM pet_db.dwd_food_inventory
WHERE expiration_date IS NOT NULL AND expiration_date != '';
INSERT INTO pet_db.dwd_food_inventory (category, product_name, net_weight, quantity, expiration_date, daily_feeding, etl_date)
SELECT 
    `种类`,
    `产品名称`,
    `净含量（克）`,
    `数量`,
    `到期日`,
    `每日推荐喂食量（克）`,
    CURDATE()
FROM pet_db.cat_food_inventory
WHERE `种类` IS NOT NULL AND `种类` != '' AND `产品名称` IS NOT NULL;
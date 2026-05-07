-- DWD层：明细数据表（清洗标准化后）
-- 用途：将ODS原始数据清洗、统一格式后存入此表

CREATE TABLE dwd_food_inventory (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    category        VARCHAR(20)   COMMENT '种类：主食/零食/营养',
    product_name    VARCHAR(100)  COMMENT '产品名称',
    net_weight_g    INT           COMMENT '净含量（克）',
    quantity        INT           COMMENT '数量',
    expiration_date DATE          COMMENT '到期日',
    daily_feeding_g INT           COMMENT '每日推荐喂食量（克）',
    etl_date        DATE          COMMENT '数据加载日期'
) COMMENT '宠物食品库存明细表';
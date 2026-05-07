-- DWS层：汇总指标表（面向分析主题）
-- 用途：从DWD层汇总计算，产出可直接用于决策的指标

-- 表1：库存健康度汇总
CREATE TABLE dws_inventory_summary (
    category        VARCHAR(20)  COMMENT '种类',
    total_stock_g   INT          COMMENT '总库存（克）',
    variety_count   INT          COMMENT '品种数',
    avg_daily_g     INT          COMMENT '平均每日推荐喂食量',
    stock_days      INT          COMMENT '预估可食用天数',
    stat_date       DATE         COMMENT '统计日期'
) COMMENT '库存健康度汇总表';

-- 表2：临期预警清单
CREATE TABLE dws_expiration_alert (
    product_name    VARCHAR(100) COMMENT '产品名称',
    category        VARCHAR(20)  COMMENT '种类',
    expiration_date DATE         COMMENT '到期日',
    remaining_qty   INT          COMMENT '剩余数量',
    days_left       INT          COMMENT '距离到期剩余天数',
    alert_level     VARCHAR(10)  COMMENT '预警等级：紧急/注意/正常'
) COMMENT '临期预警清单';
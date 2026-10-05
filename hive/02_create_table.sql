-- ============================================================
-- DELIVERY TIME PREDICTION PROJECT
-- HIVE EXTERNAL TABLE CREATION
-- ============================================================

-- Select the delivery database
USE delivery_db;

-- Create an external Hive table over
-- the processed Parquet data stored in HDFS

CREATE EXTERNAL TABLE IF NOT EXISTS delivery_data (
    order_id INT,
    distance_km DOUBLE,
    weather STRING,
    traffic_level STRING,
    time_of_day STRING,
    vehicle_type STRING,
    preparation_time_min INT,
    courier_experience_yrs DOUBLE,
    delivery_time_min INT
)
STORED AS PARQUET
LOCATION 'hdfs://namenode:8020/data/delivery/processed';
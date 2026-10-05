-- ============================================================
-- DELIVERY TIME PREDICTION PROJECT
-- HIVE ANALYSIS QUERIES
-- ============================================================

-- Select database
USE delivery_db;


-- ============================================================
-- 1. OVERALL DELIVERY PERFORMANCE
-- ============================================================

SELECT
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_min), 2) AS average_delivery_time,
    MIN(delivery_time_min) AS minimum_delivery_time,
    MAX(delivery_time_min) AS maximum_delivery_time
FROM delivery_data;


-- ============================================================
-- 2. TRAFFIC LEVEL ANALYSIS
-- ============================================================

SELECT
    traffic_level,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_min), 2) AS average_delivery_time,
    MIN(delivery_time_min) AS minimum_delivery_time,
    MAX(delivery_time_min) AS maximum_delivery_time
FROM delivery_data
GROUP BY traffic_level
ORDER BY average_delivery_time;


-- ============================================================
-- 3. WEATHER ANALYSIS
-- ============================================================

SELECT
    weather,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_min), 2) AS average_delivery_time,
    MIN(delivery_time_min) AS minimum_delivery_time,
    MAX(delivery_time_min) AS maximum_delivery_time
FROM delivery_data
GROUP BY weather
ORDER BY average_delivery_time;


-- ============================================================
-- 4. VEHICLE TYPE ANALYSIS
-- ============================================================

SELECT
    vehicle_type,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_min), 2) AS average_delivery_time,
    MIN(delivery_time_min) AS minimum_delivery_time,
    MAX(delivery_time_min) AS maximum_delivery_time
FROM delivery_data
GROUP BY vehicle_type
ORDER BY average_delivery_time;


-- ============================================================
-- 5. TIME OF DAY ANALYSIS
-- ============================================================

SELECT
    time_of_day,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_min), 2) AS average_delivery_time
FROM delivery_data
GROUP BY time_of_day
ORDER BY average_delivery_time;


-- ============================================================
-- 6. DISTANCE CATEGORY ANALYSIS
-- ============================================================

SELECT
    distance_category,
    COUNT(*) AS total_orders,
    ROUND(AVG(distance_km), 2) AS average_distance,
    ROUND(AVG(delivery_time_min), 2) AS average_delivery_time
FROM
(
    SELECT
        distance_km,
        delivery_time_min,

        CASE
            WHEN distance_km < 5 THEN 'Short'
            WHEN distance_km < 10 THEN 'Medium'
            WHEN distance_km < 15 THEN 'Long'
            ELSE 'Very Long'
        END AS distance_category

    FROM delivery_data
) AS distance_data

GROUP BY distance_category
ORDER BY average_distance;


-- ============================================================
-- 7. PREPARATION TIME ANALYSIS
-- ============================================================

SELECT
    preparation_category,
    COUNT(*) AS total_orders,
    ROUND(AVG(preparation_time_min), 2) AS average_preparation_time,
    ROUND(AVG(delivery_time_min), 2) AS average_delivery_time
FROM
(
    SELECT
        preparation_time_min,
        delivery_time_min,

        CASE
            WHEN preparation_time_min < 10 THEN 'Short'
            WHEN preparation_time_min < 20 THEN 'Medium'
            ELSE 'Long'
        END AS preparation_category

    FROM delivery_data
) AS preparation_data

GROUP BY preparation_category
ORDER BY average_preparation_time;


-- ============================================================
-- 8. COURIER EXPERIENCE ANALYSIS
-- ============================================================

SELECT
    experience_category,
    COUNT(*) AS total_orders,
    ROUND(AVG(courier_experience_yrs), 2) AS average_experience,
    ROUND(AVG(delivery_time_min), 2) AS average_delivery_time
FROM
(
    SELECT
        courier_experience_yrs,
        delivery_time_min,

        CASE
            WHEN courier_experience_yrs < 2 THEN 'Beginner'
            WHEN courier_experience_yrs < 5 THEN 'Intermediate'
            ELSE 'Experienced'
        END AS experience_category

    FROM delivery_data
) AS experience_data

GROUP BY experience_category
ORDER BY average_experience;


-- ============================================================
-- 9. TRAFFIC + WEATHER ANALYSIS
-- ============================================================

SELECT
    traffic_level,
    weather,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_min), 2) AS average_delivery_time

FROM delivery_data

GROUP BY
    traffic_level,
    weather

ORDER BY average_delivery_time DESC;
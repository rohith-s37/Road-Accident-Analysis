USE accident_analysis;
SELECT COUNT(*) AS total_accidents FROM accidents;

USE accident_analysis;

SELECT accident_severity,
       COUNT(*) AS total_accidents,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accidents), 2) AS percentage
FROM accidents
GROUP BY accident_severity
ORDER BY total_accidents DESC;

SELECT weather_conditions,
       COUNT(*) AS total_accidents,
       SUM(number_of_casualties) AS total_casualties
FROM accidents
GROUP BY weather_conditions
ORDER BY total_accidents DESC
LIMIT 5;

SELECT day_of_week,
       COUNT(*) AS total_accidents,
       SUM(number_of_casualties) AS total_casualties
FROM accidents
GROUP BY day_of_week
ORDER BY total_accidents DESC;

SELECT road_type,
       COUNT(*) AS total_accidents,
       SUM(CASE WHEN accident_severity = 'Fatal' THEN 1 ELSE 0 END) AS fatal_accidents,
       ROUND(SUM(CASE WHEN accident_severity = 'Fatal' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS fatal_percentage
FROM accidents
GROUP BY road_type
ORDER BY fatal_percentage DESC;

SELECT month,
       COUNT(*) AS total_accidents,
       SUM(number_of_casualties) AS total_casualties,
       SUM(CASE WHEN accident_severity = 'Fatal' THEN 1 ELSE 0 END) AS fatal_count
FROM accidents
GROUP BY month
ORDER BY month;

SELECT speed_limit,
       COUNT(*) AS total_accidents,
       SUM(number_of_casualties) AS total_casualties,
       SUM(CASE WHEN accident_severity = 'Fatal' THEN 1 ELSE 0 END) AS fatal_count,
       ROUND(AVG(number_of_casualties), 2) AS avg_casualties
FROM accidents
GROUP BY speed_limit
ORDER BY total_accidents DESC;
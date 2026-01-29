-- Query: Monthly Labor Demand Analysis by Event Type
-- Author: Kainoa Pajo

SELECT 
    TO_CHAR(date, 'YYYY-MM') AS month_year,
    event_type,
    COUNT(event_id) AS total_events,
    ROUND(AVG(attendance), 0) AS avg_attendance,
    SUM(staff_needed) AS total_labor_hours,
    -- Identify peak demand vs average
    MAX(staff_needed) - AVG(staff_needed) AS labor_variance
FROM 
    stadium_operations_data
WHERE 
    date >= '2024-01-01'
GROUP BY 
    1, 2
ORDER BY 
    total_labor_hours DESC;
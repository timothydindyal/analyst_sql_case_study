SELECT Year, Month
FROM (SELECT EXTRACT(YEAR FROM registration_date) AS Year,
             EXTRACT(MONTH FROM registration_date) AS Month,
             COUNT(*) AS Registrations
      FROM user_data
      GROUP BY Year, Month
      ORDER BY Registrations DESC) AS monthly_registrations
LIMIT 1;
SELECT YearlyRanking,
       Year,
       EntrySport,
       FirstDeposit,
       TimeFirstEntry
FROM (SELECT
		RANK() OVER (PARTITION BY EXTRACT (YEAR FROM e.entry_week) ORDER BY SUM(e.total_entries) DESC) AS YearlyRanking, EXTRACT (YEAR FROM e.entry_week) AS Year,
		e.entry_sport AS EntrySport,
		SUM(e.total_entries) AS Entries,
		AVG(u.first_deposit_amount) AS FirstDeposit,
		AVG(u.first_paid_entry_date - u.registration_date) AS TimeFirstEntry
	  FROM user_data AS u
	  RIGHT JOIN entry_DATA AS e
	  ON u.product_account_id = e.product_account_id
	  WHERE
		EXTRACT(YEAR FROM e.entry_week) < 2020 AND
		(u.first_paid_entry_date - u.registration_date) < 7
	  GROUP BY Year, EntrySport) AS ranked_data
WHERE YearlyRanking <= 5
ORDER BY Year ASC, YearlyRanking ASC;

SELECT FirstPaidEntryDateMonth
FROM (SELECT EXTRACT(MONTH FROM u.first_paid_entry_date) AS FirstPaidEntryDateMonth,
             COUNT(DISTINCT u.product_account_id) AS UniqueUsers
      FROM user_data AS u
      RIGHT JOIN entry_data AS e
      ON u.product_account_id = e.product_account_id
      WHERE EXTRACT(YEAR FROM u.registration_date) = 2019 AND
            e.ENTRY_SPORT = 'NBA' AND
            U.first_paid_entry_date IS NOT NULL
      GROUP BY FirstPaidEntryDateMonth
      ORDER BY UniqueUsers DESC) AS monthly_uniques
LIMIT 1;

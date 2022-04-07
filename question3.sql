SELECT u.first_paid_entry_paid_media_partner_name AS AdPartner,
       SUM(e.weekly_entry_fee) AS TotalEntryFees,
       SUM(e.total_entries) AS TotalEntries
FROM user_data AS u
RIGHT JOIN entry_data AS e
ON u.product_account_id = e.product_account_id
WHERE EXTRACT(MONTH FROM u.first_paid_entry_date) = 9
GROUP BY AdPartner
ORDER BY TotalEntryFees DESC
LIMIT 10;
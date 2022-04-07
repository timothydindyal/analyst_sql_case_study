SELECT AdPartner
FROM (SELECT first_paid_entry_paid_media_partner_name AS AdPartner,
             COUNT(*) AS UserCount
      FROM user_data
      WHERE first_paid_entry_date IS NOT NULL
      GROUP BY AdPartner
      ORDER BY UserCount DESC) AS top_ad_partners
LIMIT 10;

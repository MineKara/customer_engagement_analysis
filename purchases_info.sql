USE 365_database;

CREATE VIEW purchases_info AS
    SELECT 
        purchase_id,purchases_info
        student_id,
        purchase_type,
        date_purchased AS date_start,
        CASE
            WHEN
                purchase_type = 'Monthly'
            THEN
                DATE_ADD(date_purchased, INTERVAL 1 MONTH)
            WHEN
                purchase_type = 'Quarterly'
            THEN
                DATE_ADD(date_purchased, INTERVAL 3 MONTH)
            WHEN
                purchase_type = 'Annual'
            THEN
                DATE_ADD(date_purchased, INTERVAL 12 MONTH)
        END AS date_end
    FROM
        365_student_purchases;
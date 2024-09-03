SELECT 
    i.student_id,
    i.student_country,
    i.date_registered,
    l.date_watched,
    IF(l.minutes_watched IS NULL, 0, l.minutes_watched) AS minutes_watched
FROM
    365_student_info i
LEFT JOIN 365_student_learning l USING (student_id);

    
SELECT 
    i.student_id,
    i.student_country,
    i.date_registered,
    l.date_watched,
    IF(l.minutes_watched IS NULL, 0, l.minutes_watched) AS minutes_watched,
    IF(l.date_watched IS NULL, 0, 1) AS onboarded
FROM
    365_student_info i
LEFT JOIN 365_student_learning l USING (student_id);
    
    
SELECT 
    a.student_id,
    a.student_country,
    a.date_registered,
    a.date_watched,
    a.minutes_watched,
    a.onboarded,
    IF(a.date_watched BETWEEN p.date_start AND p.date_end, 1, 0) AS paid
FROM
    (   -- Subquery for students' information and onboarding status
        SELECT 
            i.student_id,
            i.student_country,
            i.date_registered,
            l.date_watched,
            IF(l.minutes_watched IS NULL, 0, l.minutes_watched) AS minutes_watched,
            IF(l.date_watched IS NULL, 0, 1) AS onboarded
        FROM
            365_student_info i
            LEFT JOIN 365_student_learning l USING (student_id)
    ) a
    LEFT JOIN purchases_info p USING (student_id);
    
    
SELECT 
    b.student_id,
    b.student_country,
    b.date_registered,
    b.date_watched,
    b.minutes_watched,
    b.onboarded,
    MAX(b.paid) AS paid
FROM
    (   -- Subquery for students' information, onboarding status, and payment status
        SELECT 
            a.student_id,
            a.student_country,
            a.date_registered,
            a.date_watched,
            a.minutes_watched,
            a.onboarded,
            IF(a.date_watched BETWEEN p.date_start AND p.date_end, 1, 0) AS paid
        FROM
            (   -- Subquery for students' information and onboarding status
                SELECT 
                    i.student_id,
                    i.student_country,
                    i.date_registered,
                    l.date_watched,
                    IF(l.minutes_watched IS NULL, 0, l.minutes_watched) AS minutes_watched,
                    IF(l.date_watched IS NULL, 0, 1) AS onboarded
                FROM
                    365_student_info i
                    LEFT JOIN 365_student_learning l USING (student_id)
            ) a
            LEFT JOIN purchases_info p USING (student_id)
    ) b
GROUP BY 
    b.student_id, 
    b.date_watched;




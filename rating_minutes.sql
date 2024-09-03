WITH title_total_minutes AS (
	SELECT C.course_id, C.course_title, TRUNCATE(SUM(minutes_watched), 2) as total_minutes_watched, COUNT(DISTINCT S.student_id) AS num_students
	FROM 365_database.365_course_info C
	JOIN 365_database.365_student_learning S
	ON C.course_id = S.course_id
	GROUP BY C.course_id
	ORDER BY C.course_id
),

title_average_minutes AS
(
SELECT 
    course_id,
    course_title,
    total_minutes_watched,
    ROUND((total_minutes_watched / num_students), 2) AS average_minutes
FROM
    title_total_minutes
),


title_ratings AS
(
SELECT 
    ta.course_id,
    ta.course_title,
    ta.total_minutes_watched,
    ta.average_minutes,
    COUNT(R.course_rating) AS number_of_ratings,
    AVG(R.course_rating) AS average_rating
FROM
    title_average_minutes ta
        LEFT JOIN
    365_database.365_course_ratings R USING (course_id)
GROUP BY course_id
)

SELECT *
FROM title_ratings

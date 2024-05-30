-- 1. Count how many enrollees there were each year.
SELECT YEAR(`students`.`enrolment_date`) AS `year_of_enrollment`, COUNT(*) AS `enrollees_number`
FROM `students`
GROUP BY YEAR(`students`.`enrolment_date`);

-- 2. Count the teachers who have the office in the same building.


-- 3. Calculate the grade point average of each examination roll.


-- 4. Count how many graduate courses there are for each department.
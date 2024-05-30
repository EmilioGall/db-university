-- 1. Count how many enrollees there were each year.
SELECT YEAR(`students`.`enrolment_date`) AS `year_of_enrollment`, COUNT(*) AS `enrollees_number`
FROM `students`
GROUP BY YEAR(`students`.`enrolment_date`);

-- 2. Count the teachers who have the office in the same building.
SELECT `teachers`.`office_address` AS `building_address`, COUNT(*) AS `offices_in_building`
FROM `teachers`
GROUP BY `teachers`.`office_address`;

-- 3. Calculate the average grade of each exam.
SELECT `exam_student`.`exam_id` AS `exam_id`, AVG(`exam_student`.`vote`) AS `grade_average` 
FROM `exam_student` 
GROUP BY `exam_student`.`exam_id`;

-- 4. Count how many degrees there are for each department.
SELECT `degrees`.`department_id` AS `department_identification_number`, COUNT(*) AS `num_of_courses`
FROM `degrees`
GROUP BY `degrees`.`department_id`;
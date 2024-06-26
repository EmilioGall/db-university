-- 1. Select all students enrolled in the Bachelor of Science in Economics program.
SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `students`.`registration_number`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- 2. Select all master's degree programs in the Department of Neuroscience.
SELECT `degrees`.*
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = "Magistrale"
AND `departments`.`name` = "Dipartimento di Neuroscienze";

-- 3. Select all courses in which Fulvio Amato teaches (id=44).
SELECT `courses`.`name` AS `courses_name`
FROM `courses`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44;

-- 4. Select all students with data related to the degree program in which they are enrolled and the related department, in alphabetical order by surname and first name.
SELECT `students`.`surname`, `students`.`name`, `degrees`.`name` AS `courses_name`, `departments`.`name` AS `departments_name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`surname`, `students`.`name`;

-- 5. Select all degree programs with their courses and teachers.
SELECT `degrees`.`id`, `degrees`.`name` AS `degrees_name`, `courses`.`name` AS `courses_name`, `teachers`.`surname` AS `professors_surname` ,`teachers`.`name` AS `professors_name` 
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`  
ORDER BY `degrees`.`id` ASC;

-- 6. Select all faculty members who teach in the Department of Mathematics. (54)
SELECT DISTINCT `teachers`.`id`, `teachers`.`surname` AS `professors_surname`, `teachers`.`name` AS `professors_name`, `departments`.`name` AS `department_name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di matematica";

-- 7. BONUS: Select, for each student, how many exam attempts they have taken to pass each of his or her exams.
SELECT `students`.`id` AS `student_id`,`students`.`surname`, `students`.`name`, `courses`.`id` AS `course_id`,`courses`.`name` AS `course_name`, COUNT(`exams`.`id`) AS `total_exam_attempts`, MAX(`exam_student`.`vote`) AS `max_vote`
FROM `students`
INNER JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
INNER JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
INNER JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING `max_vote` >= 18;
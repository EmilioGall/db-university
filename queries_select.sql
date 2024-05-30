-- 1. Select all students born in 1990. (160)
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- 2. Select all courses worth more than 10 credits. (479)
SELECT *
FROM `courses`
WHERE `cfu` > 10;

-- 3. Select all students who are older than 30 years.
SELECT *
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) >= 30
ORDER BY `students`.`date_of_birth` DESC;

-- 4. Select all courses in the first semester of the first year of any degree. (286)
SELECT *
FROM `courses`
WHERE `period` = "I semestre"
AND `year` = 1;

-- 5. Select all exam dates that occur in the afternoon (after 2 p.m.) on 20/06/2020. (21)
SELECT *
FROM `exams`
WHERE `date` = "2020-06-20"
AND HOUR(`hour`) >= 14;

-- 6. Select all master's degree programs. (38)
SELECT *
FROM `degrees`
WHERE `level` = "magistrale";

-- 7. How many departments does the university consist of? (12)
SELECT COUNT(*)
FROM `departments`;

-- 8. How many teachers do not have a phone number? (50)
SELECT *
FROM `teachers`
WHERE `phone` IS NULL;

-- 9. Enter a new record in the student table with your data (for the field degree_id, enter a random value).
INSERT INTO students (  `degree_id`,
                        `name`,
                        `surname`,
                        `date_of_birth`,
                        `fiscal_code`,
                        `enrolment_date`,
                        `registration_number`,
                        `email`
                        )
VALUES ( 13,
         "Emilio",
         "Gallo",
         "1993-09-21",
         "GLLMLE93P21G803X",
         "2024-05-29",
         370325,
         "emiliogallo@gmail.com"
         )

-- 10. Change the office number of Professor Pietro Rizzo to 126.
UPDATE `teachers`
SET `office_number` = 126
WHERE `name` = "Pietro"
AND `surname` = "Rizzo";

-- 11. Delete the record created previously in step 9 from the student table.
DELETE FROM `students`
WHERE `registration_number` = 370325;
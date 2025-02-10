-- 13 02
-- teacherが２人いる場合　MINとMAXの値が違うことを利用している。
-- １人のときは NULLにしているので問題なし
SELECT course_nbr,student_name,MIN(teacher_name),
    CASE COUNT(*) WHEN 1 THEN NULL
                  WHEN 2 THEN MAX(teacher_name)
                  ELSE '--More--' END
	,count(*)
    FROM register
    GROUP BY course_nbr,student_name;


-- SELECT course_nbr,student_name,MIN(teacher_name),
--     CASE WHEN COUNT(*) = 1 THEN NULL
--          WHEN COUNT(*) = 2 THEN MAX(teacher_name)
--          ELSE '--More--' END
--     FROM register
--     GROUP BY course_nbr,student_name;
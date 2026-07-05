-- Joins – inner joins
-- 2 tables
select Students.student_name, Exam_marks.exam_date
from students
inner join Exam_marks
on Students.student_id = Exam_marks.student_id;
-- 3 tables
select
	Students.student_name,
	Subjects.subject_name,
	Exam_marks.Marks
from Exam_marks
join Students on Exam_marks.student_id = Students.student_id
join Subjects on Exam_marks.subject_id = Subjects.subject_id;

-- 4 tables
select
	Subjects.subject_name,
	Teachers.teacher_name
from Exam_marks
join Students on Exam_marks.student_id = Students.student_id
join Subjects on Exam_marks.subject_id = Subjects.subject_id
join Teachers on Subjects.teacher_id = Teachers.teacher_id
where Students.student_name = 'Kasun Kalhara';
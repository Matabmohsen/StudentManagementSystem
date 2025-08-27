-- Student Transcript View
CREATE OR REPLACE VIEW StudentTranscript AS
SELECT s.Student_id,
       s.S_First_name,
       s.S_Last_name,
       c.Course_name,
       g.Exam_score,
       g.Grade,
       g.Grade_date
FROM Student s
JOIN Enrollments e ON s.Student_id = e.Student_id
JOIN Courses c ON e.Course_id = c.Course_id
JOIN Grades g ON e.Enrollment_id = g.Enrollment_id;

-- GPA View (4.0 scale)
CREATE OR REPLACE VIEW StudentGPA AS
SELECT s.Student_id,
       s.S_First_name,
       s.S_Last_name,
       ROUND(AVG((g.Exam_score / 100) * 4), 2) AS GPA
FROM Student s
JOIN Enrollments e ON s.Student_id = e.Student_id
JOIN Grades g ON e.Enrollment_id = g.Enrollment_id
GROUP BY s.Student_id, s.S_First_name, s.S_Last_name;

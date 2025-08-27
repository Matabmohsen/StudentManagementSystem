-- Top 5 Students by GPA
SELECT * 
FROM StudentGPA
ORDER BY GPA DESC
FETCH FIRST 5 ROWS ONLY;

-- View all students and their grades
SELECT * FROM StudentTranscript;

-- List all students enrolled in a specific course
SELECT s.S_First_name, s.S_Last_name, c.Course_name
FROM Enrollments e
JOIN Student s ON e.Student_id = s.Student_id
JOIN Courses c ON e.Course_id = c.Course_id
WHERE c.Course_id = 101;

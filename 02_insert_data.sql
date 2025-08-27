/* ============================= */
/* Insert Sample Data             */
/* ============================= */

-- Instructors
INSERT INTO Instructor (First_name, Last_name, Email, Department)
VALUES ('Moaz','Mohsen','moaz@gmail.com','Computer Science');

INSERT INTO Instructor (First_name, Last_name, Email, Department)
VALUES ('Ahmed','Hassan','ahmed.hassan@univ.edu','Computer Science');

INSERT INTO Instructor (First_name, Last_name, Email, Department)
VALUES ('Mona','Ali','mona.ali@univ.edu','Information Systems');

-- Courses
INSERT INTO Courses (Course_name, Credits, Instructor_id)
VALUES ('Database Systems', 3, 1);

INSERT INTO Courses (Course_name, Credits, Instructor_id)
VALUES ('Data Structures', 4, 2);

-- Students
INSERT INTO Student (S_First_name, S_Last_name, S_Email)
VALUES ('Matab','Mohsen','matab.mohsen@gmail.com');

INSERT INTO Student (S_First_name, S_Last_name, S_Email)
VALUES ('Sara','Ali','sara.ali@gmail.com');

-- Enrollments
INSERT INTO Enrollments (Student_id, Course_id, Semester)
VALUES (1, 101, 'Fall2025');
